-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2023 at 06:15 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mybarterit_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_items`
--

CREATE TABLE `tbl_items` (
  `user_id` int(6) NOT NULL,
  `item_id` int(6) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_desc` varchar(100) NOT NULL,
  `item_type` varchar(100) NOT NULL,
  `item_price` double NOT NULL,
  `item_qty` double NOT NULL,
  `item_lat` float NOT NULL,
  `item_long` int(11) NOT NULL,
  `item_state` varchar(50) NOT NULL,
  `item_locality` varchar(50) NOT NULL,
  `item_date` datetime NOT NULL DEFAULT current_timestamp(),
  `item_image` varchar(100) NOT NULL,
  `item_image1` varchar(100) NOT NULL,
  `item_image2` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_items`
--

INSERT INTO `tbl_items` (`user_id`, `item_id`, `item_name`, `item_desc`, `item_type`, `item_price`, `item_qty`, `item_lat`, `item_long`, `item_state`, `item_locality`, `item_date`, `item_image`, `item_image1`, `item_image2`) VALUES
(1, 1, 'Sofa', 'A 3-seater sofa made with real leather, with a 10-year warranty', 'Furniture', 899, 1, 3.03271, 102, 'Selangor', 'Puchong', '2023-06-29 19:21:04', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(1, 2, 'Wooder chair', 'The wooden chair is made of high-quality materials and is designed for comfortable extended use', 'Furniture', 39.9, 6, 3.03271, 102, 'Selangor', 'Puchong', '2023-06-29 19:22:17', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(1, 3, 'Long chair', 'The sleek and stylish long chair offers a perfect blend of elegance and comfort for lounging or rela', 'Furniture', 79.9, 1, 3.03271, 102, 'Selangor', 'Puchong', '2023-06-29 19:23:45', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(1, 4, 'Plate', 'White-colored premium plates, sold in a set, contain several plates', 'Kitchen & Dining', 59.9, 1, 3.03271, 102, 'Selangor', 'Puchong', '2023-06-29 19:24:34', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(1, 5, 'Clock', 'Exquisite clock, enhancing your space with style and precision', 'Furniture', 69.9, 2, 3.03271, 102, 'Selangor', 'Puchong', '2023-06-29 19:25:42', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(1, 6, 'Floor mat', 'The durable and versatile floor mat provides a practical solution for protecting your floors while a', 'Other', 19.9, 5, 3.03271, 102, 'Selangor', 'Puchong', '2023-06-29 19:27:05', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(2, 7, 'Wireless mouse', 'Wireless gaming mouse for ultimate performance and freedom', 'Compuer Accessories', 129, 1, 2.2755, 102, 'Melaka', 'Bemban', '2023-06-29 19:36:13', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABArwAAAEBAAMAAAABAdIAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAu4AAAEBAAMAAAABAfQAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAgoAAAEBAAMAAAABAVwAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(2, 8, 'Wireless keyboard', 'High-performance wireless gaming keyboard for seamless gaming experience', 'Compuer Accessories', 189, 1, 2.2755, 102, 'Melaka', 'Bemban', '2023-06-29 19:41:02', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAlgAAAEBAAMAAAABAZAAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAwAAAAEBAAMAAAABAgAAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAakAAAEBAAMAAAABARsAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(2, 9, 'USB-C cable', 'Versatile and durable USB-C cable for fast and reliable data transfer and charging', 'Compuer Accessories', 80, 2, 2.2755, 102, 'Melaka', 'Bemban', '2023-06-29 19:43:02', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAtAAAAEBAAMAAAABAeAAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAtAAAAEBAAMAAAABAeAAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(2, 10, 'Drawing tablet', 'High-performance drawing tablet for digital artists, offering precise pen control and a responsive d', 'Compuer Accessories', 99.9, 5, 2.2755, 102, 'Melaka', 'Bemban', '2023-06-29 19:44:14', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_datereg` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `user_name`, `user_email`, `user_password`, `user_datereg`) VALUES
(1, 'keaqiu', 'keaqiuynwa@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', '2023-06-11 11:16:33.353140'),
(2, 'Farhan', 'farhan@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', '2023-06-29 18:22:05.397369'),
(3, 'livent', 'livent@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', '2023-06-29 23:11:00.453447');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_items`
--
ALTER TABLE `tbl_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_items`
--
ALTER TABLE `tbl_items`
  MODIFY `item_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_items`
--
ALTER TABLE `tbl_items`
  ADD CONSTRAINT `foreign key` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
