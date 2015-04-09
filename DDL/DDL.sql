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
-- Table `dorm`.`city`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dorm`.`city` ;

CREATE TABLE IF NOT EXISTS `dorm`.`city` (
  `post_code` INT(8) NOT NULL,
  `city` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`post_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dorm`.`dorm`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dorm`.`dorm` ;

CREATE TABLE IF NOT EXISTS `dorm`.`dorm` (
  `name` VARCHAR(45) NOT NULL,
  `street_name` VARCHAR(60) NOT NULL,
  `street_no` VARCHAR(45) NOT NULL,
  `city_post_code` INT(8) NOT NULL,
  PRIMARY KEY (`name`),
  INDEX `fk_dorm_city1_idx` (`city_post_code` ASC),
  CONSTRAINT `fk_dorm_city1`
    FOREIGN KEY (`city_post_code`)
    REFERENCES `dorm`.`city` (`post_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dorm`.`kitchen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dorm`.`kitchen` ;

CREATE TABLE IF NOT EXISTS `dorm`.`kitchen` (
  `ID` INT NOT NULL,
  `dorm_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_kitchen_dorm1_idx` (`dorm_name` ASC),
  CONSTRAINT `fk_kitchen_dorm1`
    FOREIGN KEY (`dorm_name`)
    REFERENCES `dorm`.`dorm` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dorm`.`educational_instituion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dorm`.`educational_instituion` ;

CREATE TABLE IF NOT EXISTS `dorm`.`educational_instituion` (
  `name` VARCHAR(45) NOT NULL,
  `street_name` VARCHAR(60) NOT NULL,
  `street_no` VARCHAR(45) NOT NULL,
  `city_post_code` INT(8) NOT NULL,
  PRIMARY KEY (`name`),
  INDEX `fk_educational_instituion_city1_idx` (`city_post_code` ASC),
  CONSTRAINT `fk_educational_instituion_city1`
    FOREIGN KEY (`city_post_code`)
    REFERENCES `dorm`.`city` (`post_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dorm`.`room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dorm`.`room` ;

CREATE TABLE IF NOT EXISTS `dorm`.`room` (
  `id` INT NOT NULL,
  `room_name` VARCHAR(45) NOT NULL,
  `size` DECIMAL(4,2) NOT NULL,
  `monthly_fee` INT(6) NOT NULL,
  `kitchen_ID` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_room_kitchen1_idx` (`kitchen_ID` ASC),
  CONSTRAINT `fk_room_kitchen1`
    FOREIGN KEY (`kitchen_ID`)
    REFERENCES `dorm`.`kitchen` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dorm`.`renting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dorm`.`renting` ;

CREATE TABLE IF NOT EXISTS `dorm`.`renting` (
  `room_id` INT(3) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NULL,
  INDEX `fk_Renting_Room1_idx` (`room_id` ASC),
  PRIMARY KEY (`room_id`),
  CONSTRAINT `fk_Renting_Room1`
    FOREIGN KEY (`room_id`)
    REFERENCES `dorm`.`room` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dorm`.`student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dorm`.`student` ;

CREATE TABLE IF NOT EXISTS `dorm`.`student` (
  `name` VARCHAR(45) NOT NULL,
  `CPR_no` INT(10) NOT NULL,
  `phone_no` INT(8) NULL,
  `educational_instituion_name` VARCHAR(45) NOT NULL,
  `renting_Room_room_id` INT(3) NOT NULL,
  PRIMARY KEY (`name`),
  INDEX `fk_student_educational_instituion1_idx` (`educational_instituion_name` ASC),
  INDEX `fk_student_renting1_idx` (`renting_Room_room_id` ASC),
  CONSTRAINT `fk_student_educational_instituion1`
    FOREIGN KEY (`educational_instituion_name`)
    REFERENCES `dorm`.`educational_instituion` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_renting1`
    FOREIGN KEY (`renting_Room_room_id`)
    REFERENCES `dorm`.`renting` (`room_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dorm`.`signed_up`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dorm`.`signed_up` ;

CREATE TABLE IF NOT EXISTS `dorm`.`signed_up` (
  `dorm_name` VARCHAR(45) NOT NULL,
  `student_name` VARCHAR(45) NOT NULL,
  `sign_up_date` DATE NOT NULL,
  `distance_to_edu` DECIMAL(6,2) NOT NULL,
  `street_name` VARCHAR(60) NOT NULL,
  `street_no` VARCHAR(45) NOT NULL,
  `city_post_code` INT(8) NOT NULL,
  PRIMARY KEY (`dorm_name`, `student_name`),
  INDEX `fk_signed_up_city1_idx` (`city_post_code` ASC),
  INDEX `fk_signed_up_dorm1_idx` (`dorm_name` ASC),
  INDEX `fk_signed_up_student1_idx` (`student_name` ASC),
  CONSTRAINT `fk_signed_up_city1`
    FOREIGN KEY (`city_post_code`)
    REFERENCES `dorm`.`city` (`post_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_signed_up_dorm1`
    FOREIGN KEY (`dorm_name`)
    REFERENCES `dorm`.`dorm` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_signed_up_student1`
    FOREIGN KEY (`student_name`)
    REFERENCES `dorm`.`student` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
