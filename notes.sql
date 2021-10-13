-- MySQL Workbench Synchronization
-- Generated: 2021-10-12 23:30
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Noelia

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  `user_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`notes` (
  `node_id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME GENERATED ALWAYS AS () VIRTUAL,
  `description` VARCHAR(100) NOT NULL,
  `remove` TINYINT(4) NULL DEFAULT 1,
  `notescol` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`node_id`),
  CONSTRAINT `user_id`
    FOREIGN KEY ()
    REFERENCES `mydb`.`users` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`categories` (
  `category_id` INT(11) NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`notes_has_categories` (
  `notes_node_id` INT(11) NOT NULL,
  `categories_category_id` INT(11) NOT NULL,
  PRIMARY KEY (`notes_node_id`, `categories_category_id`),
  INDEX `fk_notes_has_categories_categories1_idx` (`categories_category_id` ASC) VISIBLE,
  INDEX `fk_notes_has_categories_notes1_idx` (`notes_node_id` ASC) VISIBLE,
  CONSTRAINT `fk_notes_has_categories_notes1`
    FOREIGN KEY (`notes_node_id`)
    REFERENCES `mydb`.`notes` (`node_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notes_has_categories_categories1`
    FOREIGN KEY (`categories_category_id`)
    REFERENCES `mydb`.`categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
