-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 29, 2020 at 07:03 PM
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
  `block_status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `message_text` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `message_info`
--

CREATE TABLE `message_info` (
  `sender_id` int(5) NOT NULL,
  `receiver_id` int(5) NOT NULL,
  `message_id` int(5) NOT NULL,
  `message_status_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `post_text` varchar(100) DEFAULT NULL,
  `post_image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `post_info`
--

CREATE TABLE `post_info` (
  `post_id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `post_type_id` int(5) NOT NULL,
  `post_status_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `phone_number` varchar(20) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `birthdate` varchar(50) DEFAULT NULL,
  `bio` varchar(100) DEFAULT NULL,
  `profile_picture` varchar(100) DEFAULT NULL,
  `user_type_id` int(5) NOT NULL,
  `account_type_id` int(5) NOT NULL,
  `account_status_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `username`, `phone_number`, `gender`, `birthdate`, `bio`, `profile_picture`, `user_type_id`, `account_type_id`, `account_status_id`) VALUES
(10000, 'admin', NULL, 'male', NULL, NULL, NULL, 20, 31, 10),
(10001, 'content manager', NULL, 'male', NULL, NULL, NULL, 21, 31, 10),
(10002, 'account manager', NULL, 'male', NULL, NULL, NULL, 22, 31, 10),
(10003, 'user1', NULL, 'male', NULL, NULL, NULL, 23, 31, 10),
(10004, 'user2', NULL, 'female', NULL, NULL, NULL, 23, 31, 10);

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
(10002, 'account.manager@gmail.com', 'am'),
(10003, 'user1@gmail.com', 'user1'),
(10004, 'user2@gmail.com', 'user2');

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
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40000;

--
-- AUTO_INCREMENT for table `message_status`
--
ALTER TABLE `message_status`
  MODIFY `message_status_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `post_comment_details`
--
ALTER TABLE `post_comment_details`
  MODIFY `comment_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30000;

--
-- AUTO_INCREMENT for table `post_content`
--
ALTER TABLE `post_content`
  MODIFY `post_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20000;

--
-- AUTO_INCREMENT for table `post_info`
--
ALTER TABLE `post_info`
  MODIFY `post_id` int(5) NOT NULL AUTO_INCREMENT;

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
  MODIFY `user_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10005;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `user_type_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
