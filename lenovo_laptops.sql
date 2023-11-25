/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: hddOptions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `hddOptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `size` varchar(255) NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `laptopId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `laptopId` (`laptopId`),
  CONSTRAINT `hddOptions_ibfk_1` FOREIGN KEY (`laptopId`) REFERENCES `laptops` (`id`) ON DELETE
  SET
  NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 61 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: laptops
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `laptops` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `basePrice` decimal(10, 2) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 21 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: hddOptions
# ------------------------------------------------------------

INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    1,
    '128',
    321.94,
    '2023-11-25 16:58:14',
    '2023-11-25 16:58:14',
    1
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    2,
    '256',
    341.94,
    '2023-11-25 16:58:15',
    '2023-11-25 16:58:15',
    1
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    3,
    '512',
    361.94,
    '2023-11-25 16:58:16',
    '2023-11-25 16:58:16',
    1
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    4,
    '128',
    356.49,
    '2023-11-25 16:58:19',
    '2023-11-25 16:58:19',
    2
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    5,
    '256',
    376.49,
    '2023-11-25 16:58:20',
    '2023-11-25 16:58:20',
    2
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    6,
    '512',
    396.49,
    '2023-11-25 16:58:21',
    '2023-11-25 16:58:21',
    2
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    7,
    '128',
    404.23,
    '2023-11-25 16:58:23',
    '2023-11-25 16:58:23',
    3
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    8,
    '256',
    424.23,
    '2023-11-25 16:58:25',
    '2023-11-25 16:58:25',
    3
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    9,
    '512',
    444.23,
    '2023-11-25 16:58:26',
    '2023-11-25 16:58:26',
    3
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    10,
    '128',
    409.63,
    '2023-11-25 16:58:28',
    '2023-11-25 16:58:28',
    4
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    11,
    '256',
    429.63,
    '2023-11-25 16:58:29',
    '2023-11-25 16:58:29',
    4
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    12,
    '512',
    449.63,
    '2023-11-25 16:58:30',
    '2023-11-25 16:58:30',
    4
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    13,
    '128',
    454.73,
    '2023-11-25 16:58:33',
    '2023-11-25 16:58:33',
    5
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    14,
    '256',
    474.73,
    '2023-11-25 16:58:34',
    '2023-11-25 16:58:34',
    5
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    15,
    '512',
    494.73,
    '2023-11-25 16:58:35',
    '2023-11-25 16:58:35',
    5
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    16,
    '128',
    465.95,
    '2023-11-25 16:58:37',
    '2023-11-25 16:58:37',
    6
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    17,
    '256',
    485.95,
    '2023-11-25 16:58:38',
    '2023-11-25 16:58:38',
    6
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    18,
    '512',
    505.95,
    '2023-11-25 16:58:39',
    '2023-11-25 16:58:39',
    6
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    19,
    '128',
    484.23,
    '2023-11-25 16:58:42',
    '2023-11-25 16:58:42',
    7
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    20,
    '256',
    504.23,
    '2023-11-25 16:58:43',
    '2023-11-25 16:58:43',
    7
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    21,
    '512',
    524.23,
    '2023-11-25 16:58:44',
    '2023-11-25 16:58:44',
    7
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    22,
    '128',
    487.80,
    '2023-11-25 16:58:46',
    '2023-11-25 16:58:46',
    8
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    23,
    '256',
    507.80,
    '2023-11-25 16:58:47',
    '2023-11-25 16:58:47',
    8
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    24,
    '512',
    527.80,
    '2023-11-25 16:58:48',
    '2023-11-25 16:58:48',
    8
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    25,
    '128',
    498.23,
    '2023-11-25 16:58:51',
    '2023-11-25 16:58:51',
    9
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    26,
    '256',
    518.23,
    '2023-11-25 16:58:52',
    '2023-11-25 16:58:52',
    9
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    27,
    '512',
    538.23,
    '2023-11-25 16:58:53',
    '2023-11-25 16:58:53',
    9
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    28,
    '128',
    999.00,
    '2023-11-25 16:58:55',
    '2023-11-25 16:58:55',
    10
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    29,
    '256',
    1019.00,
    '2023-11-25 16:58:56',
    '2023-11-25 16:58:56',
    10
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    30,
    '512',
    1039.00,
    '2023-11-25 16:58:57',
    '2023-11-25 16:58:57',
    10
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    31,
    '128',
    1096.02,
    '2023-11-25 16:58:59',
    '2023-11-25 16:58:59',
    11
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    32,
    '256',
    1116.02,
    '2023-11-25 16:59:00',
    '2023-11-25 16:59:00',
    11
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    33,
    '512',
    1136.02,
    '2023-11-25 16:59:01',
    '2023-11-25 16:59:01',
    11
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    34,
    '128',
    1112.91,
    '2023-11-25 16:59:04',
    '2023-11-25 16:59:04',
    12
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    35,
    '256',
    1132.91,
    '2023-11-25 16:59:05',
    '2023-11-25 16:59:05',
    12
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    36,
    '512',
    1152.91,
    '2023-11-25 16:59:06',
    '2023-11-25 16:59:06',
    12
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    37,
    '128',
    1133.91,
    '2023-11-25 16:59:08',
    '2023-11-25 16:59:08',
    13
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    38,
    '256',
    1153.91,
    '2023-11-25 16:59:09',
    '2023-11-25 16:59:09',
    13
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    39,
    '512',
    1173.91,
    '2023-11-25 16:59:10',
    '2023-11-25 16:59:10',
    13
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    40,
    '128',
    1149.00,
    '2023-11-25 16:59:13',
    '2023-11-25 16:59:13',
    14
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    41,
    '256',
    1169.00,
    '2023-11-25 16:59:14',
    '2023-11-25 16:59:14',
    14
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    42,
    '512',
    1189.00,
    '2023-11-25 16:59:15',
    '2023-11-25 16:59:15',
    14
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    43,
    '128',
    1149.73,
    '2023-11-25 16:59:17',
    '2023-11-25 16:59:17',
    15
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    44,
    '256',
    1169.73,
    '2023-11-25 16:59:18',
    '2023-11-25 16:59:18',
    15
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    45,
    '512',
    1189.73,
    '2023-11-25 16:59:19',
    '2023-11-25 16:59:19',
    15
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    46,
    '128',
    1199.73,
    '2023-11-25 16:59:21',
    '2023-11-25 16:59:21',
    16
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    47,
    '256',
    1219.73,
    '2023-11-25 16:59:22',
    '2023-11-25 16:59:22',
    16
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    48,
    '512',
    1239.73,
    '2023-11-25 16:59:23',
    '2023-11-25 16:59:23',
    16
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    49,
    '128',
    1212.16,
    '2023-11-25 16:59:26',
    '2023-11-25 16:59:26',
    17
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    50,
    '256',
    1232.16,
    '2023-11-25 16:59:27',
    '2023-11-25 16:59:27',
    17
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    51,
    '512',
    1252.16,
    '2023-11-25 16:59:28',
    '2023-11-25 16:59:28',
    17
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    52,
    '128',
    1349.23,
    '2023-11-25 16:59:30',
    '2023-11-25 16:59:30',
    18
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    53,
    '256',
    1369.23,
    '2023-11-25 16:59:31',
    '2023-11-25 16:59:31',
    18
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    54,
    '512',
    1389.23,
    '2023-11-25 16:59:32',
    '2023-11-25 16:59:32',
    18
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    55,
    '128',
    1362.24,
    '2023-11-25 16:59:35',
    '2023-11-25 16:59:35',
    19
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    56,
    '256',
    1382.24,
    '2023-11-25 16:59:36',
    '2023-11-25 16:59:36',
    19
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    57,
    '512',
    1402.24,
    '2023-11-25 16:59:37',
    '2023-11-25 16:59:37',
    19
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    58,
    '128',
    1399.00,
    '2023-11-25 16:59:40',
    '2023-11-25 16:59:40',
    20
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    59,
    '256',
    1419.00,
    '2023-11-25 16:59:41',
    '2023-11-25 16:59:41',
    20
  );
