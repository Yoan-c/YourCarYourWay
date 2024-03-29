-- MySQL Script generated by MySQL Workbench
-- Thu Jan 25 17:18:04 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema yourcaryourway
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `yourcaryourway` ;

-- -----------------------------------------------------
-- Schema yourcaryourway
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `yourcaryourway` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `yourcaryourway` ;

-- -----------------------------------------------------
-- Table `yourcaryourway`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yourcaryourway`.`address` ;

CREATE TABLE IF NOT EXISTS `yourcaryourway`.`address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `streetNumber` INT NOT NULL,
  `street` VARCHAR(200) NOT NULL,
  `zipCode` VARCHAR(10) NOT NULL,
  `city` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `yourcaryourway`.`carcategory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yourcaryourway`.`carcategory` ;

CREATE TABLE IF NOT EXISTS `yourcaryourway`.`carcategory` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category` CHAR(1) NOT NULL,
  `categoryLabel` VARCHAR(20) NOT NULL,
  `type` CHAR(1) NOT NULL,
  `typeLabel` VARCHAR(40) NOT NULL,
  `drive` CHAR(1) NOT NULL,
  `driveLabel` VARCHAR(25) NOT NULL,
  `fuel` CHAR(1) NOT NULL,
  `fuelLabel` VARCHAR(35) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `yourcaryourway`.`car`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yourcaryourway`.`car` ;

CREATE TABLE IF NOT EXISTS `yourcaryourway`.`car` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `registration` VARCHAR(20) NOT NULL,
  `brand` VARCHAR(20) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `color` VARCHAR(10) NOT NULL,
  `categoryID` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `registration` (`registration` ASC) VISIBLE,
  INDEX `categoryID` (`categoryID` ASC) VISIBLE,
  CONSTRAINT `car_ibfk_1`
    FOREIGN KEY (`categoryID`)
    REFERENCES `yourcaryourway`.`carcategory` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `yourcaryourway`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yourcaryourway`.`user` ;

CREATE TABLE IF NOT EXISTS `yourcaryourway`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `surname` VARCHAR(50) NOT NULL,
  `dateOfBirth` DATE NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `adressID` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE,
  INDEX `adressID` (`adressID` ASC) VISIBLE,
  CONSTRAINT `user_ibfk_1`
    FOREIGN KEY (`adressID`)
    REFERENCES `yourcaryourway`.`address` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `yourcaryourway`.`evaluation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yourcaryourway`.`evaluation` ;

CREATE TABLE IF NOT EXISTS `yourcaryourway`.`evaluation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rating` INT NOT NULL,
  `comment` VARCHAR(2000) NOT NULL,
  `date` DATE NOT NULL,
  `userID` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `userID` (`userID` ASC) VISIBLE,
  CONSTRAINT `evaluation_ibfk_1`
    FOREIGN KEY (`userID`)
    REFERENCES `yourcaryourway`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `yourcaryourway`.`rentalagency`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yourcaryourway`.`rentalagency` ;

CREATE TABLE IF NOT EXISTS `yourcaryourway`.`rentalagency` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `adressID` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `adressID` (`adressID` ASC) VISIBLE,
  CONSTRAINT `rentalagency_ibfk_1`
    FOREIGN KEY (`adressID`)
    REFERENCES `yourcaryourway`.`address` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `yourcaryourway`.`reservation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yourcaryourway`.`reservation` ;

CREATE TABLE IF NOT EXISTS `yourcaryourway`.`reservation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `registration` VARCHAR(20) NOT NULL,
  `startTime` DATE NOT NULL,
  `endTime` DATE NOT NULL,
  `startDate` DATE NOT NULL,
  `endDate` DATE NOT NULL,
  `dateOfReservation` DATE NOT NULL,
  `status` VARCHAR(10) NOT NULL,
  `userID` INT NOT NULL,
  `rentalAgencyID` INT NOT NULL,
  `carID` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `registration` (`registration` ASC) VISIBLE,
  INDEX `userID` (`userID` ASC) VISIBLE,
  INDEX `rentalAgencyID` (`rentalAgencyID` ASC) VISIBLE,
  INDEX `carID` (`carID` ASC) VISIBLE,
  CONSTRAINT `reservation_ibfk_1`
    FOREIGN KEY (`userID`)
    REFERENCES `yourcaryourway`.`user` (`id`),
  CONSTRAINT `reservation_ibfk_2`
    FOREIGN KEY (`rentalAgencyID`)
    REFERENCES `yourcaryourway`.`rentalagency` (`id`),
  CONSTRAINT `reservation_ibfk_3`
    FOREIGN KEY (`carID`)
    REFERENCES `yourcaryourway`.`car` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `yourcaryourway`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yourcaryourway`.`role` ;

CREATE TABLE IF NOT EXISTS `yourcaryourway`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `yourcaryourway`.`userrole`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yourcaryourway`.`userrole` ;

CREATE TABLE IF NOT EXISTS `yourcaryourway`.`userrole` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `roleID` INT NOT NULL,
  `userID` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `roleID` (`roleID` ASC) VISIBLE,
  INDEX `userID` (`userID` ASC) VISIBLE,
  CONSTRAINT `userrole_ibfk_1`
    FOREIGN KEY (`roleID`)
    REFERENCES `yourcaryourway`.`role` (`id`),
  CONSTRAINT `userrole_ibfk_2`
    FOREIGN KEY (`userID`)
    REFERENCES `yourcaryourway`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
