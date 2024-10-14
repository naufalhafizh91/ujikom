-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 14 Okt 2024 pada 22.21
-- Versi server: 8.0.36-0ubuntu0.22.04.1
-- Versi PHP: 8.1.2-1ubuntu2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'admin', 'admin', 'naufal hafizh'),
(2, 'naufal', 'naufal', 'naufal hafizh wahdiyat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `nama_kota`, `tarif`) VALUES
(1, 'Bandung', 10000),
(2, 'Cimahi', 20000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int NOT NULL,
  `email_pelanggan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password_pelanggan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telepon_pelanggan` varchar(25) NOT NULL,
  `alamat_pelanggan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`) VALUES
(1, 'naufal91@gmail.com', '123', 'naufal hafizh', '083112848053', ''),
(2, 'wahyu91@gmail.com', '1234', 'wahyu kokoh', '087654321223', ''),
(3, 'wahyuak@gmai.com', '12345', 'koko koko', '083342534556', ''),
(4, 'asep@gmail.com', '123', 'asep', '08123651726', 'cijambe'),
(5, 'naruto@gmail.com', '12345', 'naruto', '0823123443211', 'konoha'),
(8, 'wahwah@gmail.com', '123', 'wahyugodin', '081712312123', 'kircon');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int NOT NULL,
  `id_pembelian` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `jumlah` int NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `bukti`) VALUES
(1, 1, 'naufal', 'mandiri', 345345, '1jhk3j4b.jpg'),
(2, 1, 'asdvszxc', 'fdsgdb', 1231352, 'asdavc.jpg'),
(34, 45, 'naufal', 'madiri', 1220000, 'hp664212fc4a8fa4.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int NOT NULL,
  `id_pelanggan` int DEFAULT NULL,
  `id_ongkir` int DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `total_pembelian` int DEFAULT NULL,
  `nama_kota` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tarif` int DEFAULT NULL,
  `alamat_pengiriman` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `status_pembelian` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'pending',
  `resi_pengiriman` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `id_ongkir`, `tanggal`, `total_pembelian`, `nama_kota`, `tarif`, `alamat_pengiriman`, `status_pembelian`, `resi_pengiriman`) VALUES
(44, 1, 2, '2023-03-27', NULL, 'bandung', 124235, '12edsafeve efdg3q w4t34', 'pending', 'asdwefr354645'),
(45, 1, 2, '2023-03-27', 1220000, 'Cimahi', 20000, 'cinunuk', 'lunas', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int NOT NULL,
  `id_pembelian` int NOT NULL,
  `id_produk` int NOT NULL,
  `jumlah` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int NOT NULL,
  `berat` int NOT NULL,
  `subharga` int NOT NULL,
  `subberat` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `berat`, `subharga`, `subberat`) VALUES
(37, 43, 1, 1, 'HP oddo 2/128', 1500000, 1000, 1500000, 1000),
(38, 43, 46, 1, 'HP+COD M4 Pro', 300000, 250, 300000, 250),
(39, 45, 45, 1, 'HP 5G i14 Pro Max', 1200000, 200, 1200000, 200);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int NOT NULL,
  `berat_produk` int NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `stok_produk` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`, `stok_produk`) VALUES
