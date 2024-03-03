-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2024 at 10:37 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `canteen`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `userpassword` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Id`, `username`, `userpassword`) VALUES
(1, 'canteen', 'canteen123');

-- --------------------------------------------------------

--
-- Table structure for table `cart_details`
--

CREATE TABLE `cart_details` (
  `product_id` int(11) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_price` int(11) NOT NULL,
  `quantity` int(100) NOT NULL,
  `customization_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_details`
--

INSERT INTO `cart_details` (`product_id`, `ip_address`, `user_id`, `order_id`, `product_title`, `product_image`, `product_price`, `quantity`, `customization_description`) VALUES
(3, '::1', 0, 0, '', '', 0, 0, ''),
(10, '::1', 0, 0, '', '', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_title`) VALUES
(2, 'Hot Drinks'),
(3, 'Chinese Corner'),
(4, 'Dosa Corner'),
(5, 'Chat Item'),
(6, 'Cold Drinks'),
(9, 'ice creams'),
(10, 'snacks');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `name`, `email`, `subject`, `message`, `timestamp`) VALUES
(1, 'Arpita', 'a@gmail.com', 'asadd', 'sdf', '2024-02-24 08:30:16');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `feedback` text NOT NULL,
  `ratings` tinytext NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `name`, `email`, `feedback`, `ratings`, `timestamp`) VALUES
(5, 'Arpita', 'a@gmail.com', 'sdsf', '3', '2024-02-24 08:30:43');

-- --------------------------------------------------------

--
-- Table structure for table `item_sales`
--

CREATE TABLE `item_sales` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `quantity_sold` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_pending`
--

CREATE TABLE `orders_pending` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(255) NOT NULL,
  `customization_description` text NOT NULL,
  `amount_due` int(255) NOT NULL,
  `order_status` varchar(255) NOT NULL,
  `order_token` int(255) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_pending`
--

INSERT INTO `orders_pending` (`order_id`, `user_id`, `product_id`, `quantity`, `customization_description`, `amount_due`, `order_status`, `order_token`, `order_date`) VALUES
(1, 1, 5, 2, '', 0, 'pending', 0, '2024-03-03 20:03:16');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `amount` int(100) NOT NULL,
  `payment_status` varchar(100) NOT NULL,
  `payment_id` varchar(100) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `order_id`, `name`, `amount`, `payment_status`, `payment_id`, `added_on`) VALUES
(1, 0, 'a', 100, 'complete', 'pay_NgY13YLNvUbiuU', '2024-02-29 04:30:28');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_title` varchar(100) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_keywords` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_price` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_title`, `product_description`, `product_keywords`, `category_id`, `product_image`, `product_price`, `date`, `status`) VALUES
(2, 'vadapav', 'Delight, consisting of a spiced potato vada sandwiched between a soft pav.', 'vadapav,Snacks,Vadapav', 1, 'vadapav.jpg', '12', '2024-02-19 13:18:13', 'true'),
(3, 'Misal pav', 'Misal Pav is a flavorful and spicy curry made from sprouted moth beans or mixed legumes, simmered in a fiery gravy of spices.', 'misal pav,Misal pav,Snacks', 1, 'misalpav.jpg', '30', '2024-02-09 19:50:52', 'true'),
(4, 'Masala Dosa', 'South Indian delicacy consisting of a thin, crispy crepe made from fermented rice and lentil batter, generously filled with a flavorful spiced potato mixture', 'masala dosa,Masala Dosa,dosa corner', 4, 'Masala-Dosa.jpg', '30', '2024-02-08 09:04:45', 'true'),
(5, 'Veg Fried rice', 'Fragrant Basmati rice wok-tossed with a medley of colorful vegetables, aromatic spices, and a hint of tangy sauce', 'veg fried rice,Fried rice,chinese corner', 3, 'friedrice.jpg', '50', '2024-02-08 09:04:50', 'true'),
(6, 'Bhel puri', 'Refreshing and light, bhelpuri offers a delightful combination of sweet, sour, tangy, and spicy flavors', 'bhel puri,Bhel puri,chat items', 5, 'bhelpuri.jpg', '20', '2024-02-09 19:53:34', 'true'),
(7, 'Butter Milk', 'Refreshing and tangy buttermilk, a traditional Indian beverage made from yogurt. ', 'butter milk,Buttermilk,Butter milk,cold drink', 6, 'buttermilk.jpg', '10', '2024-02-09 19:53:55', 'true'),
(8, 'chinese bhel', 'A dish with dry noodles and schezwan chutney', 'snacks, chinese bhel, bhel', 1, 'chinese bhel.jpeg', '25', '2024-02-19 13:20:03', 'true'),
(9, 'sandwich', 'sandwicdchwdic', 'sandwich', 5, 'sandwich.jpg', '40', '2024-02-24 08:27:50', 'true'),
(10, 'manchurian', 'fcdsfdsrf', 'mand', 3, 'manchurian.jpg', '20', '2024-02-24 08:28:41', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `user_orders`
--

CREATE TABLE `user_orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_titles` varchar(255) NOT NULL,
  `amount_due` int(255) NOT NULL,
  `invoice_number` int(255) NOT NULL,
  `total_products` int(255) NOT NULL,
  `customization_description` text NOT NULL,
  `quantity` int(255) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_status` varchar(255) NOT NULL,
  `order_token` int(255) NOT NULL,
  `order_completion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_orders`
--

INSERT INTO `user_orders` (`order_id`, `user_id`, `product_titles`, `amount_due`, `invoice_number`, `total_products`, `customization_description`, `quantity`, `order_date`, `order_status`, `order_token`, `order_completion`) VALUES
(2, 1, '', 0, 1525063176, 1, '', 1, '2024-03-03 18:48:53', '', 0, ''),
(3, 1, '', 0, 97136384, 1, '', 1, '2024-03-03 20:40:36', 'complete', 650000, ''),
(4, 1, '', 0, 2063571905, 1, '', 1, '2024-03-03 19:25:33', 'complete', 0, ''),
(11, 1, '', 0, 0, 2, '', 1, '2024-03-03 19:33:17', 'pending', 650000, ''),
(12, 1, '', 0, 0, 2, '', 1, '2024-03-03 19:52:21', 'pending', 0, ''),
(13, 1, '', 0, 0, 2, '', 1, '2024-03-03 20:04:15', 'pending', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `user_payments`
--

CREATE TABLE `user_payments` (
  `payment_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL,
  `invoice_number` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_mode` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_payments`
--

INSERT INTO `user_payments` (`payment_id`, `name`, `order_id`, `invoice_number`, `amount`, `payment_status`, `payment_mode`, `date`) VALUES
(1, '', 5, 904824526, 0, '', 'Select Payment Mode', '2024-03-03 14:46:15'),
(2, '', 4, 34724751, 0, '', 'Select Payment Mode', '2024-03-03 16:11:09'),
(3, '', 6, 96228250, 9000, '', 'Select Payment Mode', '2024-03-03 16:11:15'),
(4, '', 7, 2103874102, 0, '', 'Select Payment Mode', '2024-03-03 16:16:41'),
(5, '', 1, 1908642375, 200, '', 'Select Payment Mode', '2024-03-03 16:25:28'),
(6, '', 8, 1128548671, 23, '', 'UPI', '2024-03-03 16:26:37'),
(7, '', 9, 629822974, 0, '', 'Select Payment Mode', '2024-03-03 16:29:12'),
(8, '', 12, 1257030033, 0, '', 'Select Payment Mode', '2024-03-03 16:30:05'),
(9, '', 13, 538711354, 0, '', 'Select Payment Mode', '2024-03-03 16:31:33'),
(10, '', 14, 846677913, 0, '', 'Select Payment Mode', '2024-03-03 16:32:21'),
(11, '', 15, 2032150619, 0, '', 'Select Payment Mode', '2024-03-03 16:33:47'),
(12, '', 11, 544024524, 0, '', 'Select Payment Mode', '2024-03-03 16:34:30'),
(13, '', 10, 808731392, 0, '', 'Select Payment Mode', '2024-03-03 17:19:41'),
(14, '', 10, 808731392, 0, '', 'Select Payment Mode', '2024-03-03 17:20:05'),
(15, '', 1, 1568968612, 0, '', 'Pay Offline', '2024-03-03 18:12:20'),
(16, '', 3, 97136384, 0, '', 'Select Payment Mode', '2024-03-03 18:54:33'),
(17, '', 4, 2063571905, 0, '', 'Select Payment Mode', '2024-03-03 18:54:43'),
(18, '', 5, 587423888, 0, '', 'Select Payment Mode', '2024-03-03 18:57:01'),
(19, '', 6, 199530059, 0, '', 'Select Payment Mode', '2024-03-03 18:58:13'),
(20, '', 7, 16275209, 0, '', 'Select Payment Mode', '2024-03-03 19:01:11'),
(21, '', 8, 1665920847, 0, '', 'Select Payment Mode', '2024-03-03 19:03:34'),
(22, '', 9, 0, 0, '', 'Select Payment Mode', '2024-03-03 19:09:03'),
(23, '', 10, 0, 0, '', 'Select Payment Mode', '2024-03-03 19:10:31');

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_image` varchar(255) NOT NULL,
  `user_ip` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`user_id`, `username`, `user_email`, `password`, `user_image`, `user_ip`) VALUES
(1, 'a', 'a@gmail.com', '$2y$10$Z26AflpiaTgLe5AEqx5mS.Q32a1eBNcW4bJrs1ySqwslEzn1fTi5a', 'arpita.jpg', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `cart_details`
--
ALTER TABLE `cart_details`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `item_sales`
--
ALTER TABLE `item_sales`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `orders_pending`
--
ALTER TABLE `orders_pending`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_orders`
--
ALTER TABLE `user_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `user_payments`
--
ALTER TABLE `user_payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `item_sales`
--
ALTER TABLE `item_sales`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders_pending`
--
ALTER TABLE `orders_pending`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_orders`
--
ALTER TABLE `user_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_payments`
--
ALTER TABLE `user_payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
