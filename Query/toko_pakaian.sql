-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2025 at 08:17 AM
-- Server version: 11.7.2-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko pakaian`
--

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(5) NOT NULL,
  `id_product` int(5) NOT NULL,
  `kode_product` char(12) NOT NULL,
  `total_product` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `status_pembayaran` enum('lunas','belum') NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id`, `id_product`, `kode_product`, `total_product`, `total_harga`, `status_pembayaran`, `createdAt`, `updatedAt`) VALUES
(2, 1, 'PSWpsWi5XnE9', 5, 500000, 'lunas', '2025-07-30 00:15:43', '2025-07-30 00:15:43');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_product` int(5) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `harga_barang` int(11) NOT NULL,
  `TIPE_barang` enum('Pria','Wanita') NOT NULL,
  `category_barang` varchar(6) DEFAULT NULL,
  `merek` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_product`, `nama_barang`, `harga_barang`, `TIPE_barang`, `category_barang`, `merek`) VALUES
(1, 'kemeja biru muda', 400000, 'Pria', 'Kemeja', 'Uniqlo'),
(2, 'Kemeja hijau tua', 400000, 'Pria', 'Kemeja', 'Uniqlo'),
(3, 'Celana levis hitam', 100000, 'Pria', 'Celana', 'Levis'),
(4, 'Celana jeans hitam', 120000, 'Wanita', 'Celana', 'Levis'),
(5, 'Baju putih', 100000, 'Pria', 'Baju', 'Uniqlo'),
(6, 'Kemeja putih', 200000, 'Pria', 'Kemeja', 'BOSS'),
(7, 'Celana pendek ', 100000, 'Wanita', 'Celana', 'Levis'),
(8, 'Jaket Parka', 600000, 'Pria', 'Jaket', 'Uniqlo'),
(9, 'Baju Erigo hitam', 150000, 'Wanita', 'Baju', 'Erigo'),
(10, 'Kemeja Hitam', 300000, 'Pria', 'Kemeja', 'Boss');

-- --------------------------------------------------------

--
-- Table structure for table `stock_product`
--

CREATE TABLE `stock_product` (
  `id` int(5) NOT NULL,
  `id_product` int(5) NOT NULL,
  `jumlah_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock_product`
--

INSERT INTO `stock_product` (`id`, `id_product`, `jumlah_product`) VALUES
(1, 4, 20),
(2, 2, 28),
(3, 1, 30),
(4, 3, 30),
(5, 5, 40),
(6, 6, 50),
(7, 7, 20),
(8, 8, 30),
(9, 9, 100),
(10, 10, 80);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`);

--
-- Indexes for table `stock_product`
--
ALTER TABLE `stock_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `stock_product`
--
ALTER TABLE `stock_product`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stock_product`
--
ALTER TABLE `stock_product`
  ADD CONSTRAINT `stock_product_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
