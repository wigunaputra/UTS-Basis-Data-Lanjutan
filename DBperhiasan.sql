-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2024 at 04:00 PM
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
-- Database: `perhiasan`
--

-- --------------------------------------------------------

--
-- Table structure for table `berlian`
--

CREATE TABLE `berlian` (
  `Id_berlian` int(11) NOT NULL,
  `Nama_berlian` varchar(255) NOT NULL,
  `Karat` int(11) DEFAULT NULL,
  `Berat` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `berlian`
--

INSERT INTO `berlian` (`Id_berlian`, `Nama_berlian`, `Karat`, `Berat`) VALUES
(1, 'Berlian Hati Biru', 3, 0.40),
(2, 'Berlian Bulat Putih', 3, 0.60),
(3, 'Berlian Oval Kuning', 2, 0.20),
(4, 'Berlian Princess Pink', 1, 0.10),
(5, 'Berlian Marquise Biru Muda', 2, 0.50);

-- --------------------------------------------------------

--
-- Table structure for table `berlian_perhiasan`
--

CREATE TABLE `berlian_perhiasan` (
  `Id_berlian` int(11) NOT NULL,
  `Id_perhiasan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `berlian_perhiasan`
--

INSERT INTO `berlian_perhiasan` (`Id_berlian`, `Id_perhiasan`) VALUES
(1, 1),
(1, 5),
(2, 2),
(2, 5),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Id_customer` int(11) NOT NULL,
  `Nama_customer` varchar(255) NOT NULL,
  `Alamat` text DEFAULT NULL,
  `No_telepon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Id_customer`, `Nama_customer`, `Alamat`, `No_telepon`) VALUES
(1, 'Bella Sari', 'Jalan Melati No. 12, Jakarta', '+628123456789'),
(2, 'Rian Chandra', 'Jalan Anggrek No. 8, Bandung', '+628532145678'),
(3, 'Dewi Lestari', 'Jalan Mawar No. 5, Surabaya', '+628987654321'),
(4, 'Anton Prasetyo', 'Jalan Tulip No. 3, Yogyakarta', '+628129876543'),
(5, 'Fitriana Dewi', 'Jalan Dahlia No. 2, Semarang', '+628765432198');

-- --------------------------------------------------------

--
-- Stand-in structure for view `customer_diskon`
-- (See below for the actual view)
--
CREATE TABLE `customer_diskon` (
`Id_customer` int(11)
,`Nama_customer` varchar(255)
,`Total_pembelian` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `penjualan_per_jenis_perhiasan`
-- (See below for the actual view)
--
CREATE TABLE `penjualan_per_jenis_perhiasan` (
`Jenis_perhiasan` enum('Kalung','Liontin','Cincin','Gelang')
,`Jumlah_terjual` decimal(32,0)
,`Total_penjualan` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `perhiasan`
--

CREATE TABLE `perhiasan` (
  `Id_perhiasan` int(11) NOT NULL,
  `Nama_perhiasan` varchar(255) NOT NULL,
  `Deskripsi` text DEFAULT NULL,
  `Jenis_perhiasan` enum('Kalung','Liontin','Cincin','Gelang') NOT NULL,
  `Bahan_perhiasan` enum('Emas','Perak','Perunggu') NOT NULL,
  `Karat` int(11) DEFAULT NULL,
  `Berat` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `perhiasan`
--

INSERT INTO `perhiasan` (`Id_perhiasan`, `Nama_perhiasan`, `Deskripsi`, `Jenis_perhiasan`, `Bahan_perhiasan`, `Karat`, `Berat`) VALUES
(1, 'Kalung Berlian Hati', 'Kalung indah dengan liontin berlian berbentuk hati', 'Kalung', 'Emas', 18, 5.20),
(2, 'Cincin Permata Biru', 'Cincin elegan dengan batu permata berwarna biru', 'Cincin', 'Perak', NULL, 3.50),
(3, 'Gelang Mutiara', 'Gelang klasik dengan untaian mutiara', 'Gelang', '', NULL, 7.80),
(4, 'Liontin Mawar Emas', 'Liontin unik dengan desain bunga mawar emas', 'Liontin', 'Emas', 24, 2.10),
(5, 'Set Kalung dan Gelang Berlian', 'Set kalung dan gelang dengan desain senada, dihiasi berlian berkilauan', '', 'Emas', 18, 8.40);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `Id_transaksi` int(11) NOT NULL,
  `Tanggal_transaksi` date NOT NULL,
  `Id_customer` int(11) NOT NULL,
  `Id_perhiasan` int(11) NOT NULL,
  `Jumlah_pembelian` int(11) NOT NULL,
  `Total_harga` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`Id_transaksi`, `Tanggal_transaksi`, `Id_customer`, `Id_perhiasan`, `Jumlah_pembelian`, `Total_harga`) VALUES
(1, '2024-04-20', 1, 1, 1, 12500000.00),
(2, '2024-04-25', 2, 2, 2, 3000000.00),
(3, '2024-04-27', 3, 3, 1, 2500000.00),
(4, '2024-04-28', 4, 1, 1, 12500000.00),
(5, '2024-04-30', 5, 5, 1, 8500000.00);

-- --------------------------------------------------------

--
-- Structure for view `customer_diskon`
--
DROP TABLE IF EXISTS `customer_diskon`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customer_diskon`  AS SELECT `c`.`Id_customer` AS `Id_customer`, `c`.`Nama_customer` AS `Nama_customer`, sum(`t`.`Total_harga`) AS `Total_pembelian` FROM (`customer` `c` join `transaksi` `t` on(`c`.`Id_customer` = `t`.`Id_customer`)) GROUP BY `c`.`Id_customer`, `c`.`Nama_customer` HAVING sum(`t`.`Total_harga`) > 10000000 ;

-- --------------------------------------------------------

--
-- Structure for view `penjualan_per_jenis_perhiasan`
--
DROP TABLE IF EXISTS `penjualan_per_jenis_perhiasan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `penjualan_per_jenis_perhiasan`  AS SELECT `Jenis_perhiasan` AS `Jenis_perhiasan`, sum(`transaksi`.`Jumlah_pembelian`) AS `Jumlah_terjual`, sum(`transaksi`.`Total_harga`) AS `Total_penjualan` FROM (((`perhiasan` join `berlian_perhiasan` on(`Id_perhiasan` = `berlian_perhiasan`.`Id_perhiasan`)) join `transaksi` on(`berlian_perhiasan`.`Id_berlian` = `transaksi`.`Id_perhiasan`)) join `customer` on(`transaksi`.`Id_customer` = `customer`.`Id_customer`)) GROUP BY `Jenis_perhiasan` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berlian`
--
ALTER TABLE `berlian`
  ADD PRIMARY KEY (`Id_berlian`);

--
-- Indexes for table `berlian_perhiasan`
--
ALTER TABLE `berlian_perhiasan`
  ADD PRIMARY KEY (`Id_berlian`,`Id_perhiasan`),
  ADD KEY `Id_perhiasan` (`Id_perhiasan`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Id_customer`);

--
-- Indexes for table `perhiasan`
--
ALTER TABLE `perhiasan`
  ADD PRIMARY KEY (`Id_perhiasan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`Id_transaksi`),
  ADD KEY `Id_customer` (`Id_customer`),
  ADD KEY `Id_perhiasan` (`Id_perhiasan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berlian`
--
ALTER TABLE `berlian`
  MODIFY `Id_berlian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `perhiasan`
--
ALTER TABLE `perhiasan`
  MODIFY `Id_perhiasan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `Id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `berlian_perhiasan`
--
ALTER TABLE `berlian_perhiasan`
  ADD CONSTRAINT `berlian_perhiasan_ibfk_1` FOREIGN KEY (`Id_berlian`) REFERENCES `berlian` (`Id_berlian`),
  ADD CONSTRAINT `berlian_perhiasan_ibfk_2` FOREIGN KEY (`Id_perhiasan`) REFERENCES `perhiasan` (`Id_perhiasan`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`Id_customer`) REFERENCES `customer` (`Id_customer`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`Id_perhiasan`) REFERENCES `perhiasan` (`Id_perhiasan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
