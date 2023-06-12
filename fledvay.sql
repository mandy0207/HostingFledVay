-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 30, 2021 at 06:39 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fledvay`
--

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
CREATE TABLE IF NOT EXISTS `hotels` (
  `Hotel_Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Destination` varchar(255) NOT NULL,
  `Checkin` date NOT NULL,
  `Checkout` date NOT NULL,
  `image` varchar(355) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Hotel_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`Hotel_Id`, `Name`, `Destination`, `Checkin`, `Checkout`, `image`, `Address`) VALUES
(1, 'Hotel Chez Swann', 'Montreal', '2021-06-12', '2021-06-13', '../static/pics/chez.jpg', '112 Saint Catherine'),
(2, 'Hotel Bonaventure', 'Montreal', '2021-06-15', '2021-06-16', '../static/pics/bonaventure.jpg', '117 Saint Laurent'),
(3, 'Hotel Holiday Inn', 'Laval', '2021-06-16', '2021-06-17', '../static/pics/holi.jpg', '584 Ash Avenue'),
(4, 'Fern Residency', 'Quebec City', '2021-06-18', '2021-06-19', '../static/pics/fern.jpg', '119 Mall Road'),
(5, 'Hotel Le Saint Suplis', 'Montreal', '2021-06-20', '2021-06-21', '../static/pics/saint.jpg', '245 Atwater'),
(6, 'Hotel Diamond Plaza', 'Brampton', '2021-06-17', '2021-06-18', '../static/pics/diamond.jpg', '117 Boulevard Parc'),
(7, 'Country Inn', 'Quebec City', '2021-06-18', '2021-06-19', '../static/pics/countryinn.jpg', '12 Manotec'),
(8, 'JW Marriot', 'Quebec City', '2021-06-24', '2021-06-25', '../static/pics/JW.jpg', '42 Welington'),
(9, 'Sandman Signature', 'Mississuaga', '2021-06-18', '2021-06-19', '../static/pics/sandman.jpg', '234 Saint Roch'),
(10, 'The Waterside Inn', 'Mississuaga', '2021-06-24', '2021-06-25', '../static/pics/water.jpg', '112 Saint Marc'),
(11, 'Delta Hotels', 'Mississuaga', '2021-06-28', '2021-06-29', '../static/pics/delta.jpg', '241 Erin Centre'),
(12, 'Hyatt Place', 'Mississuaga', '2021-06-12', '2021-06-13', '../static/pics/hyat.jpg', '41 Derrie Road'),
(13, 'Holiday Inn', 'Mississuaga', '2021-06-04', '2021-06-05', '../static/pics/holi.jpg', '2125 Saint Paul'),
(14, 'Hilton Garden', 'Mississuaga', '2021-06-06', '2021-06-07', '../static/pics/hil.jpg', '123 Hunter Avenue'),
(15, 'Delta Hotels', 'Montreal', '2021-06-28', '2021-06-29', '../static/pics/del.jpg', '142 Forest Road'),
(16, 'Hyatt Place', 'Montreal', '2021-06-12', '2021-06-13', '../static/pics/hyat.jpg', '65 Charlevoix');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `Hotel_Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Rating` int(11) NOT NULL,
  `Reviews` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`Hotel_Name`, `Email`, `Rating`, `Reviews`) VALUES
('Hotel Chez Swann', 'lilpreet@gmail.com', 4, 'awesome'),
('Hotel Chez Swann', 'mandy@yahoo.in', 4, 'great'),
('Hotel Chez Swann', 'kell@yahoo.in', 1, 'poor services'),
('Hotel Bonaventure', 'neha@gmail.com', 5, 'Great services'),
('Hotel Chez Swann', 'preet@yahoo.in', 5, 'quite impressed'),
('Hotel Le Saint Suplis', 'mini@gmail.com', 5, 'good'),
('Hotel Chez Swann', 'kim@yahoo.in', 5, 'awesome'),
('Hotel Le Saint Suplis', 'nehru@yahoo.in', 5, 'great'),
('Delta Hotels', 'gandhi@gmail.com', 4, 'nice'),
('Delta Hotels', 'greta@yahoo.in', 1, 'poor services'),
('Hyatt Place', 'neel@yahoo.in', 4, 'Best Hotel'),
('Hotel Holiday Inn', 'kalli@yahoo.in', 5, 'best'),
('Hotel Holiday Inn', 'goat@outlook.com', 5, 'Top Hotel'),
('Sandman Signature', 'mishra@gmail.com', 5, 'Best Hotel'),
('The Waterside Inn', 'kelli@gmail.com', 5, 'Best Hotel'),
('Holiday Inn', 'yippy@hotmail.com', 4, 'Kept Every Promise'),
('Hilton Garden', 'Neha@yahoo.in', 4, 'Best Hotel'),
('Fern Residency', 'lucas@hotmail.com', 4, 'Satisfied'),
('Country Inn', 'shelly@yahoo.in', 5, 'Very Good '),
('JW Marriot', 'tina@yahoo.in', 5, 'Classy'),
('Hotel Bonaventure', 'sara@hotmail.com', 4, 'satisfactory services'),
('Hotel Bonaventure', 'gopy@gmail.com', 1, 'poor'),
('Hyatt Place', 'hhj@hh.com', 1, 'gkjbkjbk'),
('Hotel Le Saint Suplis', 'rahul@yahoo.in', 1, 'poor services'),
('The Waterside Inn', 'jass@gmail.com', 1, 'poor services'),
('Hotel Bonaventure', 'shweta24@yahoo.in', 5, 'Fantastic Service');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Address` varchar(500) NOT NULL,
  `Phone` varchar(255) NOT NULL,
  `Hotel` varchar(255) NOT NULL,
  `Checkin` varchar(555) DEFAULT NULL,
  `Checkout` varchar(555) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`Name`, `Email`, `Address`, `Phone`, `Hotel`, `Checkin`, `Checkout`) VALUES
