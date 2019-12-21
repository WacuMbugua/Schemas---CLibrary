-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
SHOW WARNINGS;
-- -----------------------------------------------------
-- Schema CytonnLibrary
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `CytonnLibrary` ;

-- -----------------------------------------------------
-- Schema CytonnLibrary
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CytonnLibrary` DEFAULT CHARACTER SET latin1 ;
SHOW WARNINGS;
USE `CytonnLibrary` ;

-- -----------------------------------------------------
-- Table `Author`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Author` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Author` (
  `Authors_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `First_Name` VARCHAR(45) NOT NULL,
  `Second_Name` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Authors_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Book Details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Book Details` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Book Details` (
  `Book_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `BooK_Title` VARCHAR(45) NOT NULL,
  `Publication_Year` VARCHAR(45) NOT NULL,
  `Number of Copies` VARCHAR(45) NOT NULL,
  `Borrowed_copy` VARCHAR(45) NOT NULL,
  `Genre` VARCHAR(45) NOT NULL,
  `Book_Status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Book_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Book Status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Book Status` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Book Status` (
  `Status_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Status_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Status_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Borrowed`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Borrowed` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Borrowed` (
  `Borrowed_ID` INT(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Issued_Date` DATE NOT NULL,
  `Due_Date` DATE NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `Book_ID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Borrowed_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `User` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `User` (
  `Staff_ID` VARCHAR(45) CHARACTER SET 'latin1' COLLATE 'latin1_bin' NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Department` VARCHAR(45) NOT NULL,
  `Mobile No` VARCHAR(45) CHARACTER SET 'latin1' COLLATE 'latin1_bin' NULL DEFAULT NULL,
  `Books Issued` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`Staff_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Waiting List`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Waiting List` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Waiting List` (
  `Staff_id` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `Lastname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Staff_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `User_has_Borrowed`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `User_has_Borrowed` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `User_has_Borrowed` (
  `User_Staff_ID` VARCHAR(45) CHARACTER SET 'latin1' COLLATE 'latin1_bin' NOT NULL,
  `Borrowed_Borrowed_ID` INT(10) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`User_Staff_ID`, `Borrowed_Borrowed_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Borrowed_has_Book Details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Borrowed_has_Book Details` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Borrowed_has_Book Details` (
  `Borrowed_Borrowed_ID` INT(10) UNSIGNED ZEROFILL NOT NULL,
  `Book Details_Book_ID` INT(11) NOT NULL,
  PRIMARY KEY (`Borrowed_Borrowed_ID`, `Book Details_Book_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Borrowed_has_Book Status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Borrowed_has_Book Status` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Borrowed_has_Book Status` (
  `Borrowed_Borrowed_ID` INT(10) UNSIGNED ZEROFILL NOT NULL,
  `Book Status_Status_ID` INT(11) NOT NULL,
  PRIMARY KEY (`Borrowed_Borrowed_ID`, `Book Status_Status_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Author_has_Book Details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Author_has_Book Details` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Author_has_Book Details` (
  `Author_Authors_ID` INT(11) NOT NULL,
  `Book Details_Book_ID` INT(11) NOT NULL,
  PRIMARY KEY (`Author_Authors_ID`, `Book Details_Book_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Waiting List_has_Book Status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Waiting List_has_Book Status` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Waiting List_has_Book Status` (
  `Waiting List_Mobile Number` INT NOT NULL,
  `Book Status_Status_ID` INT(11) NOT NULL,
  PRIMARY KEY (`Waiting List_Mobile Number`, `Book Status_Status_ID`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Genre` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Genre` (
  `Genre_id` INT NOT NULL AUTO_INCREMENT,
  `Genre_name` VARCHAR(45) NULL,
  PRIMARY KEY (`Genre_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Book Details_has_Genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Book Details_has_Genre` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Book Details_has_Genre` (
  `Book Details_Book_ID` INT(11) NOT NULL,
  `Genre_Genre_id` INT NOT NULL,
  PRIMARY KEY (`Book Details_Book_ID`, `Genre_Genre_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
