-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2019 at 11:35 AM
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
(15, '2018-12-31', 'pengecekan pertama');

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
(357, 15, '2018-07-01', 'DINDIN', 720000),
(358, 15, '2018-07-01', 'MARINIR', 2700000),
(359, 15, '2018-07-01', 'DINSOS', 1430000),
(360, 15, '2018-07-01', 'DINSOS', 600000),
(361, 15, '2018-07-02', 'JASAMARGA', 3360000),
(362, 15, '2018-07-02', 'JASAMARGA', 600000),
(363, 15, '2018-07-02', 'TACI', 2405000),
(364, 15, '2018-07-02', 'TACI', 1080000),
(365, 15, '2018-07-02', 'TACI', 125000),
(366, 15, '2018-07-03', 'PANTI RAHAYU', 2475000),
(367, 15, '2018-07-03', 'MANGGALA', 2100000),
(368, 15, '2018-07-04', 'BRILIANT', 2490000),
(369, 15, '2018-07-04', 'TACI', 4700000),
(370, 15, '2018-07-04', 'UI', 6060000),
(371, 15, '2018-07-04', 'JATILAWANG', 2340000),
(372, 15, '2018-07-05', 'BEKMATPUS', 4050000),
(373, 15, '2018-07-05', 'BEKMATPUS', 1950000),
(374, 15, '2018-07-06', 'MGMP', 7050000),
(375, 15, '2018-07-06', 'KOARMADA I', 2000000),
(376, 15, '2018-07-06', 'KOARMADA I', 1400000),
(377, 15, '2018-07-06', 'KOARMADA I', 1980000),
(378, 15, '2018-07-06', 'KOARMADA I', 2940000),
(379, 15, '2018-07-07', 'MATADOR', 1050000),
(380, 15, '2018-07-07', 'MATADOR', 650000),
(381, 15, '2018-07-08', 'PPOP', 1920000),
(382, 15, '2018-07-08', 'PORAD', 5000000),
(383, 15, '2018-07-08', ' AL', 4940000),
(384, 15, '2018-07-08', ' AL', 3800000),
(385, 15, '2018-07-08', ' AL', 3870000),
(386, 15, '2018-07-10', 'BAYU', 185000),
(387, 15, '2018-07-10', 'EDI', 185000),
(388, 15, '2018-07-10', 'EDI', 185000),
(389, 15, '2018-07-10', 'DIPONEGORO', 2800000),
(390, 15, '2018-07-10', 'DIPONEGORO', 150000),
(391, 15, '2018-07-11', 'PANASONIC', 1600000),
(392, 15, '2018-07-12', 'PORAD', 7770000),
(393, 15, '2018-07-12', 'MARINIR', 7350000),
(394, 15, '2018-07-12', 'MARINIR', 1375000),
(395, 15, '2018-07-13', 'NONO', 1020000),
(396, 15, '2018-07-14', 'CAZANOVA', 1320000),
(397, 15, '2018-07-14', 'RW 02', 5600000),
(398, 15, '2018-07-15', 'PUTRA29', 1100000),
(399, 15, '2018-07-15', 'MATADOR', 1350000),
(400, 15, '2018-07-16', 'IKARAGIL', 2275000),
(401, 15, '2018-07-16', 'CAPING', 225000),
(402, 15, '2018-07-16', 'CMD', 300000),
(403, 15, '2018-07-17', 'METEOR', 1400000),
(404, 15, '2018-07-17', 'NONO', 1020000),
(405, 15, '2018-07-17', 'IIKP', 5040000),
(406, 15, '2018-07-17', 'JR', 1125000),
(407, 15, '2018-07-18', 'NONO', 2040000),
(408, 15, '2018-07-18', 'ADE', 1560000),
(409, 15, '2018-07-18', 'IIKP', 1615000),
(410, 15, '2018-07-18', 'WIKA', 4500000),
(411, 15, '2018-07-18', 'WIKA', 1500000),
(412, 15, '2018-07-19', 'AIR DEFENCE', 1850000),
(413, 15, '2018-07-19', 'BMJ', 1005000),
(414, 15, '2018-07-19', 'BMJ', 780000),
(415, 15, '2018-07-20', 'LAJ', 1560000),
(416, 15, '2018-07-20', 'RT 08', 780000),
(417, 15, '2018-07-20', 'DUMA', 2470000),
(418, 15, '2018-07-20', 'FADHILAH SPORT', 6600000),
(419, 15, '2018-07-21', '', 2405000),
(420, 15, '2018-07-21', 'IKRGL ', 2100000),
(421, 15, '2018-07-21', 'KONCO MESRA', 2220000),
(422, 15, '2018-07-21', 'SAMBA', 2220000),
(423, 15, '2018-07-21', 'Ganeksa gathering', 2600000),
(424, 15, '2018-07-22', 'Kampung Mas', 2040000),
(425, 15, '2018-07-22', 'CAPING', 1300000),
(426, 15, '2018-07-23', 'EXCELLENT SERVICE', 1380000),
(427, 15, '2018-07-23', 'BIN', 1725000),
(428, 15, '2018-07-24', 'SATUAN', 480000),
(429, 15, '2018-07-24', 'BVC', 3470000),
(430, 15, '2018-07-24', 'PGRI', 2360000),
(431, 15, '2018-07-25', 'BERSAUDARA', 3600000),
(432, 15, '2018-07-26', 'PPOP Pantai', 2040000),
(433, 15, '2018-07-26', 'ASEAN GAMES', 2405000),
(434, 15, '2018-07-26', 'ASEAN GAMES', 1755000),
(435, 15, '2018-07-27', 'RT 01', 1600000),
(436, 15, '2018-07-27', 'SINAR LAUT', 560000),
(437, 15, '2018-07-28', 'ASEAN GAMES', 390000),
(438, 15, '2018-07-28', 'ASEAN GAMES', 250000),
(439, 15, '2018-07-28', 'MATADOR', 1350000),
(440, 15, '2018-07-29', 'MAHOGANY', 1500000),
(441, 15, '2018-07-29', 'MM', 2625000),
(442, 15, '2018-07-29', 'MM', 675000),
(443, 15, '2018-07-30', 'BARY', 12600000),
(444, 15, '2018-07-30', 'ANTON', 67275000),
(445, 15, '2018-07-31', 'DEDY', 20250000),
(446, 15, '2018-07-31', 'Virama', 3375000),
(447, 15, '2018-07-31', 'Petra Jasa', 4050000),
(448, 15, '2018-08-01', 'SEHATI', 1575000),
(449, 15, '2018-08-01', 'SKB GK', 1210000),
(450, 15, '2018-08-01', 'SKB GK', 195000),
(451, 15, '2018-08-02', 'Nglipar', 2780000),
(452, 15, '2018-08-02', 'Sinar Muda', 1040000),
(453, 15, '2018-08-03', 'Dozer', 990000),
(454, 15, '2018-08-03', 'Bima Palma ', 440000),
(455, 15, '2018-08-03', 'Bima Palma ', 1320000),
(456, 15, '2018-08-03', 'Bima Palma ', 1320000),
(457, 15, '2018-08-04', 'Storage Fc', 1400000),
(458, 15, '2018-08-04', 'Pagupon', 1080000),
(459, 15, '2018-08-04', 'XSUCI', 1080000),
(460, 15, '2018-08-05', 'Bina Sakti', 1100000),
(461, 15, '2018-08-05', 'Cahaya Muda', 1850000),
(462, 15, '2018-08-05', 'Patma ', 1300000),
(463, 15, '2018-08-05', 'Mudi Sport', 2400000),
(464, 15, '2018-08-05', 'Teen Sport', 4800000),
(465, 15, '2018-08-06', 'Nono', 600000),
(466, 15, '2018-08-06', 'Haruns ', 750000),
(467, 15, '2018-08-06', 'Haruns ', 570000),
(468, 15, '2018-08-07', 'Kusuma Negara', 1400000),
(469, 15, '2018-08-07', 'Kusuma Negara', 220000),
(470, 15, '2018-08-08', 'WEGE', 9180000),
(471, 15, '2018-08-09', 'WIKA', 8000000),
(472, 15, '2018-08-09', 'WIKA', 18375000),
(473, 15, '2018-08-09', 'WIKA', 29025000),
(474, 15, '2018-08-10', 'TEPUS', 2810000),
(475, 15, '2018-08-10', 'PATUK', 2220000),
(476, 15, '2018-08-01', 'Food & Bevergas', 780000),
(477, 15, '2018-08-01', 'VORADE', 3145000),
(478, 15, '2018-08-01', 'Cordova', 540000),
(479, 15, '2018-08-02', 'MGMP', 240000),
(480, 15, '2018-08-02', 'AIR DEFENCE', 3945000),
(481, 15, '2018-08-03', 'Aqua', 4360000),
(482, 15, '2018-08-03', 'PBV', 2220000),
(483, 15, '2018-08-03', 'Panggang', 2405000),
(484, 15, '2018-08-03', 'Fedora', 1800000),
(485, 15, '2018-08-04', 'panggang', 1040000),
(486, 15, '2018-08-04', 'Rt 12/02', 1140000),
(487, 15, '2018-08-04', 'TIMNAS', 175000),
(488, 15, '2018-08-05', 'BEKASI', 660000),
(489, 15, '2018-08-05', 'ASEAN GAMES', 185000),
(490, 15, '2018-08-05', 'Satrio Fc', 165000),
(491, 15, '2018-08-05', 'Sampel', 350000),
(492, 15, '2018-08-05', 'Gilang', 195000),
(493, 15, '2018-08-06', 'XSUCI', 1080000),
(494, 15, '2018-08-06', 'T1VC', 840000),
(495, 15, '2018-08-06', 'Pagupon', 2475000),
(496, 15, '2018-08-07', 'Nono', 390000),
(497, 15, '2018-08-07', 'Teen Sport', 1400000),
(498, 15, '2018-08-08', 'WG', 6800000),
(499, 15, '2018-08-09', 'RW017', 650000),
(500, 15, '2018-08-09', 'AIR DEFENCE', 3645000),
(501, 15, '2018-08-09', 'AIR DEFENCE', 300000),
(502, 15, '2018-08-10', 'Yansa', 6500000),
(503, 15, '2018-08-10', 'alumni SmA Bandung', 1625000),
(504, 15, '2018-08-11', 'WIKA', 7500000),
(505, 15, '2018-08-11', 'Nono', 455000),
(506, 15, '2018-08-11', 'Nono', 600000),
(507, 15, '2018-08-12', 'LIY', 770000),
(508, 15, '2018-08-13', 'Mizuno', 975000),
(509, 15, '2018-08-14', 'Denzo', 1820000),
(510, 15, '2018-08-15', 'Garuda', 780000),
(511, 15, '2018-08-16', 'ADI Toser', 3915000),
(512, 15, '2018-08-18', 'AL', 5920000),
(513, 15, '2018-08-18', 'AL', 5180000),
(514, 15, '2018-08-18', 'AL', 4680000),
(515, 15, '2018-08-24', 'Marimun Putri', 900000),
(516, 15, '2018-08-25', 'WIKA', 5500000),
(517, 15, '2018-08-26', 'Banimasi', 7312500),
(518, 15, '2018-08-30', 'WIKA', 2250000),
(519, 15, '2018-08-30', 'WIKA', 6750000),
(520, 15, '2018-08-30', 'DPP PDIP', 5000000),
(521, 15, '2018-09-02', 'DIKLAPA', 4625000),
(522, 15, '2018-09-02', 'VIKING', 5110000),
(523, 15, '2018-09-03', 'AQUA', 370000),
(524, 15, '2018-09-03', 'GGS', 2160000),
(525, 15, '2018-09-03', 'ANIS', 10350000),
(526, 15, '2018-09-04', 'NONO', 720000),
(527, 15, '2018-09-05', 'TRISULA', 1320000),
(528, 15, '2018-09-05', 'METEOR', 1745000),
(529, 15, '2018-09-05', 'XSUCI', 2160000),
(530, 15, '2018-09-05', 'ASEAN GAMES', 370000),
(531, 15, '2018-09-06', 'MM2100', 1800000),
(532, 15, '2018-09-06', 'MM2101', 540000),
(533, 15, '2018-09-07', 'RUDI', 2015000),
(534, 15, '2018-09-07', 'RUDI', 600000),
(535, 15, '2018-09-08', 'CAPING', 600000),
(536, 15, '2018-09-08', 'CAPING', 1350000),
(537, 15, '2018-09-09', 'MM2100', 2205000),
(538, 15, '2018-09-09', 'AIR DEFENCE', 11000000),
(539, 15, '2018-09-09', 'SMPN 8', 2640000),
(540, 15, '2018-09-10', 'YON POM', 6210000),
(541, 15, '2018-09-10', 'DIMINPERS AU', 3675000),
(542, 15, '2018-09-11', 'RICCI', 1680000),
(543, 15, '2018-09-11', 'RICCI', 960000),
(544, 15, '2018-09-11', 'RICCI', 1050000),
(545, 15, '2018-09-11', 'RICCI', 4705000),
(546, 15, '2018-09-12', 'AIR DEFENCE', 2750000),
(547, 15, '2018-09-13', 'DENZO', 2100000),
(548, 15, '2018-09-13', 'AL', 8880000),
(549, 15, '2018-09-13', 'AL', 3150000),
(550, 15, '2018-09-13', 'AL', 5550000),
(551, 15, '2018-09-13', 'AL', 1680000),
(552, 15, '2018-09-13', 'AL', 810000),
(553, 15, '2018-09-15', 'AIR DEFENCE', 900000),
(554, 15, '2018-09-15', 'WINGBEKUD', 1350000),
(555, 15, '2018-09-16', 'DEPRATAMA', 2755000),
(556, 15, '2018-09-16', 'MANDIRI ', 3220000),
(557, 15, '2018-09-16', 'MANDIRI ', 6120000),
(558, 15, '2018-09-17', 'MANDALA', 1200000),
(559, 15, '2018-09-18', 'DVI', 3550000),
(560, 15, '2018-09-19', 'IDDO VC', 5280000),
(561, 15, '2018-09-19', 'IDDO VC', 810000),
(562, 15, '2018-09-20', 'BELKER', 3900000),
(563, 15, '2018-09-21', 'SANCU', 450000),
(564, 15, '2018-09-23', 'DCTKRP', 2605000),
(565, 15, '2018-09-23', 'DCTKRP', 2530000),
(566, 15, '2018-09-24', 'CIBUBUR', 6630000),
(567, 15, '2018-09-26', 'SDCTKRP', 5625000),
(568, 15, '2018-09-26', 'IKG PERMAI 12', 2405000),
(569, 15, '2018-09-27', 'STOCK', 1200000),
(570, 15, '2018-09-28', 'SGS', 2580000),
(571, 15, '2018-09-29', 'RVS', 2415000),
(572, 15, '2018-09-30', 'SINGGIH', 500000),
(573, 15, '2018-09-30', '38', 780000),
(574, 15, '2018-10-01', 'RICCI', 720000),
(575, 15, '2018-10-01', 'GAVOLTA', 1920000),
(576, 15, '2018-10-01', 'ORCHID', 1425000),
(577, 15, '2018-10-02', 'AQUA', 2220000),
(578, 15, '2018-10-03', 'IRENA', 2590000),
(579, 15, '2018-10-04', 'MATADOR', 8595000),
(580, 15, '2018-10-04', 'SUHILL', 2240000),
(581, 15, '2018-10-05', 'MELON', 3105000),
(582, 15, '2018-10-06', 'pgv', 1850000),
(583, 15, '2018-10-06', 'pgv', 2880000),
(584, 15, '2018-10-07', 'BENHILL', 2240000),
(585, 15, '2018-10-07', 'SOLO', 2350000),
(586, 15, '2018-10-08', 'PAJAK', 2325000),
(587, 15, '2018-10-08', 'SDCTRKTRP', 3105000),
(588, 15, '2018-10-08', 'SDCTRKTRP', 2000000),
(589, 15, '2018-10-09', 'KAMADIKA', 3600000),
(590, 15, '2018-10-10', 'YUSOMANIA', 1000000),
(591, 15, '2018-10-11', 'SIMRS', 780000),
(592, 15, '2018-10-12', 'SANANTA', 1625000),
(593, 15, '2018-10-13', 'SINGGIH', 600000),
(594, 15, '2018-10-14', 'ELANG', 825000),
(595, 15, '2018-10-15', 'TRISILA', 1875000),
(596, 15, '2018-10-16', 'DIVA', 1260000),
(597, 15, '2018-10-17', 'LAPSAT', 5445000),
(598, 15, '2018-10-17', 'DS', 6600000),
(599, 15, '2018-10-17', 'PERDAPA', 3215000),
(600, 15, '2018-10-18', 'WG PEDULI/csr', 8670000),
(601, 15, '2018-10-19', 'MADRASAH', 5120000),
(602, 15, '2018-10-20', 'BSSN', 3300000),
(603, 15, '2018-10-20', 'WIKASTRIAN', 3300000),
(604, 15, '2018-10-20', 'PANITIA', 5600000),
(605, 15, '2018-10-21', 'WEGE', 1350000),
(606, 15, '2018-10-21', 'WEGE', 1650000),
(607, 15, '2018-10-21', 'WEGE', 2640000),
(608, 15, '2018-10-21', 'WEGE', 1020000),
(609, 15, '2018-10-22', 'GGS', 810000),
(610, 15, '2018-10-22', 'KEBUMEN', 2380000),
(611, 15, '2018-10-22', 'BANGKIT SANJAYA', 3030000),
(612, 15, '2018-10-22', 'DPU', 2400000),
(613, 15, '2018-10-23', 'HEAD OFFICE', 2145000),
(614, 15, '2018-10-23', 'HEAD OFFICE', 2405000),
(615, 15, '2018-10-23', 'PANITIA FUTSAL', 2080000),
(616, 15, '2018-10-24', 'KAMADIKA', 3770000),
(617, 15, '2018-10-24', 'BRILIANT', 2220000),
(618, 15, '2018-10-24', 'JASUN', 2960000),
(619, 15, '2018-10-25', 'JIWAKORSA', 8930000),
(620, 15, '2018-10-25', 'JIWAKORSA', 2800000),
(621, 15, '2018-10-25', 'UI', 5550000),
(622, 15, '2018-10-25', 'UI', 4785000),
(623, 15, '2018-10-25', 'UI', 2835000),
(624, 15, '2018-10-26', 'C5 GRAB', 2760000),
(625, 15, '2018-10-26', 'ALCIV', 3910000),
(626, 15, '2018-10-26', 'PUTRA SRAGEN', 3850000),
(627, 15, '2018-10-27', 'JASAMARGA', 2675000),
(628, 15, '2018-10-27', 'JASAMARGA', 1625000),
(629, 15, '2018-10-27', 'JASAMARGA', 910000),
(630, 15, '2018-10-28', 'PUSPOMAD', 4550000),
(631, 15, '2018-10-28', 'PBVSI SOLO', 760000),
(632, 15, '2018-10-28', 'KOPASUS', 4110000),
(633, 15, '2018-10-29', 'WIKA', 126000000),
(634, 15, '2018-10-29', 'CIVIC', 700000),
(635, 15, '2018-10-29', 'CIVIC', 840000),
(636, 15, '2018-10-31', 'FORTUNA', 2800000),
(637, 15, '2018-10-31', 'TI', 2090000),
(638, 15, '2018-10-31', 'BRITAMA', 2810000),
(639, 15, '2018-11-01', 'SMA 33', 6120000),
(640, 15, '2018-11-01', 'AUTOMOTIF', 2720000),
(641, 15, '2018-11-01', 'RIAU', 2160000),
(642, 15, '2018-11-01', 'RIAU', 585000),
(643, 15, '2018-11-02', 'PT.JPI', 2220000),
(644, 15, '2018-11-03', 'BUNI Women', 1200000),
(645, 15, '2018-11-03', 'BUNI Women', 850000),
(646, 15, '2018-11-05', 'SEBLEAST', 5600000),
(647, 15, '2018-11-06', 'MARS PB', 1965000),
(648, 15, '2018-11-06', 'AQUA', 2220000),
(649, 15, '2018-11-07', 'DIO', 1275000),
(650, 15, '2018-11-08', 'JAKSEL', 4950000),
(651, 15, '2018-11-09', 'SPJ', 5440000),
(652, 15, '2018-11-11', 'Funtastic', 1200000),
(653, 15, '2018-11-11', 'SEKOLAH JAGAKARSA', 1920000),
(654, 15, '2018-11-11', 'SEKOLAH JAGAKARSA', 4320000),
(655, 15, '2018-11-12', 'BRITAMA PKL', 2600000),
(656, 15, '2018-11-13', 'NARADA', 1295000),
(657, 15, '2018-11-13', 'DIVA', 1920000),
(658, 15, '2018-11-13', 'IDDOVC', 720000),
(659, 15, '2018-11-14', 'AQUA', 2220000),
(660, 15, '2018-11-14', 'IDDOVC', 2100000),
(661, 15, '2018-11-14', 'IDDOVC', 1980000),
(662, 15, '2018-11-15', 'FJM', 1840000),
(663, 15, '2018-11-15', 'KIJANG', 1430000),
(664, 15, '2018-11-15', 'DHARMAIS', 1500000),
(665, 15, '2018-11-16', 'BRT', 2220000),
(666, 15, '2018-11-17', 'ASTRA', 10560000),
(667, 15, '2018-11-18', 'SHIPPING', 2220000),
(668, 15, '2018-11-18', 'OVC', 5920000),
(669, 15, '2018-11-22', 'PMS', 2625000),
(670, 15, '2018-11-22', 'EL RAGAZA', 780000),
(671, 15, '2018-11-23', 'SUDINKES', 5550000),
(672, 15, '2018-11-24', 'RSUD ', 7030000),
(673, 15, '2018-11-25', 'GARUDA', 2560000),
(674, 15, '2018-11-25', 'GARUDA', 260000),
(675, 15, '2018-11-25', 'LENONG', 1020000),
(676, 15, '2018-11-26', 'SETJEN ', 8580000),
(677, 15, '2018-11-26', 'WINGDIKTEKAL', 48300000),
(678, 15, '2018-11-28', 'SETRA BF', 500000),
(679, 15, '2018-11-28', 'T.CENDIKIA', 11400000),
(680, 15, '2018-11-28', 'CORNELL DENVER', 15980000),
(681, 15, '2018-11-28', 'PUNCAK MERR', 14570000),
(682, 15, '2018-11-28', 'MM ', 470000),
(683, 15, '2018-11-28', 'MM ', 1850000),
(684, 15, '2018-11-30', 'UHAMKA', 3525000),
(685, 15, '2018-11-30', 'PUSPOMAD', 5425000),
(686, 15, '2018-11-30', 'JAKTIM', 2470000),
(687, 15, '2018-11-30', 'KBR SIX', 1530000),
(688, 15, '2018-11-30', 'PLTU', 2470000),
(689, 15, '2018-12-01', 'PRABU', 3300000),
(690, 15, '2018-12-02', 'JATIAGUNG', 2960000),
(691, 15, '2018-12-02', 'PUTRI BANTENG', 4440000),
(692, 15, '2018-12-02', 'ASTRA', 2775000),
(693, 15, '2018-12-02', 'PBVSI', 5460000),
(694, 15, '2018-12-03', 'TOWER', 2420000),
(695, 15, '2018-12-03', 'PUSDIKES', 2340000),
(696, 15, '2018-12-04', 'ASEBAK', 1610000),
(697, 15, '2018-12-05', 'SILUMAN', 2535000),
(698, 15, '2018-12-05', 'SMA 33', 2275000),
(699, 15, '2018-12-05', 'OBM', 4900000),
(700, 15, '2018-12-05', 'ARJATIM', 4255000),
(701, 15, '2018-12-10', 'SJU', 2220000),
(702, 15, '2018-12-10', 'SJU', 810000),
(703, 15, '2018-12-11', 'SDM 9', 9750000),
(704, 15, '2018-12-12', 'METEOR', 2700000),
(705, 15, '2018-12-12', 'PBVSI', 3500000),
(706, 15, '2018-12-14', 'KASMAJI', 2700000),
(707, 15, '2018-12-14', 'PELINDO 3', 4700000),
(708, 15, '2018-12-16', 'PBV MEGA', 6280000),
(709, 15, '2018-12-17', 'MYANMAR', 1800000),
(710, 15, '2018-12-17', 'MYANMAR', 2250000),
(711, 15, '2018-12-18', 'MD FAMILY', 2175000),
(712, 15, '2018-12-18', 'MD FAMILY', 420000);

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
-- AUTO_INCREMENT for table `data_proses`
--
ALTER TABLE `data_proses`
  MODIFY `id_proses` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `data_rfm`
--
ALTER TABLE `data_rfm`
  MODIFY `id_data` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=713;
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