(1, 'HP oddo 2/128', 1500000, 996, 'hp263f3518a2e193.jpg', '        produk oddo bagus', 11),
(3, 'Jaket naga', 150000, 250, 'jaket163f35242c10ea.jpg', '    jaket keluar naga', 7),
(4, 'Jaket buluan', 175000, 320, 'jaket263f352ae6952c.jpg', '        jaket keluar bulu', 10),
(45, 'HP 5G i14 Pro Max', 1200000, 200, 'hp5g641d5cd7307cd.jpeg', 'Deskripsi Produk\r\nModel: i14 Pro Max\r\nPlatform: Android 11.0 4G / 5G LTE\r\nSiaga: Kartu ekspansi kartu TF vertikal dua lapis\r\nLayar: 7,5 inci\r\nFrekuensi: GSM: 800/900/1800/1900, WCDMA: 850/2100\r\nWarna: Hitam,Biru,emas,Ungu\r\nMemori: RAM 12GB + ROM 512GB\r\nKamera: 24MP + 58MP\r\nResolusi：1440*3040\r\nMultifungsi: pengenalan wajah, wifi mode tunggal, GPS, sensor gravitasi, jam alarm, kalender, kalkulator, perekam audio, perekam video, wap/mms/gprs/, penampil gambar, tugas e-book, sampul IML\r\nBahasa: Dukungan multi-bahasa\r\nBaterai: Baterai lithium-ion 6800mAh\r\n\r\nIsi Kemasan:\r\n1 x adaptor pengisi daya\r\n1 x kabel pengisi daya\r\n1 x headset\r\n1 x Panduan Pengguna\r\n1 x casing ponsel\r\n1 x film pelindung', 49),
(46, 'HP+COD M4 Pro', 300000, 250, 'hp6641d5d7bc9af9.jpg', 'Deskripsi Produk\r\nModel: M4 Pro\r\nPlatform: Android 12.0 4G / 5G LTE\r\nSiaga: Kartu ekspansi kartu TF vertikal dua lapis\r\nLayar: 7,5 inci\r\nFrekuensi: GSM: 800/900/1800/1900, WCDMA: 850/2100\r\nWarna: hitam,kuning,biru\r\nMemori: RAM 12GB + ROM 512GB\r\nKamera: 24MP + 58MP\r\nResolusi：1440*3040\r\nMultifungsi: pengenalan wajah, wifi mode tunggal, GPS, sensor gravitasi, jam alarm, kalender, kalkulator, perekam audio, perekam video, wap/mms/gprs/, penampil gambar, tugas e-book, sampul IML\r\nBahasa: Dukungan multi-bahasa\r\nBaterai: Baterai lithium-ion 6800mAh\r\n\r\nIsi Kemasan:\r\n1 x adaptor pengisi daya\r\n1 x kabel pengisi daya\r\n1 x headset\r\n1 x Panduan Pengguna\r\n1 x casing ponsel\r\n1 x film pelindung', 49),
(47, 'Laptop Asus X441MA', 4000000, 2000, 'asus.jpg', '    Spesifikasi Asus X441MA:\r\n\r\n    Display: 14 inch LED Backlit, 1.366 x 768 piksel\r\n    Processor: Intel Celeron Processor N4000 (4M Cache, Up to 2.60 GHz)\r\n    RAM: 4GB DDR4\r\n    HDD: 1 TB\r\n    Detail OS: Windows 10\r\n    Graphics: Intel HD Graphics\r\n    Optical Drive Type: Super Multi DVD\r\n    Keyboard: Chiclet keyboard\r\n    Camera: VGA Webcam\r\n    Audio: ASUS SonicMaster Technology\r\n    Baterai: 3 -Cell, 36 Wh\r\n', 70),
(48, 'Laptop Lenovo Ideapad 130', 3500000, 1000, '5641d5f15e1d42.-Asus-A407MA-300x300', 'Spesifikasi Lenovo IdeaPad 130:\r\n\r\n    Display: 14,0 inci, 1.366 x 768 piksel\r\n    Processor: AMD A4-9125 Processor (2.30 – 2.60 GHz, 1 MB Cache)\r\n    RAM: 4 GB DDR4\r\n    HDD: 500 GB\r\n    Detail OS: Windows 10 Home\r\n    Graphics: AMD Radeon R3 Graphics\r\n    Optical Drive Type: DVD-RW\r\n    Camera: 0.3MP with Microphone\r\n    Audio: 2 x 1.5 W speakers with Dolby Audio\r\n    Battery: 2-Cell\r\n', 40),
(49, 'Laptop Lenovo Ideapad 330', 4000000, 1200, '6641d5f631fec6.-Lenovo-IdeaPad-330-300x300', 'Spesifikasi Lenovo IdeaPad 330:\r\n\r\n    Display: TFT LCD 14 inci, 1.366 x 768 piksel\r\n    Processor: AMD APU A4-9125 dual-core 2,3GHz dengan Turbo Core 2,6GHz\r\n    RAM: 4 GB DDR4 upgradable to 8GB\r\n    HDD: 500 GB\r\n    Detail OS: Windows 10 Home\r\n    Graphics: AMD Radeon R3 Graphics\r\n    Optical Drive Type: DVD-RW\r\n    Camera: 0.3MP with Microphone\r\n    Audio: 2 x 1.5 W speakers with Dolby Audio\r\n    Battery: 2-Cell 30WHr\r\n', 20);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indeks untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
