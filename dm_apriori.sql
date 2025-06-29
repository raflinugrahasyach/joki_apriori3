-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 14, 2022 at 12:10 AM
-- Server version: 8.0.29
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
  `lolos` tinyint DEFAULT NULL,
  `min_support` double DEFAULT NULL,
  `min_confidence` double DEFAULT NULL,
  `nilai_uji_lift` double DEFAULT NULL,
  `korelasi_rule` varchar(100) DEFAULT NULL,
  `id_process` int NOT NULL DEFAULT '0',
  `jumlah_a` int DEFAULT NULL,
  `jumlah_b` int DEFAULT NULL,
  `jumlah_ab` int DEFAULT NULL,
  `px` double DEFAULT NULL,
  `py` double DEFAULT NULL,
  `pxuy` double DEFAULT NULL,
  `from_itemset` int DEFAULT NULL COMMENT 'dari itemset 2/3'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `confidence`
--

INSERT INTO `confidence` (`kombinasi1`, `kombinasi2`, `support_xUy`, `support_x`, `confidence`, `lolos`, `min_support`, `min_confidence`, `nilai_uji_lift`, `korelasi_rule`, `id_process`, `jumlah_a`, `jumlah_b`, `jumlah_ab`, `px`, `py`, `pxuy`, `from_itemset`) VALUES
('Alocasia Black Velvet ( Bibit )', 'Alocasia Amazonica ( Bibit )', 11.764705882353, 23.529411764706, 50, 1, 10, 40, 1.2142857142857, 'korelasi positif', 15, 8, 14, 4, 0.23529411764706, 0.41176470588235, 0.11764705882353, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 11.764705882353, 41.176470588235, 28.571428571429, 0, 10, 40, 1.2142857142857, 'korelasi positif', 15, 14, 8, 4, 0.41176470588235, 0.23529411764706, 0.11764705882353, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 14.705882352941, 41.176470588235, 35.714285714285, 0, 10, 40, 0.86734693877551, 'korelasi negatif', 15, 14, 14, 5, 0.41176470588235, 0.41176470588235, 0.14705882352941, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 14.705882352941, 41.176470588235, 35.714285714285, 0, 10, 40, 0.86734693877551, 'korelasi negatif', 15, 14, 14, 5, 0.41176470588235, 0.41176470588235, 0.14705882352941, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 13.513513513514, 37.837837837838, 35.714285714287, 0, 10, 50, 0.88095238095238, 'korelasi negatif', 16, 14, 15, 5, 0.37837837837838, 0.40540540540541, 0.13513513513514, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 13.513513513514, 40.540540540541, 33.333333333335, 0, 10, 50, 0.88095238095238, 'korelasi negatif', 16, 15, 14, 5, 0.40540540540541, 0.37837837837838, 0.13513513513514, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 10.810810810811, 37.837837837838, 28.571428571429, 0, 10, 50, 1.1746031746032, 'korelasi positif', 16, 14, 9, 4, 0.37837837837838, 0.24324324324324, 0.10810810810811, 2),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Amazonica ( Bibit )', 10.810810810811, 24.324324324324, 44.444444444445, 0, 10, 50, 1.1746031746032, 'korelasi positif', 16, 9, 14, 4, 0.24324324324324, 0.37837837837838, 0.10810810810811, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 12.5, 40, 31.25, 0, 10, 40, 0.83333333333333, 'korelasi negatif', 17, 16, 15, 5, 0.4, 0.375, 0.125, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 12.5, 37.5, 33.333333333333, 0, 10, 40, 0.83333333333333, 'korelasi negatif', 17, 15, 16, 5, 0.375, 0.4, 0.125, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 10, 40, 25, 0, 10, 40, 1.1111111111111, 'korelasi positif', 17, 16, 9, 4, 0.4, 0.225, 0.1, 2),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Amazonica ( Bibit )', 10, 22.5, 44.444444444444, 1, 10, 40, 1.1111111111111, 'korelasi positif', 17, 9, 16, 4, 0.225, 0.4, 0.1, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 13.953488372093, 39.53488372093, 35.294117647059, 0, 10, 40, 0.89273356401384, 'korelasi negatif', 18, 17, 17, 6, 0.3953488372093, 0.3953488372093, 0.13953488372093, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 13.953488372093, 39.53488372093, 35.294117647059, 0, 10, 40, 0.89273356401384, 'korelasi negatif', 18, 17, 17, 6, 0.3953488372093, 0.3953488372093, 0.13953488372093, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 13.333333333333, 42.222222222222, 31.57894736842, 0, 10, 40, 0.8359133126935, 'korelasi negatif', 19, 19, 17, 6, 0.42222222222222, 0.37777777777778, 0.13333333333333, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 13.333333333333, 37.777777777778, 35.294117647058, 0, 10, 40, 0.8359133126935, 'korelasi negatif', 19, 17, 19, 6, 0.37777777777778, 0.42222222222222, 0.13333333333333, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 6.25, 62.5, 10, 1, 3, 10, 0.8, 'korelasi negatif', 20, 10, 2, 1, 0.625, 0.125, 0.0625, 2),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 6.25, 12.5, 50, 1, 3, 10, 0.8, 'korelasi negatif', 20, 2, 10, 1, 0.125, 0.625, 0.0625, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 6.25, 62.5, 10, 1, 3, 10, 0.32, 'korelasi negatif', 20, 10, 5, 1, 0.625, 0.3125, 0.0625, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 6.25, 31.25, 20, 1, 3, 10, 0.32, 'korelasi negatif', 20, 5, 10, 1, 0.3125, 0.625, 0.0625, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 11.428571428571, 48.571428571429, 23.529411764705, 1, 10, 20, 1.1764705882353, 'korelasi positif', 21, 17, 7, 4, 0.48571428571429, 0.2, 0.11428571428571, 2),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 11.428571428571, 20, 57.142857142855, 1, 10, 20, 1.1764705882353, 'korelasi positif', 21, 7, 17, 4, 0.2, 0.48571428571429, 0.11428571428571, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 10, 46, 21.739130434783, 1, 10, 20, 0.54347826086957, 'korelasi negatif', 22, 23, 20, 5, 0.46, 0.4, 0.1, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 10, 40, 25, 1, 10, 20, 0.54347826086957, 'korelasi negatif', 22, 20, 23, 5, 0.4, 0.46, 0.1, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 9.3333333333333, 44, 21.212121212121, 1, 5, 20, 0.56818181818182, 'korelasi negatif', 23, 33, 28, 7, 0.44, 0.37333333333333, 0.093333333333333, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 9.3333333333333, 37.333333333333, 25, 1, 5, 20, 0.56818181818182, 'korelasi negatif', 23, 28, 33, 7, 0.37333333333333, 0.44, 0.093333333333333, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 5.3333333333333, 44, 12.121212121212, 0, 5, 20, 0.75757575757576, 'korelasi negatif', 23, 33, 12, 4, 0.44, 0.16, 0.053333333333333, 2),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 5.3333333333333, 16, 33.333333333333, 1, 5, 20, 0.75757575757576, 'korelasi negatif', 23, 12, 33, 4, 0.16, 0.44, 0.053333333333333, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 8.9108910891089, 44.554455445545, 20, 1, 5, 10, 0.54594594594595, 'korelasi negatif', 24, 45, 37, 9, 0.44554455445545, 0.36633663366337, 0.089108910891089, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 8.9108910891089, 36.633663366337, 24.324324324324, 1, 5, 10, 0.54594594594595, 'korelasi negatif', 24, 37, 45, 9, 0.36633663366337, 0.44554455445545, 0.089108910891089, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 5.9405940594059, 44.554455445545, 13.333333333333, 1, 5, 10, 0.96190476190476, 'korelasi negatif', 24, 45, 14, 6, 0.44554455445545, 0.13861386138614, 0.059405940594059, 2),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 5.9405940594059, 13.861386138614, 42.857142857143, 1, 5, 10, 0.96190476190476, 'korelasi negatif', 24, 14, 45, 6, 0.13861386138614, 0.44554455445545, 0.059405940594059, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 9.0225563909774, 41.353383458647, 21.818181818182, 1, 5, 10, 0.59220779220779, 'korelasi negatif', 26, 55, 49, 12, 0.41353383458647, 0.36842105263158, 0.090225563909774, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 9.0225563909774, 36.842105263158, 24.489795918367, 1, 5, 10, 0.59220779220779, 'korelasi negatif', 26, 49, 55, 12, 0.36842105263158, 0.41353383458647, 0.090225563909774, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 5.2631578947368, 41.353383458647, 12.727272727273, 1, 5, 10, 0.89090909090909, 'korelasi negatif', 26, 55, 19, 7, 0.41353383458647, 0.14285714285714, 0.052631578947368, 2),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 5.2631578947368, 14.285714285714, 36.842105263158, 1, 5, 10, 0.89090909090909, 'korelasi negatif', 26, 19, 55, 7, 0.14285714285714, 0.41353383458647, 0.052631578947368, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 9.0225563909774, 41.353383458647, 21.818181818182, 1, 5, 10, 0.59220779220779, 'korelasi negatif', 27, 55, 49, 12, 0.41353383458647, 0.36842105263158, 0.090225563909774, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 9.0225563909774, 36.842105263158, 24.489795918367, 1, 5, 10, 0.59220779220779, 'korelasi negatif', 27, 49, 55, 12, 0.36842105263158, 0.41353383458647, 0.090225563909774, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 5.2631578947368, 41.353383458647, 12.727272727273, 1, 5, 10, 0.89090909090909, 'korelasi negatif', 27, 55, 19, 7, 0.41353383458647, 0.14285714285714, 0.052631578947368, 2),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 5.2631578947368, 14.285714285714, 36.842105263158, 1, 5, 10, 0.89090909090909, 'korelasi negatif', 27, 19, 55, 7, 0.14285714285714, 0.41353383458647, 0.052631578947368, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 8.695652173913, 41.304347826087, 21.052631578947, 1, 5, 10, 0.58105263157895, 'korelasi negatif', 28, 57, 50, 12, 0.41304347826087, 0.36231884057971, 0.08695652173913, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 8.695652173913, 36.231884057971, 24, 1, 5, 10, 0.58105263157895, 'korelasi negatif', 28, 50, 57, 12, 0.36231884057971, 0.41304347826087, 0.08695652173913, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 5.7971014492754, 41.304347826087, 14.035087719298, 1, 5, 10, 0.96842105263158, 'korelasi negatif', 28, 57, 20, 8, 0.41304347826087, 0.14492753623188, 0.057971014492754, 2),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 5.7971014492754, 14.492753623188, 40, 1, 5, 10, 0.96842105263158, 'korelasi negatif', 28, 20, 57, 8, 0.14492753623188, 0.41304347826087, 0.057971014492754, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 8.5714285714286, 41.428571428571, 20.689655172414, 1, 5, 8, 0.57931034482759, 'korelasi negatif', 29, 58, 50, 12, 0.41428571428571, 0.35714285714286, 0.085714285714286, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 8.5714285714286, 35.714285714286, 24, 1, 5, 8, 0.57931034482759, 'korelasi negatif', 29, 50, 58, 12, 0.35714285714286, 0.41428571428571, 0.085714285714286, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 6.4285714285714, 41.428571428571, 15.51724137931, 1, 5, 8, 0.98746081504702, 'korelasi negatif', 29, 58, 22, 9, 0.41428571428571, 0.15714285714286, 0.064285714285714, 2),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 6.4285714285714, 15.714285714286, 40.909090909091, 1, 5, 8, 0.98746081504702, 'korelasi negatif', 29, 22, 58, 9, 0.15714285714286, 0.41428571428571, 0.064285714285714, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 3.5714285714286, 35.714285714286, 10, 1, 3, 3, 0.63636363636364, 'korelasi negatif', 30, 50, 22, 5, 0.35714285714286, 0.15714285714286, 0.035714285714286, 2),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Amazonica ( Bibit )', 3.5714285714286, 15.714285714286, 22.727272727273, 1, 3, 3, 0.63636363636364, 'korelasi negatif', 30, 22, 50, 5, 0.15714285714286, 0.35714285714286, 0.035714285714286, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 6.4285714285714, 41.428571428571, 15.51724137931, 1, 3, 3, 0.98746081504702, 'korelasi negatif', 30, 58, 22, 9, 0.41428571428571, 0.15714285714286, 0.064285714285714, 2),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 6.4285714285714, 15.714285714286, 40.909090909091, 1, 3, 3, 0.98746081504702, 'korelasi negatif', 30, 22, 58, 9, 0.15714285714286, 0.41428571428571, 0.064285714285714, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 8.5714285714286, 35.714285714286, 24, 1, 3, 3, 0.57931034482759, 'korelasi negatif', 30, 50, 58, 12, 0.35714285714286, 0.41428571428571, 0.085714285714286, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 8.5714285714286, 41.428571428571, 20.689655172414, 1, 3, 3, 0.57931034482759, 'korelasi negatif', 30, 58, 50, 12, 0.41428571428571, 0.35714285714286, 0.085714285714286, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 8.3916083916084, 35.664335664336, 23.529411764706, 1, 5, 10, 0.56078431372549, 'korelasi negatif', 32, 51, 60, 12, 0.35664335664336, 0.41958041958042, 0.083916083916084, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 6.4285714285714, 41.428571428571, 15.51724137931, 1, 5, 10, 0.98746081504702, 'korelasi negatif', 31, 58, 22, 9, 0.41428571428571, 0.15714285714286, 0.064285714285714, 2),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 6.4285714285714, 15.714285714286, 40.909090909091, 1, 5, 10, 0.98746081504702, 'korelasi negatif', 31, 22, 58, 9, 0.15714285714286, 0.41428571428571, 0.064285714285714, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 8.3916083916084, 41.958041958042, 20, 1, 5, 10, 0.56078431372549, 'korelasi negatif', 32, 60, 51, 12, 0.41958041958042, 0.35664335664336, 0.083916083916084, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 8.5714285714286, 35.714285714286, 24, 1, 5, 10, 0.57931034482759, 'korelasi negatif', 31, 50, 58, 12, 0.35714285714286, 0.41428571428571, 0.085714285714286, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 8.5714285714286, 41.428571428571, 20.689655172414, 1, 5, 10, 0.57931034482759, 'korelasi negatif', 31, 58, 50, 12, 0.41428571428571, 0.35714285714286, 0.085714285714286, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 6.2937062937063, 41.958041958042, 15, 1, 5, 10, 0.975, 'korelasi negatif', 32, 60, 22, 9, 0.41958041958042, 0.15384615384615, 0.062937062937063, 2),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 6.2937062937063, 15.384615384615, 40.909090909091, 1, 5, 10, 0.975, 'korelasi negatif', 32, 22, 60, 9, 0.15384615384615, 0.41958041958042, 0.062937062937063, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 8.9171974522293, 40.764331210191, 21.875, 1, 5, 10, 0.60252192982456, 'korelasi negatif', 33, 64, 57, 14, 0.40764331210191, 0.36305732484076, 0.089171974522293, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 8.9171974522293, 36.305732484076, 24.561403508772, 1, 5, 10, 0.60252192982456, 'korelasi negatif', 33, 57, 64, 14, 0.36305732484076, 0.40764331210191, 0.089171974522293, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 5.7324840764331, 40.764331210191, 14.0625, 1, 5, 10, 0.84915865384615, 'korelasi negatif', 33, 64, 26, 9, 0.40764331210191, 0.1656050955414, 0.057324840764331, 2),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 5.7324840764331, 16.56050955414, 34.615384615384, 1, 5, 10, 0.84915865384615, 'korelasi negatif', 33, 26, 64, 9, 0.1656050955414, 0.40764331210191, 0.057324840764331, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 9.0909090909091, 41.558441558442, 21.875, 1, 5, 10, 0.62384259259259, 'korelasi negatif', 34, 64, 54, 14, 0.41558441558442, 0.35064935064935, 0.090909090909091, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 9.0909090909091, 35.064935064935, 25.925925925926, 1, 5, 10, 0.62384259259259, 'korelasi negatif', 34, 54, 64, 14, 0.35064935064935, 0.41558441558442, 0.090909090909091, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 5.8441558441558, 41.558441558442, 14.0625, 1, 5, 10, 0.90234375, 'korelasi negatif', 34, 64, 24, 9, 0.41558441558442, 0.15584415584416, 0.058441558441558, 2),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 5.8441558441558, 15.584415584416, 37.5, 1, 5, 10, 0.90234375, 'korelasi negatif', 34, 24, 64, 9, 0.15584415584416, 0.41558441558442, 0.058441558441558, 2),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 9.5238095238095, 33.333333333333, 28.571428571429, 1, 5, 10, 0.75, 'korelasi negatif', 35, 7, 8, 2, 0.33333333333333, 0.38095238095238, 0.095238095238095, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 9.5238095238095, 38.095238095238, 25, 1, 5, 10, 0.75, 'korelasi negatif', 35, 8, 7, 2, 0.38095238095238, 0.33333333333333, 0.095238095238095, 2),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Amazonica ( Bibit )', 9.5238095238095, 33.333333333333, 28.571428571429, 1, 5, 10, 0.85714285714286, 'korelasi negatif', 35, 7, 7, 2, 0.33333333333333, 0.33333333333333, 0.095238095238095, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 9.5238095238095, 33.333333333333, 28.571428571429, 1, 5, 10, 0.85714285714286, 'korelasi negatif', 35, 7, 7, 2, 0.33333333333333, 0.33333333333333, 0.095238095238095, 2),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 9.5238095238095, 38.095238095238, 25, 1, 5, 10, 0.75, 'korelasi negatif', 35, 8, 7, 2, 0.38095238095238, 0.33333333333333, 0.095238095238095, 2),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 9.5238095238095, 33.333333333333, 28.571428571429, 1, 5, 10, 0.75, 'korelasi negatif', 35, 7, 8, 2, 0.33333333333333, 0.38095238095238, 0.095238095238095, 2),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 23.214285714286, 51.785714285714, 44.827586206897, 1, 10, 40, 0.78448275862069, 'korelasi negatif', 1, 58, 64, 26, 0.51785714285714, 0.57142857142857, 0.23214285714286, 2),
('Alocasia Amazonica', 'Alocasia Dragon Silver', 23.214285714286, 57.142857142857, 40.625, 1, 10, 40, 0.78448275862069, 'korelasi negatif', 1, 64, 58, 26, 0.57142857142857, 0.51785714285714, 0.23214285714286, 2),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 24.107142857143, 51.785714285714, 46.551724137931, 1, 10, 40, 1.2716568544996, 'korelasi positif', 1, 58, 41, 27, 0.51785714285714, 0.36607142857143, 0.24107142857143, 2),
('Alocasia Black Velvet', 'Alocasia Dragon Silver', 24.107142857143, 36.607142857143, 65.853658536586, 1, 10, 40, 1.2716568544996, 'korelasi positif', 1, 41, 58, 27, 0.36607142857143, 0.51785714285714, 0.24107142857143, 2),
('Alocasia Amazonica', 'Alocasia Black Velvet', 17.857142857143, 57.142857142857, 31.25, 0, 10, 40, 0.85365853658537, 'korelasi negatif', 1, 64, 41, 20, 0.57142857142857, 0.36607142857143, 0.17857142857143, 2),
('Alocasia Black Velvet', 'Alocasia Amazonica', 17.857142857143, 36.607142857143, 48.780487804878, 1, 10, 40, 0.85365853658537, 'korelasi negatif', 1, 41, 64, 20, 0.36607142857143, 0.57142857142857, 0.17857142857143, 2),
('Alocasia Amazonica', 'Alocasia Reginae Miri', 21.428571428571, 57.142857142857, 37.499999999999, 0, 10, 40, 1.4, 'korelasi positif', 1, 64, 30, 24, 0.57142857142857, 0.26785714285714, 0.21428571428571, 2),
('Alocasia Reginae Miri', 'Alocasia Amazonica', 21.428571428571, 26.785714285714, 79.999999999998, 1, 10, 40, 1.4, 'korelasi positif', 1, 30, 64, 24, 0.26785714285714, 0.57142857142857, 0.21428571428571, 2),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 23.214285714286, 51.785714285714, 44.827586206897, 1, 10, 40, 0.78448275862069, 'korelasi negatif', 2, 58, 64, 26, 0.51785714285714, 0.57142857142857, 0.23214285714286, 2),
('Alocasia Amazonica', 'Alocasia Dragon Silver', 23.214285714286, 57.142857142857, 40.625, 1, 10, 40, 0.78448275862069, 'korelasi negatif', 2, 64, 58, 26, 0.57142857142857, 0.51785714285714, 0.23214285714286, 2),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 24.107142857143, 51.785714285714, 46.551724137931, 1, 10, 40, 1.2716568544996, 'korelasi positif', 2, 58, 41, 27, 0.51785714285714, 0.36607142857143, 0.24107142857143, 2),
('Alocasia Black Velvet', 'Alocasia Dragon Silver', 24.107142857143, 36.607142857143, 65.853658536586, 1, 10, 40, 1.2716568544996, 'korelasi positif', 2, 41, 58, 27, 0.36607142857143, 0.51785714285714, 0.24107142857143, 2),
('Alocasia Amazonica', 'Alocasia Black Velvet', 17.857142857143, 57.142857142857, 31.25, 0, 10, 40, 0.85365853658537, 'korelasi negatif', 2, 64, 41, 20, 0.57142857142857, 0.36607142857143, 0.17857142857143, 2),
('Alocasia Black Velvet', 'Alocasia Amazonica', 17.857142857143, 36.607142857143, 48.780487804878, 1, 10, 40, 0.85365853658537, 'korelasi negatif', 2, 41, 64, 20, 0.36607142857143, 0.57142857142857, 0.17857142857143, 2),
('Alocasia Amazonica', 'Alocasia Reginae Miri', 21.428571428571, 57.142857142857, 37.499999999999, 0, 10, 40, 1.4, 'korelasi positif', 2, 64, 30, 24, 0.57142857142857, 0.26785714285714, 0.21428571428571, 2),
('Alocasia Reginae Miri', 'Alocasia Amazonica', 21.428571428571, 26.785714285714, 79.999999999998, 1, 10, 40, 1.4, 'korelasi positif', 2, 30, 64, 24, 0.26785714285714, 0.57142857142857, 0.21428571428571, 2),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 23.214285714286, 51.785714285714, 44.827586206897, 1, 10, 40, 0.78448275862069, 'korelasi negatif', 3, 58, 64, 26, 0.51785714285714, 0.57142857142857, 0.23214285714286, 2),
('Alocasia Amazonica', 'Alocasia Dragon Silver', 23.214285714286, 57.142857142857, 40.625, 1, 10, 40, 0.78448275862069, 'korelasi negatif', 3, 64, 58, 26, 0.57142857142857, 0.51785714285714, 0.23214285714286, 2),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 24.107142857143, 51.785714285714, 46.551724137931, 1, 10, 40, 1.2716568544996, 'korelasi positif', 3, 58, 41, 27, 0.51785714285714, 0.36607142857143, 0.24107142857143, 2),
('Alocasia Black Velvet', 'Alocasia Dragon Silver', 24.107142857143, 36.607142857143, 65.853658536586, 1, 10, 40, 1.2716568544996, 'korelasi positif', 3, 41, 58, 27, 0.36607142857143, 0.51785714285714, 0.24107142857143, 2),
('Alocasia Amazonica', 'Alocasia Black Velvet', 17.857142857143, 57.142857142857, 31.25, 0, 10, 40, 0.85365853658537, 'korelasi negatif', 3, 64, 41, 20, 0.57142857142857, 0.36607142857143, 0.17857142857143, 2),
('Alocasia Black Velvet', 'Alocasia Amazonica', 17.857142857143, 36.607142857143, 48.780487804878, 1, 10, 40, 0.85365853658537, 'korelasi negatif', 3, 41, 64, 20, 0.36607142857143, 0.57142857142857, 0.17857142857143, 2),
('Alocasia Amazonica', 'Alocasia Reginae Miri', 21.428571428571, 57.142857142857, 37.499999999999, 0, 10, 40, 1.4, 'korelasi positif', 3, 64, 30, 24, 0.57142857142857, 0.26785714285714, 0.21428571428571, 2),
('Alocasia Reginae Miri', 'Alocasia Amazonica', 21.428571428571, 26.785714285714, 79.999999999998, 1, 10, 40, 1.4, 'korelasi positif', 3, 30, 64, 24, 0.26785714285714, 0.57142857142857, 0.21428571428571, 2),
('Alocasia Reginae Miri', 'Alocasia Amazonica', 20.353982300885, 26.548672566372, 76.666666666667, 1, 10, 40, 1.3328205128205, 'korelasi positif', 4, 30, 65, 23, 0.26548672566372, 0.57522123893805, 0.20353982300885, 2),
('Alocasia Amazonica', 'Alocasia Reginae Miri', 20.353982300885, 57.522123893805, 35.384615384615, 0, 10, 40, 1.3328205128205, 'korelasi positif', 4, 65, 30, 23, 0.57522123893805, 0.26548672566372, 0.20353982300885, 2),
('Alocasia Black Velvet', 'Alocasia Amazonica', 17.699115044248, 34.513274336283, 51.282051282052, 1, 10, 40, 0.89151873767258, 'korelasi negatif', 4, 39, 65, 20, 0.34513274336283, 0.57522123893805, 0.17699115044248, 2),
('Alocasia Amazonica', 'Alocasia Black Velvet', 17.699115044248, 57.522123893805, 30.769230769231, 0, 10, 40, 0.89151873767258, 'korelasi negatif', 4, 65, 39, 20, 0.57522123893805, 0.34513274336283, 0.17699115044248, 2),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 22.12389380531, 50.442477876106, 43.859649122808, 1, 10, 40, 0.76248313090418, 'korelasi negatif', 4, 57, 65, 25, 0.50442477876106, 0.57522123893805, 0.2212389380531, 2),
('Alocasia Amazonica', 'Alocasia Dragon Silver', 22.12389380531, 57.522123893805, 38.461538461539, 0, 10, 40, 0.76248313090418, 'korelasi negatif', 4, 65, 57, 25, 0.57522123893805, 0.50442477876106, 0.2212389380531, 2),
('Alocasia Black Velvet', 'Alocasia Dragon Silver', 23.008849557522, 34.513274336283, 66.666666666666, 1, 10, 40, 1.3216374269006, 'korelasi positif', 4, 39, 57, 26, 0.34513274336283, 0.50442477876106, 0.23008849557522, 2),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 23.008849557522, 50.442477876106, 45.614035087719, 1, 10, 40, 1.3216374269006, 'korelasi positif', 4, 57, 39, 26, 0.50442477876106, 0.34513274336283, 0.23008849557522, 2),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 23.008849557522, 50.442477876106, 45.614035087719, 1, 10, 40, 1.3216374269006, 'korelasi positif', 5, 57, 39, 26, 0.50442477876106, 0.34513274336283, 0.23008849557522, 2),
('Alocasia Black Velvet', 'Alocasia Dragon Silver', 23.008849557522, 34.513274336283, 66.666666666666, 1, 10, 40, 1.3216374269006, 'korelasi positif', 5, 39, 57, 26, 0.34513274336283, 0.50442477876106, 0.23008849557522, 2),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 22.12389380531, 50.442477876106, 43.859649122808, 1, 10, 40, 0.76248313090418, 'korelasi negatif', 5, 57, 65, 25, 0.50442477876106, 0.57522123893805, 0.2212389380531, 2),
('Alocasia Amazonica', 'Alocasia Dragon Silver', 22.12389380531, 57.522123893805, 38.461538461539, 0, 10, 40, 0.76248313090418, 'korelasi negatif', 5, 65, 57, 25, 0.57522123893805, 0.50442477876106, 0.2212389380531, 2),
('Alocasia Black Velvet', 'Alocasia Amazonica', 17.699115044248, 34.513274336283, 51.282051282052, 1, 10, 40, 0.89151873767258, 'korelasi negatif', 5, 39, 65, 20, 0.34513274336283, 0.57522123893805, 0.17699115044248, 2),
('Alocasia Amazonica', 'Alocasia Black Velvet', 17.699115044248, 57.522123893805, 30.769230769231, 0, 10, 40, 0.89151873767258, 'korelasi negatif', 5, 65, 39, 20, 0.57522123893805, 0.34513274336283, 0.17699115044248, 2),
('Alocasia Amazonica', 'Alocasia Reginae Miri', 20.353982300885, 57.522123893805, 35.384615384615, 0, 10, 40, 1.3328205128205, 'korelasi positif', 5, 65, 30, 23, 0.57522123893805, 0.26548672566372, 0.20353982300885, 2),
('Alocasia Reginae Miri', 'Alocasia Amazonica', 20.353982300885, 26.548672566372, 76.666666666667, 1, 10, 40, 1.3328205128205, 'korelasi positif', 5, 30, 65, 23, 0.26548672566372, 0.57522123893805, 0.20353982300885, 2),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 22.80701754386, 50, 45.61403508772, 1, 10, 40, 1.3333333333333, 'korelasi positif', 6, 57, 39, 26, 0.5, 0.34210526315789, 0.2280701754386, 2),
('Alocasia Black Velvet', 'Alocasia Dragon Silver', 22.80701754386, 34.210526315789, 66.666666666668, 1, 10, 40, 1.3333333333333, 'korelasi positif', 6, 39, 57, 26, 0.34210526315789, 0.5, 0.2280701754386, 2),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 21.929824561404, 50, 43.859649122808, 1, 10, 40, 0.76923076923077, 'korelasi negatif', 6, 57, 65, 25, 0.5, 0.57017543859649, 0.21929824561404, 2),
('Alocasia Amazonica', 'Alocasia Dragon Silver', 21.929824561404, 57.017543859649, 38.461538461539, 0, 10, 40, 0.76923076923077, 'korelasi negatif', 6, 65, 57, 25, 0.57017543859649, 0.5, 0.21929824561404, 2),
('Alocasia Black Velvet', 'Alocasia Amazonica', 17.543859649123, 34.210526315789, 51.282051282052, 1, 10, 40, 0.89940828402367, 'korelasi negatif', 6, 39, 65, 20, 0.34210526315789, 0.57017543859649, 0.17543859649123, 2),
('Alocasia Amazonica', 'Alocasia Black Velvet', 17.543859649123, 57.017543859649, 30.769230769231, 0, 10, 40, 0.89940828402367, 'korelasi negatif', 6, 65, 39, 20, 0.57017543859649, 0.34210526315789, 0.17543859649123, 2),
('Alocasia Amazonica', 'Alocasia Reginae Miri', 20.175438596491, 57.017543859649, 35.384615384615, 0, 10, 40, 1.3446153846154, 'korelasi positif', 6, 65, 30, 23, 0.57017543859649, 0.26315789473684, 0.20175438596491, 2),
('Alocasia Reginae Miri', 'Alocasia Amazonica', 20.175438596491, 26.315789473684, 76.666666666666, 1, 10, 40, 1.3446153846154, 'korelasi positif', 6, 30, 65, 23, 0.26315789473684, 0.57017543859649, 0.20175438596491, 2),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 22.80701754386, 50, 45.61403508772, 1, 10, 40, 1.3333333333333, 'korelasi positif', 7, 57, 39, 26, 0.5, 0.34210526315789, 0.2280701754386, 2),
('Alocasia Black Velvet', 'Alocasia Dragon Silver', 22.80701754386, 34.210526315789, 66.666666666668, 1, 10, 40, 1.3333333333333, 'korelasi positif', 7, 39, 57, 26, 0.34210526315789, 0.5, 0.2280701754386, 2),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 21.929824561404, 50, 43.859649122808, 1, 10, 40, 0.76923076923077, 'korelasi negatif', 7, 57, 65, 25, 0.5, 0.57017543859649, 0.21929824561404, 2),
('Alocasia Amazonica', 'Alocasia Dragon Silver', 21.929824561404, 57.017543859649, 38.461538461539, 0, 10, 40, 0.76923076923077, 'korelasi negatif', 7, 65, 57, 25, 0.57017543859649, 0.5, 0.21929824561404, 2),
('Alocasia Black Velvet', 'Alocasia Amazonica', 17.543859649123, 34.210526315789, 51.282051282052, 1, 10, 40, 0.89940828402367, 'korelasi negatif', 7, 39, 65, 20, 0.34210526315789, 0.57017543859649, 0.17543859649123, 2),
('Alocasia Amazonica', 'Alocasia Black Velvet', 17.543859649123, 57.017543859649, 30.769230769231, 0, 10, 40, 0.89940828402367, 'korelasi negatif', 7, 65, 39, 20, 0.57017543859649, 0.34210526315789, 0.17543859649123, 2),
('Alocasia Amazonica', 'Alocasia Reginae Miri', 20.175438596491, 57.017543859649, 35.384615384615, 0, 10, 40, 1.3446153846154, 'korelasi positif', 7, 65, 30, 23, 0.57017543859649, 0.26315789473684, 0.20175438596491, 2),
('Alocasia Reginae Miri', 'Alocasia Amazonica', 20.175438596491, 26.315789473684, 76.666666666666, 1, 10, 40, 1.3446153846154, 'korelasi positif', 7, 30, 65, 23, 0.26315789473684, 0.57017543859649, 0.20175438596491, 2),
('Alocasia Dragon Silver , Alocasia Black Velvet', 'Alocasia Amazonica', 6.1946902654867, 23.008849557522, 26.923076923077, 1, 4, 10, 0.46804733727811, 'korelasi negatif', 8, 26, 65, 7, 0.23008849557522, 0.57522123893805, 0.061946902654867, 3),
('Alocasia Black Velvet , Alocasia Amazonica', 'Alocasia Dragon Silver', 6.1946902654867, 17.699115044248, 35, 1, 4, 10, 0.70625, 'korelasi negatif', 8, 20, 56, 7, 0.17699115044248, 0.49557522123894, 0.061946902654867, 3),
('Alocasia Amazonica , Alocasia Dragon Silver', 'Alocasia Black Velvet', 6.1946902654867, 22.12389380531, 28, 1, 4, 10, 0.81128205128205, 'korelasi negatif', 8, 25, 39, 7, 0.2212389380531, 0.34513274336283, 0.061946902654867, 3),
('Alocasia Dragon Silver', 'Alocasia Amazonica , Alocasia Black Velvet', 6.1946902654867, 49.557522123894, 12.5, 1, 4, 10, 0.70625, 'korelasi negatif', 8, 56, 20, 7, 0.49557522123894, 0.17699115044248, 0.061946902654867, 3),
('Alocasia Black Velvet', 'Alocasia Dragon Silver , Alocasia Amazonica', 6.1946902654867, 34.513274336283, 17.948717948718, 1, 4, 10, 0.81128205128205, 'korelasi negatif', 8, 39, 25, 7, 0.34513274336283, 0.2212389380531, 0.061946902654867, 3),
('Alocasia Amazonica', 'Alocasia Black Velvet , Alocasia Dragon Silver', 6.1946902654867, 57.522123893805, 10.769230769231, 1, 4, 10, 0.46804733727811, 'korelasi negatif', 8, 65, 26, 7, 0.57522123893805, 0.23008849557522, 0.061946902654867, 3),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 23.008849557522, 49.557522123894, 46.428571428571, 1, 4, 10, 1.3452380952381, 'korelasi positif', 8, 56, 39, 26, 0.49557522123894, 0.34513274336283, 0.23008849557522, 2),
('Alocasia Black Velvet', 'Alocasia Dragon Silver', 23.008849557522, 34.513274336283, 66.666666666666, 1, 4, 10, 1.3452380952381, 'korelasi positif', 8, 39, 56, 26, 0.34513274336283, 0.49557522123894, 0.23008849557522, 2),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 22.12389380531, 49.557522123894, 44.642857142858, 1, 4, 10, 0.7760989010989, 'korelasi negatif', 8, 56, 65, 25, 0.49557522123894, 0.57522123893805, 0.2212389380531, 2),
('Alocasia Amazonica', 'Alocasia Dragon Silver', 22.12389380531, 57.522123893805, 38.461538461539, 1, 4, 10, 0.7760989010989, 'korelasi negatif', 8, 65, 56, 25, 0.57522123893805, 0.49557522123894, 0.2212389380531, 2),
('Alocasia Black Velvet', 'Alocasia Amazonica', 17.699115044248, 34.513274336283, 51.282051282052, 1, 4, 10, 0.89151873767258, 'korelasi negatif', 8, 39, 65, 20, 0.34513274336283, 0.57522123893805, 0.17699115044248, 2),
('Alocasia Amazonica', 'Alocasia Black Velvet', 17.699115044248, 57.522123893805, 30.769230769231, 1, 4, 10, 0.89151873767258, 'korelasi negatif', 8, 65, 39, 20, 0.57522123893805, 0.34513274336283, 0.17699115044248, 2),
('Alocasia Amazonica', 'Alocasia Reginae Miri', 20.353982300885, 57.522123893805, 35.384615384615, 1, 4, 10, 1.3328205128205, 'korelasi positif', 8, 65, 30, 23, 0.57522123893805, 0.26548672566372, 0.20353982300885, 2),
('Alocasia Reginae Miri', 'Alocasia Amazonica', 20.353982300885, 26.548672566372, 76.666666666667, 1, 4, 10, 1.3328205128205, 'korelasi positif', 8, 30, 65, 23, 0.26548672566372, 0.57522123893805, 0.20353982300885, 2);

