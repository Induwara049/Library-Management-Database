-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2021 at 10:19 AM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `acl`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `Journal_num` varchar(3) NOT NULL,
  `article_num` varchar(3) NOT NULL,
  `title` varchar(30) NOT NULL,
  `issue` date DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `abstract` varchar(600) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`Journal_num`, `article_num`, `title`, `issue`, `volume`, `abstract`) VALUES
('J1', 'A1', 'Robust Learning of Consumer Pr', '0000-00-00', 1, 'This paper studies a class of ranking and selection problems faced by a company that wants to identify the most preferred product out of a finite set of alternatives when consumer preferences are a priori unknown. The only information available is that consumer preferences satisfy two key properties: (i) they are consistent with some unknown true ranking of the alternatives, and (ii) they are strict, namely, no two products are equally preferred.'),
('J2', 'A2', 'Who Is Next: Patient Prioritiz', '0000-00-00', 2.1, 'Upon arrival at emergency departments (EDs), patients are classified into different triage levels indicating their urgency. Using data from a large hospital in Canada, we find that, within the same triage level, the average waiting time (time from triage to initial assessment by a physician) of patients who are discharged is shorter than that of patients who are admitted for middle- and low-acuity patients, suggesting that the order in which patients are served deviates from first-come, first-served, and to a certain extent, discharged patients are prioritized over admitted patients.'),
('J3', 'A3', 'Organizing Form, Experimentati', '0000-00-00', 1, 'Our aim is to explore whether the benefits to firms of using community-based innovation extend to nascent markets: uncertain, high-velocity settings with novel, often complex products. Grounded in a rare empirical comparison, we closely track the two ventures (one using community-based innovation and the other firm-based) that pioneered the na2scent civilian drone market. We unpack how each addressed the three major innovations that shaped this setting. Our primary insight is that the firm organizing form for innovation performs best relative to communities in nascent markets.'),
('J4', 'A4', 'Crowd-Based Accountability: Ex', '0000-00-00', 1, 'Organizational accountability is considered critical to organizations’ sustained performance and survival. Prior research examines the structural and rhetorical responses that organizations use to manage accountability pressures from different constituents. With the emergence of social media, accountability pressures shift from the relatively clear and well-specified demands of identifiable stakeholders to the unclear and unspecified concerns of a pseudonymous crowd.'),
('J5', 'A5', 'Signaling Quality with Return ', NULL, NULL, 'This paper examines an innovative return policy, return insurance, emerging on various shopping platforms such as Taobao.com and JD.com. Return insurance is underwritten by an insurer and can be purchased by either a retailer or a consumer. Under such insurance, the insurer partially compensates consumers for their hassle costs associated with product return.');

-- --------------------------------------------------------

--
-- Table structure for table `article_author`
--

