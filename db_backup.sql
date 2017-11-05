SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `**db_name**`
--
CREATE DATABASE IF NOT EXISTS `**db_name**` DEFAULT CHARACTER SET latin1 COLLATE latin1_german2_ci;
USE `**db_name**`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename_resized` varchar(58) COLLATE utf8_unicode_ci NOT NULL,
  `filename_thumb` varchar(56) COLLATE utf8_unicode_ci NOT NULL,
  `cat` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `album` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descr` text COLLATE utf8_unicode_ci,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file` (`filename`),
  KEY `cat` (`cat`),
  KEY `cat_2` (`cat`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=116 ;

--
-- Daten für Tabelle `images`
--

INSERT INTO `images` (`id`, `filename`, `filename_resized`, `filename_thumb`, `cat`, `date`, `album`, `descr`, `title`) VALUES
(1, NULL, 'IMG_2715_Schritt1_resized.jpg', 'IMG_2715_Schritt1_thumb.jpg', 'photos', '2012-03-29 01:00:00', 'people', '', ''),
(2, NULL, 'IMG_1497p_resized.jpg', 'IMG_1497p_thumb.jpg', 'photos', '2014-09-24 01:00:00', 'abstract', '', ''),
(3, NULL, 'IMG_1452pp_resized.jpg', 'IMG_1452pp_thumb.jpg', 'photos', '2014-09-24 01:00:00', 'abstract', '', ''),
(4, NULL, 'IMG_9183pp_resized.jpg', 'IMG_9183pp_thumb.jpg', 'photos', '2013-01-27 04:00:00', 'abstract', '', ''),
(5, NULL, 'IMG_0318pp_resized.jpg', 'IMG_0318pp_thumb.jpg', 'photos', '2013-02-15 04:00:00', 'abstract', '', ''),
(6, NULL, 'IMG_9090pp_resized.jpg', 'IMG_9090pp_thumb.jpg', 'photos', '2013-01-25 04:00:00', 'abstract', '', ''),
(7, NULL, 'IMG_9178pp_resized.jpg', 'IMG_9178pp_thumb.jpg', 'photos', '2013-01-27 04:00:00', 'abstract', '', ''),
(8, NULL, 'IMG_0046pp_resized.jpg', 'IMG_0046pp_thumb.jpg', 'photos', '2012-01-20 04:00:00', 'abstract', '', ''),
(9, NULL, 'IMG_3603_resized.jpg', 'IMG_3603_thumb.jpg', 'photos', '2012-05-17 01:00:00', 'abstract', '', ''),
(10, NULL, 'IMG_0051_a_resized.jpg', 'IMG_0051_a_thumb.jpg', 'photos', '2012-01-20 04:00:00', 'abstract', '', ''),
(11, NULL, 'IMG_5393aohnet_resized.jpg', 'IMG_5393aohnet_thumb.jpg', 'photos', '2011-08-10 01:00:00', 'abstract', '', ''),
(12, NULL, 'IMG_8593bea3_resized.jpg', 'IMG_8593bea3_thumb.jpg', 'photos', '2009-09-06 01:00:00', 'abstract', '', ''),
(13, NULL, 'IMG_8605farbek_resized.jpg', 'IMG_8605farbek_thumb.jpg', 'photos', '2009-09-06 01:00:00', 'abstract', '', ''),
(15, NULL, 'IMG_0184pp_resized.jpg', 'IMG_0184pp_thumb.jpg', 'photos', '2012-03-28 01:00:00', 'people', '', ''),
(16, NULL, 'IMG_0362pp_neu_resized.jpg', 'IMG_0362pp_neu_thumb.jpg', 'photos', '2012-01-17 04:00:00', 'people', '', ''),
(17, NULL, 'IMG_5388fertigeinzl2_resized.jpg', 'IMG_5388fertigeinzl2_thumb.jpg', 'photos', '2011-08-14 01:00:00', 'people', '', ''),
(18, NULL, 'IMG_6163d_resized.jpg', 'IMG_6163d_thumb.jpg', 'photos', '2009-09-26 01:00:00', 'people', '', ''),
(19, NULL, 'IMG_6003f_duplex_resized.jpg', 'IMG_6003f_duplex_thumb.jpg', 'photos', '2009-06-24 01:00:00', 'people', '', ''),
(20, NULL, 'IMG_5989bea_Kopie_altrnt_resized.jpg', 'IMG_5989bea_Kopie_altrnt_thumb.jpg', 'photos', '2009-06-24 01:00:00', 'people', '', ''),
(22, NULL, 'IMG_7274pp_resized.jpg', 'IMG_7274pp_thumb.jpg', 'photos', '2009-07-27 01:00:00', 'people', '', ''),
(23, NULL, 'IMG_7275ohnetext_resized.jpg', 'IMG_7275ohnetext_thumb.jpg', 'photos', '2009-07-28 01:00:00', 'people', '', ''),
(24, NULL, 'IMG_7256ohnetext_resized.jpg', 'IMG_7256ohnetext_thumb.jpg', 'photos', '2009-07-29 01:00:00', 'people', '', ''),
(25, NULL, 'Scheiben2_resized.jpg', 'Scheiben2_thumb.jpg', 'photos', '2012-01-18 04:00:00', 'people', '', ''),
(26, NULL, 'Scheiben1_resized.jpg', 'Scheiben1_thumb.jpg', 'photos', '2012-01-18 04:00:00', 'people', '', ''),
(27, NULL, 'IMG_0675pp_2_resized.jpg', 'IMG_0675pp_2_thumb.jpg', 'photos', '2012-03-12 03:00:00', 'people', '', ''),
(29, NULL, 'AlleFarben_5_eineE_180_resized.jpg', 'AlleFarben_5_eineE_180_thumb.jpg', 'in between', '2013-07-28 01:00:00', 'all', '', ''),
(30, NULL, 'dunkelblau-rot_resized.jpg', 'dunkelblau-rot_thumb.jpg', 'in between', '2012-05-04 01:00:00', 'all', '', ''),
(31, NULL, 'PanoramaDoppelt_resized.jpg', 'PanoramaDoppelt_thumb.jpg', 'in between', '2011-10-29 01:00:00', 'all', '', ''),
(32, NULL, 'IMG_0118pp2_resized.jpg', 'IMG_0118pp2_thumb.jpg', 'in between', '2011-06-12 01:00:00', 'all', '', ''),
(33, NULL, 'IMG_4919fattich_resized.jpg', 'IMG_4919fattich_thumb.jpg', 'in between', '2009-05-05 01:00:00', 'all', '', ''),
(34, NULL, 'LAMB_ganzgut_LAMM_resized.jpg', 'LAMB_ganzgut_LAMM_thumb.jpg', 'in between', '2012-04-24 01:00:00', 'all', '', ''),
(35, NULL, 'JB photography_Logo_resized.png', 'JB photography_Logo_thumb.png', 'graphics', '2014-03-20 03:00:00', 'vector', '', 'Logo'),
(36, NULL, 'Arbeiten4_html_22c51997_resized.jpg', 'Arbeiten4_html_22c51997_thumb.jpg', 'graphics', '2012-05-25 01:00:00', 'other', '', ''),
(38, NULL, 'mkh_3.2_nachgez_resized.png', 'mkh_3.2_nachgez_thumb.png', 'graphics', '2013-05-29 01:00:00', 'vector', '', ''),
(39, NULL, 'waveE_fertig_Pfade_einzeln_resized.png', 'waveE_fertig_Pfade_einzeln_thumb.png', 'graphics', '2013-11-03 03:00:00', 'vector', '', 'Familienwappen'),
(40, NULL, 'bikefit_fertig_col_Kopie_resized.png', 'bikefit_fertig_col_Kopie_thumb.png', 'graphics', '2014-08-12 01:00:00', 'vector', '', ''),
(41, NULL, 'bikefit24_flyer_6seitig_end-1_resized.jpg', 'bikefit24_flyer_6seitig_end-1_thumb.jpg', 'graphics', '2014-10-16 01:00:00', 'other', '', ''),
(42, NULL, '10+BESCHDE+12mm_resized.jpg', '10+BESCHDE+12mm_thumb.jpg', 'graphics', '2011-06-04 01:00:00', 'other', '', ''),
(44, NULL, 'TC_Logo_fr_1b.2_resized.png', 'TC_Logo_fr_1b.2_thumb.png', 'graphics', '2012-10-21 01:00:00', 'vector', '', ''),
(45, NULL, 'IMG_1461p_resized.jpg', 'IMG_1461p_thumb.jpg', 'photos', '2014-09-24 03:00:00', 'abstract', '', ''),
(46, NULL, 'IMG_1382_Kopie_resized.jpg', 'IMG_1382_Kopie_thumb.jpg', 'photos', '2014-09-22 03:00:00', 'nature', '', ''),
(47, NULL, 'IMG_1458_resized.jpg', 'IMG_1458_thumb.jpg', 'photos', '2014-09-24 03:00:00', 'abstract', '', ''),
(48, NULL, 'IMG_0249_resized.jpg', 'IMG_0249_thumb.jpg', 'photos', '2012-01-17 05:00:00', 'people', '', ''),
(49, NULL, 'IMG_0124_BEA_resized.jpg', 'IMG_0124_BEA_thumb.jpg', 'photos', '2011-06-10 03:00:00', 'people', '', ''),
(50, NULL, 'IMG_1660_resized.jpg', 'IMG_1660_thumb.jpg', 'photos', '2014-09-30 03:00:00', 'nature', '', ''),
(51, NULL, 'IMG_1589_resized.jpg', 'IMG_1589_thumb.jpg', 'photos', '2014-09-26 03:00:00', 'nature', '', ''),
(52, NULL, 'IMG_1550_resized.jpg', 'IMG_1550_thumb.jpg', 'photos', '2014-09-26 03:00:00', 'nature', '', ''),
(53, NULL, 'CIMG2695pp_resized.jpg', 'CIMG2695pp_thumb.jpg', 'photos', '2008-07-29 03:00:00', 'nature', '', ''),
(54, NULL, 'IMG_1401_resized.jpg', 'IMG_1401_thumb.jpg', 'photos', '2014-09-23 03:00:00', 'nature', '', ''),
(55, NULL, 'IMG_1588_resized.jpg', 'IMG_1588_thumb.jpg', 'photos', '2014-09-26 03:00:00', 'nature', '', ''),
(56, NULL, 'IMG_4408bea_resized.jpg', 'IMG_4408bea_thumb.jpg', 'photos', '2012-07-17 03:00:00', 'nature', '', ''),
(57, NULL, 'IMG_9648pp_resized.jpg', 'IMG_9648pp_thumb.jpg', 'photos', '2013-02-05 05:00:00', 'nature', '', ''),
(58, NULL, 'IMG_0473pp_resized.jpg', 'IMG_0473pp_thumb.jpg', 'photos', '2013-02-21 05:00:00', 'nature', '', ''),
(59, NULL, 'IMG_0341_resized.jpg', 'IMG_0341_thumb.jpg', 'photos', '2013-02-16 05:00:00', 'nature', '', ''),
(60, NULL, 'IMG_8749_resized.jpg', 'IMG_8749_thumb.jpg', 'photos', '2013-01-17 05:00:00', 'nature', '', ''),
(61, NULL, 'IMG_8588pp_resized.jpg', 'IMG_8588pp_thumb.jpg', 'photos', '2013-01-14 05:00:00', 'abstract', '', ''),
(62, NULL, 'IMG_8950_resized.jpg', 'IMG_8950_thumb.jpg', 'photos', '2013-01-20 05:00:00', 'abstract', '', ''),
(63, NULL, 'IMG_8886pp_resized.jpg', 'IMG_8886pp_thumb.jpg', 'photos', '2013-01-19 05:00:00', 'abstract', '', ''),
(64, NULL, 'IMG_9582_resized.jpg', 'IMG_9582_thumb.jpg', 'photos', '2013-02-02 05:00:00', 'abstract', '', ''),
(65, NULL, 'IMG_9097_resized.jpg', 'IMG_9097_thumb.jpg', 'photos', '2013-01-25 05:00:00', 'abstract', '', ''),
(66, NULL, 'IMG_8825pp_resized.jpg', 'IMG_8825pp_thumb.jpg', 'photos', '2013-01-19 05:00:00', 'abstract', '', ''),
(100, NULL, 'IMG_8602pp_resized.jpg', 'IMG_8602pp_thumb.jpg', 'photos', '2013-01-14 04:00:00', 'abstract', '', ''),
(101, NULL, 'IMG_3772_resized.jpg', 'IMG_3772_thumb.jpg', 'photos', '2013-09-04 03:00:00', 'abstract', '', ''),
(102, NULL, 'IMG_3857_resized.jpg', 'IMG_3857_thumb.jpg', 'photos', '2013-09-01 03:00:00', 'abstract', '', ''),
(103, NULL, 'IMG_7078_pp_resized.jpg', 'IMG_7078_pp_thumb.jpg', 'photos', '2014-08-26 03:00:00', 'places', '', ''),
(104, NULL, 'IMG_7181_pp_resized.jpg', 'IMG_7181_pp_thumb.jpg', 'photos', '2014-08-26 03:00:00', 'places', '', ''),
(105, NULL, 'IMG_7185_pp Kopie_resized.jpg', 'IMG_7185_pp Kopie_thumb.jpg', 'photos', '2014-08-27 03:00:00', 'abstract', '', ''),
(106, NULL, 'dontthinkjustdo_resized.jpg', 'dontthinkjustdo_thumb.jpg', 'graphics', '2011-01-01 05:00:00', 'other', '', ''),
(107, NULL, 'Zusammen_resized.png', 'Zusammen_thumb.png', 'graphics', '2013-09-12 03:00:00', 'vector', 'T-Shirt Printvorlage', 'KÃ¼ken'),
(108, NULL, 'FB_trnsp_resized.png', 'FB_trnsp_thumb.png', 'graphics', '2012-03-11 04:00:00', 'other', '', ''),
(109, NULL, 'Banner_farbig_fertig_resized.png', 'Banner_farbig_fertig_thumb.png', 'graphics', '2013-11-18 05:00:00', 'vector', '', 'Website-Banner'),
(110, NULL, 'fuckers_resized.jpg', 'fuckers_thumb.jpg', 'in between', '2014-05-22 03:00:00', 'all', '', ''),
(112, NULL, 'bikefit24_visite_FINAL_PRINT-1_resized.png', 'bikefit24_visite_FINAL_PRINT-1_thumb.png', 'graphics', '2014-08-11 03:00:00', 'other', '', ''),
(113, NULL, 'IMG_0129pp_resized.jpg', 'IMG_0129pp_thumb.jpg', 'photos', '2013-02-10 05:00:00', 'places', '', ''),
(114, NULL, 'IMG_3475_resized.jpg', 'IMG_3475_thumb.jpg', 'photos', '2012-05-17 03:00:00', 'places', '', ''),
(115, NULL, 'IMG_8862pp_resized.jpg', 'IMG_8862pp_thumb.jpg', 'photos', '2013-01-19 05:00:00', 'places', '', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `img_categories`
--

DROP TABLE IF EXISTS `img_categories`;
CREATE TABLE IF NOT EXISTS `img_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descr` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descr` (`descr`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `img_categories`
--

INSERT INTO `img_categories` (`id`, `descr`) VALUES
(2, 'graphics'),
(3, 'in between'),
(1, 'photos');

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`cat`) REFERENCES `img_categories` (`descr`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
