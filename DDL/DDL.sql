-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema dorm
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dorm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dorm` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `dorm` ;

-- -----------------------------------------------------
-- Table `dorm`.`City`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dorm`.`City` ;

CREATE TABLE IF NOT EXISTS `dorm`.`City` (
  `Post_no` INT(8) NOT NULL,
  `City` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Post_no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dorm`.`Dorm`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dorm`.`Dorm` ;

CREATE TABLE IF NOT EXISTS `dorm`.`Dorm` (
  `Name` VARCHAR(45) NOT NULL,
  `Street_name` VARCHAR(60) NOT NULL,
  `Street_no` VARCHAR(45) NOT NULL,
  `City_Post_no` INT(8) NOT NULL,
  PRIMARY KEY (`Name`),
  INDEX `fk_Dorm_City1_idx` (`City_Post_no` ASC),
  CONSTRAINT `fk_Dorm_City1`
    FOREIGN KEY (`City_Post_no`)
    REFERENCES `dorm`.`City` (`Post_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dorm`.`Kitchen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dorm`.`Kitchen` ;

CREATE TABLE IF NOT EXISTS `dorm`.`Kitchen` (
  `Kitchen_ID` INT NOT NULL,
  `Dorm_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Kitchen_ID`),
  INDEX `fk_Kitchen_Dorm1_idx` (`Dorm_Name` ASC),
  CONSTRAINT `fk_Kitchen_Dorm1`
    FOREIGN KEY (`Dorm_Name`)
    REFERENCES `dorm`.`Dorm` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dorm`.`Educational_instituion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dorm`.`Educational_instituion` ;

CREATE TABLE IF NOT EXISTS `dorm`.`Educational_instituion` (
  `Name` VARCHAR(45) NOT NULL,
  `Street_name` VARCHAR(60) NOT NULL,
  `Street_no` VARCHAR(45) NOT NULL,
  `City_Post_no` INT(8) NOT NULL,
  PRIMARY KEY (`Name`),
  INDEX `fk_Educational_instituion_City1_idx` (`City_Post_no` ASC),
  CONSTRAINT `fk_Educational_instituion_City1`
    FOREIGN KEY (`City_Post_no`)
    REFERENCES `dorm`.`City` (`Post_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dorm`.`Student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dorm`.`Student` ;

CREATE TABLE IF NOT EXISTS `dorm`.`Student` (
  `CPR_no` INT(10) NOT NULL,
  `First_name` VARCHAR(45) NOT NULL,
  `Last_name` VARCHAR(45) NOT NULL,
  `Phone_no` INT(10) NOT NULL,
  `Educational_instituion_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CPR_no`),
  INDEX `fk_Student_Educational_instituion1_idx` (`Educational_instituion_Name` ASC),
  CONSTRAINT `fk_Student_Educational_instituion1`
    FOREIGN KEY (`Educational_instituion_Name`)
    REFERENCES `dorm`.`Educational_instituion` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dorm`.`Room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dorm`.`Room` ;

CREATE TABLE IF NOT EXISTS `dorm`.`Room` (
  `ID` INT NOT NULL,
  `Kitchen_Kitchen_ID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Size` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_room_Kitchen1_idx` (`Kitchen_Kitchen_ID` ASC),
  CONSTRAINT `fk_room_Kitchen1`
    FOREIGN KEY (`Kitchen_Kitchen_ID`)
    REFERENCES `dorm`.`Kitchen` (`Kitchen_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dorm`.`Signed_up`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dorm`.`Signed_up` ;

CREATE TABLE IF NOT EXISTS `dorm`.`Signed_up` (
  `Student_CPR_no` INT(10) NOT NULL,
  `Dorm_Name` VARCHAR(45) NOT NULL,
  `Sign_up_date` DATE NOT NULL,
  `Distance_to_edu` DECIMAL(6,2) NOT NULL,
  `Street_name` VARCHAR(60) NOT NULL,
  `Street_no` VARCHAR(45) NOT NULL,
  `City_Post_no` INT(8) NOT NULL,
  PRIMARY KEY (`Student_CPR_no`, `Dorm_Name`),
  INDEX `fk_Signed_up_Dorm1_idx` (`Dorm_Name` ASC),
  INDEX `fk_Signed_up_Student1_idx` (`Student_CPR_no` ASC),
  INDEX `fk_Signed_up_City1_idx` (`City_Post_no` ASC),
  CONSTRAINT `fk_Signed_up_Dorm1`
    FOREIGN KEY (`Dorm_Name`)
    REFERENCES `dorm`.`Dorm` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Signed_up_Student1`
    FOREIGN KEY (`Student_CPR_no`)
    REFERENCES `dorm`.`Student` (`CPR_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Signed_up_City1`
    FOREIGN KEY (`City_Post_no`)
    REFERENCES `dorm`.`City` (`Post_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dorm`.`Renting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dorm`.`Renting` ;

CREATE TABLE IF NOT EXISTS `dorm`.`Renting` (
  `Room_ID` INT NOT NULL,
  `Start_date` DATE NOT NULL,
  `End_date` DATE NULL,
  `Student_CPR_no` INT(10) NOT NULL,
  PRIMARY KEY (`Room_ID`),
  INDEX `fk_Renting_Student1_idx` (`Student_CPR_no` ASC),
  CONSTRAINT `fk_Renting_Room1`
    FOREIGN KEY (`Room_ID`)
    REFERENCES `dorm`.`Room` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Renting_Student1`
    FOREIGN KEY (`Student_CPR_no`)
    REFERENCES `dorm`.`Student` (`CPR_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dorm`.`Room_Rent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dorm`.`Room_Rent` ;

CREATE TABLE IF NOT EXISTS `dorm`.`Room_Rent` (
  `Room_size` DECIMAL(4,2) NOT NULL,
  `Dorm_Name` VARCHAR(45) NOT NULL,
  `Monthly_fee` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`Room_size`, `Dorm_Name`),
  CONSTRAINT `fk_Room_Rent_Dorm1`
    FOREIGN KEY (`Dorm_Name`)
    REFERENCES `dorm`.`Dorm` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
