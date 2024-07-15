-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jul 15, 2024 at 12:09 AM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ewevolut_ev-share`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `car_brand` varchar(255) NOT NULL,
  `license_plate` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `charging_type` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `battery_capacity` varchar(255) NOT NULL,
  `is_charging` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`id`, `user_id`, `car_brand`, `license_plate`, `model`, `charging_type`, `year`, `battery_capacity`, `is_charging`) VALUES
(2, 2, '2', '333-333-333', '4', 'TESLA 2', '2', '10', 0),
(6, 2, '2', '5678901', '5', 'TESLA 2', '2022', '64', 0),
(7, 2, '2', '6789012', '7', 'TESLA 1', '2021', '72', 0),
(8, 2, '3', '7890123', '8', 'TESLA 3', '2021', '50', 0),
(9, 2, '3', '8901234', '10', 'TESLA 1', '2022', '78', 0),
(30, 7, '1', '10134567', '1', 'TESLA 2', '2021', '17.3', 0);

-- --------------------------------------------------------

--
-- Table structure for table `car_brands`
--

CREATE TABLE `car_brands` (
  `id` int(11) NOT NULL,
  `name` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_brands`
--

INSERT INTO `car_brands` (`id`, `name`) VALUES
(1, 'Tesla'),
(2, 'Audi'),
(3, 'Ferrari');

-- --------------------------------------------------------

--
-- Table structure for table `car_models`
--

CREATE TABLE `car_models` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `brand` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_models`
--

INSERT INTO `car_models` (`id`, `name`, `brand`) VALUES
(1, 'Model S', 1),
(2, 'Model 3', 1),
(3, 'Model X', 1),
(4, 'A3', 2),
(5, 'A4', 2),
(6, 'A5', 2),
(7, 'A6', 2),
(8, 'Ferrari 812 Superfast', 3),
(9, 'Ferrari Roma', 3),
(10, 'Ferrari SF90 Stradale', 3);

-- --------------------------------------------------------

--
-- Table structure for table `charging_sessions`
--

CREATE TABLE `charging_sessions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `hourly_price` double NOT NULL DEFAULT '0',
  `total_price` double DEFAULT '0',
  `total_time` double DEFAULT NULL COMMENT 'in hours',
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `station_name` varchar(255) NOT NULL,
  `station_model` varchar(255) NOT NULL,
  `station_year` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `charging_type` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `charging_capacity` varchar(255) NOT NULL,
  `how_to_find` varchar(255) NOT NULL,
  `asking_price` varchar(255) NOT NULL,
  `algo_price` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `using_algorithm` varchar(1) NOT NULL DEFAULT '0',
  `is_available` varchar(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`id`, `user_id`, `station_name`, `station_model`, `station_year`, `address`, `charging_type`, `city`, `charging_capacity`, `how_to_find`, `asking_price`, `algo_price`, `latitude`, `longitude`, `image1`, `image2`, `using_algorithm`, `is_available`) VALUES
