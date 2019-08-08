-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2019 at 02:01 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_foura_abadi`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `gambar` varchar(255) NOT NULL DEFAULT 'default.png',
  `theme` varchar(20) NOT NULL DEFAULT 'sb_admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `nama`, `status`, `gambar`, `theme`) VALUES
(2, 'admin@admin.com', 'admin', 'admin', 1, 'default.png', 'sb_admin');

-- --------------------------------------------------------

--
-- Table structure for table `centroid_data`
--

CREATE TABLE `centroid_data` (
  `id_c` int(5) NOT NULL,
  `id_proses` int(4) NOT NULL,
  `tipe` varchar(2) NOT NULL,
  `r` int(2) NOT NULL,
  `f` int(2) NOT NULL,
  `m` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `centroid_data`
--

INSERT INTO `centroid_data` (`id_c`, `id_proses`, `tipe`, `r`, `f`, `m`) VALUES
(1, 21, 'C1', 4, 1, 1),
(2, 21, 'C2', 3, 2, 1),
(3, 22, 'C1', 1, 1, 1),
(4, 22, 'C2', 4, 1, 1),
(5, 23, 'C1', 4, 1, 1),
(6, 23, 'C2', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `data_proses`
--

CREATE TABLE `data_proses` (
  `id_proses` int(3) NOT NULL,
  `tgl_proses` date NOT NULL,
  `judul` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_proses`
--

INSERT INTO `data_proses` (`id_proses`, `tgl_proses`, `judul`) VALUES
(23, '2018-12-31', 'pengecekan pertama');

-- --------------------------------------------------------

--
-- Table structure for table `data_rfm`
--

