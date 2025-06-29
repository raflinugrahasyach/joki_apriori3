-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2025 at 07:49 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dm_apriori`
--

-- --------------------------------------------------------

--
-- Table structure for table `confidence`
--

CREATE TABLE `confidence` (
  `kombinasi1` varchar(255) DEFAULT NULL,
  `kombinasi2` varchar(255) DEFAULT NULL,
  `support_xUy` double DEFAULT NULL,
  `support_x` double DEFAULT NULL,
  `confidence` double DEFAULT NULL,
  `lolos` tinyint(4) DEFAULT NULL,
  `min_support` double DEFAULT NULL,
  `min_confidence` double DEFAULT NULL,
  `nilai_uji_lift` double DEFAULT NULL,
  `korelasi_rule` varchar(100) DEFAULT NULL,
  `id_process` int(11) NOT NULL DEFAULT 0,
  `jumlah_a` int(11) DEFAULT NULL,
  `jumlah_b` int(11) DEFAULT NULL,
  `jumlah_ab` int(11) DEFAULT NULL,
  `px` double DEFAULT NULL,
  `py` double DEFAULT NULL,
  `pxuy` double DEFAULT NULL,
  `from_itemset` int(11) DEFAULT NULL COMMENT 'dari itemset 2/3'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `confidence`
--

INSERT INTO `confidence` (`kombinasi1`, `kombinasi2`, `support_xUy`, `support_x`, `confidence`, `lolos`, `min_support`, `min_confidence`, `nilai_uji_lift`, `korelasi_rule`, `id_process`, `jumlah_a`, `jumlah_b`, `jumlah_ab`, `px`, `py`, `pxuy`, `from_itemset`) VALUES
('Ulos Mangiring', 'Ulos Ragidup', 1.865671641791, 33.582089552239, 5.5555555555554, 1, NULL, 5, 0.21578099838969, 'Korelasi Negatif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 2),
('Ulos Ragi Hotang , Ulos Ragidup', 'Ulos Sibolang', 2.2388059701493, 3.7313432835821, 60.000000000001, 1, NULL, 5, 2.1157894736843, 'Korelasi Positif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 3),
('Ulos Ragi Hotang , Ulos Sibolang', 'Ulos Ragidup', 2.2388059701493, 5.2238805970149, 42.857142857144, 1, NULL, 5, 1.664596273292, 'Korelasi Positif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 3),
('Ulos Ragidup , Ulos Sibolang', 'Ulos Ragi Hotang', 2.2388059701493, 3.7313432835821, 60.000000000001, 1, NULL, 5, 2.1157894736843, 'Korelasi Positif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 3),
('Ulos Mangiring , Ulos Ragi Hotang', 'Ulos Sibolang', 3.3582089552239, 7.089552238806, 47.368421052632, 1, NULL, 5, 1.6703601108033, 'Korelasi Positif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 3),
('Ulos Mangiring , Ulos Sibolang', 'Ulos Ragi Hotang', 3.3582089552239, 3.3582089552239, 100, 1, NULL, 5, 3.5263157894737, 'Korelasi Positif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 3),
('Ulos Ragi Hotang , Ulos Sibolang', 'Ulos Mangiring', 3.3582089552239, 5.2238805970149, 64.285714285715, 1, NULL, 5, 1.9142857142857, 'Korelasi Positif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 3),
('Ulos Mangiring , Ulos Ragidup', 'Ulos Sibolang', 1.1194029850746, 1.865671641791, 59.999999999999, 1, NULL, 5, 2.1157894736842, 'Korelasi Positif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 3),
('Ulos Mangiring , Ulos Sibolang', 'Ulos Ragidup', 1.1194029850746, 3.3582089552239, 33.333333333333, 1, NULL, 5, 1.2946859903381, 'Korelasi Positif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 3),
('Ulos Ragidup , Ulos Sibolang', 'Ulos Mangiring', 1.1194029850746, 3.7313432835821, 29.999999999999, 1, NULL, 5, 0.89333333333331, 'Korelasi Negatif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 3),
('Ulos Mangiring , Ulos Ragi Hotang', 'Ulos Ragidup', 1.865671641791, 7.089552238806, 26.315789473684, 1, NULL, 5, 1.022120518688, 'Korelasi Positif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 3),
('Ulos Mangiring , Ulos Ragidup', 'Ulos Ragi Hotang', 1.865671641791, 1.865671641791, 99.999999999998, 1, NULL, 5, 3.5263157894736, 'Korelasi Positif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 3),
('Ulos Ragi Hotang , Ulos Ragidup', 'Ulos Mangiring', 1.865671641791, 3.7313432835821, 49.999999999999, 1, NULL, 5, 1.4888888888889, 'Korelasi Positif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 3),
('Ulos Ragidup', 'Ulos Mangiring', 1.865671641791, 25.746268656716, 7.246376811594, 1, NULL, 5, 0.21578099838969, 'Korelasi Negatif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 2),
('Ulos Mangiring', 'Ulos Ragi Hotang', 7.089552238806, 33.582089552239, 21.111111111111, 1, NULL, 5, 0.74444444444445, 'Korelasi Negatif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 2),
('Ulos Ragi Hotang', 'Ulos Mangiring', 7.089552238806, 28.358208955224, 25, 1, NULL, 5, 0.74444444444445, 'Korelasi Negatif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 2),
('Ulos Mangiring', 'Ulos Sibolang', 3.3582089552239, 33.582089552239, 10, 1, NULL, 5, 0.35263157894737, 'Korelasi Negatif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 2),
('Ulos Sibolang', 'Ulos Mangiring', 3.3582089552239, 28.358208955224, 11.842105263158, 1, NULL, 5, 0.35263157894737, 'Korelasi Negatif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 2),
('Ulos Ragidup', 'Ulos Ragi Hotang', 3.7313432835821, 25.746268656716, 14.492753623188, 1, NULL, 5, 0.51106025934401, 'Korelasi Negatif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 2),
('Ulos Ragi Hotang', 'Ulos Ragidup', 3.7313432835821, 28.358208955224, 13.157894736842, 1, NULL, 5, 0.51106025934401, 'Korelasi Negatif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 2),
('Ulos Ragidup', 'Ulos Sibolang', 3.7313432835821, 25.746268656716, 14.492753623188, 1, NULL, 5, 0.51106025934401, 'Korelasi Negatif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 2),
('Ulos Sibolang', 'Ulos Ragidup', 3.7313432835821, 28.358208955224, 13.157894736842, 1, NULL, 5, 0.51106025934401, 'Korelasi Negatif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 2),
('Ulos Ragi Hotang', 'Ulos Sibolang', 5.2238805970149, 28.358208955224, 18.421052631579, 1, NULL, 5, 0.64958448753462, 'Korelasi Negatif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 2),
('Ulos Sibolang', 'Ulos Ragi Hotang', 5.2238805970149, 28.358208955224, 18.421052631579, 1, NULL, 5, 0.64958448753462, 'Korelasi Negatif', 12, NULL, NULL, NULL, NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `itemset1`
--

CREATE TABLE `itemset1` (
  `atribut` varchar(200) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `support` double DEFAULT NULL,
  `lolos` tinyint(4) DEFAULT NULL,
  `id_process` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `itemset1`
--

INSERT INTO `itemset1` (`atribut`, `jumlah`, `support`, `lolos`, `id_process`) VALUES
('Ulos Mangiring', 90, 33.582089552239, 1, 12),
('Ulos Ragidup', 69, 25.746268656716, 1, 12),
('Ulos Ragi Hotang', 76, 28.358208955224, 1, 12),
('Ulos Sibolang', 76, 28.358208955224, 1, 12),
('Ulos Bintang Maratur', 4, 1.4925373134328, 1, 12),
('31/10/2023+J202', 1, 0.37313432835821, 0, 12);

-- --------------------------------------------------------

--
-- Table structure for table `itemset2`
--

CREATE TABLE `itemset2` (
  `atribut1` varchar(200) DEFAULT NULL,
  `atribut2` varchar(200) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `support` double DEFAULT NULL,
  `lolos` tinyint(4) DEFAULT NULL,
  `id_process` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `itemset2`
--

INSERT INTO `itemset2` (`atribut1`, `atribut2`, `jumlah`, `support`, `lolos`, `id_process`) VALUES
('Ulos Mangiring', 'Ulos Ragidup', 5, 1.865671641791, 1, 12),
('Ulos Mangiring', 'Ulos Ragi Hotang', 19, 7.089552238806, 1, 12),
('Ulos Mangiring', 'Ulos Sibolang', 9, 3.3582089552239, 1, 12),
('Ulos Mangiring', 'Ulos Bintang Maratur', 0, 0, 0, 12),
('Ulos Ragidup', 'Ulos Ragi Hotang', 10, 3.7313432835821, 1, 12),
('Ulos Ragidup', 'Ulos Sibolang', 10, 3.7313432835821, 1, 12),
('Ulos Ragidup', 'Ulos Bintang Maratur', 0, 0, 0, 12),
('Ulos Ragi Hotang', 'Ulos Sibolang', 14, 5.2238805970149, 1, 12),
('Ulos Ragi Hotang', 'Ulos Bintang Maratur', 1, 0.37313432835821, 0, 12),
('Ulos Sibolang', 'Ulos Bintang Maratur', 1, 0.37313432835821, 0, 12);

-- --------------------------------------------------------

--
-- Table structure for table `itemset3`
--

CREATE TABLE `itemset3` (
  `atribut1` varchar(200) DEFAULT NULL,
  `atribut2` varchar(200) DEFAULT NULL,
  `atribut3` varchar(200) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `support` double DEFAULT NULL,
  `lolos` tinyint(4) DEFAULT NULL,
  `id_process` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `itemset3`
--

INSERT INTO `itemset3` (`atribut1`, `atribut2`, `atribut3`, `jumlah`, `support`, `lolos`, `id_process`) VALUES
('Ulos Mangiring', 'Ulos Ragi Hotang', 'Ulos Ragidup', 5, 1.865671641791, 1, 12),
('Ulos Mangiring', 'Ulos Ragidup', 'Ulos Sibolang', 3, 1.1194029850746, 1, 12),
('Ulos Mangiring', 'Ulos Ragi Hotang', 'Ulos Sibolang', 9, 3.3582089552239, 1, 12),
('Ulos Ragi Hotang', 'Ulos Ragidup', 'Ulos Sibolang', 6, 2.2388059701493, 1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `process_log`
--

CREATE TABLE `process_log` (
  `id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `min_support` double DEFAULT NULL,
  `min_confidence` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `process_log`
