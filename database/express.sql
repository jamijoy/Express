-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2020 at 11:41 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `express`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_block_request`
--

CREATE TABLE `account_block_request` (
  `user_id` int(5) NOT NULL,
  `block_status` varchar(15) NOT NULL,
  `req_time` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_block_request`
--

INSERT INTO `account_block_request` (`user_id`, `block_status`, `req_time`) VALUES
(10003, 'pending', '3-3-2020 15:30'),
(10004, 'pending', '1583616674581');

-- --------------------------------------------------------

--
-- Table structure for table `account_status`
--

CREATE TABLE `account_status` (
  `account_status_id` int(5) NOT NULL,
  `account_status_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_status`
--

INSERT INTO `account_status` (`account_status_id`, `account_status_name`) VALUES
(10, 'active'),
(11, 'deactive'),
(12, 'block');

-- --------------------------------------------------------

--
-- Table structure for table `account_type`
--

CREATE TABLE `account_type` (
  `account_type_id` int(5) NOT NULL,
  `account_type_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_type`
--

INSERT INTO `account_type` (`account_type_id`, `account_type_name`) VALUES
(30, 'public'),
(31, 'private');

-- --------------------------------------------------------

--
-- Table structure for table `account_warning`
--

CREATE TABLE `account_warning` (
  `user_id` int(5) NOT NULL,
  `warning_count` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_warning`
--

INSERT INTO `account_warning` (`user_id`, `warning_count`) VALUES
(10003, 3),
(10004, 2);

-- --------------------------------------------------------

--
-- Table structure for table `following_status`
--

CREATE TABLE `following_status` (
  `following_status_id` int(5) NOT NULL,
  `following_status_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `message_details`
--

CREATE TABLE `message_details` (
  `message_id` int(11) NOT NULL,
  `message_text` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message_details`
--

INSERT INTO `message_details` (`message_id`, `message_text`) VALUES
(40000, '0'),
(40001, '0'),
(40002, 'Your post request is canceled.'),
(40003, 'Your post request is canceled.'),
(40004, 'Your post request is canceled.'),
(40005, 'Your post request is canceled.'),
(40006, 'Your post request is canceled.'),
(40007, 'Your post request is canceled.'),
(40008, 'your account was warned'),
(40009, 'your account was warned'),
(40010, 'your account was warned'),
(40011, 'your account was warned'),
(40012, 'your account was warned'),
(40013, 'your account was warned'),
(40014, 'your account was warned'),
(40015, 'Your post request is canceled.'),
(40016, 'your account was warned'),
(40017, 'your account was warned'),
(40018, 'Your post request is canceled.'),
(40019, 'your account was warned'),
(40020, 'Your post request is canceled.');

-- --------------------------------------------------------

--
-- Table structure for table `message_info`
--

CREATE TABLE `message_info` (
  `sender_id` int(5) NOT NULL,
  `receiver_id` int(5) NOT NULL,
  `message_id` int(5) NOT NULL,
  `message_status_id` int(5) NOT NULL,
  `msg_time` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message_info`
--

INSERT INTO `message_info` (`sender_id`, `receiver_id`, `message_id`, `message_status_id`, `msg_time`) VALUES
(10001, 10003, 40006, 60, ''),
(10001, 10004, 40007, 60, ''),
(10001, 10004, 40008, 60, ''),
(10001, 10004, 40009, 60, ''),
(10001, 10004, 40010, 60, ''),
(10001, 10003, 40011, 60, ''),
(10001, 10003, 40012, 60, ''),
(10001, 10003, 40013, 60, ''),
(10001, 10004, 40014, 60, ''),
(10001, 10003, 40015, 60, ''),
(10000, 10003, 40016, 60, ''),
(10000, 10003, 40017, 60, ''),
(10001, 10003, 40018, 60, '1583616381991'),
(10001, 10004, 40019, 60, '1583616426102'),
(10001, 10004, 40020, 60, '1583616674622');

-- --------------------------------------------------------

--
-- Table structure for table `message_status`
--

CREATE TABLE `message_status` (
  `message_status_id` int(5) NOT NULL,
  `message_status_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message_status`
--

INSERT INTO `message_status` (`message_status_id`, `message_status_name`) VALUES
(60, 'sent'),
(61, 'seen');

-- --------------------------------------------------------

--
-- Table structure for table `post_comment`
--

CREATE TABLE `post_comment` (
  `post_id` int(5) NOT NULL,
  `comment_user_id` int(5) NOT NULL,
  `comment_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `post_comment_details`
--

CREATE TABLE `post_comment_details` (
  `comment_id` int(5) NOT NULL,
  `comment_text` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `post_content`
--

CREATE TABLE `post_content` (
  `post_id` int(5) NOT NULL,
  `post_text` varchar(500) DEFAULT NULL,
  `post_image` varchar(100) DEFAULT NULL,
  `post_image_source` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_content`
--

INSERT INTO `post_content` (`post_id`, `post_text`, `post_image`, `post_image_source`) VALUES
(20000, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', NULL, NULL),
(20002, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, NULL),
(20003, 'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.', NULL, NULL),
(20004, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.', NULL, NULL),
(20005, 'Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC.', NULL, NULL),
(20006, 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', NULL, NULL),
(20008, 'Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', NULL, NULL),
(20009, 'Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC.', NULL, NULL),
(20010, 'hi I am content manager', NULL, NULL),
(20011, 'checking time!!!', NULL, NULL),
(20012, 'final check for time check', NULL, NULL),
(20013, 'check for approve', NULL, NULL),
(20014, 'check for approve', NULL, NULL),
(20016, 'check for delete', NULL, NULL),
(20017, 'check for warning', NULL, NULL),
(20018, 'check for warning', NULL, NULL),
(20020, 'check for block request', NULL, NULL),
(20021, 'check for pending', NULL, NULL),
(20022, 'check for pending', NULL, NULL),
(20023, 'check for pending', NULL, NULL),
(20024, 'check for pending', NULL, NULL),
(20025, 'check for pending', NULL, NULL),
(20026, 'check for pending', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_info`
--

CREATE TABLE `post_info` (
  `post_id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `post_type_id` int(5) NOT NULL,
  `post_status_id` int(5) NOT NULL,
  `post_time` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_info`
--

INSERT INTO `post_info` (`post_id`, `user_id`, `post_type_id`, `post_status_id`, `post_time`) VALUES
(20000, 10003, 40, 51, '1583610200501'),
(20002, 10003, 41, 51, '1583610220603'),
(20003, 10003, 41, 51, '1583610230620'),
(20004, 10003, 42, 51, '1583610240622'),
(20005, 10004, 40, 51, '1583610250623'),
(20006, 10004, 40, 50, '1583610260624'),
(20008, 10004, 41, 51, '1583610270101'),
(20009, 10004, 42, 51, '1583610270202'),
(20010, 10001, 40, 51, '1583610270509'),
(20011, 10001, 40, 51, '1583611159509'),
(20012, 10001, 40, 51, '1583611581349'),
(20013, 10003, 40, 50, '1583611581450'),
(20014, 10003, 40, 30, '1583611581550'),
(20016, 10003, 40, 50, '1583611581750'),
(20017, 10004, 40, 51, '1583611581850'),
(20018, 10004, 40, 50, '1583611581950'),
(20020, 10003, 40, 50, '1583611582550'),
(20021, 10004, 40, 50, '1583611583450'),
(20022, 10003, 40, 50, '1583611585450'),
(20023, 10004, 40, 50, '1583611586450'),
(20024, 10003, 40, 50, '1583611587450'),
(20025, 10004, 40, 50, '1583611589450'),
(20026, 10003, 40, 50, '1583611591450');

-- --------------------------------------------------------

--
-- Table structure for table `post_like`
--

CREATE TABLE `post_like` (
  `post_id` int(5) NOT NULL,
  `like_user_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `post_status`
--

CREATE TABLE `post_status` (
  `post_status_id` int(5) NOT NULL,
  `post_status_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_status`
--

INSERT INTO `post_status` (`post_status_id`, `post_status_name`) VALUES
(50, 'pending'),
(51, 'approve'),
(52, 'delete');

-- --------------------------------------------------------

--
-- Table structure for table `post_type`
--

CREATE TABLE `post_type` (
  `post_type_id` int(5) NOT NULL,
  `post_type_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_type`
--

INSERT INTO `post_type` (`post_type_id`, `post_type_name`) VALUES
(40, 'public'),
(41, 'private'),
(42, 'anonymous');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `user_id` int(5) NOT NULL,
  `username` varchar(30) NOT NULL,
  `firstname` varchar(40) DEFAULT NULL,
  `lastname` varchar(40) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `birthdate` varchar(50) DEFAULT NULL,
  `bio` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `image_filename` varchar(100) DEFAULT NULL,
  `image_source` varchar(255) DEFAULT NULL,
  `user_type_id` int(5) NOT NULL,
  `account_type_id` int(5) NOT NULL,
  `account_status_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `username`, `firstname`, `lastname`, `phone_number`, `gender`, `birthdate`, `bio`, `website`, `address`, `image_filename`, `image_source`, `user_type_id`, `account_type_id`, `account_status_id`) VALUES
(10000, 'admin', NULL, NULL, NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, 20, 31, 10),
(10001, 'content manager', NULL, NULL, NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, 21, 31, 10),
(10002, 'account manager', NULL, NULL, '01779611966', 'male', '20-03-1998', 'Prefers Convention Over Configuration.', NULL, NULL, NULL, NULL, 22, 31, 10),
(10003, 'user1', NULL, NULL, NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, 23, 31, 10),
(10004, 'user2', NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, NULL, 23, 31, 10),
(10005, 'Md. Estiak Ahmed', NULL, NULL, '01766461990', 'male', '1997-09-03', 'Hi I am estiak', NULL, NULL, NULL, NULL, 23, 31, 10),
(10006, 'nahian', NULL, NULL, NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, 23, 30, 10);

-- --------------------------------------------------------

--
-- Table structure for table `user_follower`
--

CREATE TABLE `user_follower` (
  `user_id` int(5) NOT NULL,
  `follower_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_following`
--

CREATE TABLE `user_following` (
  `user_id` int(5) NOT NULL,
  `following_id` int(5) NOT NULL,
  `following_status_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `user_id` int(5) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`user_id`, `email`, `password`) VALUES
(10000, 'admin@gmail.com', 'admin'),
(10001, 'content.manager@gmail.com', 'cm'),
(10002, 'ac.manager@gmail.com', 'aa'),
(10003, 'user1@gmail.com', 'user1'),
(10004, 'user2@gmail.com', 'user2'),
(10005, 'estiak@gmail.com', 'estiak'),
(10006, 'nahian@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `user_type_id` int(5) NOT NULL,
  `user_type_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`user_type_id`, `user_type_name`) VALUES
(20, 'admin'),
(21, 'content manager'),
(22, 'account manager'),
(23, 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_status`
--
ALTER TABLE `account_status`
  ADD PRIMARY KEY (`account_status_id`);

--
-- Indexes for table `account_type`
--
ALTER TABLE `account_type`
  ADD PRIMARY KEY (`account_type_id`);

--
-- Indexes for table `following_status`
--
ALTER TABLE `following_status`
  ADD PRIMARY KEY (`following_status_id`);

--
-- Indexes for table `message_details`
--
ALTER TABLE `message_details`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `message_status`
--
ALTER TABLE `message_status`
  ADD PRIMARY KEY (`message_status_id`);

--
-- Indexes for table `post_comment_details`
--
ALTER TABLE `post_comment_details`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `post_content`
--
ALTER TABLE `post_content`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `post_info`
--
ALTER TABLE `post_info`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `post_status`
--
ALTER TABLE `post_status`
  ADD PRIMARY KEY (`post_status_id`);

--
-- Indexes for table `post_type`
--
ALTER TABLE `post_type`
  ADD PRIMARY KEY (`post_type_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`user_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_status`
--
ALTER TABLE `account_status`
  MODIFY `account_status_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `account_type`
--
ALTER TABLE `account_type`
  MODIFY `account_type_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `following_status`
--
ALTER TABLE `following_status`
  MODIFY `following_status_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message_details`
--
ALTER TABLE `message_details`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40021;

--
-- AUTO_INCREMENT for table `message_status`
--
ALTER TABLE `message_status`
  MODIFY `message_status_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `post_comment_details`
--
ALTER TABLE `post_comment_details`
  MODIFY `comment_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_content`
--
ALTER TABLE `post_content`
  MODIFY `post_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20027;

--
-- AUTO_INCREMENT for table `post_info`
--
ALTER TABLE `post_info`
  MODIFY `post_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20027;

--
-- AUTO_INCREMENT for table `post_status`
--
ALTER TABLE `post_status`
  MODIFY `post_status_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `post_type`
--
ALTER TABLE `post_type`
  MODIFY `post_type_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `user_login`
--
ALTER TABLE `user_login`
  MODIFY `user_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10007;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `user_type_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