INSERT INTO
  `hddOptions` (
    `id`,
    `size`,
    `price`,
    `createdAt`,
    `updatedAt`,
    `laptopId`
  )
VALUES
  (
    60,
    '512',
    1439.00,
    '2023-11-25 16:59:42',
    '2023-11-25 16:59:42',
    20
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: laptops
# ------------------------------------------------------------

INSERT INTO
  `laptops` (
    `id`,
    `title`,
    `description`,
    `basePrice`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    1,
    'Lenovo V110-15IAP',
    'Lenovo V110-15IAP, 15.6\" HD, Celeron N3350 1.1GHz, 4GB, 128GB SSD, Windows 10 Home',
    321.94,
    '2023-11-25 16:58:13',
    '2023-11-25 16:58:13'
  );
INSERT INTO
  `laptops` (
    `id`,
    `title`,
    `description`,
    `basePrice`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    2,
    'Lenovo V110-15IAP',
    'Asus VivoBook 15 X540NA-GQ008T Chocolate Black, 15.6\" HD, Pentium N4200, 4GB, 500GB, Windows 10 Home, En kbd',
    356.49,
    '2023-11-25 16:58:18',
    '2023-11-25 16:58:18'
  );
INSERT INTO
  `laptops` (
    `id`,
    `title`,
    `description`,
    `basePrice`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    3,
    'Lenovo ThinkPad E31-80',
    'Lenovo ThinkPad E31-80, 13.3\" HD, Celeron 3855U 1.6GHz, 4GB, 128GB SSD, Windows 10 Home',
    404.23,
    '2023-11-25 16:58:22',
    '2023-11-25 16:58:22'
  );
INSERT INTO
  `laptops` (
    `id`,
    `title`,
    `description`,
    `basePrice`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    4,
    'Lenovo V110-15ISK',
    'Lenovo V110-15ISK, 15.6\" HD, Core i3-6006U, 8GB, 128GB SSD, Windows 10 Home',
    409.63,
    '2023-11-25 16:58:27',
    '2023-11-25 16:58:27'
  );
INSERT INTO
  `laptops` (
    `id`,
    `title`,
    `description`,
    `basePrice`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    5,
    'Lenovo V110-15ISK',
    'Lenovo V110-15ISK, 15.6\" HD, Core i3-6006U, 4GB, 128GB SSD, Windows 10 Pro',
    454.73,
    '2023-11-25 16:58:32',
    '2023-11-25 16:58:32'
  );
INSERT INTO
  `laptops` (
    `id`,
    `title`,
    `description`,
    `basePrice`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    6,
    'Lenovo V110-15IKB',
    'Lenovo V110-15IKB, 15.6\" HD, Core i5-7200U, 4GB, 500GB, DOS',
    465.95,
    '2023-11-25 16:58:36',
    '2023-11-25 16:58:36'
  );
INSERT INTO
  `laptops` (
    `id`,
    `title`,
    `description`,
    `basePrice`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    7,
    'Lenovo V510 Black',
    'Lenovo V510 Black, 14\" HD, Core i3-6006U, 4GB, 128GB SSD, Windows 10 Home',
    484.23,
    '2023-11-25 16:58:41',
    '2023-11-25 16:58:41'
  );
INSERT INTO
  `laptops` (
    `id`,
    `title`,
    `description`,
    `basePrice`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    8,
    'Lenovo V510 Black',
    'Lenovo V510 Black, 15.6\" HD, Core i3-6006U, 4GB, 128GB SSD, Windows 10 Home',
    487.80,
    '2023-11-25 16:58:45',
    '2023-11-25 16:58:45'
  );
INSERT INTO
  `laptops` (
    `id`,
    `title`,
    `description`,
    `basePrice`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    9,
    'Lenovo V510 Black',
    'Lenovo V510 Black, 15.6\" FHD, Core i3-7100U, 4GB, 128GB SSD, Windows 10 Pro',
    498.23,
    '2023-11-25 16:58:50',
    '2023-11-25 16:58:50'
  );
INSERT INTO
  `laptops` (
    `id`,
    `title`,
    `description`,
    `basePrice`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    10,
    'Lenovo ThinkPad L570',
    'Lenovo ThinkPad L570, 15.6\" FHD, Core i7-7500U, 8GB, 256GB SSD, Windows 10 Pro',
    999.00,
    '2023-11-25 16:58:54',
    '2023-11-25 16:58:54'
  );
INSERT INTO
  `laptops` (
    `id`,
    `title`,
    `description`,
    `basePrice`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    11,
    'Lenovo ThinkPad L460',
    'Lenovo ThinkPad L460, 14\" FHD IPS, Core i7-6600U, 8GB, 256GB SSD, Windows 10 Pro',
    1096.02,
    '2023-11-25 16:58:58',
    '2023-11-25 16:58:58'
  );
INSERT INTO
  `laptops` (
    `id`,
    `title`,
    `description`,
    `basePrice`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    12,
    'Lenovo Legion Y520-15IKBM',
    'Lenovo Legion Y520-15IKBM, Black, 15.6\" FHD IPS, Core i5-7300HQ, 8 GB, 128GB SSD + 2 TB HDD, NVIDIA GeForce GTX 1060 6 GB, FreeDOS + Windows 10 Home',
    1112.91,
    '2023-11-25 16:59:03',
    '2023-11-25 16:59:03'
  );
INSERT INTO
  `laptops` (
    `id`,
    `title`,
    `description`,
    `basePrice`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    13,
    'Lenovo Legion Y520',
    'Lenovo Legion Y520, 15.6\" FHD, Core i7-7700HQ, 8GB, 128 GB SSD + 1TB HDD, GTX 1050 4GB, Windows 10 Home',
    1133.91,
    '2023-11-25 16:59:07',
    '2023-11-25 16:59:07'
  );
INSERT INTO
  `laptops` (
    `id`,
    `title`,
    `description`,
    `basePrice`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    14,
    'Lenovo Legion Y520-15IKBM',
    'Lenovo Legion Y520-15IKBM, 15.6\" FHD IPS, Core i7-7700HQ, 8GB, 128GB SSD + 1TB, GeForce GTX 1060 Max-Q 6GB, DOS',
    1149.00,
    '2023-11-25 16:59:12',
    '2023-11-25 16:59:12'
  );
INSERT INTO
  `laptops` (
    `id`,
    `title`,
    `description`,
    `basePrice`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    15,
    'Lenovo Yoga 720 Grey',
    'Lenovo Yoga 720 Grey, 15.6\" FHD IPS, Core i5-7300HQ, 8GB, 256GB SSD, GeForce GTX 1050 2GB, Windows 10 Home',
    1149.73,
    '2023-11-25 16:59:16',
    '2023-11-25 16:59:16'
  );
INSERT INTO
  `laptops` (
    `id`,
    `title`,
    `description`,
    `basePrice`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    16,
    'Lenovo Yoga 910 Grey',
    'Lenovo Yoga 910 Grey, 13.9\" FHD Touch, Core i5-7200U, 8GB, 256GB SSD, Windows 10 Home',
    1199.73,
    '2023-11-25 16:59:20',
    '2023-11-25 16:59:20'
  );
INSERT INTO
  `laptops` (
    `id`,
    `title`,
    `description`,
    `basePrice`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    17,
    'Lenovo IdeaPad Miix 510 Platinum Silver',
    'Lenovo IdeaPad Miix 510 Platinum Silver, 12.2\" IPS Touch, Core i5-7200U, 8GB, 256GB SSD, 4G, Windows 10 Pro',
    1212.16,
    '2023-11-25 16:59:25',
    '2023-11-25 16:59:25'
  );
INSERT INTO
  `laptops` (
    `id`,
    `title`,
    `description`,
    `basePrice`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    18,
    'Lenovo ThinkPad T470',
    'Lenovo ThinkPad T470, 14\" FHD IPS, Core i5-7200U, 8GB, 256GB SSD, Windows 10 Pro',
    1349.23,
    '2023-11-25 16:59:29',
    '2023-11-25 16:59:29'
  );
INSERT INTO
  `laptops` (
    `id`,
    `title`,
    `description`,
    `basePrice`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    19,
    'Lenovo ThinkPad Yoga 370 Black',
    'Lenovo ThinkPad Yoga 370 Black, 13.3\" FHD IPS Touch, Core i5-7200U, 8GB, 256GB SSD, 4G, Windows 10 Pro',
    1362.24,
    '2023-11-25 16:59:34',
    '2023-11-25 16:59:34'
  );
INSERT INTO
  `laptops` (
    `id`,
    `title`,
    `description`,
    `basePrice`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    20,
    'Lenovo Legion Y720',
    'Lenovo Legion Y720, 15.6\" FHD IPS, Core i7-7700HQ, 8GB, 128GB SSD + 2TB HDD, GeForce GTX 1060 6GB, DOS, RGB backlit keyboard',
    1399.00,
    '2023-11-25 16:59:38',
    '2023-11-25 16:59:38'
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