CREATE TABLE `data_rfm` (
  `id_data` int(4) NOT NULL,
  `id_proses` int(3) NOT NULL,
  `tgl` date NOT NULL,
  `nama_team` varchar(70) NOT NULL,
  `total_harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_rfm`
--

INSERT INTO `data_rfm` (`id_data`, `id_proses`, `tgl`, `nama_team`, `total_harga`) VALUES
(3205, 23, '2018-07-01', 'DINDIN', 720000),
(3206, 23, '2018-07-01', 'MARINIR', 2700000),
(3207, 23, '2018-07-01', 'DINSOS', 1430000),
(3208, 23, '2018-07-01', 'DINSOS', 600000),
(3209, 23, '2018-07-02', 'JASAMARGA', 3360000),
(3210, 23, '2018-07-02', 'JASAMARGA', 600000),
(3211, 23, '2018-07-02', 'TACI', 2405000),
(3212, 23, '2018-07-02', 'TACI', 1080000),
(3213, 23, '2018-07-02', 'TACI', 125000),
(3214, 23, '2018-07-03', 'PANTI RAHAYU', 2475000),
(3215, 23, '2018-07-03', 'MANGGALA', 2100000),
(3216, 23, '2018-07-04', 'BRILIANT', 2490000),
(3217, 23, '2018-07-04', 'TACI', 4700000),
(3218, 23, '2018-07-04', 'UI', 6060000),
(3219, 23, '2018-07-04', 'JATILAWANG', 2340000),
(3220, 23, '2018-07-05', 'BEKMATPUS', 4050000),
(3221, 23, '2018-07-05', 'BEKMATPUS', 1950000),
(3222, 23, '2018-07-06', 'MGMP', 7050000),
(3223, 23, '2018-07-06', 'KOARMADA I', 2000000),
(3224, 23, '2018-07-06', 'KOARMADA I', 1400000),
(3225, 23, '2018-07-06', 'KOARMADA I', 1980000),
(3226, 23, '2018-07-06', 'KOARMADA I', 2940000),
(3227, 23, '2018-07-07', 'MATADOR', 1050000),
(3228, 23, '2018-07-07', 'MATADOR', 650000),
(3229, 23, '2018-07-08', 'PPOP', 1920000),
(3230, 23, '2018-07-08', 'PORAD', 5000000),
(3231, 23, '2018-07-08', ' AL', 4940000),
(3232, 23, '2018-07-08', ' AL', 3800000),
(3233, 23, '2018-07-08', ' AL', 3870000),
(3234, 23, '2018-07-10', 'BAYU', 185000),
(3235, 23, '2018-07-10', 'EDI', 185000),
(3236, 23, '2018-07-10', 'EDI', 185000),
(3237, 23, '2018-07-10', 'DIPONEGORO', 2800000),
(3238, 23, '2018-07-10', 'DIPONEGORO', 150000),
(3239, 23, '2018-07-11', 'PANASONIC', 1600000),
(3240, 23, '2018-07-12', 'PORAD', 7770000),
(3241, 23, '2018-07-12', 'MARINIR', 7350000),
(3242, 23, '2018-07-12', 'MARINIR', 1375000),
(3243, 23, '2018-07-13', 'NONO', 1020000),
(3244, 23, '2018-07-14', 'CAZANOVA', 1320000),
(3245, 23, '2018-07-14', 'RW 02', 5600000),
(3246, 23, '2018-07-15', 'PUTRA29', 1100000),
(3247, 23, '2018-07-15', 'MATADOR', 1350000),
(3248, 23, '2018-07-16', 'IKARAGIL', 2275000),
(3249, 23, '2018-07-16', 'CAPING', 225000),
(3250, 23, '2018-07-16', 'CMD', 300000),
(3251, 23, '2018-07-17', 'METEOR', 1400000),
(3252, 23, '2018-07-17', 'NONO', 1020000),
(3253, 23, '2018-07-17', 'IIKP', 5040000),
(3254, 23, '2018-07-17', 'JR', 1125000),
(3255, 23, '2018-07-18', 'NONO', 2040000),
(3256, 23, '2018-07-18', 'ADE', 1560000),
(3257, 23, '2018-07-18', 'IIKP', 1615000),
(3258, 23, '2018-07-18', 'WIKA', 4500000),
(3259, 23, '2018-07-18', 'WIKA', 1500000),
(3260, 23, '2018-07-19', 'AIR DEFENCE', 1850000),
(3261, 23, '2018-07-19', 'BMJ', 1005000),
(3262, 23, '2018-07-19', 'BMJ', 780000),
(3263, 23, '2018-07-20', 'LAJ', 1560000),
(3264, 23, '2018-07-20', 'RT 08', 780000),
(3265, 23, '2018-07-20', 'DUMA', 2470000),
(3266, 23, '2018-07-20', 'FADHILAH SPORT', 6600000),
(3267, 23, '2018-07-21', '', 2405000),
(3268, 23, '2018-07-21', 'IKRGL ', 2100000),
(3269, 23, '2018-07-21', 'KONCO MESRA', 2220000),
(3270, 23, '2018-07-21', 'SAMBA', 2220000),
(3271, 23, '2018-07-21', 'Ganeksa gathering', 2600000),
(3272, 23, '2018-07-22', 'Kampung Mas', 2040000),
(3273, 23, '2018-07-22', 'CAPING', 1300000),
(3274, 23, '2018-07-23', 'EXCELLENT SERVICE', 1380000),
(3275, 23, '2018-07-23', 'BIN', 1725000),
(3276, 23, '2018-07-24', 'SATUAN', 480000),
(3277, 23, '2018-07-24', 'BVC', 3470000),
(3278, 23, '2018-07-24', 'PGRI', 2360000),
(3279, 23, '2018-07-25', 'BERSAUDARA', 3600000),
(3280, 23, '2018-07-26', 'PPOP Pantai', 2040000),
(3281, 23, '2018-07-26', 'ASEAN GAMES', 2405000),
(3282, 23, '2018-07-26', 'ASEAN GAMES', 1755000),
(3283, 23, '2018-07-27', 'RT 01', 1600000),
(3284, 23, '2018-07-27', 'SINAR LAUT', 560000),
(3285, 23, '2018-07-28', 'ASEAN GAMES', 390000),
(3286, 23, '2018-07-28', 'ASEAN GAMES', 250000),
(3287, 23, '2018-07-28', 'MATADOR', 1350000),
(3288, 23, '2018-07-29', 'MAHOGANY', 1500000),
(3289, 23, '2018-07-29', 'MM', 2625000),
(3290, 23, '2018-07-29', 'MM', 675000),
(3291, 23, '2018-07-30', 'BARY', 12600000),
(3292, 23, '2018-07-30', 'ANTON', 67275000),
(3293, 23, '2018-07-31', 'DEDY', 20250000),
(3294, 23, '2018-07-31', 'Virama', 3375000),
(3295, 23, '2018-07-31', 'Petra Jasa', 4050000),
(3296, 23, '2018-08-01', 'SEHATI', 1575000),
(3297, 23, '2018-08-01', 'SKB GK', 1210000),
(3298, 23, '2018-08-01', 'SKB GK', 195000),
(3299, 23, '2018-08-02', 'Nglipar', 2780000),
(3300, 23, '2018-08-02', 'Sinar Muda', 1040000),
(3301, 23, '2018-08-03', 'Dozer', 990000),
(3302, 23, '2018-08-03', 'Bima Palma ', 440000),
(3303, 23, '2018-08-03', 'Bima Palma ', 1320000),
(3304, 23, '2018-08-03', 'Bima Palma ', 1320000),
(3305, 23, '2018-08-04', 'Storage Fc', 1400000),
(3306, 23, '2018-08-04', 'Pagupon', 1080000),
(3307, 23, '2018-08-04', 'XSUCI', 1080000),
(3308, 23, '2018-08-05', 'Bina Sakti', 1100000),
(3309, 23, '2018-08-05', 'Cahaya Muda', 1850000),
(3310, 23, '2018-08-05', 'Patma ', 1300000),
(3311, 23, '2018-08-05', 'Mudi Sport', 2400000),
(3312, 23, '2018-08-05', 'Teen Sport', 4800000),
(3313, 23, '2018-08-06', 'Nono', 600000),
(3314, 23, '2018-08-06', 'Haruns ', 750000),
(3315, 23, '2018-08-06', 'Haruns ', 570000),
(3316, 23, '2018-08-07', 'Kusuma Negara', 1400000),
(3317, 23, '2018-08-07', 'Kusuma Negara', 220000),
(3318, 23, '2018-08-08', 'WEGE', 9180000),
(3319, 23, '2018-08-09', 'WIKA', 8000000),
(3320, 23, '2018-08-09', 'WIKA', 18375000),
(3321, 23, '2018-08-09', 'WIKA', 29025000),
(3322, 23, '2018-08-10', 'TEPUS', 2810000),
(3323, 23, '2018-08-10', 'PATUK', 2220000),
(3324, 23, '2018-08-01', 'Food & Bevergas', 780000),
(3325, 23, '2018-08-01', 'VORADE', 3145000),
(3326, 23, '2018-08-01', 'Cordova', 540000),
(3327, 23, '2018-08-02', 'MGMP', 240000),
(3328, 23, '2018-08-02', 'AIR DEFENCE', 3945000),
(3329, 23, '2018-08-03', 'Aqua', 4360000),
(3330, 23, '2018-08-03', 'PBV', 2220000),
(3331, 23, '2018-08-03', 'Panggang', 2405000),
(3332, 23, '2018-08-03', 'Fedora', 1800000),
(3333, 23, '2018-08-04', 'panggang', 1040000),
(3334, 23, '2018-08-04', 'Rt 12/02', 1140000),
(3335, 23, '2018-08-04', 'TIMNAS', 175000),
(3336, 23, '2018-08-05', 'BEKASI', 660000),
(3337, 23, '2018-08-05', 'ASEAN GAMES', 185000),
(3338, 23, '2018-08-05', 'Satrio Fc', 165000),
(3339, 23, '2018-08-05', 'Sampel', 350000),
(3340, 23, '2018-08-05', 'Gilang', 195000),
(3341, 23, '2018-08-06', 'XSUCI', 1080000),
(3342, 23, '2018-08-06', 'T1VC', 840000),
(3343, 23, '2018-08-06', 'Pagupon', 2475000),
(3344, 23, '2018-08-07', 'Nono', 390000),
(3345, 23, '2018-08-07', 'Teen Sport', 1400000),
(3346, 23, '2018-08-08', 'WG', 6800000),
(3347, 23, '2018-08-09', 'RW017', 650000),
(3348, 23, '2018-08-09', 'AIR DEFENCE', 3645000),
(3349, 23, '2018-08-09', 'AIR DEFENCE', 300000),
(3350, 23, '2018-08-10', 'Yansa', 6500000),
(3351, 23, '2018-08-10', 'alumni SmA Bandung', 1625000),
(3352, 23, '2018-08-11', 'WIKA', 7500000),
(3353, 23, '2018-08-11', 'Nono', 455000),
(3354, 23, '2018-08-11', 'Nono', 600000),
(3355, 23, '2018-08-12', 'LIY', 770000),
(3356, 23, '2018-08-13', 'Mizuno', 975000),
(3357, 23, '2018-08-14', 'Denzo', 1820000),
(3358, 23, '2018-08-15', 'Garuda', 780000),
(3359, 23, '2018-08-16', 'ADI Toser', 3915000),
(3360, 23, '2018-08-18', 'AL', 5920000),
(3361, 23, '2018-08-18', 'AL', 5180000),
(3362, 23, '2018-08-18', 'AL', 4680000),
(3363, 23, '2018-08-24', 'Marimun Putri', 900000),
(3364, 23, '2018-08-25', 'WIKA', 5500000),
(3365, 23, '2018-08-26', 'Banimasi', 7312500),
(3366, 23, '2018-08-30', 'WIKA', 2250000),
(3367, 23, '2018-08-30', 'WIKA', 6750000),
(3368, 23, '2018-08-30', 'DPP PDIP', 5000000),
(3369, 23, '2018-09-02', 'DIKLAPA', 4625000),
(3370, 23, '2018-09-02', 'VIKING', 5110000),
(3371, 23, '2018-09-03', 'AQUA', 370000),
(3372, 23, '2018-09-03', 'GGS', 2160000),
(3373, 23, '2018-09-03', 'ANIS', 10350000),
(3374, 23, '2018-09-04', 'NONO', 720000),
(3375, 23, '2018-09-05', 'TRISULA', 1320000),
(3376, 23, '2018-09-05', 'METEOR', 1745000),
(3377, 23, '2018-09-05', 'XSUCI', 2160000),
(3378, 23, '2018-09-05', 'ASEAN GAMES', 370000),
(3379, 23, '2018-09-06', 'MM2100', 1800000),
(3380, 23, '2018-09-06', 'MM2101', 540000),
(3381, 23, '2018-09-07', 'RUDI', 2015000),
(3382, 23, '2018-09-07', 'RUDI', 600000),
(3383, 23, '2018-09-08', 'CAPING', 600000),
(3384, 23, '2018-09-08', 'CAPING', 1350000),
(3385, 23, '2018-09-09', 'MM2100', 2205000),
(3386, 23, '2018-09-09', 'AIR DEFENCE', 11000000),
(3387, 23, '2018-09-09', 'SMPN 8', 2640000),
(3388, 23, '2018-09-10', 'YON POM', 6210000),
(3389, 23, '2018-09-10', 'DIMINPERS AU', 3675000),
(3390, 23, '2018-09-11', 'RICCI', 1680000),
(3391, 23, '2018-09-11', 'RICCI', 960000),
(3392, 23, '2018-09-11', 'RICCI', 1050000),
(3393, 23, '2018-09-11', 'RICCI', 4705000),
(3394, 23, '2018-09-12', 'AIR DEFENCE', 2750000),
(3395, 23, '2018-09-13', 'DENZO', 2100000),
(3396, 23, '2018-09-13', 'AL', 8880000),
(3397, 23, '2018-09-13', 'AL', 3150000),
(3398, 23, '2018-09-13', 'AL', 5550000),
(3399, 23, '2018-09-13', 'AL', 1680000),
(3400, 23, '2018-09-13', 'AL', 810000),
(3401, 23, '2018-09-15', 'AIR DEFENCE', 900000),
(3402, 23, '2018-09-15', 'WINGBEKUD', 1350000),
(3403, 23, '2018-09-16', 'DEPRATAMA', 2755000),
(3404, 23, '2018-09-16', 'MANDIRI ', 3220000),
(3405, 23, '2018-09-16', 'MANDIRI ', 6120000),
(3406, 23, '2018-09-17', 'MANDALA', 1200000),
(3407, 23, '2018-09-18', 'DVI', 3550000),
(3408, 23, '2018-09-19', 'IDDO VC', 5280000),
(3409, 23, '2018-09-19', 'IDDO VC', 810000),
(3410, 23, '2018-09-20', 'BELKER', 3900000),
(3411, 23, '2018-09-21', 'SANCU', 450000),
(3412, 23, '2018-09-23', 'DCTKRP', 2605000),
(3413, 23, '2018-09-23', 'DCTKRP', 2530000),
(3414, 23, '2018-09-24', 'CIBUBUR', 6630000),
(3415, 23, '2018-09-26', 'SDCTKRP', 5625000),
(3416, 23, '2018-09-26', 'IKG PERMAI 12', 2405000),
(3417, 23, '2018-09-27', 'STOCK', 1200000),
(3418, 23, '2018-09-28', 'SGS', 2580000),
(3419, 23, '2018-09-29', 'RVS', 2415000),
(3420, 23, '2018-09-30', 'SINGGIH', 500000),
(3421, 23, '2018-09-30', '38', 780000),
(3422, 23, '2018-10-01', 'RICCI', 720000),
(3423, 23, '2018-10-01', 'GAVOLTA', 1920000),
(3424, 23, '2018-10-01', 'ORCHID', 1425000),
(3425, 23, '2018-10-02', 'AQUA', 2220000),
(3426, 23, '2018-10-03', 'IRENA', 2590000),
(3427, 23, '2018-10-04', 'MATADOR', 8595000),
(3428, 23, '2018-10-04', 'SUHILL', 2240000),
(3429, 23, '2018-10-05', 'MELON', 3105000),
(3430, 23, '2018-10-06', 'pgv', 1850000),
(3431, 23, '2018-10-06', 'pgv', 2880000),
(3432, 23, '2018-10-07', 'BENHILL', 2240000),
(3433, 23, '2018-10-07', 'SOLO', 2350000),
(3434, 23, '2018-10-08', 'PAJAK', 2325000),
(3435, 23, '2018-10-08', 'SDCTRKTRP', 3105000),
(3436, 23, '2018-10-08', 'SDCTRKTRP', 2000000),
(3437, 23, '2018-10-09', 'KAMADIKA', 3600000),
(3438, 23, '2018-10-10', 'YUSOMANIA', 1000000),
(3439, 23, '2018-10-11', 'SIMRS', 780000),
(3440, 23, '2018-10-12', 'SANANTA', 1625000),
(3441, 23, '2018-10-13', 'SINGGIH', 600000),
(3442, 23, '2018-10-14', 'ELANG', 825000),
(3443, 23, '2018-10-15', 'TRISILA', 1875000),
(3444, 23, '2018-10-16', 'DIVA', 1260000),
(3445, 23, '2018-10-17', 'LAPSAT', 5445000),
(3446, 23, '2018-10-17', 'DS', 6600000),
(3447, 23, '2018-10-17', 'PERDAPA', 3215000),
(3448, 23, '2018-10-18', 'WG PEDULI/csr', 8670000),
(3449, 23, '2018-10-19', 'MADRASAH', 5120000),
(3450, 23, '2018-10-20', 'BSSN', 3300000),
(3451, 23, '2018-10-20', 'WIKASTRIAN', 3300000),
(3452, 23, '2018-10-20', 'PANITIA', 5600000),
(3453, 23, '2018-10-21', 'WEGE', 1350000),
(3454, 23, '2018-10-21', 'WEGE', 1650000),
(3455, 23, '2018-10-21', 'WEGE', 2640000),
(3456, 23, '2018-10-21', 'WEGE', 1020000),
(3457, 23, '2018-10-22', 'GGS', 810000),
(3458, 23, '2018-10-22', 'KEBUMEN', 2380000),
(3459, 23, '2018-10-22', 'BANGKIT SANJAYA', 3030000),
(3460, 23, '2018-10-22', 'DPU', 2400000),
(3461, 23, '2018-10-23', 'HEAD OFFICE', 2145000),
(3462, 23, '2018-10-23', 'HEAD OFFICE', 2405000),
(3463, 23, '2018-10-23', 'PANITIA FUTSAL', 2080000),
(3464, 23, '2018-10-24', 'KAMADIKA', 3770000),
(3465, 23, '2018-10-24', 'BRILIANT', 2220000),
(3466, 23, '2018-10-24', 'JASUN', 2960000),
(3467, 23, '2018-10-25', 'JIWAKORSA', 8930000),
(3468, 23, '2018-10-25', 'JIWAKORSA', 2800000),
(3469, 23, '2018-10-25', 'UI', 5550000),
(3470, 23, '2018-10-25', 'UI', 4785000),
(3471, 23, '2018-10-25', 'UI', 2835000),
(3472, 23, '2018-10-26', 'C5 GRAB', 2760000),
(3473, 23, '2018-10-26', 'ALCIV', 3910000),
(3474, 23, '2018-10-26', 'PUTRA SRAGEN', 3850000),
(3475, 23, '2018-10-27', 'JASAMARGA', 2675000),
(3476, 23, '2018-10-27', 'JASAMARGA', 1625000),
(3477, 23, '2018-10-27', 'JASAMARGA', 910000),
(3478, 23, '2018-10-28', 'PUSPOMAD', 4550000),
(3479, 23, '2018-10-28', 'PBVSI SOLO', 760000),
(3480, 23, '2018-10-28', 'KOPASUS', 4110000),
(3481, 23, '2018-10-29', 'WIKA', 126000000),
(3482, 23, '2018-10-29', 'CIVIC', 700000),
(3483, 23, '2018-10-29', 'CIVIC', 840000),
(3484, 23, '2018-10-31', 'FORTUNA', 2800000),
(3485, 23, '2018-10-31', 'TI', 2090000),
(3486, 23, '2018-10-31', 'BRITAMA', 2810000),
(3487, 23, '2018-11-01', 'SMA 33', 6120000),
(3488, 23, '2018-11-01', 'AUTOMOTIF', 2720000),
(3489, 23, '2018-11-01', 'RIAU', 2160000),
(3490, 23, '2018-11-01', 'RIAU', 585000),
(3491, 23, '2018-11-02', 'PT.JPI', 2220000),
(3492, 23, '2018-11-03', 'BUNI Women', 1200000),
(3493, 23, '2018-11-03', 'BUNI Women', 850000),
(3494, 23, '2018-11-05', 'SEBLEAST', 5600000),
(3495, 23, '2018-11-06', 'MARS PB', 1965000),
(3496, 23, '2018-11-06', 'AQUA', 2220000),
(3497, 23, '2018-11-07', 'DIO', 1275000),
(3498, 23, '2018-11-08', 'JAKSEL', 4950000),
(3499, 23, '2018-11-09', 'SPJ', 5440000),
(3500, 23, '2018-11-11', 'Funtastic', 1200000),
(3501, 23, '2018-11-11', 'SEKOLAH JAGAKARSA', 1920000),
(3502, 23, '2018-11-11', 'SEKOLAH JAGAKARSA', 4320000),
(3503, 23, '2018-11-12', 'BRITAMA PKL', 2600000),
(3504, 23, '2018-11-13', 'NARADA', 1295000),
(3505, 23, '2018-11-13', 'DIVA', 1920000),
(3506, 23, '2018-11-13', 'IDDOVC', 720000),
(3507, 23, '2018-11-14', 'AQUA', 2220000),
(3508, 23, '2018-11-14', 'IDDOVC', 2100000),
(3509, 23, '2018-11-14', 'IDDOVC', 1980000),
(3510, 23, '2018-11-15', 'FJM', 1840000),
(3511, 23, '2018-11-15', 'KIJANG', 1430000),
(3512, 23, '2018-11-15', 'DHARMAIS', 1500000),
(3513, 23, '2018-11-16', 'BRT', 2220000),
(3514, 23, '2018-11-17', 'ASTRA', 10560000),
(3515, 23, '2018-11-18', 'SHIPPING', 2220000),
(3516, 23, '2018-11-18', 'OVC', 5920000),
(3517, 23, '2018-11-22', 'PMS', 2625000),
(3518, 23, '2018-11-22', 'EL RAGAZA', 780000),
(3519, 23, '2018-11-23', 'SUDINKES', 5550000),
(3520, 23, '2018-11-24', 'RSUD ', 7030000),
(3521, 23, '2018-11-25', 'GARUDA', 2560000),
(3522, 23, '2018-11-25', 'GARUDA', 260000),
(3523, 23, '2018-11-25', 'LENONG', 1020000),
(3524, 23, '2018-11-26', 'SETJEN ', 8580000),
(3525, 23, '2018-11-26', 'WINGDIKTEKAL', 48300000),
(3526, 23, '2018-11-28', 'SETRA BF', 500000),
(3527, 23, '2018-11-28', 'T.CENDIKIA', 11400000),
(3528, 23, '2018-11-28', 'CORNELL DENVER', 15980000),
(3529, 23, '2018-11-28', 'PUNCAK MERR', 14570000),
(3530, 23, '2018-11-28', 'MM ', 470000),
(3531, 23, '2018-11-28', 'MM ', 1850000),
(3532, 23, '2018-11-30', 'UHAMKA', 3525000),
(3533, 23, '2018-11-30', 'PUSPOMAD', 5425000),
(3534, 23, '2018-11-30', 'JAKTIM', 2470000),
(3535, 23, '2018-11-30', 'KBR SIX', 1530000),
(3536, 23, '2018-11-30', 'PLTU', 2470000),
(3537, 23, '2018-12-01', 'PRABU', 3300000),
(3538, 23, '2018-12-02', 'JATIAGUNG', 2960000),
(3539, 23, '2018-12-02', 'PUTRI BANTENG', 4440000),
(3540, 23, '2018-12-02', 'ASTRA', 2775000),
(3541, 23, '2018-12-02', 'PBVSI', 5460000),
(3542, 23, '2018-12-03', 'TOWER', 2420000),
(3543, 23, '2018-12-03', 'PUSDIKES', 2340000),
(3544, 23, '2018-12-04', 'ASEBAK', 1610000),
(3545, 23, '2018-12-05', 'SILUMAN', 2535000),
(3546, 23, '2018-12-05', 'SMA 33', 2275000),
(3547, 23, '2018-12-05', 'OBM', 4900000),
(3548, 23, '2018-12-05', 'ARJATIM', 4255000),
(3549, 23, '2018-12-10', 'SJU', 2220000),
(3550, 23, '2018-12-10', 'SJU', 810000),
(3551, 23, '2018-12-11', 'SDM 9', 9750000),
(3552, 23, '2018-12-12', 'METEOR', 2700000),
(3553, 23, '2018-12-12', 'PBVSI', 3500000),
(3554, 23, '2018-12-14', 'KASMAJI', 2700000),
(3555, 23, '2018-12-14', 'PELINDO 3', 4700000),
(3556, 23, '2018-12-16', 'PBV MEGA', 6280000),
(3557, 23, '2018-12-17', 'MYANMAR', 1800000),
(3558, 23, '2018-12-17', 'MYANMAR', 2250000),
(3559, 23, '2018-12-18', 'MD FAMILY', 2175000),
(3560, 23, '2018-12-18', 'MD FAMILY', 420000);

-- --------------------------------------------------------

--
-- Table structure for table `hasil_rfm`
--

CREATE TABLE `hasil_rfm` (
  `id_hasil` int(5) NOT NULL,
  `id_proses` int(3) NOT NULL,
  `nama_team` varchar(150) NOT NULL,
  `c1` float NOT NULL,
  `c2` float NOT NULL,
  `hasil` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hasil_rfm`
--

INSERT INTO `hasil_rfm` (`id_hasil`, `id_proses`, `nama_team`, `c1`, `c2`, `hasil`) VALUES
(467, 23, 'DINDIN', 3, 0, 0),
(468, 23, 'MARINIR', 3, 0, 0),
(469, 23, 'DINSOS', 3, 0, 0),
(470, 23, 'JASAMARGA', 1, 2, 1),
(471, 23, 'TACI', 3, 0, 0),
(472, 23, 'PANTI RAHAYU', 3, 0, 0),
(473, 23, 'MANGGALA', 3, 0, 0),
(474, 23, 'BRILIANT', 1, 2, 1),
(475, 23, 'UI', 1, 2, 1),
(476, 23, 'JATILAWANG', 3, 0, 0),
(477, 23, 'BEKMATPUS', 3, 0, 0),
(478, 23, 'MGMP', 3, 0, 0),
(479, 23, 'KOARMADA I', 3, 0, 0),
(480, 23, 'MATADOR', 1, 2, 1),
(481, 23, 'PPOP', 3, 0, 0),
(482, 23, 'PORAD', 3, 0, 0),
(483, 23, ' AL', 3, 0, 0),
(484, 23, 'BAYU', 3, 0, 0),
(485, 23, 'EDI', 3, 0, 0),
(486, 23, 'DIPONEGORO', 3, 0, 0),
(487, 23, 'PANASONIC', 3, 0, 0),
(488, 23, 'NONO', 2.24, 1.41, 0),
(489, 23, 'CAZANOVA', 3, 0, 0),
(490, 23, 'RW 02', 3, 0, 0),
(491, 23, 'PUTRA29', 3, 0, 0),
(492, 23, 'IKARAGIL', 3, 0, 0),
(493, 23, 'CAPING', 2, 1, 0),
(494, 23, 'CMD', 3, 0, 0),
(495, 23, 'METEOR', 1, 4, 1),
(496, 23, 'IIKP', 3, 0, 0),
(497, 23, 'JR', 3, 0, 0),
(498, 23, 'ADE', 3, 0, 0),
(499, 23, 'WIKA', 4.24, 4.58, 1),
(500, 23, 'AIR DEFENCE', 2.24, 1.41, 0),
(501, 23, 'BMJ', 3, 0, 0),
(502, 23, 'LAJ', 3, 0, 0),
(503, 23, 'RT 08', 3, 0, 0),
(504, 23, 'DUMA', 3, 0, 0),
(505, 23, 'FADHILAH SPORT', 3, 0, 0),
(506, 23, '', 3, 0, 0),
(507, 23, 'IKRGL ', 3, 0, 0),
(508, 23, 'KONCO MESRA', 3, 0, 0),
(509, 23, 'SAMBA', 3, 0, 0),
(510, 23, 'Ganeksa gathering', 3, 0, 0),
(511, 23, 'Kampung Mas', 3, 0, 0),
(512, 23, 'EXCELLENT SERVICE', 3, 0, 0),
(513, 23, 'BIN', 3, 0, 0),
(514, 23, 'SATUAN', 3, 0, 0),
(515, 23, 'BVC', 3, 0, 0),
(516, 23, 'PGRI', 3, 0, 0),
(517, 23, 'BERSAUDARA', 3, 0, 0),
(518, 23, 'PPOP Pantai', 3, 0, 0),
(519, 23, 'ASEAN GAMES', 2, 1, 0),
(520, 23, 'RT 01', 3, 0, 0),
(521, 23, 'SINAR LAUT', 3, 0, 0),
(522, 23, 'MAHOGANY', 3, 0, 0),
(523, 23, 'MM', 0, 3, 1),
(524, 23, 'BARY', 3, 0, 0),
(525, 23, 'ANTON', 3.16, 1, 0),
(526, 23, 'DEDY', 3, 0, 0),
(527, 23, 'Virama', 3, 0, 0),
(528, 23, 'Petra Jasa', 3, 0, 0),
(529, 23, 'SEHATI', 3, 0, 0),
(530, 23, 'SKB GK', 3, 0, 0),
(531, 23, 'Nglipar', 3, 0, 0),
(532, 23, 'Sinar Muda', 3, 0, 0),
(533, 23, 'Dozer', 3, 0, 0),
(534, 23, 'Bima Palma ', 3, 0, 0),
(535, 23, 'Storage Fc', 3, 0, 0),
(536, 23, 'Pagupon', 3, 0, 0),
(537, 23, 'XSUCI', 2, 1, 0),
(538, 23, 'Bina Sakti', 3, 0, 0),
(539, 23, 'Cahaya Muda', 3, 0, 0),
(540, 23, 'Patma ', 3, 0, 0),
(541, 23, 'Mudi Sport', 3, 0, 0),
(542, 23, 'Teen Sport', 3, 0, 0),
(543, 23, 'Haruns ', 3, 0, 0),
(544, 23, 'Kusuma Negara', 3, 0, 0),
(545, 23, 'WEGE', 1, 2, 1),
(546, 23, 'TEPUS', 3, 0, 0),
(547, 23, 'PATUK', 3, 0, 0),
(548, 23, 'Food & Bevergas', 3, 0, 0),
(549, 23, 'VORADE', 3, 0, 0),
(550, 23, 'Cordova', 3, 0, 0),
(551, 23, 'Aqua', 1, 3.16, 1),
(552, 23, 'PBV', 3, 0, 0),
(553, 23, 'Panggang', 3, 0, 0),
(554, 23, 'Fedora', 3, 0, 0),
(555, 23, 'Rt 12/02', 3, 0, 0),
(556, 23, 'TIMNAS', 3, 0, 0),
(557, 23, 'BEKASI', 3, 0, 0),
(558, 23, 'Satrio Fc', 3, 0, 0),
(559, 23, 'Sampel', 3, 0, 0),
(560, 23, 'Gilang', 3, 0, 0),
(561, 23, 'T1VC', 3, 0, 0),
(562, 23, 'WG', 3, 0, 0),
(563, 23, 'RW017', 3, 0, 0),
(564, 23, 'Yansa', 3, 0, 0),
(565, 23, 'alumni SmA Bandung', 3, 0, 0),
(566, 23, 'LIY', 3, 0, 0),
(567, 23, 'Mizuno', 3, 0, 0),
(568, 23, 'Denzo', 2, 1, 0),
(569, 23, 'Garuda', 0, 3, 1),
(570, 23, 'ADI Toser', 3, 0, 0),
(571, 23, 'AL', 2, 1, 0),
(572, 23, 'Marimun Putri', 3, 0, 0),
(573, 23, 'Banimasi', 3, 0, 0),
(574, 23, 'DPP PDIP', 3, 0, 0),
(575, 23, 'DIKLAPA', 2, 1, 0),
(576, 23, 'VIKING', 2, 1, 0),
(577, 23, 'GGS', 1, 2, 1),
(578, 23, 'ANIS', 2, 1, 0),
(579, 23, 'TRISULA', 2, 1, 0),
(580, 23, 'MM2100', 2, 1, 0),
(581, 23, 'MM2101', 2, 1, 0),
(582, 23, 'RUDI', 2, 1, 0),
(583, 23, 'SMPN 8', 2, 1, 0),
(584, 23, 'YON POM', 2, 1, 0),
(585, 23, 'DIMINPERS AU', 2, 1, 0),
(586, 23, 'RICCI', 2, 1, 0),
(587, 23, 'WINGBEKUD', 2, 1, 0),
(588, 23, 'DEPRATAMA', 2, 1, 0),
(589, 23, 'MANDIRI ', 2, 1, 0),
(590, 23, 'MANDALA', 2, 1, 0),
(591, 23, 'DVI', 2, 1, 0),
(592, 23, 'IDDO VC', 2, 1, 0),
(593, 23, 'BELKER', 2, 1, 0),
(594, 23, 'SANCU', 2, 1, 0),
(595, 23, 'DCTKRP', 2, 1, 0),
(596, 23, 'CIBUBUR', 2, 1, 0),
(597, 23, 'SDCTKRP', 2, 1, 0),
(598, 23, 'IKG PERMAI 12', 2, 1, 0),
(599, 23, 'STOCK', 2, 1, 0),
(600, 23, 'SGS', 2, 1, 0),
(601, 23, 'RVS', 2, 1, 0),
(602, 23, 'SINGGIH', 1, 2, 1),
(603, 23, '38', 2, 1, 0),
(604, 23, 'GAVOLTA', 2, 1, 0),
(605, 23, 'ORCHID', 2, 1, 0),
(606, 23, 'IRENA', 1, 2, 1),
(607, 23, 'SUHILL', 1, 2, 1),
(608, 23, 'MELON', 1, 2, 1),
(609, 23, 'pgv', 1, 2, 1),
(610, 23, 'BENHILL', 1, 2, 1),
(611, 23, 'SOLO', 1, 2, 1),
(612, 23, 'PAJAK', 1, 2, 1),
(613, 23, 'SDCTRKTRP', 1, 2, 1),
(614, 23, 'KAMADIKA', 1, 2, 1),
(615, 23, 'YUSOMANIA', 1, 2, 1),
(616, 23, 'SIMRS', 1, 2, 1),
(617, 23, 'SANANTA', 1, 2, 1),
(618, 23, 'ELANG', 1, 2, 1),
(619, 23, 'TRISILA', 1, 2, 1),
(620, 23, 'DIVA', 0, 3, 1),
(621, 23, 'LAPSAT', 1, 2, 1),
(622, 23, 'DS', 1, 2, 1),
(623, 23, 'PERDAPA', 1, 2, 1),
(624, 23, 'WG PEDULI/csr', 1, 2, 1),
(625, 23, 'MADRASAH', 1, 2, 1),
(626, 23, 'BSSN', 1, 2, 1),
(627, 23, 'WIKASTRIAN', 1, 2, 1),
(628, 23, 'PANITIA', 1, 2, 1),
(629, 23, 'KEBUMEN', 1, 2, 1),
(630, 23, 'BANGKIT SANJAYA', 1, 2, 1),
(631, 23, 'DPU', 1, 2, 1),
(632, 23, 'HEAD OFFICE', 1, 2, 1),
(633, 23, 'PANITIA FUTSAL', 1, 2, 1),
(634, 23, 'JASUN', 1, 2, 1),
(635, 23, 'JIWAKORSA', 1, 2, 1),
(636, 23, 'C5 GRAB', 1, 2, 1),
(637, 23, 'ALCIV', 1, 2, 1),
(638, 23, 'PUTRA SRAGEN', 1, 2, 1),
(639, 23, 'PUSPOMAD', 0, 3, 1),
(640, 23, 'PBVSI SOLO', 1, 2, 1),
(641, 23, 'KOPASUS', 1, 2, 1),
(642, 23, 'CIVIC', 1, 2, 1),
(643, 23, 'FORTUNA', 1, 2, 1),
(644, 23, 'TI', 1, 2, 1),
(645, 23, 'BRITAMA', 1, 2, 1),
(646, 23, 'SMA 33', 1, 4, 1),
(647, 23, 'AUTOMOTIF', 0, 3, 1),
(648, 23, 'RIAU', 0, 3, 1),
(649, 23, 'PT.JPI', 0, 3, 1),
(650, 23, 'BUNI Women', 0, 3, 1),
(651, 23, 'SEBLEAST', 0, 3, 1),
(652, 23, 'MARS PB', 0, 3, 1),
(653, 23, 'DIO', 0, 3, 1),
(654, 23, 'JAKSEL', 0, 3, 1),
(655, 23, 'SPJ', 0, 3, 1),
(656, 23, 'Funtastic', 0, 3, 1),
(657, 23, 'SEKOLAH JAGAKARSA', 0, 3, 1),
(658, 23, 'BRITAMA PKL', 0, 3, 1),
(659, 23, 'NARADA', 0, 3, 1),
(660, 23, 'IDDOVC', 0, 3, 1),
(661, 23, 'FJM', 0, 3, 1),
(662, 23, 'KIJANG', 0, 3, 1),
(663, 23, 'DHARMAIS', 0, 3, 1),
(664, 23, 'BRT', 0, 3, 1),
(665, 23, 'ASTRA', 1, 4, 1),
(666, 23, 'SHIPPING', 0, 3, 1),
(667, 23, 'OVC', 0, 3, 1),
(668, 23, 'PMS', 0, 3, 1),
(669, 23, 'EL RAGAZA', 0, 3, 1),
(670, 23, 'SUDINKES', 0, 3, 1),
(671, 23, 'RSUD ', 0, 3, 1),
(672, 23, 'LENONG', 0, 3, 1),
(673, 23, 'SETJEN ', 0, 3, 1),
(674, 23, 'WINGDIKTEKAL', 1, 3.16, 1),
(675, 23, 'SETRA BF', 0, 3, 1),
(676, 23, 'T.CENDIKIA', 0, 3, 1),
(677, 23, 'CORNELL DENVER', 0, 3, 1),
(678, 23, 'PUNCAK MERR', 0, 3, 1),
(679, 23, 'UHAMKA', 0, 3, 1),
(680, 23, 'JAKTIM', 0, 3, 1),
(681, 23, 'KBR SIX', 0, 3, 1),
(682, 23, 'PLTU', 0, 3, 1),
(683, 23, 'PRABU', 1, 4, 1),
(684, 23, 'JATIAGUNG', 1, 4, 1),
(685, 23, 'PUTRI BANTENG', 1, 4, 1),
(686, 23, 'PBVSI', 1, 4, 1),
(687, 23, 'TOWER', 1, 4, 1),
(688, 23, 'PUSDIKES', 1, 4, 1),
(689, 23, 'ASEBAK', 1, 4, 1),
(690, 23, 'SILUMAN', 1, 4, 1),
(691, 23, 'OBM', 1, 4, 1),
(692, 23, 'ARJATIM', 1, 4, 1),
(693, 23, 'SJU', 1, 4, 1),
(694, 23, 'SDM 9', 1, 4, 1),
(695, 23, 'KASMAJI', 1, 4, 1),
(696, 23, 'PELINDO 3', 1, 4, 1),
(697, 23, 'PBV MEGA', 1, 4, 1),
(698, 23, 'MYANMAR', 1, 4, 1),
(699, 23, 'MD FAMILY', 1, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kriteria_f`
--

CREATE TABLE `kriteria_f` (
  `id_kriteria_f` int(4) NOT NULL,
  `batas_awal` int(3) NOT NULL,
  `batas_akhir` int(3) NOT NULL,
  `bobot_f` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kriteria_f`
--

INSERT INTO `kriteria_f` (`id_kriteria_f`, `batas_awal`, `batas_akhir`, `bobot_f`) VALUES
(1, 1, 4, 1),
(2, 5, 8, 2),
(3, 9, 12, 3),
(4, 13, 16, 4),
(5, 20, 40, 5);

-- --------------------------------------------------------

--
-- Table structure for table `kriteria_m`
--

CREATE TABLE `kriteria_m` (
  `id_kriteria_m` int(4) NOT NULL,
  `batas_awal` int(10) NOT NULL,
  `batas_akhir` int(10) NOT NULL,
  `bobot_m` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kriteria_m`
--

INSERT INTO `kriteria_m` (`id_kriteria_m`, `batas_awal`, `batas_akhir`, `bobot_m`) VALUES
(1, 0, 44000000, 1),
(2, 44000001, 88000000, 2),
(3, 88000001, 132000000, 3),
(4, 132000001, 176000000, 4),
(5, 176000001, 220000000, 5);

-- --------------------------------------------------------

--
-- Table structure for table `kriteria_r`
--

CREATE TABLE `kriteria_r` (
  `id_kriteria_r` int(2) NOT NULL,
  `batas_awal` int(3) NOT NULL,
  `batas_akhir` int(3) NOT NULL,
  `bobot_r` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kriteria_r`
--

INSERT INTO `kriteria_r` (`id_kriteria_r`, `batas_awal`, `batas_akhir`, `bobot_r`) VALUES
(1, 0, 30, 5),
(2, 31, 60, 4),
(3, 61, 90, 3),
(4, 91, 120, 2),
(5, 121, 400, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tjm_menu`
--

CREATE TABLE `tjm_menu` (
  `id` int(11) NOT NULL,
  `parent_menu` int(11) NOT NULL DEFAULT '1',
  `nama_menu` varchar(50) NOT NULL,
  `url_menu` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `urutan` tinyint(3) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `type` enum('Admin') NOT NULL DEFAULT 'Admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tjm_menu`
--

INSERT INTO `tjm_menu` (`id`, `parent_menu`, `nama_menu`, `url_menu`, `icon`, `urutan`, `status`, `type`) VALUES
(1, 1, 'root', '/', '', 0, 0, 'Admin'),
(2, 1, 'dashboard', 'admin/dashboard', 'fa fa-fw fa-dashboard', 1, 1, 'Admin'),
(3, 1, 'User Admin', 'admin/useradmin', 'fa fa-users', 99, 0, 'Admin'),
(4, 1, 'Menu', 'admin/menu', 'fa fa-gear', 100, 1, 'Admin'),
(25, 1, 'Master', 'admin/master', 'fa fa-ticket', 2, 1, 'Admin'),
(34, 1, 'Data Kriteria R', 'admin/kriteria_r', 'glyphicon glyphicon-list-alt', 2, 1, 'Admin'),
(35, 1, 'Data Kriteria F', 'admin/kriteria_f', 'glyphicon glyphicon-list-alt', 4, 1, 'Admin'),
(36, 1, 'Data Kriteria M', 'admin/kriteria_m', 'glyphicon glyphicon-list-alt', 5, 1, 'Admin'),
(37, 1, 'Proses Data', 'admin/prosesdata', 'glyphicon glyphicon-play', 6, 1, 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `centroid_data`
--
ALTER TABLE `centroid_data`
  ADD PRIMARY KEY (`id_c`);

--
-- Indexes for table `data_proses`
--
ALTER TABLE `data_proses`
  ADD PRIMARY KEY (`id_proses`);

--
-- Indexes for table `data_rfm`
--
ALTER TABLE `data_rfm`
  ADD PRIMARY KEY (`id_data`);

--
-- Indexes for table `hasil_rfm`
--
ALTER TABLE `hasil_rfm`
  ADD PRIMARY KEY (`id_hasil`);

--
-- Indexes for table `kriteria_f`
--
ALTER TABLE `kriteria_f`
  ADD PRIMARY KEY (`id_kriteria_f`);

--
-- Indexes for table `kriteria_m`
--
ALTER TABLE `kriteria_m`
  ADD PRIMARY KEY (`id_kriteria_m`);

--
-- Indexes for table `kriteria_r`
--
ALTER TABLE `kriteria_r`
  ADD PRIMARY KEY (`id_kriteria_r`);

--
-- Indexes for table `tjm_menu`
--
ALTER TABLE `tjm_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `centroid_data`
--
ALTER TABLE `centroid_data`
  MODIFY `id_c` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `data_proses`
--
ALTER TABLE `data_proses`
  MODIFY `id_proses` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `data_rfm`
--
ALTER TABLE `data_rfm`
  MODIFY `id_data` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3561;
--
-- AUTO_INCREMENT for table `hasil_rfm`
--
ALTER TABLE `hasil_rfm`
  MODIFY `id_hasil` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=700;
--
-- AUTO_INCREMENT for table `kriteria_f`
--
ALTER TABLE `kriteria_f`
  MODIFY `id_kriteria_f` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `kriteria_m`
--
ALTER TABLE `kriteria_m`
  MODIFY `id_kriteria_m` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `kriteria_r`
--
ALTER TABLE `kriteria_r`
  MODIFY `id_kriteria_r` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tjm_menu`
--
ALTER TABLE `tjm_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
