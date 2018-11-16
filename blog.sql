-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 14, 2018 at 11:49 PM
-- Server version: 5.6.37
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category`) VALUES
(1, 'cars'),
(2, 'books'),
(3, 'toys'),
(4, 'people'),
(7, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `name`, `email`, `website`, `content`, `date`) VALUES
(2, 0, 'dima', 'dima@mail.com', 'test.com', 'dfdf', 1541883405),
(3, 0, 'dima', 'dima@mail.com', 'test.com', 'dfdf', 1541883427),
(4, 35, 'dima', 'dima@mail.com', 'test.com', 'df', 1541883439),
(5, 35, 'dima', 'dima@mail.com', 'test.com', 'fgf', 1541883525),
(6, 37, 'dima', 'dima@mail.com', 'test.com', 'In hac habitasse platea dictumst. Nunc nulla.\r\n\r\nCurabitur ullamcorper ultricies nisi. Fusce fermentum.', 1542133554);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `num_comments` int(11) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no-image.png',
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `num_comments`, `date`, `image`, `category_id`) VALUES
(37, 'Cras ultricies miAenean ut eros', 'Etiam feugiat lorem non metus. Fusce pharetra convallis urna.\r\n\r\nSuspendisse feugiat. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.\r\n\r\nAenean massa. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum.\r\n\r\nPhasellus viverra nulla ut metus varius laoreet. Vestibulum dapibus nunc ac augue.Cras ultricies mi', 1, 1541867834, 'min.jpg', 1),
(36, 'Cras ultricies miAenean ut eros', 'Etiam feugiat lorem non metus. Fusce pharetra convallis urna.\r\n\r\nSuspendisse feugiat. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.\r\n\r\nAenean massa. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum.\r\n\r\nPhasellus viverra nulla ut metus varius laoreet. Vestibulum dapibus nunc ac augue.Cras ultricies mi', 0, 1541867834, '3e9ed3_imag0640.jpg', 2),
(35, 'Aenean ut eros', 'Nunc nulla. Sed cursus turpis vitae tortor. Etiam sollicitudin, ipsum eu pulvinar rutrum, tellus ipsum laoreet sapien, quis venenatis ante odio sit amet eros.\r\n\r\nSuspendisse eu ligula. Etiam rhoncus. Pellentesque posuere.', 2, 1541867824, 'min.jpg', 3),
(38, 'Aenean ut eros', 'Nunc nulla. Sed cursus turpis vitae tortor. Etiam sollicitudin, ipsum eu pulvinar rutrum, tellus ipsum laoreet sapien, quis venenatis ante odio sit amet eros.\r\n\r\nSuspendisse eu ligula. Etiam rhoncus. Pellentesque posuere.', 2, 1541867824, 'min.jpg', 4),
(39, 'Duis arcu tortor suscipit eget', 'Aenean ut eros et nisl sagittis vestibulum. Etiam ut purus mattis mauris sodales aliquam. Praesent blandit laoreet nibh. Phasellus leo dolor, tempus non, auctor et, hendrerit quis, nisi.\r\n\r\nAenean massa. Praesent egestas tristique nibh. Nam at tortor in tellus interdum sagittis. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.\r\n\r\nCurabitur ligula sapien, tincidunt non, euismod vitae, posuere imperdiet, leo. Ut tincidunt tincidunt erat. Aenean imperdiet. Ut leo.', 0, 1541928121, '3e9ed3_imag0640.jpg', 2),
(40, 'Duis arcu tortor suscipit eget', 'Aenean ut eros et nisl sagittis vestibulum. Etiam ut purus mattis mauris sodales aliquam. Praesent blandit laoreet nibh. Phasellus leo dolor, tempus non, auctor et, hendrerit quis, nisi.\r\n\r\nAenean massa. Praesent egestas tristique nibh. Nam at tortor in tellus interdum sagittis. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.\r\n\r\nCurabitur ligula sapien, tincidunt non, euismod vitae, posuere imperdiet, leo. Ut tincidunt tincidunt erat. Aenean imperdiet. Ut leo.', 0, 1541928162, 'min.jpg', 4),
(41, 'Nulla neque', 'Vivamus in erat ut urna cursus vestibulum. Aliquam lobortis. Etiam iaculis nunc ac metus. Praesent blandit laoreet nibh.\r\n\r\nQuisque rutrum. Etiam feugiat lorem non metus. Fusce vulputate eleifend sapien. Vivamus consectetuer hendrerit lacus.\r\n\r\nQuisque malesuada placerat nisl. Quisque ut nisi. In hac habitasse platea dictumst. Pellentesque auctor neque nec urna.\r\n\r\nFusce risus nisl, viverra et, tempor et, pretium in, sapien. Praesent egestas neque eu enim. Aenean viverra rhoncus pede. Pellentesque egestas, neque sit amet convallis pulvinar, justo nulla eleifend augue, ac auctor orci leo non est.\r\n\r\nMaecenas ullamcorper, dui et placerat feugiat, eros pede varius nisi, condimentum viverra felis nunc et lorem. Nam commodo suscipit quam. Etiam ut purus mattis mauris sodales aliquam. Nam adipiscing.', 0, 1541929688, '3e9ed3_imag0640.jpg', 1),
(42, '123', 'Vestibulum fringilla pede sit amet augue. Cras id dui.\r\n\r\nFusce a quam. Vivamus elementum semper nisi.\r\n\r\nNam adipiscing. Praesent metus tellus, elementum eu, semper a, adipiscing nec, purus.', 0, 1542228102, '3e9ed3_imag0640.jpg', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
