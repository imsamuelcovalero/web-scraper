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
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
    '2023-11-24 20:55:48',
    '2023-11-24 20:55:48',
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
    '2023-11-24 20:55:49',
    '2023-11-24 20:55:49',
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
    '2023-11-24 20:55:50',
    '2023-11-24 20:55:50',
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
    '2023-11-24 20:55:52',
    '2023-11-24 20:55:52',
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
    '2023-11-24 20:55:53',
    '2023-11-24 20:55:53',
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
    '2023-11-24 20:55:54',
    '2023-11-24 20:55:54',
    2
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
    '2023-11-24 20:55:47',
    '2023-11-24 20:55:47'
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
    '2023-11-24 20:55:51',
    '2023-11-24 20:55:51'
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
    '2023-11-24 20:55:55',
    '2023-11-24 20:55:55'
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
