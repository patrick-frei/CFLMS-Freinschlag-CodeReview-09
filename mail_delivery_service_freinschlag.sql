-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 13. Jul 2020 um 07:33
-- Server-Version: 8.0.20-0ubuntu0.20.04.1
-- PHP-Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `mail_delivery_service`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `del_items`
--

CREATE TABLE `del_items` (
  `id` int NOT NULL,
  `length` decimal(50,2) DEFAULT NULL,
  `width` decimal(50,2) DEFAULT NULL,
  `height` decimal(50,2) DEFAULT NULL,
  `weight` decimal(50,2) DEFAULT NULL,
  `fk_pu_station` int DEFAULT NULL,
  `fk_in_delivery` int DEFAULT NULL,
  `fk_item_category` int DEFAULT NULL,
  `fk_sender` int DEFAULT NULL,
  `fk_recipients` int DEFAULT NULL,
  `fk_tracking_code` int DEFAULT NULL,
  `fk_out_delivery` int DEFAULT NULL,
  `fk_employee` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `del_items`
--

INSERT INTO `del_items` (`id`, `length`, `width`, `height`, `weight`, `fk_pu_station`, `fk_in_delivery`, `fk_item_category`, `fk_sender`, `fk_recipients`, `fk_tracking_code`, `fk_out_delivery`, `fk_employee`) VALUES
(1, '230.25', '152.14', '16.00', '21.00', 2, 1, 2, 1, 1, 1, 2, 2),
(2, '2300.25', '1512.14', '981.00', '11526.00', 1, 3, 3, 2, 2, 2, 3, 1),
(3, '500.25', '250.14', '250.00', '3500.00', 1, 1, 3, 3, 3, 3, 4, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employees`
--

CREATE TABLE `employees` (
  `id` int NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `employees`
--

INSERT INTO `employees` (`id`, `last_name`, `first_name`) VALUES
(1, 'Bruckner', 'Emil'),
(2, 'Hammermüller', 'Johann'),
(3, 'Gerstl', 'Benjamin');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `in_deliveries`
--

CREATE TABLE `in_deliveries` (
  `id` int NOT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `in_deliveries`
--

INSERT INTO `in_deliveries` (`id`, `date`) VALUES
(1, '2020-01-15 00:00:00'),
(2, '2020-02-01 00:00:00'),
(3, '2020-02-14 00:00:00'),
(4, '2020-03-01 00:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `item_categories`
--

CREATE TABLE `item_categories` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `item_categories`
--

INSERT INTO `item_categories` (`id`, `name`) VALUES
(1, 'package'),
(2, 'letter'),
(3, 'bulky freight');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `out_deliveries`
--

CREATE TABLE `out_deliveries` (
  `id` int NOT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `out_deliveries`
--

INSERT INTO `out_deliveries` (`id`, `date`) VALUES
(1, '2020-02-15 00:00:00'),
(2, '2020-03-01 00:00:00'),
(3, '2020-03-14 00:00:00'),
(4, '2020-05-01 00:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pu_stations`
--

CREATE TABLE `pu_stations` (
  `id` int NOT NULL,
  `organization` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `zip_code` int DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `pu_stations`
--

INSERT INTO `pu_stations` (`id`, `organization`, `street`, `zip_code`, `city`) VALUES
(1, 'Postal Office', 'Somewhere 123', 3425, 'Hopping'),
(2, 'Pick-up Package', 'Lorem 14', 1324, 'Ipsum'),
(3, 'CF Mail', 'Kettenbrückengasse 14', 1000, 'Vienna');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recipients`
--

CREATE TABLE `recipients` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `zip_code` int DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country_code` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `recipients`
--

INSERT INTO `recipients` (`id`, `name`, `street`, `zip_code`, `city`, `country_code`) VALUES
(1, 'Gernot Müller', 'Baumallee 12', 3300, 'Amstetten', 'AT'),
(2, 'Georg Brunner', 'Germanstraße 3', 99999, 'Berlin', 'DE'),
(3, 'Ipsum Amed', 'Gasse 21', 7741, 'Hillbach', 'AT');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `senders`
--

CREATE TABLE `senders` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `zip_code` int DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `senders`
--

INSERT INTO `senders` (`id`, `name`, `street`, `zip_code`, `city`) VALUES
(1, 'Hans Jürgen Müller', 'Bahnhofstraße 12', 3300, 'Amstetten'),
(2, 'Georg Mayer', 'Poolplatz 3', 1110, 'Vienna'),
(3, 'Ipsum Lorem', 'Test 112', 1254, 'Notting Hill');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tariffs`
--

CREATE TABLE `tariffs` (
  `id` int NOT NULL,
  `country_code` varchar(2) DEFAULT NULL,
  `max_length` decimal(50,2) DEFAULT NULL,
  `max_width` decimal(50,2) DEFAULT NULL,
  `max_height` decimal(50,2) DEFAULT NULL,
  `max_weight` decimal(50,2) DEFAULT NULL,
  `price` decimal(50,2) DEFAULT NULL,
  `fk_item_category` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `tariffs`
--

INSERT INTO `tariffs` (`id`, `country_code`, `max_length`, `max_width`, `max_height`, `max_weight`, `price`, `fk_item_category`) VALUES
(1, 'AT', '500.00', '250.00', '10.00', '15.00', '0.89', 2),
(2, 'AT', '500.00', '250.00', '20.00', '500.00', '2.99', 2),
(3, 'AT', '1000.00', '1000.00', '1000.00', '15000.00', '6.99', 1),
(4, 'AT', '1500.00', '1500.00', '1000.00', '30000.00', '9.99', 1),
(5, 'AT', '2000.00', '1500.00', '1500.00', '300000.00', '99.99', 3),
(6, 'AT', '3000.00', '2000.00', '1500.00', '500000.00', '159.99', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tracking_codes`
--

CREATE TABLE `tracking_codes` (
  `id` int NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `code` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `tracking_codes`
--

INSERT INTO `tracking_codes` (`id`, `timestamp`, `code`) VALUES
(1, NULL, '463257518063802337955425720290'),
(2, NULL, '706520659264254493639971095317'),
(3, NULL, '407859603627772365104376561604');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `del_items`
--
ALTER TABLE `del_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pu_station` (`fk_pu_station`),
  ADD KEY `fk_in_delivery` (`fk_in_delivery`),
  ADD KEY `fk_item_category` (`fk_item_category`),
  ADD KEY `fk_sender` (`fk_sender`),
  ADD KEY `fk_recipients` (`fk_recipients`),
  ADD KEY `fk_tracking_code` (`fk_tracking_code`),
  ADD KEY `fk_out_delivery` (`fk_out_delivery`),
  ADD KEY `fk_employee` (`fk_employee`);

--
-- Indizes für die Tabelle `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `in_deliveries`
--
ALTER TABLE `in_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `out_deliveries`
--
ALTER TABLE `out_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `pu_stations`
--
ALTER TABLE `pu_stations`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `recipients`
--
ALTER TABLE `recipients`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `senders`
--
ALTER TABLE `senders`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `tariffs`
--
ALTER TABLE `tariffs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_item_category` (`fk_item_category`);

--
-- Indizes für die Tabelle `tracking_codes`
--
ALTER TABLE `tracking_codes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `del_items`
--
ALTER TABLE `del_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `in_deliveries`
--
ALTER TABLE `in_deliveries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `out_deliveries`
--
ALTER TABLE `out_deliveries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `pu_stations`
--
ALTER TABLE `pu_stations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `recipients`
--
ALTER TABLE `recipients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `senders`
--
ALTER TABLE `senders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `tariffs`
--
ALTER TABLE `tariffs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `tracking_codes`
--
ALTER TABLE `tracking_codes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `del_items`
--
ALTER TABLE `del_items`
  ADD CONSTRAINT `del_items_ibfk_1` FOREIGN KEY (`fk_pu_station`) REFERENCES `pu_stations` (`id`),
  ADD CONSTRAINT `del_items_ibfk_2` FOREIGN KEY (`fk_in_delivery`) REFERENCES `in_deliveries` (`id`),
  ADD CONSTRAINT `del_items_ibfk_3` FOREIGN KEY (`fk_item_category`) REFERENCES `item_categories` (`id`),
  ADD CONSTRAINT `del_items_ibfk_4` FOREIGN KEY (`fk_sender`) REFERENCES `senders` (`id`),
  ADD CONSTRAINT `del_items_ibfk_5` FOREIGN KEY (`fk_recipients`) REFERENCES `recipients` (`id`),
  ADD CONSTRAINT `del_items_ibfk_6` FOREIGN KEY (`fk_tracking_code`) REFERENCES `tracking_codes` (`id`),
  ADD CONSTRAINT `del_items_ibfk_7` FOREIGN KEY (`fk_out_delivery`) REFERENCES `out_deliveries` (`id`),
  ADD CONSTRAINT `del_items_ibfk_8` FOREIGN KEY (`fk_employee`) REFERENCES `employees` (`id`);

--
-- Constraints der Tabelle `tariffs`
--
ALTER TABLE `tariffs`
  ADD CONSTRAINT `tariffs_ibfk_1` FOREIGN KEY (`fk_item_category`) REFERENCES `item_categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