CREATE TABLE `article_author` (
  `author` varchar(30) NOT NULL,
  `article_num` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `article_author`
--

INSERT INTO `article_author` (`author`, `article_num`) VALUES
('BBC,N.Bulletin', 'A3'),
('IEEE', 'A4'),
('James,Kyle', 'A1'),
('Morgone', 'A2'),
('Rodrigez', 'A5');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `publication_id` varchar(3) NOT NULL,
  `ISBN_num` varchar(3) NOT NULL,
  `title` varchar(20) NOT NULL,
  `issue_year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`publication_id`, `ISBN_num`, `title`, `issue_year`) VALUES
('PB1', 'B1', 'Harry Potter', 2000),
('PB2', 'B2', 'Theory of Everything', 1998),
('PB3', 'B3', 'Vendor of Sweets', 2002),
('PB4', 'B4', 'Pulp Fiction', 2005),
('PB5', 'B5', 'TENET', 2001);

-- --------------------------------------------------------

--
-- Table structure for table `book_copy`
--

CREATE TABLE `book_copy` (
  `book_copy_no` varchar(3) NOT NULL,
  `ISBN_num` varchar(3) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_copy`
--

INSERT INTO `book_copy` (`book_copy_no`, `ISBN_num`, `quantity`) VALUES
('Bc1', 'B1', 20),
('Bc2', 'B2', 37),
('Bc3', 'B3', 14),
('Bc4', 'B4', 26),
('Bc5', 'B5', 15);

-- --------------------------------------------------------

--
-- Table structure for table `book_copy_order`
--

CREATE TABLE `book_copy_order` (
  `book_copy_no` varchar(3) NOT NULL,
  `order_id` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_copy_order`
--

INSERT INTO `book_copy_order` (`book_copy_no`, `order_id`) VALUES
('Bc1', 'OD1'),
('Bc2', 'OD2'),
('Bc3', 'OD3'),
('Bc4', 'OD4'),
('Bc5', 'OD5');

-- --------------------------------------------------------

--
-- Table structure for table `book_order`
--

CREATE TABLE `book_order` (
  `ISBN_num` varchar(3) NOT NULL,
  `order_id` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_order`
--

INSERT INTO `book_order` (`ISBN_num`, `order_id`) VALUES
('B1', 'OD3'),
('B1', 'OD4'),
('B2', 'OD1'),
('B3', 'OD5'),
('B5', 'OD2');

-- --------------------------------------------------------

--
-- Table structure for table `book_reservation`
--

CREATE TABLE `book_reservation` (
  `ISBN_num` varchar(3) NOT NULL,
  `reservation_num` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_reservation`
--

INSERT INTO `book_reservation` (`ISBN_num`, `reservation_num`) VALUES
('B1', 'R1'),
('B2', 'R2'),
('B3', 'R3'),
('B4', 'R4'),
('B5', 'R5');

-- --------------------------------------------------------

--
-- Table structure for table `journal`
--

CREATE TABLE `journal` (
  `publication_id` varchar(3) NOT NULL,
  `Journal_num` varchar(3) NOT NULL,
  `name` varchar(30) NOT NULL,
  `publisher` varchar(30) NOT NULL,
  `Description` varchar(150) DEFAULT NULL,
  `Year_of_creation` int(11) DEFAULT NULL,
  `Subscription_cost` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `journal`
--

INSERT INTO `journal` (`publication_id`, `Journal_num`, `name`, `publisher`, `Description`, `Year_of_creation`, `Subscription_cost`) VALUES
('PJ1', 'J1', 'Scopus', 'BBLC coporate.', 'Scopus is one of the two big commercial, bibliographic databases that cover scholarly literature from almost any discipline. Beside searching for rese', 2015, '120/='),
('PJ2', 'J2', 'Web of Science', 'Howard University.', 'Web of Science also known as Web of Knowledge is the second big bibliographic database. Usually, academic institutions provide either access to Web of', 1999, '320/='),
('PJ3', 'J3', 'ERIC', 'John Newman', 'For education sciences, ERIC is the number one destination. ERIC stands for Education Resources Information Center, and is a database that specificall', 2014, '180/='),
('PJ4', 'J4', 'IEEE Xplore', 'Society of IEEE', 'IEEE Xplore is the leading academic database in the field of engineering and computer science. It\'s not only journal articles, but also conference pap', 2012, '300/='),
('PJ5', 'J5', 'The Wisdom', 'Elon Musk', 'The Wisdom is the gateway to the millions of academic articles published by Elsevier. 2,500 journals and more than 40,000 e-books can be searched via ', 2016, '250/=');

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

CREATE TABLE `librarian` (
  `librarian_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `librarian`
--

INSERT INTO `librarian` (`librarian_id`, `name`) VALUES
(1, 'Mark Strong'),
(2, 'Neil Patrick'),
(3, 'Robert Daniels'),
(4, 'Ann Fernando'),
(5, 'Henry Cavil');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `librarian_id` int(11) NOT NULL,
  `order_id` varchar(3) NOT NULL,
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`librarian_id`, `order_id`, `order_date`) VALUES
(4, 'OD1', '2000-09-02'),
(1, 'OD2', '2000-03-07'),
(4, 'OD3', '1999-12-27'),
(4, 'OD4', '2001-03-23'),
(5, 'OD5', '2000-05-05');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_num` varchar(3) NOT NULL,
  `reservation_date` date DEFAULT NULL,
  `user_id` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_num`, `reservation_date`, `user_id`) VALUES
('R1', '2001-04-08', 'U2'),
('R2', '2002-04-05', 'U1'),
('R3', '2001-03-03', 'U1'),
('R4', '2003-06-08', 'U3'),
('R5', '2000-11-01', 'U5');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `User_ID` varchar(2) NOT NULL,
  `F_name` varchar(10) NOT NULL,
  `L_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`User_ID`, `F_name`, `L_name`) VALUES
('U1', 'Amal', 'Perera'),
('U2', 'Diane', 'Klington'),
('U3', 'Dave', 'Rogers'),
('U4', 'Sam', 'Fraseer'),
('U5', 'Lex', 'Luther');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_num`),
  ADD KEY `Journal_num` (`Journal_num`);

