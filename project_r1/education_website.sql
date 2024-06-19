-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2024 at 08:20 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `education_website`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_name` varchar(200) NOT NULL,
  `category_id` int(200) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_name`, `category_id`) VALUES
('Soon', 1),
('Important', 2),
('Attractive', 3);

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `meeting_date` date NOT NULL,
  `meeting_title` varchar(150) NOT NULL,
  `meeting_content` varchar(200) NOT NULL,
  `meeting_location` varchar(150) NOT NULL,
  `meeting_price` decimal(10,0) UNSIGNED NOT NULL,
  `meeting_image` blob NOT NULL,
  `active` tinyint(1) NOT NULL,
  `meeting_id` int(200) UNSIGNED NOT NULL,
  `category_id` int(200) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meetings`
--

INSERT INTO `meetings` (`meeting_date`, `meeting_title`, `meeting_content`, `meeting_location`, `meeting_price`, `meeting_image`, `active`, `meeting_id`, `category_id`) VALUES
('2024-11-12', 'New Lecturers Meeting', 'Morbi in libero blandit lectuscursus ullamcorper.', 'Recreio dos Bandeirantes,Rio de Janeiro - RJ, 22795-008, Brazil', 14, 0x6d656574696e672d30312e6a7067, 1, 1, 1),
('2024-11-14', 'Online Teaching Techniques', 'Morbi in libero blandit lectus \r\ncursus ullamcorper.', 'Recreio dos Bandeirantes,Rio de Janeiro - RJ, 22795-008, Brazil', 22, 0x6d656574696e672d30322e6a7067, 0, 2, 2),
('2024-11-16', 'Network Teaching Concept', 'Morbi in libero blandit lectus\r\ncursus ullamcorper.', 'Recreio dos Bandeirantes,Rio de Janeiro - RJ, 22795-008, Brazil', 24, 0x6d656574696e672d30332e6a7067, 0, 3, 1),
('2024-11-18', 'Online Teaching Tools<', 'Morbi in libero blandit lectus\r\ncursus ullamcorper.', 'Recreio dos Bandeirantes,Rio de Janeiro - RJ, 22795-008, Brazil', 32, 0x6d656574696e672d30342e6a7067, 0, 4, 3),
('2024-11-22', 'New Teaching Techniques', 'Morbi in libero blandit lectus\r\ncursus ullamcorper.', 'Recreio dos Bandeirantes,Rio de Janeiro - RJ, 22795-008, Brazil', 34, 0x6d656574696e672d30322e6a7067, 1, 5, 3),
('2024-11-24', 'Technology Conference', 'emplateMo is the best website\r\nwhen it comes to Free CSS.ts', 'Recreio dos Bandeirantes,Rio de Janeiro - RJ, 22795-008, Brazil', 45, 0x6d656574696e672d30332e6a7067, 1, 6, 2),
('2024-11-27', 'Online Teaching Techniques', 'Morbi in libero blandit lectus\r\ncursus ullamcorper.', 'Recreio dos Bandeirantes,Rio de Janeiro - RJ, 22795-008, Brazil', 52, 0x6d656574696e672d30312e6a7067, 1, 7, 2),
('2024-11-28', 'Instant Lecture Design', 'Morbi in libero blandit lectus\r\ncursus ullamcorper.', 'Recreio dos Bandeirantes,Rio de Janeiro - RJ, 22795-008, Brazil', 64, 0x6d656574696e672d30322e6a7067, 1, 8, 1),
('2024-11-30', 'Online Social Networking', 'Morbi in libero blandit lectus\r\ncursus ullamcorper.', 'Recreio dos Bandeirantes,Rio de Janeiro - RJ, 22795-008, Brazil', 74, 0x6d656574696e672d30332e6a7067, 0, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `full_name` varchar(200) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `active_status` tinyint(1) NOT NULL,
  `user_role` enum('admin','student','instructor','') NOT NULL,
  `register_date` date NOT NULL,
  `user_id` int(200) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`full_name`, `user_name`, `email`, `password`, `active_status`, `user_role`, `register_date`, `user_id`) VALUES
('John Doe', 'John', 'john@gmail.com', '$2y$10$9.8F84f.oqKL8csp7txO.ODoPVZ1GMPvAVp1N/j3bnua9rQP2HA42', 0, 'admin', '2024-02-24', 1),
('Ahmed Ali', 'ahmedali', 'ahmed@google.com', '$2y$10$CrzXMe.BltbIes6PX9afH.iwjc7Ozd3HcU5dW0//v0FhYaCopGsCy', 0, 'student', '2024-02-24', 3),
('Naira Ali', 'nairaali', 'naira@gmail.com', '$2y$10$o3IstD.kolvToNDa6QVq5OhLl5wGAR326v4TTlm8vDTeDW3AJMkB.', 0, 'instructor', '2024-02-24', 4),
('Ashraf Ali', 'ashrafali', 'ashraf@google.com', '$2y$10$DSd0rkloQ4iI1s9/p3HXn.i2L0h2hdQRf1xPTG.PJ2lDndCU1nGli', 0, 'student', '2024-02-25', 5),
('Marwa Ahmed', 'marwa', 'meroonadi234567@gmail.com', '$2y$10$u/rUcBPDaKe0UigkLbqiDuwVRK0V8M8/8zQYbLd5D2a1Dq9xnaXwu', 1, 'admin', '2024-02-27', 7),
('Dalia Ali', 'dalia', 'dalia@test.com', '$2y$10$DlFSLqWA5Knc8eIt3pztNewbOTJIvWHTznI6DRK8GoOglwKXEw/d2', 1, 'admin', '2024-02-27', 8),
('Walaa Ahmed', 'walaa', 'walaa@gmail.com', '$2y$10$Jj51OPXza82EIl2TyZEQouaCFb4ThnvKOe.wv9X2.pxQ.qlc4dZXe', 1, 'admin', '2024-02-27', 9),
('Maisa Ahmed', 'maisa', 'maisa@google.com', '$2y$10$661ay1HDMDedavMlOH0FEeTQrQ62XihTwjUfcrPU7y.a9X1ScCozW', 0, 'instructor', '2024-02-27', 10),
('Mayar Akram', 'mayar', 'mayar@google.com', '$2y$10$tIFq1TGVHYKo3JJm/8FhfugKe1ACpyVUHG/cHJPyNbTxCeRNyccw6', 1, 'admin', '2024-02-27', 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`meeting_id`),
  ADD KEY `index` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(200) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `meetings`
--
ALTER TABLE `meetings`
  MODIFY `meeting_id` int(200) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(200) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `meetings`
--
ALTER TABLE `meetings`
  ADD CONSTRAINT `meetings_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
