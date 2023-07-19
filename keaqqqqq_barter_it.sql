-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 19, 2023 at 04:17 PM
-- Server version: 10.3.39-MariaDB-cll-lve
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `keaqqqqq_barter_it`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_carts`
--

CREATE TABLE `tbl_carts` (
  `cart_id` int(5) NOT NULL,
  `item_id` varchar(5) NOT NULL,
  `cart_qty` int(5) NOT NULL,
  `cart_price` float NOT NULL,
  `user_id` varchar(5) NOT NULL,
  `seller_id` varchar(5) NOT NULL,
  `cart_date` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_carts`
--

INSERT INTO `tbl_carts` (`cart_id`, `item_id`, `cart_qty`, `cart_price`, `user_id`, `seller_id`, `cart_date`) VALUES
(18, '13', 1, 999, '16', '4', '2023-07-19 14:47:38.406530'),
(19, '18', 5, 95, '16', '3', '2023-07-19 14:48:00.938795'),
(20, '19', 1, 19.9, '16', '3', '2023-07-19 14:48:05.623357');

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
(1, 1, '3 Seater Sofa', 'A 3-seater sofa made with real leather, with a 10-year warranty', 'Furniture', 899, 2, 3.03271, 102, 'Selangor', 'Puchong', '2023-06-29 19:21:04', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(1, 2, 'Wooder chair', 'The wooden chair is made of high-quality materials and is designed for comfortable extended use', 'Furniture', 39.9, 1, 3.03271, 102, 'Selangor', 'Puchong', '2023-06-29 19:22:17', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(1, 3, 'Long chair', 'The sleek and stylish long chair offers a perfect blend of elegance and comfort for lounging or rela', 'Furniture', 79.9, 1, 3.03271, 102, 'Selangor', 'Puchong', '2023-06-29 19:23:45', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(1, 4, 'Plate', 'White-colored premium plates, sold in a set, contain several plates', 'Kitchen & Dining', 59.9, 1, 3.03271, 102, 'Selangor', 'Puchong', '2023-06-29 19:24:34', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(1, 5, 'Clock', 'Exquisite clock, enhancing your space with style and precision', 'Furniture', 69.9, 1, 3.03271, 102, 'Selangor', 'Puchong', '2023-06-29 19:25:42', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(1, 6, 'Floor mat', 'The durable and versatile floor mat provides a practical solution for protecting your floors while a', 'Other', 19.9, 3, 3.03271, 102, 'Selangor', 'Puchong', '2023-06-29 19:27:05', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(2, 7, 'Wireless mouse', 'Wireless gaming mouse for ultimate performance and freedom', 'Compuer Accessories', 129, 1, 2.2755, 102, 'Melaka', 'Bemban', '2023-06-29 19:36:13', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABArwAAAEBAAMAAAABAdIAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAu4AAAEBAAMAAAABAfQAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAgoAAAEBAAMAAAABAVwAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(2, 8, 'Wireless keyboard', 'High-performance wireless gaming keyboard for seamless gaming experience', 'Compuer Accessories', 189, 1, 2.2755, 102, 'Melaka', 'Bemban', '2023-06-29 19:41:02', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAlgAAAEBAAMAAAABAZAAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAwAAAAEBAAMAAAABAgAAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAakAAAEBAAMAAAABARsAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(2, 9, 'USB-C cable', 'Versatile and durable USB-C cable for fast and reliable data transfer and charging', 'Compuer Accessories', 80, 2, 2.2755, 102, 'Melaka', 'Bemban', '2023-06-29 19:43:02', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAtAAAAEBAAMAAAABAeAAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAtAAAAEBAAMAAAABAeAAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(2, 10, 'Drawing tablet', 'High-performance drawing tablet for digital artists, offering precise pen control and a responsive d', 'Compuer Accessories', 99.9, 2, 2.2755, 102, 'Melaka', 'Bemban', '2023-06-29 19:44:14', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(4, 11, 'Seiko 5', 'A branded watch', 'Watches', 2500, 1, 2.2755, 102, 'Melaka', 'Bemban', '2023-07-05 01:01:24', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAlgAAAEBAAMAAAABAZAAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAlgAAAEBAAMAAAABAZAAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAlgAAAEBAAMAAAABAZAAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(4, 12, 'The Reverse Flash', 'Three Hand Stainless Steel Watch', 'Watches', 1500, 1, 2.2755, 102, 'Melaka', 'Bemban', '2023-07-05 01:11:45', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(4, 13, 'Amazfit', 'Amazfit Cheetah Round', 'Watches', 999, 1, 2.2755, 102, 'Melaka', 'Bemban', '2023-07-05 01:40:13', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAk4AAAEBAAMAAAABAYkAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAk4AAAEBAAMAAAABAYkAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAk4AAAEBAAMAAAABAYkAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(3, 14, 'Women Oversized Denim Jacket', 'Color: Light blue', 'Clothes', 59.9, 50, 5.46422, 100, 'Pulau Pinang', 'George Town', '2023-07-19 12:32:48', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(3, 15, 'Women Oversized Denim Jacket', 'Color: Blue', 'Clothes', 59.9, 50, 5.46422, 100, 'Pulau Pinang', 'George Town', '2023-07-19 12:35:53', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(3, 16, 'Men Graphic Short Sleeve T-Shirt', 'Color: Light blue', 'Clothes', 9.9, 100, 5.46422, 100, 'Pulau Pinang', 'George Town', '2023-07-19 12:38:34', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(3, 17, 'Women Oversized Long Sleeve Shirt', 'Color: Light purple', 'Clothes', 29.9, 20, 5.46422, 100, 'Pulau Pinang', 'George Town', '2023-07-19 12:41:07', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(3, 18, 'Men Graphic Short Sleeve T-Shirt', 'Color: White', 'Clothes', 19, 20, 5.46422, 100, 'Pulau Pinang', 'George Town', '2023-07-19 12:43:44', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(3, 19, 'Men Graphic Short Sleeve T-Shirt', 'Color: Lilac', 'Clothes', 19.9, 10, 5.46422, 100, 'Pulau Pinang', 'George Town', '2023-07-19 12:47:07', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(5, 20, 'Casio Financial Calculator ', 'FC-100V-2', 'Stationary', 200, 1, 4.59926, 101, 'Perak', 'Ipoh', '2023-07-19 12:50:40', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(5, 21, 'Fabric Pencil Bag', 'Color: Grey', 'Stationary', 10, 100, 4.59926, 101, 'Perak', 'Ipoh', '2023-07-19 13:35:17', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(5, 22, 'Pop Kids School Bag', 'Schoolmate Chili Red', 'Stationary', 200, 2, 4.59926, 101, 'Perak', 'Ipoh', '2023-07-19 13:38:23', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(5, 23, 'Plus Correction Tape', 'Length: 5mm', 'Stationary', 7.8, 1000, 4.59926, 101, 'Perak', 'Ipoh', '2023-07-19 13:40:51', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA'),
(6, 24, 'Apple Airpods Pro', 'Original set', 'Mobile & Accessories', 999, 1, 5.64437, 100, 'Kedah', 'Sungai Petani', '2023-07-19 13:55:34', '/9j/4QDCRXhpZgAATU0AKgAAAAgABQEAAAMAAAABAfQAAAEBAAMAAAABAU0AAIdpAAQAAAABAAAAXgESAAMAAAABAAAAAAEyAAIA', '/9j/4QDCRXhpZgAATU0AKgAAAAgABQEAAAMAAAABAfQAAAEBAAMAAAABAU0AAIdpAAQAAAABAAAAXgESAAMAAAABAAAAAAEyAAIA', '/9j/4QDCRXhpZgAATU0AKgAAAAgABQEAAAMAAAABAfQAAAEBAAMAAAABAU0AAIdpAAQAAAABAAAAXgESAAMAAAABAAAAAAEyAAIA'),
(6, 25, 'Apple Magsafe Battery Pack', 'Original', 'Mobile & Accessories', 439, 1, 5.64437, 100, 'Kedah', 'Sungai Petani', '2023-07-19 14:04:08', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA', '/9j/4QCCRXhpZgAATU0AKgAAAAgABAEAAAMAAAABAyAAAAEBAAMAAAABAhUAAIdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAA');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news`
--

CREATE TABLE `tbl_news` (
  `news_id` int(6) NOT NULL,
  `news_title` varchar(100) NOT NULL,
  `news_detail` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_news`
--

INSERT INTO `tbl_news` (`news_id`, `news_title`, `news_detail`, `created_at`) VALUES
(1, 'Discover a World of Exciting Deals on Barter_IT!', 'Barter_IT is your go-to app for discovering amazing deals and connecting with sellers offering a wid', '2023-07-16 17:44:46'),
(2, 'Discover a World of Exciting Deals on Barter_IT!', 'Welcome all of you !!!', '2023-07-19 15:04:25');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orderdetails`
--

CREATE TABLE `tbl_orderdetails` (
  `orderdetail_id` int(5) NOT NULL,
  `order_bill` varchar(8) NOT NULL,
  `item_id` varchar(5) NOT NULL,
  `orderdetail_qty` int(5) NOT NULL,
  `orderdetail_paid` float NOT NULL,
  `buyer_id` varchar(5) NOT NULL,
  `seller_id` varchar(5) NOT NULL,
  `orderdetail_date` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_orderdetails`
--

INSERT INTO `tbl_orderdetails` (`orderdetail_id`, `order_bill`, `item_id`, `orderdetail_qty`, `orderdetail_paid`, `buyer_id`, `seller_id`, `orderdetail_date`) VALUES
(9, 'el0prqqh', '2', 2, 79.8, '7', '1', '2023-07-13 16:45:54.477760'),
(10, 'el0prqqh', '1', 1, 899, '7', '1', '2023-07-13 16:45:54.490087'),
(11, 'auutumoo', '2', 1, 39.9, '7', '1', '2023-07-14 11:22:12.886325'),
(12, 'auutumoo', '10', 1, 99.9, '7', '2', '2023-07-14 11:22:12.894577'),
(13, 'ehqd0mg0', '2', 1, 39.9, '9', '1', '2023-07-15 21:59:10.198303'),
(14, 'cb305mvt', '6', 1, 19.9, '9', '1', '2023-07-15 22:17:09.009615'),
(15, 'ml40t0vs', '6', 1, 19.9, '9', '1', '2023-07-15 22:19:02.903455'),
(16, 'wqsg9uev', '10', 1, 99.9, '9', '2', '2023-07-15 22:21:01.109650'),
(17, 'vuykshgi', '10', 1, 99.9, '9', '2', '2023-07-15 22:22:24.305842'),
(18, 'raiyj4ea', '1', 1, 899, '7', '1', '2023-07-17 23:27:22.021303'),
(19, 'g08fbonz', '1', 3, 2697, '8', '1', '2023-07-17 23:30:01.457948'),
(20, 'nmz0pit8', '1', 1, 899, '11', '1', '2023-07-17 23:48:01.424233'),
(21, 'nmz0pit8', '2', 1, 39.9, '11', '1', '2023-07-17 23:48:01.479740'),
(22, 'odan60bu', '1', 3, 2697, '17', '1', '2023-07-19 14:55:50.950291'),
(23, 'odan60bu', '5', 1, 69.9, '17', '1', '2023-07-19 14:55:51.056985');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `order_id` int(5) NOT NULL,
  `order_bill` varchar(8) NOT NULL,
  `order_paid` float NOT NULL,
  `buyer_id` varchar(5) NOT NULL,
  `seller_id` varchar(5) NOT NULL,
  `order_date` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `order_status` varchar(20) NOT NULL,
  `order_lat` varchar(12) NOT NULL,
  `order_lng` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_orders`
--

INSERT INTO `tbl_orders` (`order_id`, `order_bill`, `order_paid`, `buyer_id`, `seller_id`, `order_date`, `order_status`, `order_lat`, `order_lng`) VALUES
(5, 'el0prqqh', 978.8, '7', '1', '2023-07-13 16:45:54.486493', 'New', '', ''),
(6, 'auutumoo', 39.9, '7', '1', '2023-07-14 11:22:12.890933', 'New', '', ''),
(7, 'auutumoo', 99.9, '7', '2', '2023-07-14 11:22:12.892748', 'New', '', ''),
(8, 'ehqd0mg0', 39.9, '9', '1', '2023-07-15 21:59:10.186977', 'New', '', ''),
(9, 'cb305mvt', 19.9, '9', '1', '2023-07-15 22:17:09.005234', 'New', '', ''),
(10, 'ml40t0vs', 19.9, '9', '1', '2023-07-15 22:19:02.901039', 'New', '', ''),
(11, 'wqsg9uev', 99.9, '9', '2', '2023-07-15 22:21:01.097687', 'New', '', ''),
(12, 'vuykshgi', 99.9, '9', '2', '2023-07-15 22:22:24.300945', 'New', '', ''),
(13, 'raiyj4ea', 899, '7', '1', '2023-07-17 23:27:21.992949', 'New', '', ''),
(14, 'g08fbonz', 2697, '8', '1', '2023-07-17 23:30:01.452494', 'New', '', ''),
(15, 'nmz0pit8', 938.9, '11', '1', '2023-07-17 23:48:01.474724', 'New', '', ''),
(16, 'odan60bu', 2766.9, '17', '1', '2023-07-19 14:55:51.033640', 'New', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_saved`
--

CREATE TABLE `tbl_saved` (
  `saved_id` int(6) NOT NULL,
  `item_id` int(6) NOT NULL,
  `user_id` int(6) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_saved`
--

INSERT INTO `tbl_saved` (`saved_id`, `item_id`, `user_id`, `status`) VALUES
(1, 2, 7, 1),
(2, 3, 0, 0),
(3, 4, 0, 1),
(4, 2, 1, 1),
(5, 1, 1, 1),
(6, 1, 8, 0),
(7, 4, 8, 0),
(8, 1, 15, 0),
(9, 13, 16, 1),
(10, 6, 16, 1),
(11, 1, 17, 0),
(12, 5, 17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_phone` varchar(15) NOT NULL,
  `otp` int(5) NOT NULL,
  `user_datereg` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `user_name`, `user_email`, `user_password`, `user_phone`, `otp`, `user_datereg`) VALUES
(1, 'Chu Kea Qiu', 'keaqiuynwa@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', '01159655960', 1, '2023-06-11 11:16:33.353140'),
(2, 'Farhan', 'farhan@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', '01112345678', 1, '2023-06-29 18:22:05.397369'),
(3, 'Livent Rajoo', 'livent@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', '01187654321', 1, '2023-06-29 23:11:00.453447'),
(4, 'Prem Kumar', 'prem@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', '01013456322', 1, '2023-07-05 01:00:26.197685'),
(5, 'Emily Dobson', 'emily@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', '0126489972', 1, '2023-07-05 07:40:48.867634'),
(6, 'Nurul Ain', 'nurul@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', '0173768120', 1, '2023-07-11 13:56:56.016835'),
(7, 'Bing Qian', 'bingqian@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', '01133882066', 1, '2023-07-12 22:07:47.825119'),
(8, 'Jeremy Pang', 'dibameb840@meogl.com', '8cb2237d0679ca88db6464eac60da96345513964', '0182304260', 1, '2023-07-15 21:24:35.318316'),
(9, 'Chan Jien Sheng', 'bepaxar934@niback.com', '8cb2237d0679ca88db6464eac60da96345513964', '0121234567', 1, '2023-07-15 21:27:26.779170'),
(11, 'Siti Aishah', 'keridat525@ridteam.com', '8cb2237d0679ca88db6464eac60da96345513964', '01134561234', 1, '2023-07-17 23:45:45.183116'),
(14, 'Halim Ali', 'hokar17397@ridteam.com', '8cb2237d0679ca88db6464eac60da96345513964', '0112345190', 1, '2023-07-19 14:21:58.592420'),
(15, 'Pang Jia Jiunn', 'verifo2639@rc3s.com', '8cb2237d0679ca88db6464eac60da96345513964', '01156729901', 1, '2023-07-19 14:36:39.165366'),
(16, 'Chan Jien Sheng', 'xidowe9583@semonir.com', '8cb2237d0679ca88db6464eac60da96345513964', '01112465493', 1, '2023-07-19 14:44:52.213567'),
(17, 'Eugene Lim Wei Kang', 'webej59572@rc3s.com', '348162101fc6f7e624681b7400b085eeac6df7bd', '012345678', 1, '2023-07-19 14:52:41.134829');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_carts`
--
ALTER TABLE `tbl_carts`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `tbl_items`
--
ALTER TABLE `tbl_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_news`
--
ALTER TABLE `tbl_news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `tbl_orderdetails`
--
ALTER TABLE `tbl_orderdetails`
  ADD PRIMARY KEY (`orderdetail_id`);

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_saved`
--
ALTER TABLE `tbl_saved`
  ADD PRIMARY KEY (`saved_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_carts`
--
ALTER TABLE `tbl_carts`
  MODIFY `cart_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_items`
--
ALTER TABLE `tbl_items`
  MODIFY `item_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tbl_news`
--
ALTER TABLE `tbl_news`
  MODIFY `news_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_orderdetails`
--
ALTER TABLE `tbl_orderdetails`
  MODIFY `orderdetail_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `order_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_saved`
--
ALTER TABLE `tbl_saved`
  MODIFY `saved_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