--
-- Indexes for table `article_author`
--
ALTER TABLE `article_author`
  ADD PRIMARY KEY (`author`,`article_num`),
  ADD KEY `article_num` (`article_num`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ISBN_num`);

--
-- Indexes for table `book_copy`
--
ALTER TABLE `book_copy`
  ADD PRIMARY KEY (`book_copy_no`),
  ADD KEY `ISBN_num` (`ISBN_num`);

--
-- Indexes for table `book_copy_order`
--
ALTER TABLE `book_copy_order`
  ADD PRIMARY KEY (`book_copy_no`,`order_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `book_order`
--
ALTER TABLE `book_order`
  ADD PRIMARY KEY (`ISBN_num`,`order_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `book_reservation`
--
ALTER TABLE `book_reservation`
  ADD PRIMARY KEY (`reservation_num`,`ISBN_num`),
  ADD KEY `ISBN_num` (`ISBN_num`);

--
-- Indexes for table `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`Journal_num`);

--
-- Indexes for table `librarian`
--
ALTER TABLE `librarian`
  ADD PRIMARY KEY (`librarian_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `librarian_id` (`librarian_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_num`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`User_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`Journal_num`) REFERENCES `journal` (`Journal_num`);

--
-- Constraints for table `article_author`
--
ALTER TABLE `article_author`
  ADD CONSTRAINT `article_author_ibfk_1` FOREIGN KEY (`article_num`) REFERENCES `article` (`article_num`);

--
-- Constraints for table `book_copy`
--
ALTER TABLE `book_copy`
  ADD CONSTRAINT `book_copy_ibfk_1` FOREIGN KEY (`ISBN_num`) REFERENCES `book` (`ISBN_num`);

--
-- Constraints for table `book_copy_order`
--
ALTER TABLE `book_copy_order`
  ADD CONSTRAINT `book_copy_order_ibfk_1` FOREIGN KEY (`book_copy_no`) REFERENCES `book_copy` (`book_copy_no`),
  ADD CONSTRAINT `book_copy_order_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order_details` (`order_id`);

--
-- Constraints for table `book_order`
--
ALTER TABLE `book_order`
  ADD CONSTRAINT `book_order_ibfk_1` FOREIGN KEY (`ISBN_num`) REFERENCES `book` (`ISBN_num`),
  ADD CONSTRAINT `book_order_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order_details` (`order_id`);

--
-- Constraints for table `book_reservation`
--
ALTER TABLE `book_reservation`
  ADD CONSTRAINT `book_reservation_ibfk_1` FOREIGN KEY (`reservation_num`) REFERENCES `reservation` (`reservation_num`),
  ADD CONSTRAINT `book_reservation_ibfk_2` FOREIGN KEY (`ISBN_num`) REFERENCES `book` (`ISBN_num`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`librarian_id`) REFERENCES `librarian` (`librarian_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`User_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