(2, 2, 'Mivtsa Kadesh Charger', '3', '2020', '32 Mivtsa Kadesh', 'TESLA 1', 'Tel Aviv', '25', 'Near the dog park entrance', '4', '3.5', '32.113563', '34.815640', NULL, NULL, '1', '1'),
(4, 2, 'Yeshiva EV', '3', '2023', '44 Mivtsa Kadesh', 'TESLA 2, TESLA 1', 'Tel Aviv', '25', 'Next to the Yeshiva entrance', '4', '3.6', '32.113270', '34.820007', NULL, NULL, '1', '1'),
(5, 2, 'Dizi Charge', '2', '2019', '123 Dizengoff St', 'TESLA 1', 'Tel Aviv', '20', 'Across from Central Park', '3', '2.5', '32.081248', '34.773634', NULL, NULL, '1', '1'),
(6, 2, 'Rothschild EV Station', '1', '2019', '456 Rothschild Blvd', 'TESLA 1', '9', '15', 'Next to the grocery store', '2.2', '2.2', '32.065369', '34.776622', NULL, NULL, '1', '1'),
(7, 7, 'EV Gabirol Station', '2', '2022', '789 Ibn Gabirol St', 'TESLA 3', 'Tel Aviv', '30', 'Parking lot level 3', '5', '4.8', '32.097233', '34.783638', NULL, NULL, '1', '1'),
(8, 2, 'AFEKA EV STATION', '2', '2021', '36 Mivtsa Kadesh', 'TESLA 3', 'Tel Aviv', '25', 'Near the dog park entrance', '4', '3.5', '32.113563', '34.817499', NULL, NULL, '1', '1'),
(9, 2, 'Neot Afeka Charge', '3', '2020', '40 Mivtsa Kadesh', 'TESLA 2', 'Tel Aviv', '35', 'Dirt parking lot', '6', '5.5', '32.113436', '34.818929', NULL, NULL, '1', '1'),
(10, 2, 'Beachside Charge', '2', '2019', 'HaYarkon St 114', 'TESLA 2', 'Tel Aviv', '18', 'Near Avis', '4', '3.8', '32.080858', '34.768473', NULL, NULL, '1', '1'),
(11, 2, 'Kikar Hamedina Station', '1', '2017', '29 Moshe Sharet St', 'TESLA 1', 'Tel Aviv', '12', 'Building 5', '2', '1.9', '32.086894', '34.787561', NULL, NULL, '1', '1'),
(12, 7, 'Campus Charge', '1', '2023', '8 Torczyner', 'TESLA 3', 'Tel Aviv', '40', 'Gate 7A', '7', '6.5', '32.108696', '34.800228', NULL, NULL, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `station_models`
--

CREATE TABLE `station_models` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `station_models`
--

INSERT INTO `station_models` (`id`, `name`, `created_at`) VALUES
(1, 'Gen 1', '2024-07-05 16:52:39'),
(2, 'Gen 2', '2024-07-05 16:52:39'),
(3, 'Gen 3', '2024-07-05 16:52:44');

-- --------------------------------------------------------

--
-- Table structure for table `system_values`
--

CREATE TABLE `system_values` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` varchar(150) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `system_values`
--

INSERT INTO `system_values` (`id`, `name`, `value`, `updated_at`, `created_at`) VALUES
(1, 'profit_fee', '4', '2024-07-07 18:55:04', '2024-07-07 18:55:04'),
(2, 'electricity_price', '2', '2024-07-07 18:55:04', '2024-07-07 18:55:04'),
(3, 'demand_hour_price', '3', '2024-07-07 18:55:46', '2024-07-07 18:55:46'),
(4, 'medium_demand_price', '3.5', '2024-07-07 18:55:46', '2024-07-07 18:55:46'),
(5, 'high_demand_price', '5', '2024-07-07 18:55:59', '2024-07-07 18:55:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` enum('Station_Owner','Car_Owner') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `address`, `password`, `user_type`) VALUES
(1, 'Test Car Owner', '03244202186', 'CO@gmail.com', '123 Street', '$2y$10$BM/v5pA1Zlt4X.WUd/1xCe4Ov6JhxZue.XgVWgkfNqe.BftRghQQa', 'Car_Owner'),
(2, 'Ali Safdar', '033341678489', 'test@gmail.com', 'Addres', '$2y$10$BM/v5pA1Zlt4X.WUd/1xCe4Ov6JhxZue.XgVWgkfNqe.BftRghQQa', 'Station_Owner'),
(4, 'New Station Owner', '03244202185', 'tester@gmail.com', 'Address', '$2y$10$BM/v5pA1Zlt4X.WUd/1xCe4Ov6JhxZue.XgVWgkfNqe.BftRghQQa', 'Station_Owner'),
(5, 'Nir Srour', '0501234562', 'email@email.com', 'Hayarkon 2 , tel aviv', '$2y$10$S3pvxFX8grCvhG9rMfGh0.9cGb/tglx1MGN6ruk6n8ENEniVYTE.q', 'Station_Owner'),
(6, 'Efi Leder', '0543007148', 'Efik88@gmail.com', '×”×§×•× ×’×¨×¡ 27 ×ª×œ ××‘×™×‘', '$2y$10$rB8CMhECm2PFrxDRPsf0DupzKWbykNQVs5vTkRuyL4WlSrGH5PIA.', 'Station_Owner'),
(7, 'FS', '03242415898', 'fs@gmail.com', 'abc', '$2y$10$htE5Nl6yZfev8XaZ5QJn2uSpamcDO64.PGXIENnz0PkGRuZbWWCiS', 'Station_Owner');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_brands`
--
ALTER TABLE `car_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_models`
--
ALTER TABLE `car_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charging_sessions`
--
ALTER TABLE `charging_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `station_models`
--
ALTER TABLE `station_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_values`
--
ALTER TABLE `system_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `car_brands`
--
ALTER TABLE `car_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `car_models`
--
ALTER TABLE `car_models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `charging_sessions`
--
ALTER TABLE `charging_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `station`
--
ALTER TABLE `station`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `station_models`
--
ALTER TABLE `station_models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `system_values`
--
ALTER TABLE `system_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