-- --------------------------------------------------------

--
-- Table structure for table `itemset1`
--

CREATE TABLE `itemset1` (
  `atribut` varchar(200) DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `support` double DEFAULT NULL,
  `lolos` tinyint DEFAULT NULL,
  `id_process` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itemset1`
--

INSERT INTO `itemset1` (`atribut`, `jumlah`, `support`, `lolos`, `id_process`) VALUES
('Alocasia Amazonica ( Bibit )', 15, 27.777777777778, 0, 5),
('Alocasia Black Velvet ( Bibit )', 20, 37.037037037037, 0, 5),
('Alocasia Dragon Silver ( Bibit )', 17, 31.481481481481, 0, 5),
('Alocasia Golden Bone ( Bibit )', 10, 18.518518518519, 0, 5),
('Alocasia Watsoniana ( Remaja )', 5, 9.2592592592593, 0, 5),
('Alocasia Epip Varigata ( Remaja )', 2, 3.7037037037037, 0, 5),
('Philodendron White Knight ( Dewasa )', 1, 1.8518518518519, 0, 5),
('Philodendron Giganteum Marble Variage ( Dewasa )', 3, 5.5555555555556, 0, 5),
('Anthurium Jemani ( Bibit )', 3, 5.5555555555556, 0, 5),
('Alocasia Reginae Miri ( Remaja )', 3, 5.5555555555556, 0, 5),
('Anii Monstera Adansonii Variegata lokal (Dewasa)', 3, 5.5555555555556, 0, 5),
('Alocasia Dragon Silver ( Remaja )', 2, 3.7037037037037, 0, 5),
('Alocasia Black Velvet (Remaja)', 1, 1.8518518518519, 0, 5),
('Alocasia Melo (Dewasa)', 1, 1.8518518518519, 0, 5),
('Philodendron Burle Mark Varigata ( Remaja )', 1, 1.8518518518519, 0, 5),
('Alocasia Black Maharani ( Dewasa )', 2, 3.7037037037037, 0, 5),
('Philodendron Pink Princess ( Dewasa )', 1, 1.8518518518519, 0, 5),
('Philodendron Jose Buono ( Dewasa )', 1, 1.8518518518519, 0, 5),
('Alocasia Silver Streak ( Dewasa )', 1, 1.8518518518519, 0, 5),
('Philodendron Florida Beauty Variegated ( Dewasa )', 1, 1.8518518518519, 0, 5),
('Alocasia Amazonica ( Bibit )', 1, 20, 0, 6),
('Alocasia Dragon Silver ( Bibit )', 3, 60, 1, 6),
('Alocasia Black Velvet ( Bibit )', 1, 20, 0, 6),
('Alocasia Amazonica ( Bibit )', 3, 33.333333333333, 0, 7),
('Alocasia Dragon Silver ( Bibit )', 5, 55.555555555556, 1, 7),
('Alocasia Black Velvet ( Bibit )', 1, 11.111111111111, 0, 7),
('Alocasia Golden Bone ( Bibit )', 2, 22.222222222222, 0, 7),
('Alocasia Amazonica ( Bibit )', 3, 25, 0, 8),
('Alocasia Dragon Silver ( Bibit )', 6, 50, 1, 8),
('Alocasia Black Velvet ( Bibit )', 1, 8.3333333333333, 0, 8),
('Alocasia Golden Bone ( Bibit )', 4, 33.333333333333, 0, 8),
('Alocasia Watsoniana ( Remaja )', 1, 8.3333333333333, 0, 8),
('Alocasia Amazonica ( Bibit )', 3, 21.428571428571, 0, 9),
('Alocasia Dragon Silver ( Bibit )', 7, 50, 1, 9),
('Alocasia Black Velvet ( Bibit )', 1, 7.1428571428571, 0, 9),
('Alocasia Golden Bone ( Bibit )', 6, 42.857142857143, 1, 9),
('Alocasia Watsoniana ( Remaja )', 1, 7.1428571428571, 0, 9),
('Alocasia Reginae Miri ( Remaja )', 1, 7.1428571428571, 0, 9),
('Alocasia Amazonica ( Bibit )', 6, 33.333333333333, 0, 10),
('Alocasia Dragon Silver ( Bibit )', 8, 44.444444444444, 1, 10),
('Alocasia Black Velvet ( Bibit )', 2, 11.111111111111, 0, 10),
('Alocasia Golden Bone ( Bibit )', 6, 33.333333333333, 0, 10),
('Alocasia Watsoniana ( Remaja )', 2, 11.111111111111, 0, 10),
('Alocasia Reginae Miri ( Remaja )', 2, 11.111111111111, 0, 10),
('Philodendron Florida Beauty Variegated ( Dewasa )', 1, 5.5555555555556, 0, 10),
('Alocasia Amazonica ( Bibit )', 9, 39.130434782609, 0, 11),
('Alocasia Dragon Silver ( Bibit )', 10, 43.478260869565, 1, 11),
('Alocasia Black Velvet ( Bibit )', 4, 17.391304347826, 0, 11),
('Alocasia Golden Bone ( Bibit )', 7, 30.434782608696, 0, 11),
('Alocasia Watsoniana ( Remaja )', 2, 8.695652173913, 0, 11),
('Alocasia Reginae Miri ( Remaja )', 2, 8.695652173913, 0, 11),
('Philodendron Florida Beauty Variegated ( Dewasa )', 1, 4.3478260869565, 0, 11),
('Alocasia Dragon Silver ( Remaja )', 1, 4.3478260869565, 0, 11),
('Alocasia Amazonica ( Bibit )', 12, 41.379310344828, 1, 12),
('Alocasia Dragon Silver ( Bibit )', 12, 41.379310344828, 1, 12),
('Alocasia Black Velvet ( Bibit )', 7, 24.137931034483, 0, 12),
('Alocasia Golden Bone ( Bibit )', 7, 24.137931034483, 0, 12),
('Alocasia Watsoniana ( Remaja )', 2, 6.8965517241379, 0, 12),
('Alocasia Reginae Miri ( Remaja )', 2, 6.8965517241379, 0, 12),
('Philodendron Florida Beauty Variegated ( Dewasa )', 1, 3.448275862069, 0, 12),
('Alocasia Dragon Silver ( Remaja )', 1, 3.448275862069, 0, 12),
('Alocasia Amazonica ( Bibit )', 13, 43.333333333333, 1, 13),
('Alocasia Dragon Silver ( Bibit )', 12, 40, 1, 13),
('Alocasia Black Velvet ( Bibit )', 7, 23.333333333333, 0, 13),
('Alocasia Golden Bone ( Bibit )', 7, 23.333333333333, 0, 13),
('Alocasia Watsoniana ( Remaja )', 2, 6.6666666666667, 0, 13),
('Alocasia Reginae Miri ( Remaja )', 2, 6.6666666666667, 0, 13),
('Philodendron Florida Beauty Variegated ( Dewasa )', 1, 3.3333333333333, 0, 13),
('Alocasia Dragon Silver ( Remaja )', 1, 3.3333333333333, 0, 13),
('Alocasia Melo (Dewasa)', 1, 3.3333333333333, 0, 13),
('Alocasia Amazonica ( Bibit )', 13, 40.625, 1, 14),
('Alocasia Dragon Silver ( Bibit )', 13, 40.625, 1, 14),
('Alocasia Black Velvet ( Bibit )', 7, 21.875, 0, 14),
('Alocasia Golden Bone ( Bibit )', 8, 25, 0, 14),
('Alocasia Watsoniana ( Remaja )', 2, 6.25, 0, 14),
('Alocasia Reginae Miri ( Remaja )', 3, 9.375, 0, 14),
('Philodendron Florida Beauty Variegated ( Dewasa )', 1, 3.125, 0, 14),
('Alocasia Dragon Silver ( Remaja )', 1, 3.125, 0, 14),
('Alocasia Melo (Dewasa)', 1, 3.125, 0, 14),
('Alocasia Amazonica ( Bibit )', 14, 41.176470588235, 1, 15),
('Alocasia Dragon Silver ( Bibit )', 14, 41.176470588235, 1, 15),
('Alocasia Black Velvet ( Bibit )', 8, 23.529411764706, 1, 15),
('Alocasia Golden Bone ( Bibit )', 9, 26.470588235294, 1, 15),
('Alocasia Watsoniana ( Remaja )', 2, 5.8823529411765, 0, 15),
('Alocasia Reginae Miri ( Remaja )', 3, 8.8235294117647, 0, 15),
('Philodendron Florida Beauty Variegated ( Dewasa )', 1, 2.9411764705882, 0, 15),
('Alocasia Dragon Silver ( Remaja )', 1, 2.9411764705882, 0, 15),
('Alocasia Melo (Dewasa)', 1, 2.9411764705882, 0, 15),
('Alocasia Black Maharani ( Dewasa )', 1, 2.9411764705882, 0, 15),
('Alocasia Amazonica ( Bibit )', 14, 37.837837837838, 1, 16),
('Alocasia Dragon Silver ( Bibit )', 15, 40.540540540541, 1, 16),
('Alocasia Black Velvet ( Bibit )', 9, 24.324324324324, 1, 16),
('Alocasia Golden Bone ( Bibit )', 11, 29.72972972973, 1, 16),
('Alocasia Watsoniana ( Remaja )', 2, 5.4054054054054, 0, 16),
('Alocasia Reginae Miri ( Remaja )', 3, 8.1081081081081, 0, 16),
('Philodendron Florida Beauty Variegated ( Dewasa )', 1, 2.7027027027027, 0, 16),
('Alocasia Dragon Silver ( Remaja )', 1, 2.7027027027027, 0, 16),
('Alocasia Melo (Dewasa)', 1, 2.7027027027027, 0, 16),
('Alocasia Black Maharani ( Dewasa )', 1, 2.7027027027027, 0, 16),
('Alocasia Golden Bone ( Remaja )', 1, 2.7027027027027, 0, 16),
('Alocasia Golden Bone ( Dewasa )', 1, 2.7027027027027, 0, 16),
('Alocasia Amazonica ( Bibit )', 16, 40, 1, 17),
('Alocasia Dragon Silver ( Bibit )', 15, 37.5, 1, 17),
('Alocasia Black Velvet ( Bibit )', 9, 22.5, 1, 17),
('Alocasia Golden Bone ( Bibit )', 14, 35, 1, 17),
('Alocasia Watsoniana ( Remaja )', 2, 5, 0, 17),
('Alocasia Reginae Miri ( Remaja )', 3, 7.5, 0, 17),
('Philodendron Florida Beauty Variegated ( Dewasa )', 1, 2.5, 0, 17),
('Alocasia Dragon Silver ( Remaja )', 1, 2.5, 0, 17),
('Alocasia Melo (Dewasa)', 1, 2.5, 0, 17),
('Alocasia Black Maharani ( Dewasa )', 1, 2.5, 0, 17),
('Alocasia Golden Bone ( Remaja )', 1, 2.5, 0, 17),
('Alocasia Golden Bone ( Dewasa )', 1, 2.5, 0, 17),
('Alocasia Amazonica ( Bibit )', 17, 39.53488372093, 1, 18),
('Alocasia Dragon Silver ( Bibit )', 17, 39.53488372093, 1, 18),
('Alocasia Black Velvet ( Bibit )', 9, 20.93023255814, 1, 18),
('Alocasia Golden Bone ( Bibit )', 14, 32.558139534884, 1, 18),
('Alocasia Watsoniana ( Remaja )', 2, 4.6511627906977, 0, 18),
('Alocasia Reginae Miri ( Remaja )', 3, 6.9767441860465, 0, 18),
('Philodendron Florida Beauty Variegated ( Dewasa )', 1, 2.3255813953488, 0, 18),
('Alocasia Dragon Silver ( Remaja )', 1, 2.3255813953488, 0, 18),
('Alocasia Melo (Dewasa)', 1, 2.3255813953488, 0, 18),
('Alocasia Black Maharani ( Dewasa )', 1, 2.3255813953488, 0, 18),
('Alocasia Golden Bone ( Remaja )', 1, 2.3255813953488, 0, 18),
('Alocasia Golden Bone ( Dewasa )', 1, 2.3255813953488, 0, 18),
('Anthurium Jemani ( Bibit )', 1, 2.3255813953488, 0, 18),
('Alocasia Amazonica ( Bibit )', 19, 42.222222222222, 1, 19),
('Alocasia Dragon Silver ( Bibit )', 17, 37.777777777778, 1, 19),
('Alocasia Black Velvet ( Bibit )', 9, 20, 1, 19),
('Alocasia Golden Bone ( Bibit )', 15, 33.333333333333, 1, 19),
('Alocasia Watsoniana ( Remaja )', 2, 4.4444444444444, 0, 19),
('Alocasia Reginae Miri ( Remaja )', 3, 6.6666666666667, 0, 19),
('Philodendron Florida Beauty Variegated ( Dewasa )', 1, 2.2222222222222, 0, 19),
('Alocasia Dragon Silver ( Remaja )', 1, 2.2222222222222, 0, 19),
('Alocasia Melo (Dewasa)', 1, 2.2222222222222, 0, 19),
('Alocasia Black Maharani ( Dewasa )', 1, 2.2222222222222, 0, 19),
('Alocasia Golden Bone ( Remaja )', 1, 2.2222222222222, 0, 19),
('Alocasia Golden Bone ( Dewasa )', 1, 2.2222222222222, 0, 19),
('Anthurium Jemani ( Bibit )', 1, 2.2222222222222, 0, 19),
('Alocasia Dragon Silver ( Bibit )', 10, 62.5, 1, 20),
('Alocasia Black Velvet ( Bibit )', 2, 12.5, 1, 20),
('Alocasia Amazonica ( Bibit )', 5, 31.25, 1, 20),
('Alocasia Golden Bone ( Bibit )', 1, 6.25, 1, 20),
('Alocasia Dragon Silver ( Bibit )', 17, 48.571428571429, 1, 21),
('Alocasia Black Velvet ( Bibit )', 7, 20, 1, 21),
('Alocasia Amazonica ( Bibit )', 14, 40, 1, 21),
('Alocasia Golden Bone ( Bibit )', 1, 2.8571428571429, 0, 21),
('Philodendron Giganteum Marble Variage ( Dewasa )', 1, 2.8571428571429, 0, 21),
('Alocasia Melo (Dewasa)', 1, 2.8571428571429, 0, 21),
('Alocasia Watsoniana ( Remaja )', 1, 2.8571428571429, 0, 21),
('Alocasia Black Maharani ( Dewasa )', 1, 2.8571428571429, 0, 21),
('Alocasia Dragon Silver ( Bibit )', 23, 46, 1, 22),
('Alocasia Black Velvet ( Bibit )', 10, 20, 1, 22),
('Alocasia Amazonica ( Bibit )', 20, 40, 1, 22),
('Alocasia Golden Bone ( Bibit )', 1, 2, 0, 22),
('Philodendron Giganteum Marble Variage ( Dewasa )', 1, 2, 0, 22),
('Alocasia Melo (Dewasa)', 1, 2, 0, 22),
('Alocasia Watsoniana ( Remaja )', 1, 2, 0, 22),
('Alocasia Black Maharani ( Dewasa )', 1, 2, 0, 22),
('Alocasia Reginae Miri ( Remaja )', 2, 4, 0, 22),
('Alocasia Golden Bone ( Dewasa )', 1, 2, 0, 22),
('Alocasia Dragon Silver ( Bibit )', 33, 44, 1, 23),
('Alocasia Amazonica ( Bibit )', 28, 37.333333333333, 1, 23),
('Alocasia Black Velvet ( Bibit )', 12, 16, 1, 23),
('Alocasia Golden Bone ( Bibit )', 1, 1.3333333333333, 0, 23),
('Philodendron Giganteum Marble Variage ( Dewasa )', 1, 1.3333333333333, 0, 23),
('Alocasia Melo (Dewasa)', 1, 1.3333333333333, 0, 23),
('Alocasia Watsoniana ( Remaja )', 1, 1.3333333333333, 0, 23),
('Alocasia Black Maharani ( Dewasa )', 1, 1.3333333333333, 0, 23),
('Alocasia Reginae Miri ( Remaja )', 8, 10.666666666667, 1, 23),
('Alocasia Golden Bone ( Dewasa )', 1, 1.3333333333333, 0, 23),
('Anii Monstera Adansonii Variegata lokal (Dewasa)', 1, 1.3333333333333, 0, 23),
('Alocasia Dragon Silver ( Bibit )', 45, 44.554455445545, 1, 24),
('Alocasia Amazonica ( Bibit )', 37, 36.633663366337, 1, 24),
('Alocasia Black Velvet ( Bibit )', 14, 13.861386138614, 1, 24),
('Alocasia Golden Bone ( Bibit )', 1, 0.99009900990099, 0, 24),
('Philodendron Giganteum Marble Variage ( Dewasa )', 1, 0.99009900990099, 0, 24),
('Alocasia Melo (Dewasa)', 1, 0.99009900990099, 0, 24),
('Alocasia Watsoniana ( Remaja )', 1, 0.99009900990099, 0, 24),
('Alocasia Black Maharani ( Dewasa )', 1, 0.99009900990099, 0, 24),
('Alocasia Reginae Miri ( Remaja )', 11, 10.891089108911, 1, 24),
('Alocasia Golden Bone ( Dewasa )', 1, 0.99009900990099, 0, 24),
('Anii Monstera Adansonii Variegata lokal (Dewasa)', 1, 0.99009900990099, 0, 24),
('Philodendron Paraiso Verde ( Dewasa )', 1, 0.99009900990099, 0, 24),
('Anthurium Jemani ( Bibit )', 2, 1.980198019802, 0, 24),
('Philodendron Pink Princess ( Dewasa )', 1, 0.99009900990099, 0, 24),
('Alocasia Dragon Silver ( Bibit )', 55, 41.353383458647, 1, 25),
('Alocasia Amazonica ( Bibit )', 49, 36.842105263158, 1, 25),
('Alocasia Black Velvet ( Bibit )', 19, 14.285714285714, 1, 25),
('Alocasia Golden Bone ( Bibit )', 4, 3.0075187969925, 0, 25),
('Philodendron Giganteum Marble Variage ( Dewasa )', 2, 1.5037593984962, 0, 25),
('Alocasia Melo (Dewasa)', 2, 1.5037593984962, 0, 25),
('Alocasia Watsoniana ( Remaja )', 1, 0.75187969924812, 0, 25),
('Alocasia Black Maharani ( Dewasa )', 1, 0.75187969924812, 0, 25),
('Alocasia Reginae Miri ( Remaja )', 16, 12.03007518797, 1, 25),
('Alocasia Golden Bone ( Dewasa )', 1, 0.75187969924812, 0, 25),
('Anii Monstera Adansonii Variegata lokal (Dewasa)', 1, 0.75187969924812, 0, 25),
('Philodendron Paraiso Verde ( Dewasa )', 1, 0.75187969924812, 0, 25),
('Anthurium Jemani ( Bibit )', 2, 1.5037593984962, 0, 25),
('Philodendron Pink Princess ( Dewasa )', 1, 0.75187969924812, 0, 25),
('Alocasia Dragon Silver ( Bibit )', 55, 41.353383458647, 1, 26),
('Alocasia Amazonica ( Bibit )', 49, 36.842105263158, 1, 26),
('Alocasia Black Velvet ( Bibit )', 19, 14.285714285714, 1, 26),
('Alocasia Golden Bone ( Bibit )', 4, 3.0075187969925, 0, 26),
('Philodendron Giganteum Marble Variage ( Dewasa )', 2, 1.5037593984962, 0, 26),
('Alocasia Melo (Dewasa)', 2, 1.5037593984962, 0, 26),
('Alocasia Watsoniana ( Remaja )', 1, 0.75187969924812, 0, 26),
('Alocasia Black Maharani ( Dewasa )', 1, 0.75187969924812, 0, 26),
('Alocasia Reginae Miri ( Remaja )', 16, 12.03007518797, 1, 26),
('Alocasia Golden Bone ( Dewasa )', 1, 0.75187969924812, 0, 26),
('Anii Monstera Adansonii Variegata lokal (Dewasa)', 1, 0.75187969924812, 0, 26),
('Philodendron Paraiso Verde ( Dewasa )', 1, 0.75187969924812, 0, 26),
('Anthurium Jemani ( Bibit )', 2, 1.5037593984962, 0, 26),
('Philodendron Pink Princess ( Dewasa )', 1, 0.75187969924812, 0, 26),
('Alocasia Dragon Silver ( Bibit )', 55, 41.353383458647, 1, 27),
('Alocasia Amazonica ( Bibit )', 49, 36.842105263158, 1, 27),
('Alocasia Black Velvet ( Bibit )', 19, 14.285714285714, 1, 27),
('Alocasia Golden Bone ( Bibit )', 4, 3.0075187969925, 0, 27),
('Philodendron Giganteum Marble Variage ( Dewasa )', 2, 1.5037593984962, 0, 27),
('Alocasia Melo (Dewasa)', 2, 1.5037593984962, 0, 27),
('Alocasia Watsoniana ( Remaja )', 1, 0.75187969924812, 0, 27),
('Alocasia Black Maharani ( Dewasa )', 1, 0.75187969924812, 0, 27),
('Alocasia Reginae Miri ( Remaja )', 16, 12.03007518797, 1, 27),
('Alocasia Golden Bone ( Dewasa )', 1, 0.75187969924812, 0, 27),
('Anii Monstera Adansonii Variegata lokal (Dewasa)', 1, 0.75187969924812, 0, 27),
('Philodendron Paraiso Verde ( Dewasa )', 1, 0.75187969924812, 0, 27),
('Anthurium Jemani ( Bibit )', 2, 1.5037593984962, 0, 27),
('Philodendron Pink Princess ( Dewasa )', 1, 0.75187969924812, 0, 27),
('Alocasia Dragon Silver ( Bibit )', 57, 41.304347826087, 1, 28),
('Alocasia Amazonica ( Bibit )', 50, 36.231884057971, 1, 28),
('Alocasia Black Velvet ( Bibit )', 20, 14.492753623188, 1, 28),
('Alocasia Golden Bone ( Bibit )', 4, 2.8985507246377, 0, 28),
('Philodendron Giganteum Marble Variage ( Dewasa )', 2, 1.4492753623188, 0, 28),
('Alocasia Melo (Dewasa)', 2, 1.4492753623188, 0, 28),
('Alocasia Watsoniana ( Remaja )', 1, 0.72463768115942, 0, 28),
('Alocasia Black Maharani ( Dewasa )', 1, 0.72463768115942, 0, 28),
('Alocasia Reginae Miri ( Remaja )', 18, 13.04347826087, 1, 28),
('Alocasia Golden Bone ( Dewasa )', 1, 0.72463768115942, 0, 28),
('Anii Monstera Adansonii Variegata lokal (Dewasa)', 1, 0.72463768115942, 0, 28),
('Philodendron Paraiso Verde ( Dewasa )', 1, 0.72463768115942, 0, 28),
('Anthurium Jemani ( Bibit )', 2, 1.4492753623188, 0, 28),
('Philodendron Pink Princess ( Dewasa )', 1, 0.72463768115942, 0, 28),
('Alocasia Dragon Silver ( Bibit )', 58, 41.428571428571, 1, 29),
('Alocasia Amazonica ( Bibit )', 50, 35.714285714286, 1, 29),
('Alocasia Black Velvet ( Bibit )', 22, 15.714285714286, 1, 29),
('Alocasia Golden Bone ( Bibit )', 4, 2.8571428571429, 0, 29),
('Philodendron Giganteum Marble Variage ( Dewasa )', 2, 1.4285714285714, 0, 29),
('Alocasia Melo (Dewasa)', 2, 1.4285714285714, 0, 29),
('Alocasia Watsoniana ( Remaja )', 1, 0.71428571428571, 0, 29),
('Alocasia Black Maharani ( Dewasa )', 1, 0.71428571428571, 0, 29),
('Alocasia Reginae Miri ( Remaja )', 18, 12.857142857143, 1, 29),
('Alocasia Golden Bone ( Dewasa )', 1, 0.71428571428571, 0, 29),
('Anii Monstera Adansonii Variegata lokal (Dewasa)', 1, 0.71428571428571, 0, 29),
('Philodendron Paraiso Verde ( Dewasa )', 1, 0.71428571428571, 0, 29),
('Anthurium Jemani ( Bibit )', 2, 1.4285714285714, 0, 29),
('Philodendron Pink Princess ( Dewasa )', 1, 0.71428571428571, 0, 29),
('Alocasia Dragon Silver ( Bibit )', 58, 41.428571428571, 1, 30),
('Alocasia Amazonica ( Bibit )', 50, 35.714285714286, 1, 30),
('Alocasia Black Velvet ( Bibit )', 22, 15.714285714286, 1, 30),
('Alocasia Golden Bone ( Bibit )', 4, 2.8571428571429, 0, 30),
('Philodendron Giganteum Marble Variage ( Dewasa )', 2, 1.4285714285714, 0, 30),
('Alocasia Melo (Dewasa)', 2, 1.4285714285714, 0, 30),
('Alocasia Watsoniana ( Remaja )', 1, 0.71428571428571, 0, 30),
('Alocasia Black Maharani ( Dewasa )', 1, 0.71428571428571, 0, 30),
('Alocasia Reginae Miri ( Remaja )', 18, 12.857142857143, 1, 30),
('Alocasia Golden Bone ( Dewasa )', 1, 0.71428571428571, 0, 30),
('Anii Monstera Adansonii Variegata lokal (Dewasa)', 1, 0.71428571428571, 0, 30),
('Philodendron Paraiso Verde ( Dewasa )', 1, 0.71428571428571, 0, 30),
('Anthurium Jemani ( Bibit )', 2, 1.4285714285714, 0, 30),
('Philodendron Pink Princess ( Dewasa )', 1, 0.71428571428571, 0, 30),
('Alocasia Dragon Silver ( Bibit )', 58, 41.428571428571, 1, 31),
('Alocasia Amazonica ( Bibit )', 50, 35.714285714286, 1, 31),
('Alocasia Black Velvet ( Bibit )', 22, 15.714285714286, 1, 31),
('Alocasia Golden Bone ( Bibit )', 4, 2.8571428571429, 0, 31),
('Philodendron Giganteum Marble Variage ( Dewasa )', 2, 1.4285714285714, 0, 31),
('Alocasia Melo (Dewasa)', 2, 1.4285714285714, 0, 31),
('Alocasia Watsoniana ( Remaja )', 1, 0.71428571428571, 0, 31),
('Alocasia Black Maharani ( Dewasa )', 1, 0.71428571428571, 0, 31),
('Alocasia Reginae Miri ( Remaja )', 18, 12.857142857143, 1, 31),
('Alocasia Golden Bone ( Dewasa )', 1, 0.71428571428571, 0, 31),
('Anii Monstera Adansonii Variegata lokal (Dewasa)', 1, 0.71428571428571, 0, 31),
('Philodendron Paraiso Verde ( Dewasa )', 1, 0.71428571428571, 0, 31),
('Anthurium Jemani ( Bibit )', 2, 1.4285714285714, 0, 31),
('Philodendron Pink Princess ( Dewasa )', 1, 0.71428571428571, 0, 31),
('Alocasia Dragon Silver ( Bibit )', 60, 41.958041958042, 1, 32),
('Alocasia Amazonica ( Bibit )', 51, 35.664335664336, 1, 32),
('Alocasia Black Velvet ( Bibit )', 22, 15.384615384615, 1, 32),
('Alocasia Golden Bone ( Bibit )', 4, 2.7972027972028, 0, 32),
('Philodendron Giganteum Marble Variage ( Dewasa )', 2, 1.3986013986014, 0, 32),
('Alocasia Melo (Dewasa)', 2, 1.3986013986014, 0, 32),
('Alocasia Watsoniana ( Remaja )', 1, 0.6993006993007, 0, 32),
('Alocasia Black Maharani ( Dewasa )', 1, 0.6993006993007, 0, 32),
('Alocasia Reginae Miri ( Remaja )', 18, 12.587412587413, 1, 32),
('Alocasia Golden Bone ( Dewasa )', 1, 0.6993006993007, 0, 32),
('Anii Monstera Adansonii Variegata lokal (Dewasa)', 1, 0.6993006993007, 0, 32),
('Philodendron Paraiso Verde ( Dewasa )', 1, 0.6993006993007, 0, 32),
('Anthurium Jemani ( Bibit )', 2, 1.3986013986014, 0, 32),
('Philodendron Pink Princess ( Dewasa )', 1, 0.6993006993007, 0, 32),
('Alocasia Dragon Silver ( Bibit )', 64, 40.764331210191, 1, 33),
('Alocasia Amazonica ( Bibit )', 57, 36.305732484076, 1, 33),
('Alocasia Black Velvet ( Bibit )', 26, 16.56050955414, 1, 33),
('Alocasia Golden Bone ( Bibit )', 4, 2.5477707006369, 0, 33),
('Philodendron Giganteum Marble Variage ( Dewasa )', 2, 1.2738853503185, 0, 33),
('Alocasia Melo (Dewasa)', 2, 1.2738853503185, 0, 33),
('Alocasia Watsoniana ( Remaja )', 2, 1.2738853503185, 0, 33),
('Alocasia Black Maharani ( Dewasa )', 1, 0.63694267515924, 0, 33),
('Alocasia Reginae Miri ( Remaja )', 21, 13.375796178344, 1, 33),
('Alocasia Golden Bone ( Dewasa )', 2, 1.2738853503185, 0, 33),
('Anii Monstera Adansonii Variegata lokal (Dewasa)', 1, 0.63694267515924, 0, 33),
('Philodendron Paraiso Verde ( Dewasa )', 1, 0.63694267515924, 0, 33),
('Anthurium Jemani ( Bibit )', 2, 1.2738853503185, 0, 33),
('Philodendron Pink Princess ( Dewasa )', 1, 0.63694267515924, 0, 33),
('Alocasia Dragon Silver ( Bibit )', 64, 41.558441558442, 1, 34),
('Alocasia Amazonica ( Bibit )', 54, 35.064935064935, 1, 34),
('Alocasia Black Velvet ( Bibit )', 24, 15.584415584416, 1, 34),
('Alocasia Golden Bone ( Bibit )', 4, 2.5974025974026, 0, 34),
('Philodendron Giganteum Marble Variage ( Dewasa )', 2, 1.2987012987013, 0, 34),
('Alocasia Melo (Dewasa)', 2, 1.2987012987013, 0, 34),
('Alocasia Watsoniana ( Remaja )', 2, 1.2987012987013, 0, 34),
('Alocasia Black Maharani ( Dewasa )', 1, 0.64935064935065, 0, 34),
('Alocasia Reginae Miri ( Remaja )', 20, 12.987012987013, 1, 34),
('Alocasia Golden Bone ( Dewasa )', 2, 1.2987012987013, 0, 34),
('Anii Monstera Adansonii Variegata lokal (Dewasa)', 1, 0.64935064935065, 0, 34),
('Philodendron Paraiso Verde ( Dewasa )', 1, 0.64935064935065, 0, 34),
('Anthurium Jemani ( Bibit )', 2, 1.2987012987013, 0, 34),
('Philodendron Pink Princess ( Dewasa )', 1, 0.64935064935065, 0, 34),
('Alocasia Reginae Miri ( Remaja )', 4, 19.047619047619, 1, 35),
('Alocasia Black Velvet ( Bibit )', 7, 33.333333333333, 1, 35),
('Alocasia Dragon Silver ( Bibit )', 8, 38.095238095238, 1, 35),
('Alocasia Amazonica ( Bibit )', 7, 33.333333333333, 1, 35),
('Alocasia Watsoniana ( Remaja )', 1, 4.7619047619048, 0, 35),
('Alocasia Golden Bone ( Dewasa )', 1, 4.7619047619048, 0, 35),
('Alocasia Dragon Silver', 58, 51.785714285714, 1, 1),
('Alocasia Amazonica', 64, 57.142857142857, 1, 1),
('Alocasia Black Velvet', 41, 36.607142857143, 1, 1),
('Alocasia Golden Bone', 3, 2.6785714285714, 0, 1),
('Alocasia Reginae Miri', 30, 26.785714285714, 1, 1),
('Philodendron Giganteum Marble Variage', 2, 1.7857142857143, 0, 1),
('Alocasia Melo', 2, 1.7857142857143, 0, 1),
('Alocasia Watsoniana', 1, 0.89285714285714, 0, 1),
('Alocasia Black Maharani', 1, 0.89285714285714, 0, 1),
('Monstera Adansonii Variegata (Lokal)', 1, 0.89285714285714, 0, 1),
('Philodendron Paraiso Verde', 1, 0.89285714285714, 0, 1),
('Anthurium Jemani', 1, 0.89285714285714, 0, 1),
('Philodendron White Princess', 1, 0.89285714285714, 0, 1),
('Alocasia Dragon Silver', 58, 51.785714285714, 1, 2),
('Alocasia Amazonica', 64, 57.142857142857, 1, 2),
('Alocasia Black Velvet', 41, 36.607142857143, 1, 2),
('Alocasia Golden Bone', 3, 2.6785714285714, 0, 2),
('Alocasia Reginae Miri', 30, 26.785714285714, 1, 2),
('Philodendron Giganteum Marble Variage', 2, 1.7857142857143, 0, 2),
('Alocasia Melo', 2, 1.7857142857143, 0, 2),
('Alocasia Watsoniana', 1, 0.89285714285714, 0, 2),
('Alocasia Black Maharani', 1, 0.89285714285714, 0, 2),
('Monstera Adansonii Variegata (Lokal)', 1, 0.89285714285714, 0, 2),
('Philodendron Paraiso Verde', 1, 0.89285714285714, 0, 2),
('Anthurium Jemani', 1, 0.89285714285714, 0, 2),
('Philodendron White Princess', 1, 0.89285714285714, 0, 2),
('Alocasia Dragon Silver', 58, 51.785714285714, 1, 3),
('Alocasia Amazonica', 64, 57.142857142857, 1, 3),
('Alocasia Black Velvet', 41, 36.607142857143, 1, 3),
('Alocasia Golden Bone', 3, 2.6785714285714, 0, 3),
('Alocasia Reginae Miri', 30, 26.785714285714, 1, 3),
('Philodendron Giganteum Marble Variage', 2, 1.7857142857143, 0, 3),
('Alocasia Melo', 2, 1.7857142857143, 0, 3),
('Alocasia Watsoniana', 1, 0.89285714285714, 0, 3),
('Alocasia Black Maharani', 1, 0.89285714285714, 0, 3),
('Monstera Adansonii Variegata (Lokal)', 1, 0.89285714285714, 0, 3),
('Philodendron Paraiso Verde', 1, 0.89285714285714, 0, 3),
('Anthurium Jemani', 1, 0.89285714285714, 0, 3),
('Philodendron White Princess', 1, 0.89285714285714, 0, 3),
('Alocasia Dragon Silver', 57, 50.442477876106, 1, 4),
('Alocasia Black Velvet', 39, 34.513274336283, 1, 4),
('Alocasia Amazonica', 65, 57.522123893805, 1, 4),
('Alocasia Golden Bone', 3, 2.6548672566372, 0, 4),
('Alocasia Reginae Miri', 30, 26.548672566372, 1, 4),
('Philodendron Giganteum Marble Variage', 2, 1.7699115044248, 0, 4),
('Alocasia Melo', 2, 1.7699115044248, 0, 4),
('Alocasia Watsoniana', 1, 0.88495575221239, 0, 4),
('Alocasia Black Maharani', 1, 0.88495575221239, 0, 4),
('Monstera Adansonii Variegata (Lokal)', 1, 0.88495575221239, 0, 4),
('Anthurium Jemani', 1, 0.88495575221239, 0, 4),
('Philodendron White Princess', 1, 0.88495575221239, 0, 4),
('Alocasia Dragon Silver', 57, 50.442477876106, 1, 5),
('Alocasia Black Velvet', 39, 34.513274336283, 1, 5),
('Alocasia Amazonica', 65, 57.522123893805, 1, 5),
('Alocasia Golden Bone', 3, 2.6548672566372, 0, 5),
('Alocasia Reginae Miri', 30, 26.548672566372, 1, 5),
('Philodendron Giganteum Marble Variage', 2, 1.7699115044248, 0, 5),
('Alocasia Melo', 2, 1.7699115044248, 0, 5),
('Alocasia Watsoniana', 1, 0.88495575221239, 0, 5),
('Alocasia Black Maharani', 1, 0.88495575221239, 0, 5),
('Monstera Adansonii Variegata (Lokal)', 1, 0.88495575221239, 0, 5),
('Anthurium Jemani', 1, 0.88495575221239, 0, 5),
('Philodendron White Princess', 1, 0.88495575221239, 0, 5),
('Alocasia Dragon Silver', 57, 50, 1, 6),
('Alocasia Black Velvet', 39, 34.210526315789, 1, 6),
('Alocasia Amazonica', 65, 57.017543859649, 1, 6),
('Alocasia Golden Bone', 3, 2.6315789473684, 0, 6),
('Alocasia Reginae Miri', 30, 26.315789473684, 1, 6),
('Philodendron Giganteum Marble Variage', 2, 1.7543859649123, 0, 6),
('Alocasia Melo', 2, 1.7543859649123, 0, 6),
('Alocasia Watsoniana', 2, 1.7543859649123, 0, 6),
('Alocasia Black Maharani', 1, 0.87719298245614, 0, 6),
('Monstera Adansonii Variegata (Lokal)', 1, 0.87719298245614, 0, 6),
('Anthurium Jemani', 1, 0.87719298245614, 0, 6),
('Philodendron White Princess', 1, 0.87719298245614, 0, 6),
('Alocasia Dragon Silver', 57, 50, 1, 7),
('Alocasia Black Velvet', 39, 34.210526315789, 1, 7),
('Alocasia Amazonica', 65, 57.017543859649, 1, 7),
('Alocasia Golden Bone', 3, 2.6315789473684, 0, 7),
('Alocasia Reginae Miri', 30, 26.315789473684, 1, 7),
('Philodendron Giganteum Marble Variage', 2, 1.7543859649123, 0, 7),
('Alocasia Melo', 2, 1.7543859649123, 0, 7),
('Alocasia Watsoniana', 2, 1.7543859649123, 0, 7),
('Alocasia Black Maharani', 1, 0.87719298245614, 0, 7),
('Monstera Adansonii Variegata (Lokal)', 1, 0.87719298245614, 0, 7),
('Anthurium Jemani', 1, 0.87719298245614, 0, 7),
('Philodendron White Princess', 1, 0.87719298245614, 0, 7),
('Alocasia Dragon Silver', 56, 49.557522123894, 1, 8),
('Alocasia Black Velvet', 39, 34.513274336283, 1, 8),
('Alocasia Amazonica', 65, 57.522123893805, 1, 8),
('Alocasia Golden Bone', 3, 2.6548672566372, 0, 8),
('Alocasia Reginae Miri', 30, 26.548672566372, 1, 8),
('Philodendron Giganteum Marble Variage', 2, 1.7699115044248, 0, 8),
('Alocasia Melo', 2, 1.7699115044248, 0, 8),
('Alocasia Watsoniana', 2, 1.7699115044248, 0, 8),
('Alocasia Black Maharani', 1, 0.88495575221239, 0, 8),
('Monstera Adansonii Variegata (Lokal)', 1, 0.88495575221239, 0, 8),
('Anthurium Jemani', 1, 0.88495575221239, 0, 8),
('Philodendron White Princess', 1, 0.88495575221239, 0, 8);

-- --------------------------------------------------------

--
-- Table structure for table `itemset2`
--

CREATE TABLE `itemset2` (
  `atribut1` varchar(200) DEFAULT NULL,
  `atribut2` varchar(200) DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `support` double DEFAULT NULL,
  `lolos` tinyint DEFAULT NULL,
  `id_process` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itemset2`
--

INSERT INTO `itemset2` (`atribut1`, `atribut2`, `jumlah`, `support`, `lolos`, `id_process`) VALUES
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Golden Bone ( Bibit )', 3, 21.428571428571, 0, 9),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 4, 13.793103448276, 0, 12),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 4, 13.333333333333, 0, 13),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 4, 12.5, 0, 14),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 5, 14.705882352941, 1, 15),
('Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 4, 11.764705882353, 1, 15),
('Alocasia Amazonica ( Bibit )', 'Alocasia Golden Bone ( Bibit )', 1, 2.9411764705882, 0, 15),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 2, 5.8823529411765, 0, 15),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Golden Bone ( Bibit )', 3, 8.8235294117647, 0, 15),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Golden Bone ( Bibit )', 0, 0, 0, 15),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 5, 13.513513513514, 1, 16),
('Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 4, 10.810810810811, 1, 16),
('Alocasia Amazonica ( Bibit )', 'Alocasia Golden Bone ( Bibit )', 1, 2.7027027027027, 0, 16),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 3, 8.1081081081081, 0, 16),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Golden Bone ( Bibit )', 3, 8.1081081081081, 0, 16),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Golden Bone ( Bibit )', 0, 0, 0, 16),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 5, 12.5, 1, 17),
('Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 4, 10, 1, 17),
('Alocasia Amazonica ( Bibit )', 'Alocasia Golden Bone ( Bibit )', 3, 7.5, 0, 17),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 3, 7.5, 0, 17),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Golden Bone ( Bibit )', 3, 7.5, 0, 17),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Golden Bone ( Bibit )', 0, 0, 0, 17),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 6, 13.953488372093, 1, 18),
('Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 4, 9.3023255813953, 0, 18),
('Alocasia Amazonica ( Bibit )', 'Alocasia Golden Bone ( Bibit )', 3, 6.9767441860465, 0, 18),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 3, 6.9767441860465, 0, 18),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Golden Bone ( Bibit )', 3, 6.9767441860465, 0, 18),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Golden Bone ( Bibit )', 0, 0, 0, 18),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 6, 13.333333333333, 1, 19),
('Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 4, 8.8888888888889, 0, 19),
('Alocasia Amazonica ( Bibit )', 'Alocasia Golden Bone ( Bibit )', 4, 8.8888888888889, 0, 19),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 3, 6.6666666666667, 0, 19),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Golden Bone ( Bibit )', 3, 6.6666666666667, 0, 19),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Golden Bone ( Bibit )', 0, 0, 0, 19),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 1, 6.25, 1, 20),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 1, 6.25, 1, 20),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Golden Bone ( Bibit )', 0, 0, 0, 20),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Amazonica ( Bibit )', 0, 0, 0, 20),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Golden Bone ( Bibit )', 0, 0, 0, 20),
('Alocasia Amazonica ( Bibit )', 'Alocasia Golden Bone ( Bibit )', 0, 0, 0, 20),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 4, 11.428571428571, 1, 21),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 3, 8.5714285714286, 0, 21),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Amazonica ( Bibit )', 2, 5.7142857142857, 0, 21),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 4, 8, 0, 22),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 5, 10, 1, 22),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Amazonica ( Bibit )', 3, 6, 0, 22),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 7, 9.3333333333333, 1, 23),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 4, 5.3333333333333, 1, 23),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 23),
('Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 3, 4, 0, 23),
('Alocasia Amazonica ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 23),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 23),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 9, 8.9108910891089, 1, 24),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 6, 5.9405940594059, 1, 24),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 24),
('Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 4, 3.960396039604, 0, 24),
('Alocasia Amazonica ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 24),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 24),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 12, 9.0225563909774, 0, 25),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 7, 5.2631578947368, 0, 25),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 25),
('Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 5, 3.7593984962406, 0, 25),
('Alocasia Amazonica ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 25),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 25),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 12, 9.0225563909774, 1, 26),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 7, 5.2631578947368, 1, 26),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 26),
('Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 5, 3.7593984962406, 0, 26),
('Alocasia Amazonica ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 26),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 26),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 12, 9.0225563909774, 1, 27),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 7, 5.2631578947368, 1, 27),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 27),
('Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 5, 3.7593984962406, 0, 27),
('Alocasia Amazonica ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 27),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 27),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 12, 8.695652173913, 1, 28),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 8, 5.7971014492754, 1, 28),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 28),
('Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 5, 3.6231884057971, 0, 28),
('Alocasia Amazonica ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 28),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 28),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 12, 8.5714285714286, 1, 29),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 9, 6.4285714285714, 1, 29),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 29),
('Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 5, 3.5714285714286, 0, 29),
('Alocasia Amazonica ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 29),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 29),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 12, 8.5714285714286, 1, 30),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 9, 6.4285714285714, 1, 30),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 30),
('Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 5, 3.5714285714286, 1, 30),
('Alocasia Amazonica ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 30),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 30),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 12, 8.5714285714286, 1, 31),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 9, 6.4285714285714, 1, 31),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 31),
('Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 5, 3.5714285714286, 0, 31),
('Alocasia Amazonica ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 31),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 31),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 12, 8.3916083916084, 1, 32),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 9, 6.2937062937063, 1, 32),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 32),
('Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 5, 3.4965034965035, 0, 32),
('Alocasia Amazonica ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 32),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 32),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 14, 8.9171974522293, 1, 33),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 9, 5.7324840764331, 1, 33),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 33),
('Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 7, 4.4585987261146, 0, 33),
('Alocasia Amazonica ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 1, 0.63694267515924, 0, 33),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 1, 0.63694267515924, 0, 33),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 14, 9.0909090909091, 1, 34),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 9, 5.8441558441558, 1, 34),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 34),
('Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 5, 3.2467532467532, 0, 34),
('Alocasia Amazonica ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 34),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Reginae Miri ( Remaja )', 0, 0, 0, 34),
('Alocasia Reginae Miri ( Remaja )', 'Alocasia Black Velvet ( Bibit )', 1, 4.7619047619048, 0, 35),
('Alocasia Reginae Miri ( Remaja )', 'Alocasia Dragon Silver ( Bibit )', 0, 0, 0, 35),
('Alocasia Reginae Miri ( Remaja )', 'Alocasia Amazonica ( Bibit )', 1, 4.7619047619048, 0, 35),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 2, 9.5238095238095, 1, 35),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Amazonica ( Bibit )', 2, 9.5238095238095, 1, 35),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 2, 9.5238095238095, 1, 35),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 26, 23.214285714286, 1, 1),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 27, 24.107142857143, 1, 1),
('Alocasia Dragon Silver', 'Alocasia Reginae Miri', 4, 3.5714285714286, 0, 1),
('Alocasia Amazonica', 'Alocasia Black Velvet', 20, 17.857142857143, 1, 1),
('Alocasia Amazonica', 'Alocasia Reginae Miri', 24, 21.428571428571, 1, 1),
('Alocasia Black Velvet', 'Alocasia Reginae Miri', 2, 1.7857142857143, 0, 1),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 26, 23.214285714286, 1, 2),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 27, 24.107142857143, 1, 2),
('Alocasia Dragon Silver', 'Alocasia Reginae Miri', 4, 3.5714285714286, 0, 2),
('Alocasia Amazonica', 'Alocasia Black Velvet', 20, 17.857142857143, 1, 2),
('Alocasia Amazonica', 'Alocasia Reginae Miri', 24, 21.428571428571, 1, 2),
('Alocasia Black Velvet', 'Alocasia Reginae Miri', 2, 1.7857142857143, 0, 2),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 26, 23.214285714286, 1, 3),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 27, 24.107142857143, 1, 3),
('Alocasia Dragon Silver', 'Alocasia Reginae Miri', 4, 3.5714285714286, 0, 3),
('Alocasia Amazonica', 'Alocasia Black Velvet', 20, 17.857142857143, 1, 3),
('Alocasia Amazonica', 'Alocasia Reginae Miri', 24, 21.428571428571, 1, 3),
('Alocasia Black Velvet', 'Alocasia Reginae Miri', 2, 1.7857142857143, 0, 3),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 26, 23.008849557522, 1, 4),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 25, 22.12389380531, 1, 4),
('Alocasia Dragon Silver', 'Alocasia Reginae Miri', 3, 2.6548672566372, 0, 4),
('Alocasia Black Velvet', 'Alocasia Amazonica', 20, 17.699115044248, 1, 4),
('Alocasia Black Velvet', 'Alocasia Reginae Miri', 0, 0, 0, 4),
('Alocasia Amazonica', 'Alocasia Reginae Miri', 23, 20.353982300885, 1, 4),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 26, 23.008849557522, 1, 5),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 25, 22.12389380531, 1, 5),
('Alocasia Dragon Silver', 'Alocasia Reginae Miri', 3, 2.6548672566372, 0, 5),
('Alocasia Black Velvet', 'Alocasia Amazonica', 20, 17.699115044248, 1, 5),
('Alocasia Black Velvet', 'Alocasia Reginae Miri', 0, 0, 0, 5),
('Alocasia Amazonica', 'Alocasia Reginae Miri', 23, 20.353982300885, 1, 5),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 26, 22.80701754386, 1, 6),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 25, 21.929824561404, 1, 6),
('Alocasia Dragon Silver', 'Alocasia Reginae Miri', 3, 2.6315789473684, 0, 6),
('Alocasia Black Velvet', 'Alocasia Amazonica', 20, 17.543859649123, 1, 6),
('Alocasia Black Velvet', 'Alocasia Reginae Miri', 0, 0, 0, 6),
('Alocasia Amazonica', 'Alocasia Reginae Miri', 23, 20.175438596491, 1, 6),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 26, 22.80701754386, 1, 7),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 25, 21.929824561404, 1, 7),
('Alocasia Dragon Silver', 'Alocasia Reginae Miri', 3, 2.6315789473684, 0, 7),
('Alocasia Black Velvet', 'Alocasia Amazonica', 20, 17.543859649123, 1, 7),
('Alocasia Black Velvet', 'Alocasia Reginae Miri', 0, 0, 0, 7),
('Alocasia Amazonica', 'Alocasia Reginae Miri', 23, 20.175438596491, 1, 7),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 26, 23.008849557522, 1, 8),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 25, 22.12389380531, 1, 8),
('Alocasia Dragon Silver', 'Alocasia Reginae Miri', 3, 2.6548672566372, 0, 8),
('Alocasia Black Velvet', 'Alocasia Amazonica', 20, 17.699115044248, 1, 8),
('Alocasia Black Velvet', 'Alocasia Reginae Miri', 0, 0, 0, 8),
('Alocasia Amazonica', 'Alocasia Reginae Miri', 23, 20.353982300885, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `itemset3`
--

CREATE TABLE `itemset3` (
  `atribut1` varchar(200) DEFAULT NULL,
  `atribut2` varchar(200) DEFAULT NULL,
  `atribut3` varchar(200) DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `support` double DEFAULT NULL,
  `lolos` tinyint DEFAULT NULL,
  `id_process` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itemset3`
--

INSERT INTO `itemset3` (`atribut1`, `atribut2`, `atribut3`, `jumlah`, `support`, `lolos`, `id_process`) VALUES
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 2, 5.8823529411765, 0, 15),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 2, 5.4054054054054, 0, 16),
('Alocasia Amazonica ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 2, 5, 0, 17),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 'Alocasia Amazonica ( Bibit )', 0, 0, 0, 20),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 1, 1.3333333333333, 0, 23),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 2, 1.980198019802, 0, 24),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 2, 1.5037593984962, 0, 26),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 2, 1.5037593984962, 0, 27),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 2, 1.4492753623188, 0, 28),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 2, 1.4285714285714, 0, 29),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 2, 1.4285714285714, 0, 30),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 2, 1.4285714285714, 0, 31),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 2, 1.3986013986014, 0, 32),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 2, 1.2738853503185, 0, 33),
('Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 'Alocasia Black Velvet ( Bibit )', 2, 1.2987012987013, 0, 34),
('Alocasia Black Velvet ( Bibit )', 'Alocasia Dragon Silver ( Bibit )', 'Alocasia Amazonica ( Bibit )', 0, 0, 0, 35),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 'Alocasia Black Velvet', 7, 6.25, 0, 1),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 'Alocasia Reginae Miri', 1, 0.89285714285714, 0, 1),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 'Alocasia Reginae Miri', 0, 0, 0, 1),
('Alocasia Amazonica', 'Alocasia Black Velvet', 'Alocasia Reginae Miri', 2, 1.7857142857143, 0, 1),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 'Alocasia Black Velvet', 7, 6.25, 0, 2),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 'Alocasia Reginae Miri', 1, 0.89285714285714, 0, 2),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 'Alocasia Reginae Miri', 0, 0, 0, 2),
('Alocasia Amazonica', 'Alocasia Black Velvet', 'Alocasia Reginae Miri', 2, 1.7857142857143, 0, 2),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 'Alocasia Black Velvet', 7, 6.25, 0, 3),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 'Alocasia Reginae Miri', 1, 0.89285714285714, 0, 3),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 'Alocasia Reginae Miri', 0, 0, 0, 3),
('Alocasia Amazonica', 'Alocasia Black Velvet', 'Alocasia Reginae Miri', 2, 1.7857142857143, 0, 3),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 'Alocasia Amazonica', 7, 6.1946902654867, 0, 4),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 'Alocasia Reginae Miri', 1, 0.88495575221239, 0, 4),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 'Alocasia Reginae Miri', 0, 0, 0, 4),
('Alocasia Amazonica', 'Alocasia Black Velvet', 'Alocasia Reginae Miri', 0, 0, 0, 4),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 'Alocasia Amazonica', 7, 6.1946902654867, 0, 5),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 'Alocasia Reginae Miri', 1, 0.88495575221239, 0, 5),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 'Alocasia Reginae Miri', 0, 0, 0, 5),
('Alocasia Amazonica', 'Alocasia Black Velvet', 'Alocasia Reginae Miri', 0, 0, 0, 5),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 'Alocasia Amazonica', 7, 6.140350877193, 0, 6),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 'Alocasia Reginae Miri', 1, 0.87719298245614, 0, 6),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 'Alocasia Reginae Miri', 0, 0, 0, 6),
('Alocasia Amazonica', 'Alocasia Black Velvet', 'Alocasia Reginae Miri', 0, 0, 0, 6),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 'Alocasia Amazonica', 7, 6.140350877193, 0, 7),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 'Alocasia Reginae Miri', 1, 0.87719298245614, 0, 7),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 'Alocasia Reginae Miri', 0, 0, 0, 7),
('Alocasia Amazonica', 'Alocasia Black Velvet', 'Alocasia Reginae Miri', 0, 0, 0, 7),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 'Alocasia Amazonica', 7, 6.1946902654867, 1, 8),
('Alocasia Dragon Silver', 'Alocasia Amazonica', 'Alocasia Reginae Miri', 1, 0.88495575221239, 0, 8),
('Alocasia Dragon Silver', 'Alocasia Black Velvet', 'Alocasia Reginae Miri', 0, 0, 0, 8),
('Alocasia Amazonica', 'Alocasia Black Velvet', 'Alocasia Reginae Miri', 0, 0, 0, 8);

-- --------------------------------------------------------

--
-- Table structure for table `process_log`
--

CREATE TABLE `process_log` (
  `id` int NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `min_support` double DEFAULT NULL,
  `min_confidence` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `process_log`
--

INSERT INTO `process_log` (`id`, `start_date`, `end_date`, `min_support`, `min_confidence`) VALUES
(1, '2021-12-03', '2022-05-30', 10, 40),
(2, '2021-12-03', '2022-06-23', 10, 40),
(3, '2021-12-03', '2022-06-24', 10, 40),
(4, '2021-12-03', '2022-06-24', 10, 40),
(5, '2021-12-03', '2022-09-03', 10, 40),
(6, '2021-12-03', '2022-09-03', 10, 40),
(7, '2021-12-03', '2022-09-10', 10, 40),
(8, '2021-10-14', '2022-10-14', 4, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bulan`
--

CREATE TABLE `tbl_bulan` (
  `id_bulan` int NOT NULL,
  `bulan` char(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `id_produk` int NOT NULL,
  `produk` char(90) NOT NULL,
  `harga` char(90) NOT NULL,
  `foto` char(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_produk`
--

INSERT INTO `tbl_produk` (`id_produk`, `produk`, `harga`, `foto`) VALUES
(1, 'Philodendron Florida Beauty Variegated', '1000000', 'WhatsApp Image 2022-04-10 at 13.45.50.jpeg'),
(2, 'Philodendron White Knight', '500000', 'WhatsApp Image 2022-04-10 at 13.46.26.jpeg'),
(3, 'Philodendron Paraiso Verde', '400000', 'WhatsApp Image 2022-04-10 at 13.49.22.jpeg'),
(4, 'Philodendron Giganteum Marble Variage', '200000', 'WhatsApp Image 2022-04-10 at 13.49.35.jpeg'),
(5, 'Philodendron Burle Mark Varigata', '450000', 'WhatsApp Image 2022-04-10 at 14.40.44 (1).jpeg'),
(6, 'Philodendron White Princess', '250000', 'WhatsApp Image 2022-04-10 at 13.47.47.jpeg'),
(7, 'Philodendron Jose Buono', '500000', 'WhatsApp Image 2022-04-10 at 13.47.05.jpeg'),
(8, 'Anthurium Jemani', '100.000', 'WhatsApp Image 2022-04-10 at 13.48.54 (1).jpeg'),
(9, 'Monstera Adansonii Variegata (Lokal)', '500000', 'WhatsApp Image 2022-04-10 at 13.50.05.jpeg'),
(10, 'Alocasia Black Velvet', '100000', 'WhatsApp Image 2022-04-10 at 14.04.09 (1).jpeg'),
(11, 'Alocasia Dragon Silver', '150000', 'WhatsApp Image 2022-04-10 at 14.06.14.jpeg'),
(12, 'Alocasia Golden Bone', '600000', 'WhatsApp Image 2022-04-10 at 14.34.11.jpeg'),
(13, 'Alocasia Reginae Miri', '500000', 'WhatsApp Image 2022-04-10 at 14.34.46.jpeg'),
(14, 'Alocasia Black Maharani', '200000', 'WhatsApp Image 2022-04-10 at 14.35.01 (1).jpeg'),
(15, 'Alocasia Melo', '200000', 'WhatsApp Image 2022-05-29 at 11.11.52.jpeg'),
(16, 'Alocasia Amazonica', '100000', 'WhatsApp Image 2022-04-10 at 14.41.09 (1).jpeg'),
(17, 'Alocasia Watsoniana', '150000', 'WhatsApp Image 2022-04-10 at 14.36.57 (2).jpeg'),
(18, 'Alocasia Silver Streak', '500000', 'WhatsApp Image 2022-04-10 at 14.04.32.jpeg'),
(19, 'Alocasia Epip Varigata', '200000', 'WhatsApp Image 2022-04-10 at 14.39.09.jpeg'),
(20, 'Alocasia Black Velvet Baru', '200000', '10. black velvet.jpg'),
(21, 'testerorrrrrr', '30000000', 'Graduation Day MSIB 2021.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `toko`
--

CREATE TABLE `toko` (
  `id_toko` int NOT NULL,
  `nama` char(25) NOT NULL,
  `noHp` int NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `id` int NOT NULL,
  `transaction_date` date DEFAULT NULL,
  `produk` text,
  `id_bulan` int NOT NULL,
  `tahun` int NOT NULL,
  `jam` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `transaction_date`, `produk`, `id_bulan`, `tahun`, `jam`) VALUES
(1, '2021-12-05', 'Alocasia Dragon Silver', 12, 2021, '08:52:36'),
(2, '2021-12-05', 'Alocasia Dragon Silver', 12, 2021, '10:55:07'),
(3, '2021-12-06', 'Alocasia Dragon Silver', 12, 2021, '11:00:29'),
(4, '2021-12-07', 'Alocasia Black Velvet,Alocasia Amazonica', 12, 2021, '10:30:58'),
(5, '2021-12-08', 'Alocasia Dragon Silver', 12, 2021, '14:00:36'),
(6, '2021-12-08', 'Alocasia Amazonica', 12, 2021, '11:30:59'),
(7, '2021-12-11', 'Alocasia Dragon Silver', 12, 2021, '09:02:39'),
(8, '2021-12-13', 'Alocasia Amazonica', 12, 2021, '09:22:41'),
(9, '2021-12-13', 'Alocasia Golden Bone', 12, 2021, '09:40:31'),
(10, '2022-12-17', 'Alocasia Black Velvet,Alocasia Dragon Silver', 12, 2022, '09:05:03'),
(11, '2021-12-17', 'Alocasia Black Velvet,Alocasia Dragon Silver', 12, 2021, '08:15:30'),
(12, '2022-01-07', 'Alocasia Amazonica,Alocasia Reginae Miri', 12, 2021, '10:50:23'),
(13, '2022-01-08', 'Alocasia Dragon SIlver,Alocasia Black Velvet', 1, 2022, '11:12:59'),
(14, '2022-01-11', 'Alocasia Black Velvet,Alocasia Dragon Silver', 1, 2022, '11:20:25'),
(15, '2022-01-11', 'Alocasia Amazonica', 1, 2022, '09:00:57'),
(16, '2022-01-15', 'Alocasia Reginae Miri,Alocasia Amazonica', 1, 2022, '16:00:24'),
(17, '2022-01-16', 'Alocasia Dragon Silver,Alocasia Black Velvet', 1, 2022, '10:00:35'),
(18, '2022-01-18', 'Alocasia Reginae Miri,Alocasia Amazonica', 1, 2022, '11:10:26'),
(19, '2022-01-20', 'Alocasia Black Velvet,Alocasia Dragon Silver', 1, 2022, '11:10:53'),
(20, '2022-01-22', 'Alocasia Reginae Miri,Alocasia Amazonica', 1, 2022, '15:10:24'),
(21, '2022-01-23', 'Alocasia Dragon Silver,Alocasia Amazonica', 1, 2022, '16:00:04'),
(22, '2022-01-25', 'Alocasia Black Velvet,Alocasia Dragon Silver,Alocasia Amazonica', 1, 2022, '08:10:35'),
(23, '2022-01-25', 'Alocasia Black Velvet,Alocasia Amazonica', 1, 2022, '09:00:11'),
(24, '2022-01-25', 'Philodendron Giganteum Marble Variage', 1, 2022, '09:00:43'),
(25, '2022-01-26', 'Alocasia Black Velvet,Alocasia Dragon Silver', 1, 2022, '11:00:06'),
(26, '2022-01-26', 'Alocasia Black Velvet,Alocasia Amazonica', 1, 2022, '09:45:33'),
(27, '2022-01-27', 'Alocasia Reginae Miri,Alocasia Amazonica', 1, 2022, '11:40:04'),
(28, '2022-01-27', 'Alocasia Melo', 1, 2022, '18:00:38'),
(29, '2022-01-28', 'Alocasia Reginae Miri,Alocasia Amazonica', 1, 2022, '14:22:00'),
(30, '2022-01-30', 'Alocasia Black Velvet,Alocasia Dragon Silver', 1, 2022, '14:30:37'),
(31, '2022-02-03', 'Alocasia Watsoniana', 2, 2022, '17:00:14'),
(32, '2022-02-06', 'Alocasia Reginae Miri', 2, 2022, '14:00:58'),
(33, '2022-02-06', 'Alocasia Black Velvet,Alocasia Amazonica', 2, 2022, '19:10:34'),
(34, '2022-02-07', 'Alocasia Black Velvet,Alocasia Dragon Silver,Alocasia Amazonica', 2, 2022, '14:00:00'),
(35, '2022-02-08', 'Alocasia Dragon Silver,Alocasia Amazonica', 2, 2022, '13:04:34'),
(36, '2022-02-09', 'Alocasia Black Maharani', 2, 2022, '14:00:02'),
(37, '2022-02-10', 'Alocasia Dragon Silver,Alocasia Reginae Miri,Alocasia Amazonica', 2, 2022, '14:00:30'),
(38, '2022-02-11', 'Alocasia Dragon Silver,Alocasia Amazonica', 2, 2022, '08:13:58'),
(39, '2022-02-11', 'Alocasia Reginae Miri', 2, 2022, '09:00:44'),
(40, '2022-02-14', 'Alocasia Reginae Miri,Alocasia Amazonica', 2, 2022, '09:30:11'),
(41, '2022-02-16', 'Alocasia Amazonica', 2, 2022, '09:50:39'),
(42, '2022-02-17', 'Alocasia Black Velvet,Alocasia Dragon Silver,Alocasia Amazonica', 2, 2022, '13:05:21'),
(43, '2022-02-19', 'Alocasia Reginae Miri', 2, 2022, '13:19:53'),
(44, '2022-02-21', 'Alocasia Black Velvet,Alocasia Dragon Silver', 2, 2022, '13:08:28'),
(45, '2022-02-25', 'Alocasia Black Velvet,Alocasia Amazonica', 2, 2022, '13:40:52'),
(46, '2022-03-01', 'Alocasia Golden Bone', 3, 2022, '09:30:15'),
(47, '2022-03-01', 'Alocasia Black Velvet,Alocasia Amazonica', 3, 2022, '16:40:37'),
(48, '2022-03-02', 'Alocasia Black Velvet,Alocasia Dragon Silver', 3, 2022, '17:00:01'),
(49, '2022-03-03', 'Alocasia Dragon Silver,Alocasia Amazonica', 3, 2022, '09:45:29'),
(50, '2022-03-05', 'Alocasia Black Velvet,Alocasia Dragon Silver', 3, 2022, '17:10:01'),
(52, '2022-03-07', 'Alocasia Black Velvet,Alocasia Dragon Silver', 3, 2022, '17:00:54'),
(53, '2022-03-09', 'Alocasia Dragon Silver,Alocasia Amazonica', 3, 2022, '13:00:41'),
(54, '2022-03-10', 'Alocasia Dragon Silver,Alocasia Amazonica', 3, 2022, '09:00:12'),
(55, '2022-03-10', 'Alocasia Black Velvet,Alocasia Dragon Silver', 3, 2022, '10:20:37'),
(56, '2022-03-12', 'Alocasia Black Velvet,Alocasia Dragon Silver', 3, 2022, '16:00:03'),
(57, '2022-03-13', 'Alocasia Reginae Miri,Alocasia Amazonica', 3, 2022, '09:18:27'),
(58, '2022-03-14', 'Monstera Adansonii Variegata (Lokal)', 3, 2022, '08:10:52'),
(59, '2022-03-14', 'Alocasia Dragon Silver,Alocasia Amazonica', 3, 2022, '16:50:15'),
(60, '2022-03-15', 'Alocasia Reginae Miri', 3, 2022, '14:20:56'),
(61, '2022-03-17', 'Alocasia Reginae Miri,Alocasia Amazonica', 3, 2022, '08:10:16'),
(62, '2022-03-19', 'Alocasia Reginae Miri,Alocasia Amazonica', 3, 2022, '09:43:09'),
(63, '2022-03-19', 'Alocasia Dragon Silver,Alocasia Amazonica', 3, 2022, '16:40:08'),
(64, '2022-03-21', 'Alocasia Black Velvet,Alocasia Dragon Silver', 3, 2022, '10:00:59'),
(65, '2022-03-23', 'Alocasia Black Velvet,Alocasia Amazonica', 3, 2022, '10:00:36'),
(66, '2022-03-26', 'Alocasia Dragon Silver,Alocasia Amazonica', 3, 2022, '11:10:06'),
(67, '2022-04-01', 'Alocasia Dragon Silver,Alocasia Amazonica', 4, 2022, '10:20:40'),
(68, '2022-04-03', 'Alocasia Reginae Miri,Alocasia Amazonica', 4, 2022, '15:00:05'),
(69, '2022-04-03', 'Alocasia Black Velvet,Alocasia Amazonica', 4, 2022, '14:00:28'),
(70, '2022-04-05', 'Alocasia Reginae Miri', 4, 2022, '08:17:57'),
(71, '2022-04-05', 'Alocasia Reginae Miri,Alocasia Amazonica', 4, 2022, '10:48:19'),
(73, '2022-04-06', 'Alocasia Reginae Miri,Alocasia Amazonica', 4, 2022, '09:00:28'),
(74, '2022-04-07', 'Alocasia Dragon Silver,Alocasia Amazonica', 4, 2022, '09:08:57'),
(75, '2022-04-11', 'Alocasia Reginae Miri,Alocasia Amazonica', 4, 2022, '11:00:24'),
(76, '2022-04-11', 'Alocasia Dragon Silver,Alocasia Amazonica', 4, 2022, '13:00:47'),
(77, '2022-04-13', 'Alocasia Dragon Silver,Alocasia Amazonica', 4, 2022, '14:00:11'),
(78, '2022-04-14', 'Alocasia Reginae Miri,Alocasia Amazonica', 4, 2022, '08:40:33'),
(79, '2022-04-15', 'Alocasia Dragon Silver', 4, 2022, '14:00:15'),
(80, '2022-04-16', 'Alocasia Reginae Miri,Alocasia Amazonica', 4, 2022, '14:10:38'),
(81, '2022-04-16', 'Alocasia Dragon Silver', 4, 2022, '08:30:43'),
(82, '2022-04-20', 'Alocasia Amazonica', 4, 2022, '10:54:20'),
(83, '2022-04-23', 'Alocasia Dragon Silver', 4, 2022, '09:54:42'),
(84, '2022-04-27', 'Anthurium Jemani', 4, 2022, '10:50:27'),
(85, '2022-05-01', 'Alocasia Black Velvet,Alocasia Dragon Silver,Alocasia Amazonica', 5, 2022, '08:20:55'),
(86, '2022-05-01', 'Alocasia Black Velvet,Alocasia Dragon Silver,Alocasia Amazonica', 5, 2022, '11:20:27'),
(87, '2022-05-02', 'Alocasia Dragon Silver', 5, 2022, '11:01:56'),
(88, '2022-05-03', 'Alocasia Reginae Miri,Alocasia Amazonica', 5, 2022, '14:02:16'),
(89, '2022-05-03', 'Alocasia Dragon Silver,Alocasia Amazonica', 5, 2022, '15:00:47'),
(90, '2022-05-05', 'Alocasia Black Velvet,Alocasia Dragon Silver', 5, 2022, '18:20:19'),
(91, '2022-05-06', 'Alocasia Dragon Silver,Alocasia Amazonica', 5, 2022, '16:40:42'),
(92, '2022-05-07', 'Philodendron White Princess,Alocasia Dragon Silver', 5, 2022, '10:30:06'),
(93, '2022-05-10', 'Alocasia Golden Bone', 5, 2022, '08:10:40'),
(94, '2022-05-11', 'Alocasia Black Velvet,Alocasia Amazonica', 5, 2022, '09:00:16'),
(95, '2022-05-11', 'Alocasia Amazonica,Alocasia Reginae Miri', 5, 2022, '10:11:47'),
(96, '2022-05-13', 'Alocasia Black Velvet,Alocasia Dragon Silver,Alocasia Amazonica', 5, 2022, '09:10:45'),
(97, '2022-05-14', 'Alocasia Reginae Miri,Alocasia Amazonica', 5, 2022, '09:12:26'),
(98, '2022-05-16', 'Alocasia Dragon Silver,Alocasia Reginae Miri', 5, 2022, '09:50:51'),
(99, '2022-05-17', 'Alocasia Black Velvet,Alocasia Dragon Silver', 5, 2022, '09:55:33'),
(100, '2022-05-18', 'Alocasia Reginae Miri,Alocasia Amazonica', 5, 2022, '10:30:57'),
(101, '2022-05-20', 'Alocasia Reginae Miri,Alocasia Amazonica', 5, 2022, '10:15:23'),
(102, '2022-05-20', 'Alocasia Black Velvet,Alocasia Dragon Silver', 5, 2022, '10:50:49'),
(103, '2022-05-20', 'Alocasia Black Velvet,Alocasia Amazonica', 5, 2022, '12:00:11'),
(104, '2022-05-21', 'Alocasia Black Velvet,Alocasia Amazonica', 5, 2022, '07:04:22'),
(105, '2022-05-23', 'Alocasia Dragon Silver,Alocasia Amazonica', 5, 2022, '11:00:04'),
(106, '2022-05-24', 'Alocasia Dragon Silver,Alocasia Amazonica', 5, 2022, '09:00:29'),
(107, '2022-05-24', 'Alocasia Black Velvet,Alocasia Dragon Silver,Alocasia Amazonica', 5, 2022, '08:53:09'),
(108, '2022-05-25', 'Alocasia Black Velvet,Alocasia Amazonica', 5, 2022, '09:36:47'),
(109, '2022-05-25', 'Philodendron Giganteum Marble Variage', 5, 2022, '11:20:07'),
(110, '2022-05-26', 'Alocasia Black Velvet,Alocasia Dragon Silver', 5, 2022, '09:00:09'),
(111, '2022-05-27', 'Alocasia Dragon Silver,Alocasia Reginae Miri', 5, 2022, '10:00:05'),
(112, '2022-05-27', 'Alocasia Melo', 5, 2022, '14:00:33'),
(113, '2022-05-29', 'Alocasia Reginae Miri,Alocasia Amazonica', 5, 2022, '11:20:50'),
(114, '2022-05-30', 'Alocasia Black Velvet,Alocasia Amazonica', 5, 2022, '08:10:09'),
(115, '2022-05-30', 'Alocasia Black Velvet,Alocasia Dragon Silver', 5, 2022, '08:18:39'),
(117, '2022-02-11', 'Alocasia Watsoniana', 2, 2022, '10:00:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(200) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `password` text,
  `level` tinyint NOT NULL DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `inactive` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_bulan`
--
ALTER TABLE `tbl_bulan`
  MODIFY `id_bulan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_produk`
--
ALTER TABLE `tbl_produk`
  MODIFY `id_produk` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `toko`
--
ALTER TABLE `toko`
  MODIFY `id_toko` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
