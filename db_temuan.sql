-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2023 at 04:32 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_temuan`
--

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `description` text NOT NULL,
  `img` varchar(1000) NOT NULL,
  `location` varchar(1000) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `type` enum('kehilangan','temuan') NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `title`, `description`, `img`, `location`, `phone`, `type`, `date`, `created_at`) VALUES
(5, 'asdf', 'Jordan (Arabic: الأردن; tr. Al-ʾUrdunn [al.ʔur.dunː]), officially the Hashemite Kingdom of Jordan,[a] is a country in Western Asia. It is situated at the crossroads of Asia, Africa, and Europe,[8] within the Levant region, on the East Bank of the Jordan River. Jordan is bordered by Saudi Arabia to the south and east, Iraq to the northeast, Syria to the north, and the Palestinian West Bank, Israel, and the Dead Sea to the west. It has a 26 km (16 mi) coastline in its southwest on the Gulf of Aqaba\'s Red Sea, which separates Jordan from Egypt.[9] Amman is Jordan\'s capital and largest city, as well as its economic, political, and cultural centre.', '8dbddf25-ebe9-492b-a17a-068c11599eda2023-01-02_091609.428861.jpg', 'gerbang masuk selatan universitas amikom yogyakarta ', '', 'kehilangan', '2022-12-22', '2023-01-01 06:39:17'),
(6, 'asdf', 'asdf', 'e15c9361-d323-4a0f-b122-8bb4f803838a2023-01-01_182740.489067.png', 'asdf', '', 'temuan', '2023-01-03', '2023-01-01 11:27:40'),
(9, 'test', 'test', 'd6ba5200-a510-4588-8f57-85264cda52842023-01-02_102404.096461.jpg', 'rest', '988989', 'kehilangan', '2023-01-21', '2023-01-02 03:24:04'),
(10, 'kjasdfjasd', 'kasdjfjasdjfklajsdklfjklasdjklfjadkl', '42735e80-ddbb-41be-957c-2bdcbbf6077a2023-01-02_102930.403853.jpg', 'kaldsjkfjadsjfasd', '89789789789789', 'kehilangan', '2000-03-12', '2023-01-02 03:29:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
