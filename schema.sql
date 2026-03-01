-- SSM-Library Database Schema
-- MySQL 5.7+

CREATE DATABASE IF NOT EXISTS `ssmbuild` DEFAULT CHARACTER SET utf8;
USE `ssmbuild`;

CREATE TABLE IF NOT EXISTS `books` (
    `bookID`     INT(10)      NOT NULL AUTO_INCREMENT COMMENT 'Book ID',
    `bookName`   VARCHAR(100) NOT NULL COMMENT 'Book name',
    `bookCounts` INT(11)      NOT NULL COMMENT 'Quantity',
    `detail`     VARCHAR(200) NOT NULL COMMENT 'Description',
    PRIMARY KEY (`bookID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Sample data
INSERT INTO `books` (`bookID`, `bookName`, `bookCounts`, `detail`) VALUES
    (1, 'Java',   2,  'Core Java Programming'),
    (2, 'MySQL',  12, 'Database Fundamentals'),
    (3, 'Linux',  5,  'Linux Administration'),
    (4, 'Oracle', 10, 'Oracle Database Guide'),
    (5, 'Spring', 8,  'Spring Framework in Action'),
    (6, 'Docker', 6,  'Docker in Practice')
ON DUPLICATE KEY UPDATE `bookName` = VALUES(`bookName`);
