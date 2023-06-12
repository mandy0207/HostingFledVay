const express = require("express");
const path = require("path");
var mysql = require('mysql')
var easyinvoice = require('easyinvoice');
var fs = require('fs');

//for Payment
const dotenv = require("dotenv");
const cors = require("cors");
const bodyParser = require("body-parser");
const crypto = require("crypto");
const Razorpay = require("razorpay");
const { json } = require("body-parser");
const { copyFileSync } = require("fs");
dotenv.config();
const instance = new Razorpay({
    key_id: "rzp_test_thAuSPrJqiCCPR",
    key_secret: "jawgosJ5SosxsulKQttXGNLt"
});
const app = express();
app.use(cors());
app.use(express.json());
app.use(
    bodyParser.urlencoded({
        extended: false
    })
);
app.use(bodyParser.json());

const port = 3600;
// Express Specific stuff
app.use('/static', express.static('static'));;
app.use(express.urlencoded());

//Set the template engine as HTML
app.engine('html', require('ejs').renderFile);
app.set('view engine', 'html');
app.set('views', path.join(__dirname, 'views'))


var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'fledvay'
})

connection.connect(function(err) {
    if (err) throw err;
    console.log("Connected");
})


// End Points

app.get('/', (req, res) => {
    res.status(200).render('home.html');
})
app.get('/about', (req, res) => {
    res.status(200).render('about.html');
})

app.get('/Register', (req, res) => {
    res.status(200).render('home.html');
})
app.get('/home', (req, res) => {
    res.status(200).render('home.html');
})
app.get('/Signup', (req, res) => {
    res.status(200).render('Signup.html');
})

app.get('/login', (req, res) => {
    res.status(200).render('login.html');
})

app.get('/contact', (req, res) => {
    res.status(200).render('contact.html');
})

app.get('/rooms', (req, res) => {
    res.status(200).render('rooms.html');
})

app.get('/tracking', (req, res) => {
    res.status(200).render('booking.html');
})

app.get('/Reviews', (req, res) => {
    res.status(200).render('Reviews.html');
})

app.get('*', (req, res) => {
    res.status(404).render('404.html', {
        errorcomment: "oops! Page not found"
    });
})


app.post('/AjaxDetails', (req, res) => {
    params = req.body;
    console.log(params);
    var insertquery = `SELECT AVG(rating) AS Average FROM Rating where Hotel_Name='${params.name}'`;
    //console.log(params.name, params.destination, params.address, params.image);
    connection.query(insertquery, function(err, response) {
        if (err) throw err
            // console.log(response[0].Average);
        res.status(200).render('HotelDetails.html', { name: params.name, destination: params.destination, address: params.address, image: params.image, Average: response[0].Average });
    });
});

app.post('/Roominfo', (req, res) => {
    // params = req.body;
    // console.log(params);

    res.status(200).render('RoomDetails.html');
});



app.post('/Reviews', (req, res) => {
    var karams = req.body;
    console.log(karams);
    var hotelname = req.body.hotelname;

    var email = req.body.email;
    var rating = req.body.rating;
    var message = req.body.message;

    var insertquery = "insert into `rating`(`Hotel_Name`,`Email`,`Rating`,`Reviews`) values (?,?,?,?)";
    var sql = mysql.format(insertquery, [hotelname, email, rating, message]);
    connection.query(sql, function(err, response) {
        if (err) throw err
        console.log(response);
        res.status(200).render('Result.html');

    });

});

app.post('/', (req, res) => {
    var karams = req.body;
    // console.log(karams);
    var insertquery = `select * from hotels where  Destination='${karams.destination}'`;

    connection.query(insertquery, function(err, response) {
        if (err) throw err
        console.log(response);
        res.status(200).render('Hotels', { arra: response });
    });
});


app.post('/home', (req, res) => {
    var karams = req.body;
    // console.log(karams);
    var insertquery = `select * from hotels where  Destination='${karams.destination}'`;

    connection.query(insertquery, function(err, response) {
        if (err) throw err
        console.log(response);
        res.status(200).render('Hotels', { arra: response });
    });
});


