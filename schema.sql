SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema instanto
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `instanto` ;
CREATE SCHEMA IF NOT EXISTS `instanto` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `instanto` ;

-- -----------------------------------------------------
-- Table `instanto`.`rol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`rol` ;

CREATE TABLE IF NOT EXISTS `instanto`.`rol` (
  `id` VARCHAR(45) NOT NULL,
  `display_name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`ugroup`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`ugroup` ;

CREATE TABLE IF NOT EXISTS `instanto`.`ugroup` (
  `id` VARCHAR(45) NOT NULL,
  `display_name` VARCHAR(45) NOT NULL,
  `rol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ugroup_rol_idx` (`rol` ASC),
  CONSTRAINT `fk_ugroup_rol`
    FOREIGN KEY (`rol`)
    REFERENCES `instanto`.`rol` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`user` ;

CREATE TABLE IF NOT EXISTS `instanto`.`user` (
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `enabled` TINYINT(1) NOT NULL,
  `display_name` VARCHAR(45) NOT NULL,
  `ugroup` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`username`),
  INDEX `fk_user_ugroup_ugroup_idx` (`ugroup` ASC),
  CONSTRAINT `fk_user_ugroup_ugroup`
    FOREIGN KEY (`ugroup`)
    REFERENCES `instanto`.`ugroup` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `instanto`.`newspaper`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`newspaper` ;

CREATE TABLE IF NOT EXISTS `instanto`.`newspaper` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `web` VARCHAR(200) NOT NULL,
  `logo` VARCHAR(32) NOT NULL DEFAULT '',
  `created_by` VARCHAR(45) NOT NULL,
  `updated_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  `updated_at` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_newspaper_1_idx` (`created_by` ASC),
  INDEX `fk_newspaper_2_idx` (`updated_by` ASC),
  CONSTRAINT `fk_newspaper_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_newspaper_2`
    FOREIGN KEY (`updated_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`article` ;

CREATE TABLE IF NOT EXISTS `instanto`.`article` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `web` VARCHAR(200) NOT NULL,
  `date` INT NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `updated_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  `updated_at` INT NOT NULL,
  `newspaper` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_article_1_idx` (`created_by` ASC),
  INDEX `fk_article_2_idx` (`updated_by` ASC),
  INDEX `fk_article_3_idx` (`newspaper` ASC),
  CONSTRAINT `fk_article_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_article_2`
    FOREIGN KEY (`updated_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_article_3`
    FOREIGN KEY (`newspaper`)
    REFERENCES `instanto`.`newspaper` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`status` ;

CREATE TABLE IF NOT EXISTS `instanto`.`status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL COMMENT '	' /* comment truncated */ /*

*/,
  `updated_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  `updated_at` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_status_1_idx` (`created_by` ASC),
  INDEX `fk_status_2_idx` (`updated_by` ASC),
  CONSTRAINT `fk_status_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_status_2`
    FOREIGN KEY (`updated_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`member` ;

CREATE TABLE IF NOT EXISTS `instanto`.`member` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `degree` VARCHAR(45) CHARACTER SET 'big5' NOT NULL,
  `year_in` INT NOT NULL,
  `year_out` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `cv` VARCHAR(32) NOT NULL DEFAULT '',
  `photo` VARCHAR(32) NOT NULL DEFAULT '',
  `created_by` VARCHAR(45) NOT NULL,
  `updated_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  `updated_at` INT NOT NULL,
  `primary_status` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_member_1_idx` (`created_by` ASC),
  INDEX `fk_member_2_idx` (`updated_by` ASC),
  INDEX `fk_member_3_idx` (`primary_status` ASC),
  CONSTRAINT `fk_member_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_2`
    FOREIGN KEY (`updated_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_3`
    FOREIGN KEY (`primary_status`)
    REFERENCES `instanto`.`status` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`member_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`member_status` ;

CREATE TABLE IF NOT EXISTS `instanto`.`member_status` (
  `member` INT NOT NULL,
  `status` INT NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  PRIMARY KEY (`member`, `status`),
  INDEX `fk_member_status_1_idx` (`created_by` ASC),
  INDEX `fk_member_status_3_idx` (`status` ASC),
  CONSTRAINT `fk_member_status_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_status_2`
    FOREIGN KEY (`member`)
    REFERENCES `instanto`.`member` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_member_status_3`
    FOREIGN KEY (`status`)
    REFERENCES `instanto`.`status` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`partner`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`partner` ;

CREATE TABLE IF NOT EXISTS `instanto`.`partner` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `web` VARCHAR(45) NOT NULL,
  `logo` VARCHAR(32) NOT NULL DEFAULT '',
  `same_department` TINYINT(1) NOT NULL,
  `scope` VARCHAR(45) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `updated_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  `updated_at` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_partner_1_idx` (`created_by` ASC),
  INDEX `fk_partner_2_idx` (`updated_by` ASC),
  CONSTRAINT `fk_partner_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partner_2`
    FOREIGN KEY (`updated_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'z';


-- -----------------------------------------------------
-- Table `instanto`.`partner_member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`partner_member` ;

CREATE TABLE IF NOT EXISTS `instanto`.`partner_member` (
  `partner` INT NOT NULL,
  `member` INT NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  PRIMARY KEY (`partner`, `member`),
  INDEX `fk_partner_member_1_idx` (`created_by` ASC),
  INDEX `fk_partner_member_3_idx` (`member` ASC),
  CONSTRAINT `fk_partner_member_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partner_member_2`
    FOREIGN KEY (`partner`)
    REFERENCES `instanto`.`partner` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_partner_member_3`
    FOREIGN KEY (`member`)
    REFERENCES `instanto`.`member` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`research_area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`research_area` ;

CREATE TABLE IF NOT EXISTS `instanto`.`research_area` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `logo` VARCHAR(32) NOT NULL DEFAULT '',
  `created_by` VARCHAR(45) NOT NULL,
  `updated_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  `updated_at` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_research_area_1_idx` (`created_by` ASC),
  INDEX `fk_research_area_2_idx` (`updated_by` ASC),
  CONSTRAINT `fk_research_area_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_research_area_2`
    FOREIGN KEY (`updated_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`funding_body`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`funding_body` ;

CREATE TABLE IF NOT EXISTS `instanto`.`funding_body` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `web` VARCHAR(200) NOT NULL,
  `scope` VARCHAR(45) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `updated_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  `updated_at` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_funding_body_1_idx` (`created_by` ASC),
  INDEX `fk_funding_body_2_idx` (`updated_by` ASC),
  CONSTRAINT `fk_funding_body_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funding_body_2`
    FOREIGN KEY (`updated_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`financed_project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`financed_project` ;

CREATE TABLE IF NOT EXISTS `instanto`.`financed_project` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `started` INT NOT NULL,
  `ended` INT NOT NULL,
  `budget` INT NOT NULL,
  `scope` VARCHAR(45) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `updated_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  `updated_at` INT NOT NULL,
  `primary_funding_body` INT NOT NULL,
  `primary_record` VARCHAR(45) NOT NULL,
  `primary_leader` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_financed_project_1_idx` (`created_by` ASC),
  INDEX `fk_financed_project_2_idx` (`updated_by` ASC),
  INDEX `fk_financed_project_4_idx` (`primary_leader` ASC),
  INDEX `fk_financed_project_3_idx` (`primary_funding_body` ASC),
  CONSTRAINT `fk_financed_project_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_financed_project_2`
    FOREIGN KEY (`updated_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_financed_project_3`
    FOREIGN KEY (`primary_funding_body`)
    REFERENCES `instanto`.`funding_body` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_financed_project_4`
    FOREIGN KEY (`primary_leader`)
    REFERENCES `instanto`.`member` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`funding_body_financed_project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`funding_body_financed_project` ;

CREATE TABLE IF NOT EXISTS `instanto`.`funding_body_financed_project` (
  `funding_body` INT NOT NULL,
  `financed_project` INT NOT NULL,
  `record` VARCHAR(45) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `updated_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  `updated_at` INT NOT NULL,
  PRIMARY KEY (`funding_body`, `financed_project`),
  INDEX `fk_funding_body_financed_project_1_idx` (`created_by` ASC),
  INDEX `fk_funding_body_financed_project_2_idx` (`updated_by` ASC),
  INDEX `fk_funding_body_financed_project_4_idx` (`financed_project` ASC),
  CONSTRAINT `fk_funding_body_financed_project_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funding_body_financed_project_2`
    FOREIGN KEY (`updated_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funding_body_financed_project_3`
    FOREIGN KEY (`funding_body`)
    REFERENCES `instanto`.`funding_body` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_funding_body_financed_project_4`
    FOREIGN KEY (`financed_project`)
    REFERENCES `instanto`.`financed_project` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`timestamps`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`timestamps` ;

CREATE TABLE IF NOT EXISTS `instanto`.`timestamps` (
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL);


-- -----------------------------------------------------
-- Table `instanto`.`student_work_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`student_work_type` ;

CREATE TABLE IF NOT EXISTS `instanto`.`student_work_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `updated_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  `updated_at` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_student_work_type_1_idx` (`created_by` ASC),
  INDEX `fk_student_work_type_2_idx` (`updated_by` ASC),
  CONSTRAINT `fk_student_work_type_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_work_type_2`
    FOREIGN KEY (`updated_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`publication_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`publication_type` ;

CREATE TABLE IF NOT EXISTS `instanto`.`publication_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `updated_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  `updated_at` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_publication_type_1_idx` (`created_by` ASC),
  INDEX `fk_publication_type_2_idx` (`updated_by` ASC),
  CONSTRAINT `fk_publication_type_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_publication_type_2`
    FOREIGN KEY (`updated_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`student_work`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`student_work` ;

CREATE TABLE IF NOT EXISTS `instanto`.`student_work` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `year` INT NOT NULL,
  `school` VARCHAR(200) NOT NULL,
  `volume` VARCHAR(45) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `updated_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  `updated_at` INT NOT NULL,
  `student_work_type` INT NOT NULL,
  `author` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_student_work_1_idx` (`created_by` ASC),
  INDEX `fk_student_work_2_idx` (`updated_by` ASC),
  INDEX `fk_student_work_3_idx` (`student_work_type` ASC),
  INDEX `fk_student_work_4_idx` (`author` ASC),
  CONSTRAINT `fk_student_work_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_work_2`
    FOREIGN KEY (`updated_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_work_3`
    FOREIGN KEY (`student_work_type`)
    REFERENCES `instanto`.`student_work_type` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_student_work_4`
    FOREIGN KEY (`author`)
    REFERENCES `instanto`.`member` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`publisher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`publisher` ;

CREATE TABLE IF NOT EXISTS `instanto`.`publisher` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `updated_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  `updated_at` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_publisher_1_idx` (`created_by` ASC),
  INDEX `fk_publisher_2_idx` (`updated_by` ASC),
  CONSTRAINT `fk_publisher_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_publisher_2`
    FOREIGN KEY (`updated_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`publication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`publication` ;

CREATE TABLE IF NOT EXISTS `instanto`.`publication` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `year` INT NOT NULL,
  `book_title` VARCHAR(45) NOT NULL,
  `chapter` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `conference_name` VARCHAR(45) NOT NULL,
  `edition` VARCHAR(45) NOT NULL,
  `institution` VARCHAR(45) NOT NULL,
  `isbn` VARCHAR(45) NOT NULL,
  `issn` VARCHAR(45) NOT NULL,
  `journal` VARCHAR(45) NOT NULL,
  `language` VARCHAR(45) NOT NULL,
  `nationality` VARCHAR(45) NOT NULL,
  `number` VARCHAR(45) NOT NULL,
  `organization` VARCHAR(45) NOT NULL,
  `pages` VARCHAR(45) NOT NULL,
  `school` VARCHAR(45) NOT NULL COMMENT '	',
  `series` VARCHAR(45) NOT NULL,
  `volume` VARCHAR(45) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `updated_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  `updated_at` INT NOT NULL,
  `publication_type` INT NOT NULL,
  `publisher` INT NOT NULL,
  `primary_author` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_publication_1_idx` (`created_by` ASC),
  INDEX `fk_publication_2_idx` (`updated_by` ASC),
  INDEX `fk_publication_3_idx` (`publication_type` ASC),
  INDEX `fk_publication_4_idx` (`publisher` ASC),
  INDEX `fk_publication_5_idx` (`primary_author` ASC),
  CONSTRAINT `fk_publication_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_publication_2`
    FOREIGN KEY (`updated_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_publication_3`
    FOREIGN KEY (`publication_type`)
    REFERENCES `instanto`.`publication_type` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_publication_4`
    FOREIGN KEY (`publisher`)
    REFERENCES `instanto`.`publisher` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_publication_5`
    FOREIGN KEY (`primary_author`)
    REFERENCES `instanto`.`member` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`research_line`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`research_line` ;

CREATE TABLE IF NOT EXISTS `instanto`.`research_line` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `finished` TINYINT(1) NOT NULL,
  `description` TEXT NOT NULL,
  `logo` VARCHAR(32) NOT NULL DEFAULT '',
  `created_by` VARCHAR(45) NOT NULL,
  `updated_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  `updated_at` INT NOT NULL,
  `primary_research_area` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_research_line_1_idx` (`created_by` ASC),
  INDEX `fk_research_line_2_idx` (`updated_by` ASC),
  INDEX `fk_research_line_3_idx` (`primary_research_area` ASC),
  CONSTRAINT `fk_research_line_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_research_line_2`
    FOREIGN KEY (`updated_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_research_line_3`
    FOREIGN KEY (`primary_research_area`)
    REFERENCES `instanto`.`research_area` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`category` ;

CREATE TABLE IF NOT EXISTS `instanto`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `updated_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  `updated_at` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_resource_type_1_idx` (`created_by` ASC),
  INDEX `fk_resource_type_2_idx` (`updated_by` ASC),
  CONSTRAINT `fk_resource_type_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resource_type_2`
    FOREIGN KEY (`updated_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`resource` ;

CREATE TABLE IF NOT EXISTS `instanto`.`resource` (
  `filename_hash` VARCHAR(32) NOT NULL,
  `filename` VARCHAR(45) NOT NULL,
  `mime_type` VARCHAR(45) NOT NULL,
  `size` INT NOT NULL,
  `private` TINYINT(1) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `updated_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  `updated_at` INT NOT NULL,
  INDEX `fk_resource_1_idx` (`created_by` ASC),
  INDEX `fk_resource_2_idx` (`updated_by` ASC),
  PRIMARY KEY (`filename_hash`),
  CONSTRAINT `fk_resource_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resource_2`
    FOREIGN KEY (`updated_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`research_area_research_line`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`research_area_research_line` ;

CREATE TABLE IF NOT EXISTS `instanto`.`research_area_research_line` (
  `research_area` INT NOT NULL,
  `research_line` INT NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  PRIMARY KEY (`research_area`, `research_line`),
  INDEX `fk_research_area_research_line_1_idx` (`created_by` ASC),
  INDEX `fk_research_area_research_line_3_idx` (`research_line` ASC),
  CONSTRAINT `fk_research_area_research_line_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_research_area_research_line_2`
    FOREIGN KEY (`research_area`)
    REFERENCES `instanto`.`research_area` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_research_area_research_line_3`
    FOREIGN KEY (`research_line`)
    REFERENCES `instanto`.`research_line` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`member_publication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`member_publication` ;

CREATE TABLE IF NOT EXISTS `instanto`.`member_publication` (
  `member` INT NOT NULL,
  `publication` INT NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  PRIMARY KEY (`member`, `publication`),
  INDEX `fk_member_publication_1_idx` (`created_by` ASC),
  INDEX `fk_member_publication_3_idx` (`publication` ASC),
  CONSTRAINT `fk_member_publication_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_publication_2`
    FOREIGN KEY (`member`)
    REFERENCES `instanto`.`member` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_member_publication_3`
    FOREIGN KEY (`publication`)
    REFERENCES `instanto`.`publication` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`research_line_article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`research_line_article` ;

CREATE TABLE IF NOT EXISTS `instanto`.`research_line_article` (
  `research_line` INT NOT NULL,
  `article` INT NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  PRIMARY KEY (`research_line`, `article`),
  INDEX `fk_research_line_article_1_idx` (`created_by` ASC),
  INDEX `fk_research_line_article_3_idx` (`article` ASC),
  CONSTRAINT `fk_research_line_article_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_research_line_article_2`
    FOREIGN KEY (`research_line`)
    REFERENCES `instanto`.`research_line` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_research_line_article_3`
    FOREIGN KEY (`article`)
    REFERENCES `instanto`.`article` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`research_line_partner`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`research_line_partner` ;

CREATE TABLE IF NOT EXISTS `instanto`.`research_line_partner` (
  `research_line` INT NOT NULL,
  `partner` INT NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  PRIMARY KEY (`research_line`, `partner`),
  INDEX `fk_research_line_partner_1_idx` (`created_by` ASC),
  INDEX `fk_research_line_partner_3_idx` (`partner` ASC),
  CONSTRAINT `fk_research_line_partner_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_research_line_partner_2`
    FOREIGN KEY (`research_line`)
    REFERENCES `instanto`.`research_line` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_research_line_partner_3`
    FOREIGN KEY (`partner`)
    REFERENCES `instanto`.`partner` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`research_line_financed_project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`research_line_financed_project` ;

CREATE TABLE IF NOT EXISTS `instanto`.`research_line_financed_project` (
  `research_line` INT NOT NULL,
  `financed_project` INT NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  PRIMARY KEY (`research_line`, `financed_project`),
  INDEX `fk_research_line_financed_project_1_idx` (`created_by` ASC),
  INDEX `fk_research_line_financed_project_3_idx` (`financed_project` ASC),
  CONSTRAINT `fk_research_line_financed_project_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_research_line_financed_project_2`
    FOREIGN KEY (`research_line`)
    REFERENCES `instanto`.`research_line` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_research_line_financed_project_3`
    FOREIGN KEY (`financed_project`)
    REFERENCES `instanto`.`financed_project` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`financed_project_member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`financed_project_member` ;

CREATE TABLE IF NOT EXISTS `instanto`.`financed_project_member` (
  `financed_project` INT NOT NULL,
  `member` INT NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  PRIMARY KEY (`financed_project`, `member`),
  INDEX `fk_financed_project_member_1_idx` (`created_by` ASC),
  INDEX `fk_financed_project_member_3_idx` (`member` ASC),
  CONSTRAINT `fk_financed_project_member_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_financed_project_member_2`
    FOREIGN KEY (`financed_project`)
    REFERENCES `instanto`.`financed_project` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_financed_project_member_3`
    FOREIGN KEY (`member`)
    REFERENCES `instanto`.`member` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`financed_project_leader`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`financed_project_leader` ;

CREATE TABLE IF NOT EXISTS `instanto`.`financed_project_leader` (
  `financed_project` INT NOT NULL,
  `member` INT NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  PRIMARY KEY (`financed_project`, `member`),
  INDEX `fk_financed_project_leader_1_idx` (`created_by` ASC),
  INDEX `fk_financed_project_leader_3_idx` (`member` ASC),
  CONSTRAINT `fk_financed_project_leader_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_financed_project_leader_2`
    FOREIGN KEY (`financed_project`)
    REFERENCES `instanto`.`financed_project` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_financed_project_leader_3`
    FOREIGN KEY (`member`)
    REFERENCES `instanto`.`member` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`research_line_member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`research_line_member` ;

CREATE TABLE IF NOT EXISTS `instanto`.`research_line_member` (
  `research_line` INT NOT NULL,
  `member` INT NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  PRIMARY KEY (`research_line`, `member`),
  INDEX `fk_research_line_member_1_idx` (`created_by` ASC),
  INDEX `fk_research_line_member_3_idx` (`member` ASC),
  CONSTRAINT `fk_research_line_member_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_research_line_member_2`
    FOREIGN KEY (`research_line`)
    REFERENCES `instanto`.`research_line` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_research_line_member_3`
    FOREIGN KEY (`member`)
    REFERENCES `instanto`.`member` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`research_line_student_work`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`research_line_student_work` ;

CREATE TABLE IF NOT EXISTS `instanto`.`research_line_student_work` (
  `research_line` INT NOT NULL,
  `student_work` INT NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  PRIMARY KEY (`research_line`, `student_work`),
  INDEX `fk_research_line_student_work_1_idx` (`created_by` ASC),
  INDEX `fk_research_line_student_work_3_idx` (`student_work` ASC),
  CONSTRAINT `fk_research_line_student_work_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_research_line_student_work_2`
    FOREIGN KEY (`research_line`)
    REFERENCES `instanto`.`research_line` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_research_line_student_work_3`
    FOREIGN KEY (`student_work`)
    REFERENCES `instanto`.`student_work` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`research_line_publication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`research_line_publication` ;

CREATE TABLE IF NOT EXISTS `instanto`.`research_line_publication` (
  `research_line` INT NOT NULL,
  `publication` INT NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  PRIMARY KEY (`research_line`, `publication`),
  INDEX `fk_research_line_publication_1_idx` (`created_by` ASC),
  INDEX `fk_research_line_publication_3_idx` (`publication` ASC),
  CONSTRAINT `fk_research_line_publication_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_research_line_publication_2`
    FOREIGN KEY (`research_line`)
    REFERENCES `instanto`.`research_line` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_research_line_publication_3`
    FOREIGN KEY (`publication`)
    REFERENCES `instanto`.`publication` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`research_line_resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`research_line_resource` ;

CREATE TABLE IF NOT EXISTS `instanto`.`research_line_resource` (
  `research_line` INT NOT NULL,
  `resource` VARCHAR(32) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  PRIMARY KEY (`research_line`, `resource`),
  INDEX `fk_research_line_resource_1_idx` (`created_by` ASC),
  INDEX `fk_research_line_resource_3_idx` (`resource` ASC),
  CONSTRAINT `fk_research_line_resource_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_research_line_resource_2`
    FOREIGN KEY (`research_line`)
    REFERENCES `instanto`.`research_line` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_research_line_resource_3`
    FOREIGN KEY (`resource`)
    REFERENCES `instanto`.`resource` (`filename_hash`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`access_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`access_log` ;

CREATE TABLE IF NOT EXISTS `instanto`.`access_log` (
  `when` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `app` VARCHAR(3) NOT NULL,
  `ip` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`when`, `username`, `ip`, `app`),
  CONSTRAINT `fk_access_log_1`
    FOREIGN KEY (`username`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`permission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`permission` ;

CREATE TABLE IF NOT EXISTS `instanto`.`permission` (
  `id` VARCHAR(64) NOT NULL,
  `display_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`rol_permission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`rol_permission` ;

CREATE TABLE IF NOT EXISTS `instanto`.`rol_permission` (
  `rol` VARCHAR(45) NOT NULL,
  `permission` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`rol`, `permission`),
  INDEX `fk_rol_permission_3_idx` (`permission` ASC),
  CONSTRAINT `fk_rol_permission_2`
    FOREIGN KEY (`rol`)
    REFERENCES `instanto`.`rol` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rol_permission_3`
    FOREIGN KEY (`permission`)
    REFERENCES `instanto`.`permission` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`log` ;

CREATE TABLE IF NOT EXISTS `instanto`.`log` (
  `when` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `who` VARCHAR(45) NOT NULL,
  `app` VARCHAR(45) NOT NULL,
  `what` TEXT NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`category_resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`category_resource` ;

CREATE TABLE IF NOT EXISTS `instanto`.`category_resource` (
  `category` INT NOT NULL,
  `resource` VARCHAR(45) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  PRIMARY KEY (`category`, `resource`),
  INDEX `fk_category_resource_1_idx` (`created_by` ASC),
  INDEX `fk_category_resource_3_idx` (`resource` ASC),
  CONSTRAINT `fk_category_resource_1`
    FOREIGN KEY (`created_by`)
    REFERENCES `instanto`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_resource_2`
    FOREIGN KEY (`category`)
    REFERENCES `instanto`.`category` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_category_resource_3`
    FOREIGN KEY (`resource`)
    REFERENCES `instanto`.`resource` (`filename_hash`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`config`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`config` ;

CREATE TABLE IF NOT EXISTS `instanto`.`config` (
  `config_key` VARCHAR(45) NOT NULL,
  `config_value` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`config_key`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instanto`.`notification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instanto`.`notification` ;

CREATE TABLE IF NOT EXISTS `instanto`.`notification` (
  `1` INT NOT NULL AUTO_INCREMENT,
  `message` VARCHAR(45) NULL,
  PRIMARY KEY (`1`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `instanto`.`rol`
-- -----------------------------------------------------
START TRANSACTION;
USE `instanto`;
INSERT INTO `instanto`.`rol` (`id`, `display_name`, `description`) VALUES ('root_rol', 'Root rol', 'Root privileges');

COMMIT;


-- -----------------------------------------------------
-- Data for table `instanto`.`ugroup`
-- -----------------------------------------------------
START TRANSACTION;
USE `instanto`;
INSERT INTO `instanto`.`ugroup` (`id`, `display_name`, `rol`) VALUES ('root_group', 'Root group', 'root_rol');

COMMIT;


-- -----------------------------------------------------
-- Data for table `instanto`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `instanto`;
INSERT INTO `instanto`.`user` (`username`, `email`, `password`, `enabled`, `display_name`, `ugroup`) VALUES ('root', 'root@instanto.com', 'root', 1, 'Root user', 'root_group');
INSERT INTO `instanto`.`user` (`username`, `email`, `password`, `enabled`, `display_name`, `ugroup`) VALUES ('hugo', 'hugo@instanto.com', 'hugo', 1, 'Hugo González', 'root_group');

COMMIT;


-- -----------------------------------------------------
-- Data for table `instanto`.`permission`
-- -----------------------------------------------------
START TRANSACTION;
USE `instanto`;
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('article_create', 'Create article');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('article_update_mine', 'Update article created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('article_delete_mine', 'Delete article created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('newspaper_create', 'Create newspaper');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('newspaper_update_mine', 'Update newspaper created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('newspaper_delete_mine', 'Delete newspaper created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('partner_create', 'Create partner');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('partner_update_mine', 'Update partner created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('partner_delete_mine', 'Delete partner created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_area_create', 'Create research area');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_area_update_mine', 'Update research area created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_area_delete_mine', 'Delete research area created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('funding_body_create', 'Create funding body');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('funding_body_update_mine', 'Update funding body created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('funding_body_delete_mine', 'Delete funding body created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('financed_project_create', 'Create financed project');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('financed_project_update_mine', 'Update financed project created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('financed_project_delete_mine', 'Delete financed project created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('status_create', 'Create status');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('status_update_mine', 'Update status created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('status_delete_mine', 'Delete status created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('member_create', 'Create member');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('member_update_mine', 'Update member created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('member_delete_mine', 'Delete member created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('student_work_create', 'Create student work');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('student_work_update_mine', 'Update student work created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('student_work_delete_mine', 'Delete student work created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('student_work_type_create', 'Create student work type');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('student_work_type_update_mine', 'Update student work type created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('student_work_type_delete_mine', 'Delete student work type created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('publication_type_create', 'Create publication type');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('publication_type_update_mine', 'Update publication type created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('publication_type_delete_mine', 'Delete publication type created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('publisher_create', 'Create publisher');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('publisher_update_mine', 'Update publisher created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('publisher_delete_mine', 'Delete publisher created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('publication_create', 'Create publication');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('publication_update_mine', 'Update publication created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('publication_delete_mine', 'Delete publication created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_create', 'Create research line');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_update_mine', 'Update research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_delete_mine', 'Delete research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('resource_type_create', 'Create resource type');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('resource_type_update_mine', 'Update resource type created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('resource_type_delete_mine', 'Delete resource type created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('resource_create', 'Create reosource');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('resource_update_mine', 'Update resource created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('resource_delete_mine', 'Delete resource created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('partner_member_add_mine_mine', 'Add members created by me to a partner created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('partner_member_remove_mine_mine', 'Remove members created by me from a partner created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('member_status_add_mine_mine', 'Add status created by me to a member created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('member_status_remove_mine_mine', 'Remove status created by me from a member created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('funding_body_financed_project_add_mine_mine', 'Add financed projects created by me to a funding body created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('funding_body_financed_project_remove_mine_mine', 'Remove financed projects created by me from a funding body created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_area_research_line_add_mine_mine', 'Add research lines created by me to a research area created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_area_research_line_remove_mine_mine', 'Remove research lines created by me from a research area created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('member_publication_add_mine_mine', 'Add publications created by me to a member created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('member_publication_remove_mine_mine', 'Remove publications created by me from a member created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_article_add_mine_mine', 'Add articles created by me to a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_article_remove_mine_mine', 'Remove articles created by me from a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_partner_add_mine_mine', 'Add partners created by me to a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_partner_remove_mine_mine', 'Remove partners created by me from a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_financed_project_add_mine_mine', 'Add financed projects created by me to a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_financed_project_remove_mine_mine', 'Remove financed projects created by me from a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_member_add_mine_mine', 'Add members created by me to a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_member_remove_mine_mine', 'Remove members created by me from a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('financed_project_member_add_mine_mine', 'Add members created by me to a financed project created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('financed_project_member_remove_mine_mine', 'Remove members created by me from a financed project created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('financed_project_leader_add_mine_mine', 'Add leaders created by me to a financed project created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('financed_project_leader_remove_mine_mine', 'Remove leaders created by me from a financed project created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_student_work_add_mine_mine', 'Add student works created by me to a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_student_work_remove_mine_mine', 'Remove student workscreated by me  from a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_publication_add_mine_mine', 'Add publications created by me to a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_publication_remove_mine_mine', 'Remove publications created by me from a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_resource_add_mine_mine', 'Add resources created by me to a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_resource_remove_mine_mine', 'Remove resources created by me from a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('funding_body_financed_project_update_mine_mine', 'Update the record of the funding if the funding body and the financed project are mine');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('log_view', 'View the system log');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('user_create', 'Create user');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('user_update_mine', 'Update user created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('user_disable_mine', 'Disable user created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('rol_create', 'Create rol');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('rol_update_mine', 'Update rol created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('rol_delete_mine', 'Delete rol created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('rol_permission_add_mine', 'Add permissions to a rol created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('rol_permission_remove_mine', 'Remove permissions from a rol created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('group_create', 'Create group');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('group_update_mine', 'Update group created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('group_delete_mine', 'Delete group created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('user_enable_mine', 'Enable user created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('group_user_add_mine_mine', 'Add users created by me to a group created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('group_user_remove_mine_mine', 'Remove users created by me from a group created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('article_update_other', 'Update article created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('article_delete_other', 'Delete article created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('financed_project_update_other', 'Update financed project created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('financed_project_delete_other', 'Delete financed project created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('funding_body_update_other', 'Update funding body created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('funding_body_delete_other', 'Delete funding body created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('group_update_other', 'Update group created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('group_delete_other', 'Delete group created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('member_update_other', 'Update member created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('member_delete_other', 'Delete member created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('newspaper_update_other', 'Update newspaper created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('newspaper_delete_other', 'Delete newspaper created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('partner_update_other', 'Update newspaper created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('partner_delete_other', 'Delete newspaper created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('publication_update_other', 'Update publication created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('publication_delete_other', 'Delete publication created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('publication_type_update_other', 'Update publication created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('publication_type_delete_other', 'Delete publication created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('publisher_update_other', 'Update publisher created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('publisher_delete_other', 'Delete publisher created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('resource_update_other', 'Update resource created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('resource_delete_other', 'Delete resource created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_area_update_other', 'Update research area created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_area_delete_other', 'Delete research area created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_update_other', 'Update research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_delete_other', 'Delete research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('resource_type_update', 'Update resource type created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('resource_type_delete', 'Delete resource type created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('rol_update_other', 'Update rol created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('rol_delete_other', 'Delete rol created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('status_update_other', 'Update status created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('status_delete_other', 'Delete status created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('student_work_update_other', 'Update student work created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('student_work_delete_other', 'Delete student work created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('student_work_type_update_other', 'Update student work type created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('student_work_type_delete_other', 'Delete student work type created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('user_update_other', 'Update user created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('user_disable_other', 'Disable user created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('user_enable_other', 'Enable user created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('financed_project_leader_add_mine_other', 'Add leaders created by other to a financed project created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('financed_project_leader_add_other_mine', 'Add leaders created by me to a financed project created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('financed_project_leader_add_other_other', 'Add leaders created by other to a financed project created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('financed_project_leader_remove_mine_other', 'Remove members created by other from a financed project created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('financed_project_leader_remove_other_mine', 'Remove members created by other from a financed project created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('financed_project_leader_remove_other_other', 'Remove members created by other from a financed project created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('financed_project_member_add_mine_other', 'Add members created by other to a financed project created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('financed_project_member_add_other_mine', 'Add members created by me to a financed project created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('financed_project_member_add_other_other', 'Add members created by other to a financed project created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('financed_project_member_remove_mine_other', 'Remove members created by other from a financed project created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('financed_project_member_remove_other_mine', 'Remove members created by me from a financed project created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('financed_project_member_remove_other_other', 'Remove members created by other from a financed project created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('funding_body_financed_project_mine_other', 'Add financed projects created by other to a funding body created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('funding_body_financed_project_other_mine', 'Add financed projects created by me to a funding body created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('funding_body_financed_project_other_other', 'Add financed projects created by other to a funding body created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('funding_body_financed_project_remove_mine_other', 'Remove financed projects created by other from a funding body created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('funding_body_financed_project_remove_other_mine', 'Remove financed projects created by me from a funding body created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('funding_body_financed_project_remove_other_other', 'Remove financed projects created by other from a funding body created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('group_user_add_mine_other', 'Add users created by other to a group created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('group_user_add_other_mine', 'Add users created by me to a group created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('group_user_add_other_other', 'Add users created by other to a group created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('group_user_remove_mine_other', 'Remove users created by other from a group created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('group_user_remove_other_mine', 'Remove users created by other from a group created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('group_user_remove_other_other', 'Remove users created by other from a group created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('member_publication_add_mine_other', 'Add publications created by other to a member created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('member_publication_add_other_mine', 'Add publications created by me to a member created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('member_publication_add_other_other', 'Add publications created by other to a member created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('member_publication_remove_mine_other', 'Remove publications created by other from a member created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('member_publication_remove_other_mine', 'Remove publications created by me from a member created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('member_publication_remove_other_other', 'Remove publications created by other from a member created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('member_status_add_mine_other', 'Add statuses created by other to a member created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('member_status_add_other_mine', 'Add statuses created by me to a member created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('member_status_add_other_other', 'Add statuses created by other to a member created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('member_status_remove_mine_other', 'Remove statuses created by other from a member created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('member_status_remove_other_mine', 'Remove statuses created by me from a member created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('member_status_remove_other_other', 'Remove statuses created by other from a member created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('partner_member_add_mine_other', 'Add members created by other to a partner created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('partner_member_add_other_mine', 'Add members created by me to a partner created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('partner_member_add_other_other', 'Add members created by other to a partner created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('partner_member_remove_mine_other', 'Remove members created by other from a partner created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('partner_member_remove_other_mine', 'Remove members created by me from a partner created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('partner_member_remove_other_other', 'Remove members created by other from a partner created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_area_research_line_add_mine_other', 'Add research lines created by other to a research area created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_area_research_line_add_other_mine', 'Add research lines created by me to a research area created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_area_research_line_add_other_other', 'Add research lines created by other to a research area created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_area_research_line_remove_mine_other', 'Remove research lines created by other from a research area created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_area_research_line_remove_other_mine', 'Remove research lines created by me from a research area created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_area_research_line_remove_other_other', 'Remove research lines created by other from a research area created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_article_add_mine_other', 'Add articles created by other to a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_article_add_other_mine', 'Add articles created by me to a research linecreated by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_article_add_other_other', 'Add articles created by other to a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_article_remove_mine_other', 'Remove articles created by other from a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_article_remove_other_mine', 'Remove articles created by me from a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_article_remove_other_other', 'Remove articles created by other from a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_financed_project_add_mine_other', 'Add financed projects created by other to a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_financed_project_add_other_mine', 'Add financed projects created by me to a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_financed_project_add_other_other', 'Add financed projects created by other to a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_financed_project_remove_mine_other', 'Remove financed projects created by other from a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_financed_project_remove_other_mine', 'Remove financed projects created by me from a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_financed_project_remove_other_other', 'Remove financed projects created by other from a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_member_add_mine_other', 'Add members created by other to a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_member_add_other_mine', 'Add members created by me to a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_member_add_other_other', 'Add members created by other to a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_member_remove_mine_other', 'Remove members created by other from a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_member_remove_other_mien', 'Remove members created by me from a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_member_remove_other_other', 'Remove members created by other from a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_partner_add_mine_other', 'Add partners created by other from a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_partner_add_other_mine', 'Add partners created by me from a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_partner_add_other_other', 'Add partners created by other from a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_partner_remove_mine_other', 'Remove partners created by other from a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_partner_remove_other_mine', 'Remove partners created by me from a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_partner_remove_other_other', 'Remove partners created by other from a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_publication_add_mine_other', 'Add publications created by other to a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_publication_add_other_mine', 'Add publications created by me to a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_publication_add_other_other', 'Add publication created by other to a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_publication_remove_mine_other', 'Remove publications created by other from a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_publication_remove_other_mine', 'Remove publications created by me from a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_publication_remove_other_other', 'Remove publications created by other from a research line creared by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_resource_add_mine_other', 'Add resources created by other to a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_resource_add_other_mine', 'Add resources created by me to a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_resource_add_other_other', 'Add resources created by other to a reseach line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_resouce_remove_mine_other', 'Remove resources created by other from a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_resource_remove_other_mine', 'Remove resources created by me from a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_resource_remove_other_other', 'Remove resources created by other from a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_student_work_add_mine_other', 'Add student works created by other to a reseach line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_student_work_add_other_mine', 'Add student works created by me to a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_student_work_add_other_other', 'Add student works created by other to a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_student_work_remove_mine_other', 'Remove student works created by other from a research line created by me');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_student_work_remove_other_mine', 'Remove student works created by me from a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('research_line_student_work_remove_other_other', 'Remove student works created by other from a research line created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('rol_permission_add_other', 'Add permissions to a rol created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('rol_permission_remove_other', 'Remove permissions from a rol created by other');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('user_disable_itself', 'Disable the user logged in only');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('user_update_itself', 'Update the user logged in only');
INSERT INTO `instanto`.`permission` (`id`, `display_name`) VALUES ('access_log_view', 'View the access log');

COMMIT;

