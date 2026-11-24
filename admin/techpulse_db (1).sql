-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2026 at 01:26 AM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.3.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techpulse_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(80) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `icon` varchar(40) NOT NULL DEFAULT 'bi-cpu',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `icon`, `created_at`) VALUES
(1, 'Artificial Intelligence', 'AI tools, models and how they change our work', 'bi-robot', '2026-11-22 19:10:43'),
(2, 'Programming', 'Languages, frameworks and clean-code habits', 'bi-code-slash', '2026-11-22 19:10:43'),
(3, 'Cybersecurity', 'Stay safe online and build secure websites', 'bi-shield-lock', '2026-11-22 19:10:43');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `author_name` varchar(60) NOT NULL DEFAULT 'Guest',
  `comment` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `author_name`, `comment`, `created_at`) VALUES
(1, 1, 'Sara', 'Great article, very clear!', '2026-11-22 19:11:46'),
(3, 5, 'Guest', 'Thanks, I just enabled two-step verification.', '2026-11-22 19:11:46'),
(4, 5, 'malak', 'very good', '2026-11-22 19:16:27'),
(5, 3, 'seif', 'what is php?', '2026-11-22 19:18:43');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('published','draft') NOT NULL DEFAULT 'published',
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `title`, `content`, `image`, `status`, `views`, `created_at`) VALUES
(1, 1, 'How AI Assistants Are Changing Everyday Work', 'AI assistants are now built into many of the tools people already use, from email apps to code editors. They can draft text, summarize long documents and suggest fixes for errors.\n\nExperts recommend treating their output as a first draft. Checking facts and understanding the result yourself is still the most important step.', NULL, 'published', 120, '2026-11-21 19:11:46'),
(2, 1, 'What Is Machine Learning? A Simple Explanation', 'Traditional programs follow instructions written by a developer. A machine learning model instead learns from many examples and finds patterns by itself.\n\nA spam filter is a classic example: it studies thousands of emails marked as spam or not spam, and then predicts the label of a new email.', NULL, 'published', 85, '2026-11-19 19:11:46'),
(3, 2, 'Why PHP Is Still Powering a Large Part of the Web', 'PHP runs many content management systems and online stores. Modern versions added typed properties, enums, attributes and big performance gains.\n\nLearning PHP with PDO and prepared statements is a great first step toward building secure database-driven sites.', NULL, 'published', 151, '2026-11-20 19:11:46'),
(4, 2, '5 Habits of Developers Who Write Clean Code', 'Use clear names for variables and functions so the code explains itself. Keep functions short and focused on a single task.\n\nSeparate your project into folders, for example configuration, includes and public pages. Test your work often and read your code again after a break.', NULL, 'published', 65, '2026-11-17 19:11:46'),
(5, 3, 'Password Safety: How to Protect Your Online Accounts', 'Reusing the same password everywhere is risky, because one leak can expose many accounts. A password manager can create and store a unique password for each site.\n\nDevelopers must also protect users by never storing plain-text passwords. Use password_hash() and password_verify() in PHP.', NULL, 'published', 98, '2026-11-18 19:11:46'),
(6, 2, 'Choosing a Laptop for Programming Students', 'For web development, a laptop with 8 GB of RAM or more and a fast SSD is a comfortable starting point. A clear screen and a good keyboard also help during long sessions.\r\n\r\nTools like XAMPP and Visual Studio Code run well on modest hardware, so spend your budget on reliability and battery life.', NULL, 'published', 53, '2026-11-15 19:11:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password_hash`) VALUES
(1, 'admin', '$2y$10$BcyLDY46KvOxAHajrzwIX.yuTX2mCOxyIimXSlRIT9xAyf/jG23Ku');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_category_name` (`name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_comments_post` (`post_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_posts_category` (`category_id`),
  ADD KEY `idx_posts_status_date` (`status`,`created_at`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_posts_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