--

INSERT INTO `process_log` (`id`, `start_date`, `end_date`, `min_support`, `min_confidence`) VALUES
(12, '2023-06-29', '2025-06-29', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bulan`
--

CREATE TABLE `tbl_bulan` (
  `id_bulan` int(11) NOT NULL,
  `bulan` char(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_bulan`
--

INSERT INTO `tbl_bulan` (`id_bulan`, `bulan`) VALUES
(1, 'januari'),
(2, 'februari'),
(3, 'maret'),
(4, 'April'),
(5, 'Mei'),
(6, 'Juni'),
(7, 'Juli'),
(8, 'Agustus'),
(9, 'September'),
(10, 'Oktober'),
(11, 'November'),
(12, 'Desember');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_produk`
--

CREATE TABLE `tbl_produk` (
  `id_produk` int(11) NOT NULL,
  `jenis_ulos` char(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` char(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_produk`
--

INSERT INTO `tbl_produk` (`id_produk`, `jenis_ulos`, `harga`) VALUES
(1, 'Ulos Ragi Hotang', '600000'),
(2, 'Ulos Sibolang', '1200000'),
(3, 'Ulos Ragidup', '750000'),
(4, 'Ulos Mangiring', '500000'),
(5, 'Ulos Bintang Maratur', '800000');

-- --------------------------------------------------------

--
-- Table structure for table `toko`
--

CREATE TABLE `toko` (
  `id_toko` int(11) NOT NULL,
  `nama` char(25) NOT NULL,
  `noHp` int(11) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `toko`
--

INSERT INTO `toko` (`id_toko`, `nama`, `noHp`, `alamat`) VALUES
(1, 'Ilham Green Shop', 2147483647, 'Jl. Captain Ozora, Kp. Bulu RT 03/04 Setia Mekar, Tambun Selatan – 17510');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `transaction_date` date DEFAULT NULL,
  `produk` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `harga` int(11) NOT NULL,
  `jumlah_terjual` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `nama_pembeli` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kota_tujuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metode_pembayaran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `transaction_date`, `produk`, `harga`, `jumlah_terjual`, `total_harga`, `nama_pembeli`, `kota_tujuan`, `metode_pembayaran`) VALUES
(1, '2023-05-01', 'Ulos Ragi Hotang', 0, 4, 2400000, 'Budi Siregar', 'Balige', 'COD'),
(2, '2023-05-05', 'Ulos Sibolang', 0, 6, 12000000, 'Johan Pangaribuan', 'Medan', 'Kartu Kredit'),
(3, '2023-05-06', 'Ulos Sibolang,Ulos Ragi Hotang', 0, 5, 6600000, 'Duma Manullang', 'Bandung', 'Transfer Bank'),
(4, '2023-05-06', 'Ulos Ragidup', 0, 3, 3000000, 'Duma Sianturi', 'Yogyakarta', 'Transfer Bank'),
(5, '2023-05-06', 'Ulos Mangiring', 0, 2, 1000000, 'Johan Pangaribuan', 'Surabaya', 'E-Wallet'),
(6, '2023-05-07', 'Ulos Sibolang', 0, 1, 4800000, 'Tiur Simbolon', 'Bandung', 'E-Wallet'),
(7, '2023-05-09', 'Ulos Mangiring', 0, 2, 1500000, 'Maria Simanjuntak', 'Palembang', 'Transfer Bank'),
(8, '2023-05-09', 'Ulos Ragidup', 0, 2, 1500000, 'Yanti Marpaung', 'Pekanbaru', 'Kartu Kredit'),
(9, '2023-05-09', 'Ulos Ragidup', 0, 2, 1500000, 'Lamtarida Simbolon', 'Palembang', 'Transfer Bank'),
(10, '2023-05-11', 'Ulos Ragi Hotang,Ulos Mangiring,Ulos Ragidup', 0, 10, 10650000, 'Nina Tampubolon', 'Batam', 'Transfer Bank'),
(11, '2023-05-17', 'Ulos Sibolang', 0, 1, 3600000, 'Sinta Saragih', 'Yogyakarta', 'Transfer Bank'),
(12, '2023-05-17', 'Ulos Ragidup', 0, 2, 1500000, 'Robert Sipayung', 'Bogor', 'COD'),
(13, '2023-05-18', 'Ulos Mangiring', 0, 1, 1500000, 'Maria Sianipar', 'Yogyakarta', 'Transfer Bank'),
(14, '2023-05-18', 'Ulos Sibolang', 0, 1, 6000000, 'Lasma Sitompul', 'Yogyakarta', 'E-Wallet'),
(15, '2023-05-19', 'Ulos Sibolang', 0, 1, 4800000, 'Niko Saragih', 'Jakarta', 'Kartu Kredit'),
(16, '2023-05-20', 'Ulos Sibolang', 0, 1, 2400000, 'Lasma Lumban Gaol', 'Pekanbaru', 'Kartu Kredit'),
(17, '2023-05-20', 'Ulos Ragidup', 0, 2, 3750000, 'Lamnauli Lumban Gaol', 'Balige', 'COD'),
(18, '2023-05-22', 'Ulos Mangiring', 0, 3, 2500000, 'Nina Sinaga', 'Bogor', 'Kartu Kredit'),
(19, '2023-05-22', 'Ulos Sibolang', 0, 1, 6000000, 'Tiur Pardosi', 'Bandung', 'E-Wallet'),
(20, '2023-05-25', 'Ulos Mangiring,Ulos Sibolang,Ulos Ragidup', 0, 6, 12250000, 'Anwar Sitompul', 'Pekanbaru', 'Transfer Bank'),
(21, '2023-05-25', 'Ulos Mangiring', 0, 2, 2000000, 'Santa Purba', 'Bandung', 'Kartu Kredit'),
(22, '2023-05-26', 'Ulos Ragidup', 0, 1, 3750000, 'Angel Nainggolan', 'Batam', 'Kartu Kredit'),
(23, '2023-05-27', 'Ulos Mangiring,Ulos Ragidup', 0, 3, 4000000, 'Johan Pangaribuan', 'Medan', 'COD'),
(24, '2023-05-27', 'Ulos Bintang Maratur', 0, 1, 1600000, 'Lela Pasaribu', 'Bogor', 'Transfer Bank'),
(25, '2023-05-29', 'Ulos Ragi Hotang', 0, 1, 600000, 'Horas Sinaga', 'Palembang', 'E-Wallet'),
(26, '2023-05-29', 'Ulos Bintang Maratur', 0, 1, 3200000, 'Dwi Situngkir', 'Batam', 'Kartu Kredit'),
(27, '2023-05-30', 'Ulos Ragi Hotang', 0, 2, 1200000, 'Sinta Parcdede', 'Surabaya', 'Kartu Kredit'),
(28, '2023-05-30', 'Ulos Mangiring,Ulos Ragi Hotang', 0, 6, 5800000, 'Yanti Marpaung', 'Surabaya', 'Kartu Kredit'),
(29, '2023-05-30', 'Ulos Ragi Hotang', 0, 2, 1200000, 'Nina Tampubolon', 'Pekanbaru', 'E-Wallet'),
(30, '2023-05-31', 'Ulos Sibolang', 0, 1, 3600000, 'Arta Pardosi', 'Yogyakarta', 'Transfer Bank'),
(31, '2023-05-31', 'Ulos Bintang Maratur', 0, 1, 1600000, 'Budi Siregar', 'Balige', 'COD'),
(32, '2023-06-07', 'Ulos Ragidup', 0, 1, 3750000, 'Johan Sitepu', 'Palembang', 'Kartu Kredit'),
(33, '2023-06-07', 'Ulos Ragidup', 0, 2, 3000000, 'Anwar Sitompul', 'Jakarta', 'Transfer Bank'),
(34, '2023-06-10', 'Ulos Ragi Hotang', 0, 1, 1800000, 'Tiur Simbolon', 'Medan', 'Kartu Kredit'),
(35, '2023-06-10', 'Ulos Ragi Hotang', 0, 3, 1200000, 'Lela Pasaribu', 'Pekanbaru', 'COD'),
(36, '2023-06-10', 'Ulos Sibolang', 0, 1, 3600000, 'Sisil Napitupulu', 'Surabaya', 'COD'),
(37, '2023-06-10', 'Ulos Ragidup', 0, 3, 3000000, 'Jesica Sipayung', 'Palembang', 'E-Wallet'),
(38, '2023-06-11', 'Ulos Sibolang', 0, 2, 6000000, 'Lamtaruli Silalahi', 'Bogor', 'Kartu Kredit'),
(39, '2023-06-15', 'Ulos Ragidup,Ulos Ragi Hotang,Ulos Mangiring', 0, 6, 9200000, 'Rinto Lumban Gaol', 'Balige', 'Transfer Bank'),
(40, '2023-06-16', 'Ulos Ragidup', 0, 3, 1500000, 'Sisil Napitupulu', 'Pekanbaru', 'COD'),
(41, '2023-06-20', 'Ulos Bintang Maratur,Ulos Ragidup', 0, 4, 6950000, 'Sinta Saragih', 'Yogyakarta', 'E-Wallet'),
(42, '2023-06-20', 'Ulos Sibolang', 0, 1, 1200000, 'Maria Silaban', 'Batam', 'E-Wallet'),
(43, '2023-06-20', 'Ulos Mangiring', 0, 2, 1000000, 'Mely Samosir', 'Pekanbaru', 'COD'),
(44, '2023-06-21', 'Ulos Sibolang', 0, 1, 1200000, 'Geby Pasaribu', 'Jakarta', 'Transfer Bank'),
(45, '2023-06-23', 'Ulos Mangiring', 0, 3, 1500000, 'Johan Pangaribuan', 'Balige', 'Transfer Bank'),
(46, '2023-06-23', 'Ulos Ragidup', 0, 1, 750000, 'Robert Silalahi', 'Surabaya', 'COD'),
(47, '2023-06-25', 'Ulos Mangiring', 0, 2, 1500000, 'Sinta Saragih', 'Balige', 'COD'),
(48, '2023-06-27', 'Ulos Ragidup,Ulos Sibolang', 0, 4, 7800000, 'Tiur Simbolon', 'Jakarta', 'Transfer Bank'),
(49, '2023-06-29', 'Ulos Mangiring', 0, 2, 1000000, 'Anwar Sitompul', 'Surabaya', 'Kartu Kredit'),
(50, '2023-06-29', 'Ulos Mangiring', 0, 2, 1500000, 'Johan Pangaribuan', 'Pekanbaru', 'Kartu Kredit'),
(51, '2023-06-30', 'Ulos Mangiring', 0, 1, 2000000, 'Anwar Sitompul', 'Bandung', 'E-Wallet'),
(52, '2023-07-01', 'Ulos Ragidup,Ulos Ragi Hotang', 0, 3, 4950000, 'Togar Nainggolan', 'Yogyakarta', 'E-Wallet'),
(53, '2023-07-02', 'Ulos Sibolang', 0, 1, 6000000, 'Yanti Marpaung', 'Batam', 'E-Wallet'),
(54, '2023-07-03', 'Ulos Ragi Hotang,Ulos Sibolang', 0, 2, 3000000, 'Yanti Marpaung', 'Pekanbaru', 'COD'),
(55, '2023-07-03', 'Ulos Bintang Maratur', 0, 2, 800000, 'Johan Pangaribuan', 'Surabaya', 'Transfer Bank'),
(56, '2023-07-05', 'Ulos Sibolang', 0, 1, 6000000, 'Duma Manullang', 'Yogyakarta', 'E-Wallet'),
(57, '2023-07-05', 'Ulos Ragidup', 0, 2, 3000000, 'Sinta Saragih', 'Pekanbaru', 'COD'),
(58, '2023-07-10', 'Ulos Bintang Maratur,Ulos Ragi Hotang,Ulos Sibolang', 0, 6, 13800000, 'Robert Silalahi', 'Jakarta', 'Transfer Bank'),
(59, '2023-07-11', 'Ulos Bintang Maratur', 0, 2, 4000000, 'Maria Simanjuntak', 'Bogor', 'Transfer Bank'),
(60, '2023-07-11', 'Ulos Sibolang', 0, 1, 4800000, 'Tiur Simbolon', 'Surabaya', 'Transfer Bank'),
(61, '2023-07-15', 'Ulos Mangiring', 0, 2, 1000000, 'Tiur Simbolon', 'Surabaya', 'E-Wallet'),
(62, '2023-07-27', 'Ulos Ragidup', 0, 2, 750000, 'Johan Pangaribuan', 'Jakarta', 'COD'),
(63, '2023-07-28', 'Ulos Ragidup', 0, 1, 750000, 'Rinto Lumban Gaol', 'Batam', 'Transfer Bank'),
(64, '2023-07-29', 'Ulos Mangiring', 0, 2, 1500000, 'Nina Tampubolon', 'Bandung', 'Transfer Bank'),
(65, '2023-07-29', 'Ulos Mangiring', 0, 2, 2000000, 'Robert Silalahi', 'Bogor', 'Transfer Bank'),
(66, '2023-07-31', 'Ulos Ragidup,Ulos Sibolang', 0, 4, 8100000, 'Yohana Tampubolon', 'Balige', 'E-Wallet'),
(67, '2023-08-01', 'Ulos Sibolang', 0, 3, 1200000, 'Togar Nainggolan', 'Balige', 'Kartu Kredit'),
(68, '2023-08-01', 'Ulos Bintang Maratur', 0, 2, 4000000, 'Sinta Saragih', 'Surabaya', 'Kartu Kredit'),
(69, '2023-08-02', 'Ulos Mangiring', 0, 2, 1000000, 'Johan Pangaribuan', 'Balige', 'Transfer Bank'),
(70, '2023-08-04', 'Ulos Mangiring,Ulos Ragi Hotang', 0, 4, 2700000, 'Bonar Saragih', 'Palembang', 'Transfer Bank'),
(71, '2023-08-05', 'Ulos Ragidup', 0, 1, 3000000, 'Yanti Marpaung', 'Bandung', 'E-Wallet'),
(72, '2023-08-08', 'Ulos Ragidup', 0, 1, 3000000, 'Togar Nainggolan', 'Yogyakarta', 'COD'),
(73, '2023-08-08', 'Ulos Mangiring', 0, 4, 1500000, 'Budi Siregar', 'Bandung', 'E-Wallet'),
(74, '2023-08-10', 'Ulos Ragi Hotang', 0, 2, 1800000, 'Marta Sihombing', 'Medan', 'COD'),
(75, '2023-08-13', 'Ulos Mangiring', 0, 4, 2500000, 'Daniel Simatupang', 'Jakarta', 'Transfer Bank'),
(76, '2023-08-13', 'Ulos Sibolang', 0, 1, 2400000, 'Sari Manurung', 'Surabaya', 'E-Wallet'),
(77, '2023-08-13', 'Ulos Ragi Hotang', 0, 5, 3600000, 'Joni Situmorang', 'Batam', 'Kartu Kredit'),
(78, '2023-08-17', 'Ulos Ragidup', 0, 1, 3000000, 'Johan Pangaribuan', 'Bandung', 'COD'),
(79, '2023-08-17', 'Ulos Mangiring', 0, 2, 1000000, 'Geby Pasaribu', 'Yogyakarta', 'E-Wallet'),
(80, '2023-08-18', 'Ulos Sibolang', 0, 1, 1200000, 'Duma Manullang', 'Bogor', 'Kartu Kredit'),
(81, '2023-08-21', 'Ulos Ragidup', 0, 1, 2250000, 'Tiur Simbolon', 'Medan', 'Transfer Bank'),
(82, '2023-08-21', 'Ulos Ragi Hotang,Ulos Mangiring', 0, 5, 4900000, 'Tiara Simanjuntak', 'Pahae', 'E-Wallet'),
(83, '2023-08-22', 'Ulos Sibolang', 0, 1, 2400000, 'Sari Manurung', 'Balige', 'Transfer Bank'),
(84, '2023-08-23', 'Ulos Ragi Hotang', 0, 1, 3000000, 'Budi Siregar', 'Jakarta', 'COD'),
(85, '2023-08-25', 'Ulos Mangiring', 0, 2, 1500000, 'Maria Simanjuntak', 'Bandung', 'E-Wallet'),
(86, '2023-08-25', 'Ulos Ragidup', 0, 1, 3000000, 'Elen Sitorus', 'Yogyakarta', 'Transfer Bank'),
(87, '2023-08-29', 'Ulos Sibolang', 0, 1, 1200000, 'Johan Pangaribuan', 'Surabaya', 'Kartu Kredit'),
(88, '2023-08-30', 'Ulos Ragi Hotang', 0, 2, 1200000, 'Duma Manullang', 'Medan', 'E-Wallet'),
(89, '2023-09-05', 'Ulos Ragidup', 0, 3, 3750000, 'Joni Situmorang', 'Bogor', 'COD'),
(90, '2023-09-05', 'Ulos Mangiring', 0, 2, 2000000, 'Sari Manurung', 'Batam', 'Transfer Bank'),
(91, '2023-09-06', 'Ulos Sibolang', 0, 1, 7200000, 'Marta Sihombing', 'Medan', 'Kartu Kredit'),
(92, '2023-09-06', 'Ulos Ragi Hotang', 0, 3, 1800000, 'Daniel Simatupang', 'Yogyakarta', 'E-Wallet'),
(93, '2023-09-06', 'Ulos Ragidup', 0, 2, 1500000, 'Johan Pangaribuan', 'Balige', 'Transfer Bank'),
(94, '2023-09-06', 'Ulos Mangiring', 0, 1, 500000, 'Budi Siregar', 'Surabaya', 'COD'),
(95, '2023-09-07', 'Ulos Sibolang', 0, 1, 6000000, 'Elen Sitorus', 'Jakarta', 'E-Wallet'),
(96, '2023-09-10', 'Ulos Ragi Hotang', 0, 2, 2400000, 'Duma Manullang', 'Bandung', 'Kartu Kredit'),
(97, '2023-09-10', 'Ulos Ragidup', 0, 1, 4500000, 'Maria Simanjuntak', 'Medan', 'Transfer Bank'),
(98, '2023-09-10', 'Ulos Mangiring', 0, 1, 1500000, 'Joni Situmorang', 'Surabaya', 'COD'),
(99, '2023-09-11', 'Ulos Sibolang,Ulos Ragi Hotang,Ulos Ragidup', 0, 6, 9000000, 'Risama Sihombing', 'Batam', 'Transfer Bank'),
(100, '2023-09-15', 'Ulos Ragi Hotang', 0, 1, 1800000, 'Lestari Simbolon', 'Medan', 'COD'),
(101, '2023-09-15', 'Ulos Sibolang', 0, 2, 2400000, 'Ronal Sihombing', 'Bandung', 'Transfer Bank'),
(102, '2023-09-16', 'Ulos Mangiring', 0, 2, 2500000, 'Dian Manurung', 'Surabaya', 'Kartu Kredit'),
(103, '2023-09-17', 'Ulos Ragidup', 0, 1, 3000000, 'Ferry Pardede', 'Jakarta', 'E-Wallet'),
(104, '2023-09-19', 'Ulos Ragi Hotang', 0, 2, 1800000, 'Debora Napitupulu', 'Palembang', 'Kartu Kredit'),
(105, '2023-09-20', 'Ulos Sibolang', 0, 1, 4800000, 'Yohana Samosir', 'Batam', 'Transfer Bank'),
(106, '2023-09-20', 'Ulos Mangiring', 0, 1, 1000000, 'Geby Pasaribu', 'Yogyakarta', 'COD'),
(107, '2023-09-20', 'Ulos Ragidup', 0, 2, 3750000, 'Puspita Hutapea', 'Balige', 'E-Wallet'),
(108, '2023-09-21', 'Ulos Sibolang', 0, 1, 1200000, 'Anggi Manurung', 'Bogor', 'Transfer Bank'),
(109, '2023-09-24', 'Ulos Mangiring', 0, 3, 2000000, 'Dedi Nainggolan', 'Bandung', 'Kartu Kredit'),
(110, '2023-09-25', 'Ulos Ragi Hotang', 0, 2, 1800000, 'Putri Silalahi', 'Surabaya', 'COD'),
(111, '2023-09-27', 'Ulos Ragidup', 0, 1, 3000000, 'Samuel Panjaitan', 'Pekanbaru', 'Transfer Bank'),
(112, '2023-09-27', 'Ulos Sibolang', 0, 1, 2400000, 'Lenny Tampubolon', 'Medan', 'E-Wallet'),
(113, '2023-09-29', 'Ulos Mangiring', 0, 2, 2500000, 'Junaedi Hutabarat', 'Jakarta', 'Kartu Kredit'),
(114, '2023-09-29', 'Ulos Ragi Hotang,Ulos Ragidup,Ulos Sibolang', 0, 6, 10650000, 'Shalom Sihombing', 'Yogyakarta', 'Transfer Bank'),
(115, '2023-09-30', 'Ulos Mangiring', 0, 1, 500000, 'Rio Pardede', 'Bandung', 'Kartu Kredit'),
(116, '2023-10-01', 'Ulos Ragi Hotang', 0, 1, 1800000, 'Vivi Lumbantoruan', 'Bogor', 'COD'),
(117, '2023-10-01', 'Ulos Ragidup', 0, 1, 3000000, 'Hendra Simanungkalit', 'Palembang', 'Transfer Bank'),
(118, '2023-10-01', 'Ulos Sibolang', 0, 2, 3600000, 'Merry Nababan', 'Jakarta', 'E-Wallet'),
(119, '2023-10-01', 'Ulos Mangiring', 0, 1, 1500000, 'Sari Napitupulu', 'Medan', 'E-Wallet'),
(120, '2023-10-02', 'Ulos Ragidup', 0, 1, 3750000, 'Julian Manurung', 'Jakarta', 'Kartu Kredit'),
(121, '2023-10-02', 'Ulos Ragi Hotang', 0, 2, 1200000, 'Benny Sitorus', 'Batam', 'COD'),
(122, '2023-10-05', 'Ulos Sibolang', 0, 1, 4800000, 'Monica Sihotang', 'Bandung', 'Transfer Bank'),
(123, '2023-10-06', 'Ulos Mangiring', 0, 3, 2500000, 'Aldo Panjaitan', 'Bogor', 'E-Wallet'),
(124, '2023-10-07', 'Ulos Ragidup,Ulos Ragi Hotang,Ulos Sibolang,Ulos Mangiring', 0, 8, 7550000, 'Selvi Aritonang', 'Samosir', 'Transfer Bank'),
(125, '2023-10-08', 'Ulos Ragidup', 0, 1, 3750000, 'Grace Samosir', 'Bandung', 'Transfer Bank'),
(126, '2023-10-08', 'Ulos Ragi Hotang', 0, 1, 1800000, 'Ronny Lumban Gaol', 'Balige', 'E-Wallet'),
(127, '2023-10-08', 'Ulos Sibolang', 0, 1, 3600000, 'Irma Napitu', 'Jakarta', 'Kartu Kredit'),
(128, '2023-10-08', 'Ulos Mangiring', 0, 2, 2000000, 'Liana Hutapea', 'Palembang', 'COD'),
(129, '2023-10-09', 'Ulos Ragidup', 0, 1, 1500000, 'Jerry Pardede', 'Batam', 'Transfer Bank'),
(130, '2023-10-10', 'Ulos Ragi Hotang', 0, 1, 3000000, 'Febri Silaban', 'Medan', 'E-Wallet'),
(131, '2023-10-10', 'Ulos Sibolang', 0, 1, 2400000, 'Dina Simatupang', 'Pekanbaru', 'Kartu Kredit'),
(132, '2023-10-12', 'Ulos Mangiring', 0, 1, 1500000, 'Andi Simanjuntak', 'Bogor', 'Transfer Bank'),
(133, '2023-10-12', 'Ulos Ragidup', 0, 2, 2250000, 'Geby Pasaribu', 'Bandung', 'E-Wallet'),
(134, '2023-10-12', 'Ulos Ragi Hotang', 0, 3, 1200000, 'Tony Situmorang', 'Surabaya', 'COD'),
(135, '2023-10-13', 'Ulos Sibolang', 0, 1, 4800000, 'Melati Pardede', 'Yogyakarta', 'Transfer Bank'),
(136, '2023-10-15', 'Ulos Mangiring', 0, 2, 2000000, 'Sylvia Manurung', 'Palembang', 'Kartu Kredit'),
(137, '2023-10-16', 'Ulos Ragidup', 0, 3, 2250000, 'Ricky Lumbantoruan', 'Batam', 'Transfer Bank'),
(138, '2023-10-17', 'Ulos Ragi Hotang', 0, 3, 2400000, 'Winda Simanjuntak', 'Bandung', 'E-Wallet'),
(139, '2023-10-17', 'Ulos Sibolang', 0, 4, 3600000, 'Hendra Sihombing', 'Medan', 'COD'),
(140, '2023-10-17', 'Ulos Mangiring', 0, 2, 2500000, 'Ria Sitompul', 'Yogyakarta', 'Transfer Bank'),
(141, '2023-10-18', 'Ulos Ragidup', 0, 3, 1500000, 'Daniel Simatupang', 'Surabaya', 'Kartu Kredit'),
(142, '2023-10-19', 'Ulos Ragi Hotang', 0, 2, 3000000, 'Sinta Hutagalung', 'Jakarta', 'E-Wallet'),
(143, '2023-10-19', 'Ulos Sibolang', 0, 1, 1200000, 'Yogi Simbolon', 'Bandung', 'COD'),
(144, '2023-10-20', 'Ulos Mangiring,Ulos Ragidup,Ulos Ragi Hotang,Ulos Sibolang', 0, 9, 13250000, 'Erlin Naibaho', 'Jakarta', 'Transfer Bank'),
(145, '2023-10-21', 'Ulos Ragidup', 0, 2, 2250000, 'Clara Simbolon', 'Surabaya', 'COD'),
(146, '2023-10-21', 'Ulos Ragi Hotang', 0, 1, 3000000, 'Tony Lumbanbatu', 'Medan', 'Kartu Kredit'),
(147, '2023-10-22', 'Ulos Sibolang', 0, 1, 2400000, 'Olivia Sihombing', 'Bandung', 'Transfer Bank'),
(148, '2023-10-22', 'Ulos Mangiring', 0, 1, 2500000, 'Grace Manik', 'Balige', 'E-Wallet'),
(149, '2023-10-22', 'Ulos Ragidup', 0, 1, 750000, 'Tommy Panjaitan', 'Yogyakarta', 'Kartu Kredit'),
(150, '2023-10-23', 'Ulos Ragi Hotang', 0, 2, 2400000, 'Ika Simanjuntak', 'Palembang', 'COD'),
(151, '2023-10-23', 'Ulos Sibolang', 0, 1, 4800000, 'Albert Napitupulu', 'Bogor', 'Transfer Bank'),
(152, '2023-10-24', 'Ulos Mangiring', 0, 2, 2000000, 'Veronika Situmorang', 'Bandung', 'Kartu Kredit'),
(153, '2023-10-24', 'Ulos Ragidup', 0, 1, 2250000, 'Joko Lumbantoruan', 'Medan', 'Transfer Bank'),
(154, '2023-10-25', 'Ulos Ragi Hotang', 0, 1, 3000000, 'Yuli Simanjuntak', 'Surabaya', 'E-Wallet'),
(155, '2023-10-26', 'Ulos Sibolang', 0, 1, 2400000, 'Togar Samosir', 'Yogyakarta', 'COD'),
(156, '2023-10-29', 'Ulos Mangiring', 0, 2, 2500000, 'Geby Pasaribu', 'Batam', 'Transfer Bank'),
(157, '2023-10-29', 'Ulos Ragidup', 0, 2, 1500000, 'Aditya Sihotang', 'Jakarta', 'Kartu Kredit'),
(158, '2023-10-30', 'Ulos Ragi Hotang', 0, 3, 1800000, 'Sari Hutapea', 'Pekanbaru', 'E-Wallet'),
(159, '2023-10-30', 'Ulos Sibolang', 0, 3, 4800000, 'Doni Panjaitan', 'Palembang', 'COD'),
(160, '2023-10-30', '31/10/2023+J202', 0, 3, 1500000, 'Nina Napitu', 'Bogor', 'Transfer Bank'),
(161, '2023-10-31', 'Ulos Ragidup,Ulos Ragi Hotang', 0, 4, 6150000, 'Robet Simbolon', 'Bandung', 'E-Wallet'),
(162, '2023-11-06', 'Ulos Sibolang', 0, 1, 2400000, 'Matius Sihombing', 'Surabaya', 'Transfer Bank'),
(163, '2023-11-06', 'Ulos Mangiring', 0, 1, 1000000, 'Debby Lumbanbatu', 'Medan', 'COD'),
(164, '2023-11-07', 'Ulos Ragidup', 0, 3, 3000000, 'Hans Sitorus', 'Jakarta', 'E-Wallet'),
(165, '2023-11-08', 'Ulos Ragi Hotang', 0, 3, 3000000, 'Silvi Pardede', 'Palembang', 'Transfer Bank'),
(166, '2023-11-10', 'Ulos Sibolang', 0, 2, 3600000, 'Leo Tambunan', 'Bogor', 'Kartu Kredit'),
(167, '2023-11-13', 'Ulos Mangiring,Ulos Ragidup,Ulos Ragi Hotang', 0, 5, 4400000, 'Amanda Hutagalung', 'Batam', 'Transfer Bank'),
(168, '2023-11-13', 'Ulos Sibolang', 0, 1, 1200000, 'Erwin Simbolon', 'Jakarta', 'Kartu Kredit'),
(169, '2023-11-14', 'Ulos Sibolang', 0, 2, 2400000, 'Rama Simanjuntak', 'Pekanbaru', 'E-Wallet'),
(170, '2023-11-14', 'Ulos Ragidup', 0, 2, 2250000, 'Nina Tampubolon', 'Pekanbaru', 'E-Wallet'),
(171, '2023-11-17', 'Ulos Ragi Hotang', 0, 3, 3000000, 'Robert Simbolon', 'Bogor', 'Transfer Bank'),
(172, '2023-11-17', 'Ulos Ragi Hotang', 0, 1, 600000, 'Maria Simanjuntak', 'Surabaya', 'Kartu Kredit'),
(173, '2023-11-17', 'Ulos Ragi Hotang', 0, 2, 1200000, 'Anwar Sitompul', 'Jakarta', 'COD'),
(174, '2023-11-17', 'Ulos Ragi Hotang', 0, 2, 1200000, 'Geby Pasaribu', 'Palembang', 'COD'),
(175, '2023-11-18', 'Ulos Mangiring', 0, 1, 500000, 'Nina Tampubolon', 'Medan', 'Kartu Kredit'),
(176, '2023-11-18', 'Ulos Sibolang', 0, 1, 7200000, 'Maria Simanjuntak', 'Bandung', 'Kartu Kredit'),
(177, '2023-11-19', 'Ulos Mangiring', 0, 1, 500000, 'Nina Tampubolon', 'Yogyakarta', 'Transfer Bank'),
(178, '2023-11-20', 'Ulos Sibolang', 0, 2, 2400000, 'Dina Samosir', 'Yogyakarta', 'E-Wallet'),
(179, '2023-11-22', 'Ulos Sibolang', 0, 2, 4800000, 'Jenny Hutabarat', 'Pekanbaru', 'Kartu Kredit'),
(180, '2023-11-22', 'Ulos Ragidup', 0, 2, 3750000, 'Sari Hutapea', 'Yogyakarta', 'COD'),
(181, '2023-11-23', 'Ulos Ragidup', 0, 2, 2250000, 'Robert Simbolon', 'Bogor', 'Kartu Kredit'),
(182, '2023-11-25', 'Ulos Ragidup,Ulos Sibolang', 0, 3, 6600000, 'Tasya Sitompul', 'Balige', 'Transfer Bank'),
(183, '2023-11-26', 'Ulos Ragidup', 0, 2, 1500000, 'Tony Sitompul', 'Medan', 'Kartu Kredit'),
(184, '2023-11-26', 'Ulos Mangiring', 0, 3, 3000000, 'Maria Simanjuntak', 'Medan', 'Transfer Bank'),
(185, '2023-11-27', 'Ulos Sibolang', 0, 2, 4800000, 'Togar Nainggolan', 'Palembang', 'COD'),
(186, '2023-11-27', 'Ulos Ragi Hotang', 0, 1, 1800000, 'Hendra Simanungkalit', 'Surabaya', 'Transfer Bank'),
(187, '2023-11-29', 'Ulos Mangiring', 0, 1, 1500000, 'Sinta Saragih', 'Medan', 'E-Wallet'),
(188, '2023-11-29', 'Ulos Sibolang', 0, 1, 4800000, 'Eko Pardede', 'Surabaya', 'Transfer Bank'),
(189, '2023-11-29', 'Ulos Sibolang', 0, 2, 2400000, 'Vina Sinaga', 'Surabaya', 'COD'),
(190, '2023-11-30', 'Ulos Ragidup', 0, 2, 2250000, 'Yuliana Siregar', 'Bandung', 'Kartu Kredit'),
(191, '2023-11-30', 'Ulos Mangiring', 0, 2, 1000000, 'Hendra Simanungkalit', 'Bandung', 'E-Wallet'),
(192, '2023-11-30', 'Ulos Mangiring', 0, 1, 500000, 'Geby Pasaribu', 'Medan', 'Transfer Bank'),
(193, '2023-12-01', 'Ulos Ragi Hotang,Ulos Mangiring,Ulos Sibolang', 0, 8, 7900000, 'Robert Sihombing', 'Tarutung', 'Transfer Bank'),
(194, '2023-12-02', 'Ulos Ragidup', 0, 3, 3000000, 'Sari Hutapea', 'Surabaya', 'COD'),
(195, '2023-12-02', 'Ulos Ragi Hotang', 0, 3, 3000000, 'Maria Simanjuntak', 'Palembang', 'E-Wallet'),
(196, '2023-12-04', 'Ulos Mangiring', 0, 1, 1000000, 'Sari Hutapea', 'Batam', 'Transfer Bank'),
(197, '2023-12-04', 'Ulos Ragi Hotang,Ulos Mangiring', 0, 3, 6000000, 'Robert Simbolon', 'Medan', 'E-Wallet'),
(198, '2023-12-04', 'Ulos Sibolang', 0, 1, 4800000, 'Vina Sinaga', 'Yogyakarta', 'Kartu Kredit'),
(199, '2023-12-04', 'Ulos Ragidup', 0, 1, 2250000, 'Yanti Marpaung', 'Medan', 'Transfer Bank'),
(200, '2023-12-05', 'Ulos Mangiring', 0, 1, 3000000, 'Dina Samosir', 'Bogor', 'COD'),
(201, '2023-12-05', 'Ulos Ragi Hotang', 0, 1, 3600000, 'Sari Hutapea', 'Pekanbaru', 'Kartu Kredit'),
(202, '2023-12-05', 'Ulos Ragidup', 0, 1, 3000000, 'Hendra Simanungkalit', 'Jakarta', 'COD'),
(203, '2023-12-05', 'Ulos Ragi Hotang', 0, 2, 1800000, 'Nina Tampubolon', 'Bogor', 'Transfer Bank'),
(204, '2023-12-05', 'Ulos Ragi Hotang', 0, 3, 3600000, 'Tiur Simbolon', 'Yogyakarta', 'E-Wallet'),
(205, '2023-12-06', 'Ulos Ragi Hotang', 0, 3, 600000, 'Yanti Marpaung', 'Medan', 'COD'),
(206, '2023-12-07', 'Ulos Ragi Hotang', 0, 1, 600000, 'Vina Sinaga', 'Surabaya', 'Transfer Bank'),
(207, '2023-12-07', 'Ulos Mangiring', 0, 1, 500000, 'Sinta Saragih', 'Pekanbaru', 'Transfer Bank'),
(208, '2023-12-07', 'Ulos Sibolang', 0, 1, 1200000, 'Ronald Hutapea', 'Bogor', 'Kartu Kredit'),
(209, '2023-12-08', 'Ulos Ragi Hotang', 0, 2, 1200000, 'Ronald Hutapea', 'Medan', 'Transfer Bank'),
(210, '2023-12-08', 'Ulos Ragi Hotang', 0, 2, 1200000, 'Eko Pardede', 'Medan', 'Transfer Bank'),
(211, '2023-12-10', 'Ulos Ragi Hotang,Ulos Sibolang,Ulos Ragidup,Ulos Mangiring', 0, 7, 9000000, 'Yanti Situngkir', 'Medan', 'Transfer Bank'),
(212, '2023-12-10', 'Ulos Mangiring', 0, 3, 1500000, 'Yuliana Siregar', 'Surabaya', 'COD'),
(213, '2023-12-11', 'Ulos Mangiring', 0, 5, 2500000, 'Tiur Simbolon', 'Yogyakarta', 'COD'),
(214, '2023-12-11', 'Ulos Sibolang', 0, 1, 1200000, 'Hostia Sitompul', 'Bandung', 'Transfer Bank'),
(215, '2023-12-12', 'Ulos Mangiring', 0, 2, 2500000, 'Tony Sitompul', 'Balige', 'COD'),
(216, '2023-12-12', 'Ulos Ragidup', 0, 2, 3000000, 'Tiur Simbolon', 'Yogyakarta', 'Kartu Kredit'),
(217, '2023-12-13', 'Ulos Mangiring,Ulos Ragi Hotang', 0, 3, 3600000, 'Budi Siregar', 'Palembang', 'Transfer Bank'),
(218, '2023-12-13', 'Ulos Ragidup', 0, 3, 3000000, 'Vina Sinaga', 'Jakarta', 'Kartu Kredit'),
(219, '2023-12-14', 'Ulos Mangiring', 0, 6, 3000000, 'Rama Simanjuntak', 'Batam', 'Kartu Kredit'),
(220, '2023-12-14', 'Ulos Ragi Hotang', 0, 1, 600000, 'Sari Hutapea', 'Batam', 'COD'),
(221, '2023-12-15', 'Ulos Mangiring,Ulos Ragi Hotang', 0, 8, 4200000, 'Tiar Sihombing', 'Tarutung', 'Transfer Bank'),
(222, '2023-12-16', 'Ulos Sibolang', 0, 3, 7200000, 'Sari Hutapea', 'Medan', 'COD'),
(223, '2023-12-17', 'Ulos Ragi Hotang', 0, 4, 3000000, 'Anwar Sitompul', 'Balige', 'Transfer Bank'),
(224, '2023-12-17', 'Ulos Sibolang', 0, 1, 7200000, 'Tony Sitompul', 'Yogyakarta', 'COD'),
(225, '2023-12-17', 'Ulos Mangiring', 0, 1, 1500000, 'Rama Simanjuntak', 'Pekanbaru', 'E-Wallet'),
(226, '2023-12-18', 'Ulos Ragidup', 0, 3, 1500000, 'Duma Manullang', 'Balige', 'E-Wallet'),
(227, '2023-12-18', 'Ulos Mangiring', 0, 3, 2500000, 'Hendra Simanungkalit', 'Jakarta', 'E-Wallet'),
(228, '2023-12-18', 'Ulos Sibolang', 0, 2, 1200000, 'Ronald Hutapea', 'Balige', 'COD'),
(229, '2023-12-21', 'Ulos Sibolang,Ulos Ragi Hotang,Ulos Mangiring', 0, 8, 12600000, 'Moren Simanjuntak', 'Balige', 'Transfer Bank'),
(230, '2023-12-21', 'Ulos Mangiring', 0, 2, 1000000, 'Togar Nainggolan', 'Medan', 'Transfer Bank'),
(231, '2023-12-22', 'Ulos Sibolang', 0, 1, 4800000, 'Jenny Hutabarat', 'Medan', 'Transfer Bank'),
(232, '2023-12-22', 'Ulos Sibolang', 0, 1, 1200000, 'Yanti Marpaung', 'Medan', 'E-Wallet'),
(233, '2023-12-22', 'Ulos Mangiring', 0, 2, 1000000, 'Anwar Sitompul', 'Palembang', 'COD'),
(234, '2023-12-23', 'Ulos Ragi Hotang', 0, 3, 1800000, 'Hostia Sitompul', 'Surabaya', 'E-Wallet'),
(235, '2023-12-23', 'Ulos Mangiring', 0, 5, 3000000, 'Vina Sinaga', 'Yogyakarta', 'Transfer Bank'),
(236, '2023-12-23', 'Ulos Ragi Hotang', 0, 2, 1200000, 'Togar Nainggolan', 'Surabaya', 'Kartu Kredit'),
(237, '2023-12-27', 'Ulos Sibolang', 0, 1, 4800000, 'Rama Simanjuntak', 'Bogor', 'E-Wallet'),
(238, '2023-12-27', 'Ulos Mangiring', 0, 1, 2000000, 'Robert Simbolon', 'Batam', 'Transfer Bank'),
(239, '2023-12-28', 'Ulos Mangiring,Ulos Sibolang,Ulos Ragi Hotang', 0, 13, 14100000, 'Sintia Hutapea', 'Sibolga', 'Transfer Bank'),
(240, '2023-12-29', 'Ulos Mangiring', 0, 1, 1500000, 'Sari Hutapea', 'Surabaya', 'Transfer Bank'),
(241, '2023-12-29', 'Ulos Mangiring', 0, 1, 2000000, 'Rama Simanjuntak', 'Palembang', 'COD'),
(242, '2023-12-29', 'Ulos Sibolang', 0, 1, 7200000, 'Jenny Hutabarat', 'Surabaya', 'E-Wallet'),
(243, '2023-12-30', 'Ulos Ragi Hotang,Ulos Ragidup,Ulos Sibolang', 0, 9, 13800000, 'Molen Simbolon', 'Tarutung', 'Transfer Bank'),
(244, '2024-01-02', 'Ulos Ragi Hotang', 0, 4, 2400000, 'Tiur Simbolon', 'Medan', 'Transfer Bank'),
(245, '2024-01-02', 'Ulos Ragidup', 0, 3, 2250000, 'Hostia Sitompul', 'Bandung', 'COD'),
(246, '2024-01-02', 'Ulos Ragi Hotang', 0, 2, 1200000, 'Duma Manullang', 'Balige', 'Kartu Kredit'),
(247, '2024-01-02', 'Ulos Sibolang,Ulos Mangiring,Ulos Ragi Hotang', 0, 8, 20200000, 'Mauliate Hutapea', 'Sipoholon', 'Transfer Bank'),
(248, '2024-01-03', 'Ulos Mangiring', 0, 3, 2500000, 'Nina Tampubolon', 'Bogor', 'COD'),
(249, '2024-01-03', 'Ulos Ragidup', 0, 2, 3000000, 'Hendra Simanungkalit', 'Pekanbaru', 'Kartu Kredit'),
(250, '2024-01-04', 'Ulos Sibolang', 0, 1, 6000000, 'Yuliana Siregar', 'Yogyakarta', 'COD'),
(251, '2024-01-04', 'Ulos Ragidup', 0, 1, 750000, 'Hostia Sitompul', 'Medan', 'Transfer Bank'),
(252, '2024-01-04', 'Ulos Ragidup', 0, 1, 2250000, 'Robert Simbolon', 'Bandung', 'COD'),
(253, '2024-01-06', 'Ulos Mangiring', 0, 1, 1500000, 'Anwar Sitompul', 'Surabaya', 'E-Wallet'),
(254, '2024-01-06', 'Ulos Ragidup', 0, 2, 3000000, 'Vina Sinaga', 'Medan', 'E-Wallet'),
(255, '2024-01-06', 'Ulos Mangiring', 0, 3, 2500000, 'Rama Simanjuntak', 'Jakarta', 'Kartu Kredit'),
(256, '2024-01-07', 'Ulos Ragi Hotang', 0, 2, 3600000, 'Geby Pasaribu', 'Surabaya', 'Kartu Kredit'),
(257, '2024-01-07', 'Ulos Mangiring', 0, 2, 2000000, 'Yanti Marpaung', 'Yogyakarta', 'E-Wallet'),
(258, '2024-01-10', 'Ulos Sibolang,Ulos Mangiring,Ulos Ragi Hotang', 0, 14, 7500000, 'Yolanda Simbolon', 'Bogor', 'Transfer Bank'),
(259, '2024-01-12', 'Ulos Ragidup', 0, 1, 3000000, 'Maria Simanjuntak', 'Pekanbaru', 'Kartu Kredit'),
(260, '2024-01-12', 'Ulos Sibolang', 0, 1, 1200000, 'Sinta Saragih', 'Batam', 'Transfer Bank'),
(261, '2024-01-12', 'Ulos Mangiring', 0, 4, 2000000, 'Jenny Hutabarat', 'Jakarta', 'Kartu Kredit'),
(262, '2024-01-14', 'Ulos Ragi Hotang', 0, 3, 1800000, 'Dina Samosir', 'Batam', 'Transfer Bank'),
(263, '2024-01-14', 'Ulos Mangiring', 0, 4, 2000000, 'Tiur Simbolon', 'Jakarta', 'COD'),
(264, '2024-01-14', 'Ulos Mangiring', 0, 1, 500000, 'Yanti Marpaung', 'Yogyakarta', 'COD'),
(265, '2024-01-14', 'Ulos Sibolang', 0, 2, 6000000, 'Tony Sitompul', 'Jakarta', 'Kartu Kredit'),
(266, '2024-01-17', 'Ulos Ragi Hotang', 0, 3, 1800000, 'Budi Siregar', 'Balige', 'COD'),
(267, '2024-01-17', 'Ulos Ragi Hotang,Ulos Mangiring', 0, 4, 1100000, 'Duma Sipayung', 'Palembang', 'Transfer Bank'),
(268, '2024-01-17', 'Ulos Sibolang', 0, 2, 7200000, 'Sari Hutapea', 'Batam', 'COD'),
(269, '2024-01-18', 'Ulos Ragidup', 0, 2, 1500000, 'Yanti Marpaung', 'Yogyakarta', 'Transfer Bank'),
(270, '2024-01-18', 'Ulos Ragidup', 0, 4, 3000000, 'Rama Simanjuntak', 'Surabaya', 'Transfer Bank'),
(271, '2024-01-18', 'Ulos Sibolang', 0, 3, 3600000, 'Tiur Simbolon', 'Yogyakarta', 'E-Wallet'),
(272, '2024-01-21', 'Ulos Sibolang', 0, 1, 1200000, 'Ronald Hutapea', 'Pekanbaru', 'Transfer Bank'),
(273, '2024-01-21', 'Ulos Ragi Hotang', 0, 4, 2400000, 'Vina Sinaga', 'Surabaya', 'Transfer Bank'),
(274, '2024-01-21', 'Ulos Ragidup', 0, 4, 3000000, 'Yanti Marpaung', 'Jakarta', 'E-Wallet'),
(275, '2024-01-22', 'Ulos Ragi Hotang', 0, 3, 3000000, 'Tiur Simbolon', 'Bogor', 'COD'),
(276, '2024-01-22', 'Ulos Ragi Hotang', 0, 1, 1800000, 'Robert Simbolon', 'Jakarta', 'COD'),
(277, '2024-01-22', 'Ulos Ragi Hotang', 0, 1, 1800000, 'Hendra Simanungkalit', 'Pekanbaru', 'E-Wallet'),
(278, '2024-01-25', 'Ulos Ragi Hotang,Ulos Ragidup,Ulos Mangiring', 0, 7, 10900000, 'Raima Pardede', 'Sibolga', 'Transfer Bank'),
(279, '2024-01-26', 'Ulos Mangiring', 0, 1, 500000, 'Robert Simbolon', 'Medan', 'COD'),
(280, '2024-01-26', 'Ulos Ragidup', 0, 4, 3000000, 'Duma Manullang', 'Batam', 'Transfer Bank'),
(281, '2024-01-27', 'Ulos Ragidup', 0, 5, 3750000, 'Budi Siregar', 'Yogyakarta', 'COD'),
(282, '2024-01-27', 'Ulos Sibolang', 0, 6, 7200000, 'Ronald Hutapea', 'Medan', 'Kartu Kredit'),
(283, '2024-01-27', 'Ulos Ragi Hotang', 0, 6, 3600000, 'Sinta Saragih', 'Balige', 'COD'),
(284, '2024-01-27', 'Ulos Mangiring', 0, 5, 2500000, 'Hendra Simanungkalit', 'Bogor', 'Kartu Kredit'),
(285, '2024-01-29', 'Ulos Ragi Hotang', 0, 5, 3000000, 'Sinta Saragih', 'Balige', 'E-Wallet'),
(286, '2024-01-29', 'Ulos Mangiring', 0, 4, 2000000, 'Dina Samosir', 'Medan', 'E-Wallet'),
(287, '2024-01-29', 'Ulos Mangiring', 0, 4, 2000000, 'Anwar Sitompul', 'Medan', 'E-Wallet'),
(288, '2024-01-31', 'Ulos Mangiring', 0, 6, 3000000, 'Robert Simbolon', 'Palembang', 'COD'),
(289, '2024-01-31', 'Ulos Sibolang', 0, 1, 1200000, 'Togar Nainggolan', 'Bogor', 'Kartu Kredit'),
(290, '2024-02-01', 'Ulos Mangiring,Ulos Sibolang,Ulos Ragi Hotang', 0, 16, 13400000, 'Hostia Sitompul', 'Samosir', 'Transfer Bank'),
(291, '2024-02-02', 'Ulos Sibolang', 0, 2, 2400000, 'Hendra Simanungkalit', 'Pekanbaru', 'Kartu Kredit'),
(292, '2024-02-02', 'Ulos Ragidup', 0, 2, 1500000, 'Tony Sitompul', 'Surabaya', 'COD'),
(293, '2024-02-03', 'Ulos Ragidup', 0, 1, 750000, 'Vina Sinaga', 'Yogyakarta', 'COD'),
(294, '2024-02-05', 'Ulos Mangiring', 0, 4, 2000000, 'Duma Manullang', 'Palembang', 'Kartu Kredit'),
(295, '2024-02-05', 'Ulos Sibolang,Ulos Ragidup', 0, 7, 7950000, 'Vina Sinaga', 'Medan', 'COD'),
(296, '2024-02-05', 'Ulos Ragi Hotang', 0, 4, 2400000, 'Budi Siregar', 'Yogyakarta', 'E-Wallet'),
(297, '2024-02-07', 'Ulos Mangiring', 0, 5, 2500000, 'Hendra Simanungkalit', 'Bogor', 'Transfer Bank'),
(298, '2024-02-11', 'Ulos Mangiring', 0, 5, 2500000, 'Jenny Hutabarat', 'Palembang', 'E-Wallet'),
(299, '2024-02-11', 'Ulos Sibolang', 0, 4, 4800000, 'Yanti Marpaung', 'Palembang', 'Kartu Kredit'),
(300, '2024-02-15', 'Ulos Sibolang,Ulos Ragidup', 0, 13, 12900000, 'Dina Sianturi', 'Siborongborong', 'E-Wallet'),
(301, '2024-02-17', 'Ulos Sibolang', 0, 6, 7200000, 'Nina Tampubolon', 'Medan', 'Transfer Bank'),
(302, '2024-02-20', 'Ulos Ragidup', 0, 6, 4500000, 'Tony Sitompul', 'Bandung', 'E-Wallet'),
(303, '2024-02-20', 'Ulos Ragidup', 0, 3, 2250000, 'Eko Pardede', 'Batam', 'E-Wallet'),
(304, '2024-02-22', 'Ulos Mangiring', 0, 2, 1000000, 'Tony Sitompul', 'Medan', 'E-Wallet'),
(305, '2024-02-24', 'Ulos Ragidup', 0, 5, 3750000, 'Yuliana Siregar', 'Pekanbaru', 'E-Wallet'),
(306, '2024-02-24', 'Ulos Mangiring', 0, 2, 1000000, 'Ronald Hutapea', 'Surabaya', 'E-Wallet'),
(307, '2024-02-24', 'Ulos Sibolang', 0, 5, 6000000, 'Sari Hutapea', 'Jakarta', 'E-Wallet'),
(308, '2024-02-28', 'Ulos Ragidup', 0, 4, 3000000, 'Geby Pasaribu', 'Surabaya', 'Kartu Kredit'),
(309, '2024-02-28', 'Ulos Mangiring', 0, 4, 2000000, 'Maria Simanjuntak', 'Palembang', 'E-Wallet'),
(310, '2024-05-22', 'Ulos Mangiring', 0, 3, 1500000, 'Sari Hutapea', 'Pekanbaru', 'Kartu Kredit'),
(311, '2024-05-22', 'Ulos Ragidup', 0, 6, 4500000, 'Jenny Hutabarat', 'Yogyakarta', 'Kartu Kredit'),
(312, '2024-05-22', 'Ulos Mangiring', 0, 5, 2500000, 'Nina Tampubolon', 'Pekanbaru', 'Transfer Bank'),
(313, '2024-05-22', 'Ulos Sibolang', 0, 1, 1200000, 'Hendra Simanungkalit', 'Surabaya', 'Transfer Bank'),
(314, '2024-05-22', 'Ulos Ragi Hotang,Ulos Mangiring', 0, 10, 5400000, 'Sinta Saragih', 'Bogor', 'E-Wallet'),
(315, '2024-05-22', 'Ulos Mangiring,Ulos Ragi Hotang', 0, 4, 2200000, 'Eko Pardede', 'Bogor', 'Kartu Kredit'),
(316, '2024-05-22', 'Ulos Mangiring', 0, 4, 2000000, 'Rama Simanjuntak', 'Palembang', 'COD');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(200) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `level` tinyint(4) NOT NULL DEFAULT 0,
  `last_login` datetime DEFAULT NULL,
  `inactive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `nama`, `password`, `level`, `last_login`, `inactive`) VALUES
(1, 'admin', 'Administrator', '21232f297a57a5a743894a0e4a801fc3', 1, '2017-02-22 01:49:04', 0),
(2, 'pimpinan', 'User Direktur', 'ee11cbb19052e40b07aac0ca060c23ee', 2, '2016-05-22 09:19:02', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `process_log`
--
ALTER TABLE `process_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_bulan`
--
ALTER TABLE `tbl_bulan`
  ADD PRIMARY KEY (`id_bulan`);

--
-- Indexes for table `tbl_produk`
--
ALTER TABLE `tbl_produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`id_toko`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
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
-- AUTO_INCREMENT for table `process_log`
--
ALTER TABLE `process_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_bulan`
--
ALTER TABLE `tbl_bulan`
  MODIFY `id_bulan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_produk`
--
ALTER TABLE `tbl_produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `toko`
--
ALTER TABLE `toko`
  MODIFY `id_toko` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=317;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