('Neel', 'Neel@yahoo.in', 'Bhatinda', '9988215946', 'Hotel Bonaventure', 'Tue Jun 15 2021', 'Wed Jun 16 2021'),
('Deepsher', 'deep@gmail.com', 'Montreal', '9988215943', 'Hotel Holiday Inn', 'Wed Jun 16 2021', 'Thu Jun 17 2021'),
('Dilraj', 'dilraj@outlook.com', 'MOntreal', '789456123', 'Hotel Le Saint Suplis', 'Sun Jun 20 2021', 'Mon Jun 21 2021'),
('bubu', 'bubu@yahoo.in', 'Toronto', '514589653', 'Hotel Le Saint Suplis', 'Sun Jun 20 2021', 'Mon Jun 21 2021'),
('udit', 'udit@yahoo.com', 'Montreal', '7894561230', 'Hotel Holiday Inn', 'Wed Jun 16 2021', 'Thu Jun 17 2021'),
('kell', 'kell@yahoo.in', 'Hell', '456789123', 'Hotel Holiday Inn', 'Wed Jun 16 2021', 'Thu Jun 17 2021'),
('nelson', 'nelson@yahoo.in', 'Africa', '7894561230', 'Hotel Holiday Inn', 'Wed Jun 16 2021', 'Thu Jun 17 2021'),
('jimm', 'jimy@yahoo.in', 'Jamaica', '456789', 'Hotel Holiday Inn', 'Wed Jun 16 2021', 'Thu Jun 17 2021'),
('virat', 'virat@kohli.com', 'Delhi', '789456123', 'Country Inn', 'Fri Jun 18 2021', 'Sat Jun 19 2021'),
('chris', 'chris@yahoo.in', 'Pakistan', '789456123', 'Delta Hotels', 'Mon Jun 28 2021', 'Tue Jun 29 2021'),
('jess', 'jess@gmail.com', 'Mississuaga', '78945613', 'Hotel Holiday Inn', 'Wed Jun 16 2021', 'Thu Jun 17 2021'),
('Mehak Sethi', 'mehak@gmail.com', 'Dharamshala', '7894561230', 'The Waterside Inn', 'Thu Jun 24 2021', 'Fri Jun 25 2021'),
('Harjot', 'harjot@gmail.com', 'Haryana', '7894561230', 'Hotel Holiday Inn', 'Wed Jun 16 2021', 'Thu Jun 17 2021'),
('Amit', 'amit@yahoo.in', 'BHatinda', '7894561230', 'Hotel Holiday Inn', 'Wed Jun 16 2021', 'Thu Jun 17 2021'),
('Kriti', 'kritz@gmail.com', 'Mumbai', '7894561230', 'Hotel Holiday Inn', 'Wed Jun 16 2021', 'Thu Jun 17 2021'),
('nimi', 'nim@gmail.com', 'Montreal', '7894561023', 'Hotel Holiday Inn', 'Wed Jun 16 2021', 'Thu Jun 17 2021'),
('Sonakshi', 'sona@gmail.com', 'Mumbai', '7415823690', 'Hotel Holiday Inn', 'Wed Jun 16 2021', 'Thu Jun 17 2021'),
('hegde', 'hegde@gmail.com', 'Jaipur', '789456', 'Hotel Holiday Inn', 'Wed Jun 16 2021', 'Thu Jun 17 2021'),
('lipi', 'lip@gmail.com', 'Mumbai', '47895126', 'Hotel Holiday Inn', 'Wed Jun 16 2021', 'Thu Jun 17 2021'),
('nikki', 'nik@gmail.com', 'Laval', '123456789', 'Hotel Holiday Inn', 'Wed Jun 16 2021', 'Thu Jun 17 2021'),
('kity', 'kity@gmail.com', 'Jaislmar', '123456789', 'Hotel Holiday Inn', 'Wed Jun 16 2021', 'Thu Jun 17 2021'),
('nimi', 'nimz@gmail.com', 'Amritsar', '9881635263', 'Hotel Holiday Inn', 'Wed Jun 16 2021', 'Thu Jun 17 2021'),
('rabia', 'rabbu@gmail.com', 'rabb@gmail.com', '9988163216', 'Hotel Holiday Inn', 'Wed Jun 16 2021', 'Thu Jun 17 2021'),
('anamika', 'anamika@hotmail.com', 'Hoshiarpur', '7894561230', 'Hotel Holiday Inn', 'Wed Jun 16 2021', 'Thu Jun 17 2021'),
('manjinder', 'manjinder@gmail.com', 'Jalandhar', '12345679', 'Hotel Holiday Inn', 'Wed Jun 16 2021', 'Thu Jun 17 2021'),
('nilaksha', 'nilaksha@gmail.com', 'Montreal', '1234569871', 'Hotel Holiday Inn', 'Wed Jun 16 2021', 'Thu Jun 17 2021');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Country` varchar(255) NOT NULL,
  `City` varchar(255) NOT NULL,
  `Zipcode` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Name`, `Email`, `Username`, `Password`, `Country`, `City`, `Zipcode`) VALUES
('Neha', 'Neha@hotmail.com', 'neha24', '123456789', 'Australia', 'Melbourne', '143421'),
('mandy', 'mandy@gmail.com', 'mandy2324', '12345678', 'india', 'gurdaspur', '143521'),
('shinda', 'shinda@gmail.com', 'shinda2324', '12345678', 'india', 'jalandhar', '142563'),
('happy', 'haapy@gmail.com', 'happy2324', '12345678', 'canada', 'montreal', '145236');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