//pawan work
app.post("/Signup", (req, res) => {
    console.log(req.body);

    const { name, email, username, password, conpass, country, city, zipcode } =
    req.body;
    connection.query(
        "select * from users where email=?", [email],
        function(err, result, fields) {
            if (result.length > 0) {
                alert = "Email already exists.";
                res.render("Signup.ejs", { alert: alert });
                return;
            }
        }
    );
    if (password == conpass) {
        connection.query(
            "insert into users (name,email,username,password,country,city,zipcode) values(?,?,?,?,?,?,?)", [name, email, username, password, country, city, zipcode],
            function(err, result, fields) {
                if (err) {
                    res.send(err.message);
                } else {
                    alert = "You are successfully registered. Please login to continue.";
                    res.render("Signup.ejs", { alert: alert });
                }
            }
        );
    } else {
        alert = "Passwords don't match";
        res.render("Signup.ejs", { alert: alert });
    }
});

app.post("/Login", (req, res) => {
    const { email, password } = req.body;
    if (email && password) {
        connection.query(
            "SELECT * FROM users WHERE email = ? AND password = ?", [email, password],
            function(error, results, fields) {
                if (results.length > 0) {
                    currUser = results[0].username;
                    res.render("Hometwo.html", {
                        user: currUser,
                    });
                } else {
                    alert = "Email id or password is incorrect. ";
                    res.render("Login.ejs", { alert: alert });
                }
            }
        );
    } else {
        alert = "Email or password not found.";
        res.render("Login.ejs", { alert: alert });
    }
});

app.post("/api/Payment/order", (req, res) => {
    params = req.body;
    // console.log(params);
    instance.orders.create(params)
        .then((data) => {
            res.send({ sub: data, status: "Success" });
        })
        .catch((error) => {
            res.send({ sub: error, status: "failed" });
        });
});
app.post("/api/Payment/verify", (req, res) => {

    params = req.body;
    console.log(params);

    body = req.body.razorpay_order_id + "|" + req.body.razorpay_payment_id;
    var expectedSignature = crypto
        .createHmac("sha256", "jawgosJ5SosxsulKQttXGNLt")
        .update(body.toString())
        .digest("hex");
    console.log("sig" + req.body.razorpay_signature);
    console.log("sig" + expectedSignature);
    var response = { status: "failure" };
    if (expectedSignature === req.body.razorpay_signature) {
        // response = "Congrats! Your payment is successful";
        //res.send(response);
        res.status(200).render('DownloadTicket.html', params);


        // console.log("mandy");
        var insertquery = "insert into `reservation`(`Name`,`Email`,`Address`,`Phone`,`Hotel`,`Checkin`,`Checkout`) values (?,?,?,?,?,?,?)";
        var sql = mysql.format(insertquery, [params.name, params.bookingEmail, params.address, params.phone, params.hotel, params.checkin, params.checkout]);
        connection.query(sql, function(err, response) {
            // if (err) throw err
            console.log(response);
            //console.log(err);

        });

    }




});

app.post('/tracking', (req, res) => {
    karams = JSON.parse(JSON.stringify(req.body));
    //params = req.body;
    console.log(karams);
    //console.log(karams.name);
    var selectquery = `select * from reservation where Name='${karams.name}' AND Email='${karams.email}'`;
    connection.query(selectquery, function(err, response) {
        if (err) throw err
            //console.log(response);
        res.status(200).render('BookingStatus.html', { Frra: response });
        console.log(response);
    });
})

app.post('/CancelBooking', (req, res) => {
    karams = req.body;
    console.log(karams.name);
    var selectquery = `delete from reservation where Name='${karams.name}' `;
    connection.query(selectquery, function(err, response) {
        if (err) throw err
            //  res.status(200).render('BookingStatus.html');
        res.send("Ticket Cancelled");
        console.log(response);
    });

})

app.listen(port, () => {
    console.log(`The app started succesfully on ${port}`)
})