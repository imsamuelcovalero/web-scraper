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
) ENGINE = InnoDB AUTO_INCREMENT = 78 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
) ENGINE = InnoDB AUTO_INCREMENT = 38 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
    67,
    '256GB',
    50.00,
    '2023-11-24 23:02:14',
    '2023-11-24 23:02:14',
    27
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
    68,
    '256GB',
    50.00,
    '2023-11-24 23:06:49',
    '2023-11-24 23:06:49',
    28
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
    69,
    '256GB',
    50.00,
    '2023-11-25 00:27:27',
    '2023-11-25 00:27:27',
    29
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
    70,
    '256GB',
    50.00,
    '2023-11-25 00:31:27',
    '2023-11-25 00:31:27',
    30
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
    71,
    '256GB',
    50.00,
    '2023-11-25 00:31:55',
    '2023-11-25 00:31:55',
    31
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
    72,
    '256GB',
    50.00,
    '2023-11-25 00:32:12',
    '2023-11-25 00:32:12',
    32
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
    73,
    '256GB',
    50.00,
    '2023-11-25 00:36:48',
    '2023-11-25 00:36:48',
    33
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
    74,
    '256GB',
    50.00,
    '2023-11-25 00:38:40',
    '2023-11-25 00:38:40',
    34
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
    75,
    '256GB',
    50.00,
    '2023-11-25 00:41:08',
    '2023-11-25 00:41:08',
    35
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
    76,
    '256GB',
    50.00,
    '2023-11-25 00:41:57',
    '2023-11-25 00:41:57',
    36
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
    77,
    '256GB',
    50.00,
    '2023-11-25 00:42:07',
    '2023-11-25 00:42:07',
    37
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
    27,
    'Test Laptop',
    'A test laptop description',
    999.99,
    '2023-11-24 23:02:14',
    '2023-11-24 23:02:14'
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
    28,
    'Test Laptop',
    'A test laptop description',
    999.99,
    '2023-11-24 23:06:49',
    '2023-11-24 23:06:49'
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
    29,
    'Test Laptop',
    'A test laptop description',
    999.99,
    '2023-11-25 00:27:27',
    '2023-11-25 00:27:27'
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
    30,
    'Test Laptop',
    'A test laptop description',
    999.99,
    '2023-11-25 00:31:27',
    '2023-11-25 00:31:27'
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
    31,
    'Test Laptop',
    'A test laptop description',
    999.99,
    '2023-11-25 00:31:55',
    '2023-11-25 00:31:55'
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
    32,
    'Test Laptop',
    'A test laptop description',
    999.99,
    '2023-11-25 00:32:12',
    '2023-11-25 00:32:12'
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
    33,
    'Test Laptop',
    'A test laptop description',
    999.99,
    '2023-11-25 00:36:48',
    '2023-11-25 00:36:48'
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
    34,
    'Test Laptop',
    'A test laptop description',
    999.99,
    '2023-11-25 00:38:40',
    '2023-11-25 00:38:40'
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
    35,
    'Test Laptop',
    'A test laptop description',
    999.99,
    '2023-11-25 00:41:08',
    '2023-11-25 00:41:08'
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
    36,
    'Test Laptop',
    'A test laptop description',
    999.99,
    '2023-11-25 00:41:57',
    '2023-11-25 00:41:57'
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
    37,
    'Test Laptop',
    'A test laptop description',
    999.99,
    '2023-11-25 00:42:07',
    '2023-11-25 00:42:07'
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
