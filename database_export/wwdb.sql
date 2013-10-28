-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 28, 2013 at 07:02 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wwdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `xcart_orders`
--

CREATE TABLE IF NOT EXISTS `xcart_orders` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT '0',
  `membership` varchar(255) NOT NULL DEFAULT '',
  `total` decimal(12,2) NOT NULL DEFAULT '0.00',
  `giftcert_discount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `giftcert_ids` mediumtext NOT NULL,
  `subtotal` decimal(12,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `coupon` varchar(32) NOT NULL DEFAULT '',
  `coupon_discount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `shippingid` int(11) NOT NULL DEFAULT '0',
  `shipping` varchar(255) NOT NULL DEFAULT '',
  `tracking` varchar(64) NOT NULL DEFAULT '',
  `shipping_cost` decimal(12,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(12,2) NOT NULL DEFAULT '0.00',
  `taxes_applied` mediumtext NOT NULL,
  `date` int(11) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT 'Q',
  `return_status` enum('Return full','Return partial','Cancel full','Cancel partial') DEFAULT NULL,
  `payment_method` varchar(128) NOT NULL DEFAULT '',
  `flag` char(1) NOT NULL DEFAULT 'N',
  `notes` mediumtext NOT NULL,
  `details` mediumtext NOT NULL,
  `customer_notes` mediumtext NOT NULL,
  `customer` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(32) NOT NULL DEFAULT '',
  `firstname` varchar(128) NOT NULL DEFAULT '',
  `lastname` varchar(128) NOT NULL DEFAULT '',
  `company` varchar(255) NOT NULL DEFAULT '',
  `b_title` varchar(32) NOT NULL DEFAULT '',
  `b_firstname` varchar(128) NOT NULL DEFAULT '',
  `b_lastname` varchar(128) NOT NULL DEFAULT '',
  `b_address` varchar(255) NOT NULL DEFAULT '',
  `b_city` varchar(64) NOT NULL DEFAULT '',
  `b_county` varchar(32) NOT NULL DEFAULT '',
  `b_state` varchar(32) NOT NULL DEFAULT '',
  `b_country` char(2) NOT NULL DEFAULT '',
  `b_zipcode` varchar(32) NOT NULL DEFAULT '',
  `b_zip4` varchar(4) NOT NULL DEFAULT '',
  `b_phone` varchar(32) NOT NULL DEFAULT '',
  `b_fax` varchar(32) NOT NULL DEFAULT '',
  `s_title` varchar(32) NOT NULL DEFAULT '',
  `s_firstname` varchar(128) NOT NULL DEFAULT '',
  `s_lastname` varchar(128) NOT NULL DEFAULT '',
  `s_address` varchar(255) NOT NULL DEFAULT '',
  `s_city` varchar(255) NOT NULL DEFAULT '',
  `s_county` varchar(32) NOT NULL DEFAULT '',
  `s_state` varchar(32) NOT NULL DEFAULT '',
  `s_country` char(2) NOT NULL DEFAULT '',
  `s_zipcode` varchar(32) NOT NULL DEFAULT '',
  `s_phone` varchar(32) NOT NULL DEFAULT '',
  `s_fax` varchar(32) NOT NULL DEFAULT '',
  `s_zip4` varchar(4) NOT NULL DEFAULT '',
  `url` varchar(128) NOT NULL DEFAULT '',
  `email` varchar(128) NOT NULL DEFAULT '',
  `language` char(2) NOT NULL DEFAULT 'en',
  `clickid` int(11) NOT NULL DEFAULT '0',
  `extra` longtext NOT NULL,
  `membershipid` int(11) NOT NULL DEFAULT '0',
  `paymentid` int(11) NOT NULL DEFAULT '0',
  `payment_surcharge` decimal(12,2) NOT NULL DEFAULT '0.00',
  `tax_number` varchar(50) NOT NULL DEFAULT '',
  `tax_exempt` char(1) NOT NULL DEFAULT 'N',
  `init_total` decimal(12,2) NOT NULL DEFAULT '0.00',
  `access_key` varchar(16) NOT NULL DEFAULT '',
  `docdata_export_status` int(11) NOT NULL DEFAULT '0' COMMENT '0: not exported; 1: successfully exported; 101: export result pending; -1: export failed',
  `docdata_export_date` int(11) NOT NULL DEFAULT '0' COMMENT 'last export date to docdata',
  `docdata_bulk_orderid` int(11) NOT NULL DEFAULT '0',
  `docdata_bulk_order_export_status` int(11) NOT NULL DEFAULT '0',
  `docdata_bulk_order_export_date` int(11) NOT NULL DEFAULT '0',
  `abilita_order_create` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`orderid`),
  UNIQUE KEY `odsp` (`orderid`,`date`,`status`,`paymentid`),
  KEY `order_date` (`date`),
  KEY `s_state` (`s_state`),
  KEY `b_state` (`b_state`),
  KEY `s_country` (`s_country`),
  KEY `b_country` (`b_country`),
  KEY `clickid` (`clickid`),
  KEY `userid` (`userid`),
  KEY `paymentid` (`paymentid`),
  KEY `shippingid` (`shippingid`),
  KEY `return_status` (`return_status`),
  KEY `status` (`status`),
  KEY `docdata_export_status` (`docdata_export_status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=535623 ;

--
-- Dumping data for table `xcart_orders`
--

INSERT INTO `xcart_orders` (`orderid`, `userid`, `membership`, `total`, `giftcert_discount`, `giftcert_ids`, `subtotal`, `discount`, `coupon`, `coupon_discount`, `shippingid`, `shipping`, `tracking`, `shipping_cost`, `tax`, `taxes_applied`, `date`, `status`, `return_status`, `payment_method`, `flag`, `notes`, `details`, `customer_notes`, `customer`, `title`, `firstname`, `lastname`, `company`, `b_title`, `b_firstname`, `b_lastname`, `b_address`, `b_city`, `b_county`, `b_state`, `b_country`, `b_zipcode`, `b_zip4`, `b_phone`, `b_fax`, `s_title`, `s_firstname`, `s_lastname`, `s_address`, `s_city`, `s_county`, `s_state`, `s_country`, `s_zipcode`, `s_phone`, `s_fax`, `s_zip4`, `url`, `email`, `language`, `clickid`, `extra`, `membershipid`, `paymentid`, `payment_surcharge`, `tax_number`, `tax_exempt`, `init_total`, `access_key`, `docdata_export_status`, `docdata_export_date`, `docdata_bulk_orderid`, `docdata_bulk_order_export_status`, `docdata_bulk_order_export_date`, `abilita_order_create`) VALUES
(535600, 1, '', '10.00', '0.00', '', '0.00', '0.00', '', '0.00', 0, '', '', '0.00', '0.00', '', 0, 'Q', NULL, '', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'en', 0, '', 0, 0, '0.00', '', 'N', '0.00', '', 0, 0, 0, 0, 0, 1),
(535601, 2, '', '10.00', '0.00', '', '0.00', '0.00', '', '0.00', 0, '', '', '0.00', '0.00', '', 0, 'Q', NULL, '', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'en', 0, '', 0, 0, '0.00', '', 'N', '0.00', '', 0, 0, 0, 0, 0, 1),
(535602, 3, '', '10.00', '0.00', '', '0.00', '0.00', '', '0.00', 0, '', '', '0.00', '0.00', '', 0, 'Q', NULL, '', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'en', 0, '', 0, 0, '0.00', '', 'N', '0.00', '', 0, 0, 0, 0, 0, 1),
(535603, 4, '', '10.00', '0.00', '', '0.00', '0.00', '', '0.00', 0, '', '', '0.00', '0.00', '', 0, 'Q', NULL, '', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'en', 0, '', 0, 0, '0.00', '', 'N', '0.00', '', 0, 0, 0, 0, 0, 1),
(535604, 5, '', '10.00', '0.00', '', '0.00', '0.00', '', '0.00', 0, '', '', '0.00', '0.00', '', 0, 'Q', NULL, '', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'en', 0, '', 0, 0, '0.00', '', 'N', '0.00', '', 0, 0, 0, 0, 0, 1),
(535605, 6, '', '10.00', '0.00', '', '0.00', '0.00', '', '0.00', 0, '', '', '0.00', '0.00', '', 0, 'Q', NULL, '', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'en', 0, '', 0, 0, '0.00', '', 'N', '0.00', '', 0, 0, 0, 0, 0, 1),
(535606, 7, '', '10.00', '0.00', '', '0.00', '0.00', '', '0.00', 0, '', '', '0.00', '0.00', '', 0, 'Q', NULL, '', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'en', 0, '', 0, 0, '0.00', '', 'N', '0.00', '', 0, 0, 0, 0, 0, 1),
(535607, 8, '', '10.00', '0.00', '', '0.00', '0.00', '', '0.00', 0, '', '', '0.00', '0.00', '', 0, 'Q', NULL, '', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'en', 0, '', 0, 0, '0.00', '', 'N', '0.00', '', 0, 0, 0, 0, 0, 1),
(535608, 9, '', '1.00', '0.00', '', '0.00', '0.00', '', '0.00', 0, '', '', '0.00', '0.00', '', 0, 'Q', NULL, '', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'en', 0, '', 0, 0, '0.00', '', 'N', '0.00', '', 0, 0, 0, 0, 0, 1),
(535609, 10, '', '1.00', '0.00', '', '0.00', '0.00', '', '0.00', 0, '', '', '0.00', '0.00', '', 0, 'Q', NULL, '', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'en', 0, '', 0, 0, '0.00', '', 'N', '0.00', '', 0, 0, 0, 0, 0, 1),
(535610, 1, '', '-111.00', '0.00', '', '0.00', '0.00', '', '0.00', 0, '', '', '0.00', '0.00', '', 0, 'Q', NULL, '', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'en', 0, '', 0, 0, '0.00', '', 'N', '0.00', '', 0, 0, 0, 0, 0, 1),
(535611, 2, '', '1.00', '0.00', '', '0.00', '0.00', '', '0.00', 0, '', '', '0.00', '0.00', '', 0, 'Q', NULL, '', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'en', 0, '', 0, 0, '0.00', '', 'N', '0.00', '', 0, 0, 0, 0, 0, 1),
(535612, 3, '', '1.00', '0.00', '', '0.00', '0.00', '', '0.00', 0, '', '', '0.00', '0.00', '', 0, 'Q', NULL, '', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'en', 0, '', 0, 0, '0.00', '', 'N', '0.00', '', 0, 0, 0, 0, 0, 1),
(535613, 4, '', '1.00', '0.00', '', '0.00', '0.00', '', '0.00', 0, '', '', '0.00', '0.00', '', 0, 'Q', NULL, '', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'en', 0, '', 0, 0, '0.00', '', 'N', '0.00', '', 0, 0, 0, 0, 0, 1),
(535614, 5, '', '1.00', '0.00', '', '0.00', '0.00', '', '0.00', 0, '', '', '0.00', '0.00', '', 0, 'Q', NULL, '', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'en', 0, '', 0, 0, '0.00', '', 'N', '0.00', '', 0, 0, 0, 0, 0, 1),
(535615, 6, '', '1.00', '0.00', '', '0.00', '0.00', '', '0.00', 0, '', '', '0.00', '0.00', '', 0, 'Q', NULL, '', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'en', 0, '', 0, 0, '0.00', '', 'N', '0.00', '', 0, 0, 0, 0, 0, 1),
(535616, 7, '', '1.00', '0.00', '', '0.00', '0.00', '', '0.00', 0, '', '', '0.00', '0.00', '', 0, 'Q', NULL, '', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'en', 0, '', 0, 0, '0.00', '', 'N', '0.00', '', 0, 0, 0, 0, 0, 1),
(535617, 8, '', '1.00', '0.00', '', '0.00', '0.00', '', '0.00', 0, '', '', '0.00', '0.00', '', 0, 'Q', NULL, '', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'en', 0, '', 0, 0, '0.00', '', 'N', '0.00', '', 0, 0, 0, 0, 0, 1),
(535618, 9, '', '1.00', '0.00', '', '0.00', '0.00', '', '0.00', 0, '', '', '0.00', '0.00', '', 0, 'Q', NULL, '', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'en', 0, '', 0, 0, '0.00', '', 'N', '0.00', '', 0, 0, 0, 0, 0, 1),
(535619, 10, '', '1.00', '0.00', '', '0.00', '0.00', '', '0.00', 0, '', '', '0.00', '0.00', '', 0, 'Q', NULL, '', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'en', 0, '', 0, 0, '0.00', '', 'N', '0.00', '', 0, 0, 0, 0, 0, 1),
(535620, 11, '', '1.00', '0.00', '', '0.00', '0.00', '', '0.00', 0, '', '', '0.00', '0.00', '', 0, 'Q', NULL, '', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'en', 0, '', 0, 0, '0.00', '', 'N', '0.00', '', 0, 0, 0, 0, 0, 1),
(535621, 12, '', '100.00', '0.00', '', '0.00', '0.00', '', '0.00', 0, '', '', '0.00', '0.00', '', 0, 'Q', NULL, '', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'en', 0, '', 0, 0, '0.00', '', 'N', '0.00', '', 0, 0, 0, 0, 0, 1),
(535622, 9, '', '1.00', '0.00', '', '0.00', '0.00', '', '0.00', 0, '', '', '0.00', '0.00', '', 0, 'Q', NULL, '', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'en', 0, '', 0, 0, '0.00', '', 'N', '0.00', '', 0, 0, 0, 0, 0, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
