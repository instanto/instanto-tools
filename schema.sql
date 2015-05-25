-- phpMyAdmin SQL Dump
-- version 4.2.6deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 25, 2015 at 01:19 PM
-- Server version: 5.5.41-0ubuntu0.14.10.1
-- PHP Version: 5.5.12-2ubuntu4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `instanto`
--
CREATE DATABASE IF NOT EXISTS `instanto` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `instanto`;

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
`id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `web` varchar(200) NOT NULL,
  `date` int(11) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `updated_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `newspaper` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=194 ;

--
-- RELATIONS FOR TABLE `article`:
--   `created_by`
--       `user` -> `username`
--   `updated_by`
--       `user` -> `username`
--   `newspaper`
--       `newspaper` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
`id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `updated_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- RELATIONS FOR TABLE `category`:
--   `created_by`
--       `user` -> `username`
--   `updated_by`
--       `user` -> `username`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_resource`
--

DROP TABLE IF EXISTS `category_resource`;
CREATE TABLE IF NOT EXISTS `category_resource` (
  `category` int(11) NOT NULL,
  `resource` varchar(45) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `category_resource`:
--   `created_by`
--       `user` -> `username`
--   `category`
--       `category` -> `id`
--   `resource`
--       `resource` -> `filename_hash`
--

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `config_key` varchar(45) NOT NULL,
  `config_value` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `financed_project`
--

DROP TABLE IF EXISTS `financed_project`;
CREATE TABLE IF NOT EXISTS `financed_project` (
`id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `started` int(11) NOT NULL,
  `ended` int(11) NOT NULL,
  `budget` int(11) NOT NULL,
  `scope` varchar(45) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `updated_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `primary_funding_body` int(11) NOT NULL,
  `primary_record` varchar(45) NOT NULL,
  `primary_leader` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- RELATIONS FOR TABLE `financed_project`:
--   `created_by`
--       `user` -> `username`
--   `updated_by`
--       `user` -> `username`
--   `primary_funding_body`
--       `funding_body` -> `id`
--   `primary_leader`
--       `member` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `financed_project_leader`
--

DROP TABLE IF EXISTS `financed_project_leader`;
CREATE TABLE IF NOT EXISTS `financed_project_leader` (
  `financed_project` int(11) NOT NULL,
  `member` int(11) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `financed_project_leader`:
--   `created_by`
--       `user` -> `username`
--   `financed_project`
--       `financed_project` -> `id`
--   `member`
--       `member` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `financed_project_member`
--

DROP TABLE IF EXISTS `financed_project_member`;
CREATE TABLE IF NOT EXISTS `financed_project_member` (
  `financed_project` int(11) NOT NULL,
  `member` int(11) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `financed_project_member`:
--   `created_by`
--       `user` -> `username`
--   `financed_project`
--       `financed_project` -> `id`
--   `member`
--       `member` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `funding_body`
--

DROP TABLE IF EXISTS `funding_body`;
CREATE TABLE IF NOT EXISTS `funding_body` (
`id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `web` varchar(200) NOT NULL,
  `scope` varchar(45) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `updated_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- RELATIONS FOR TABLE `funding_body`:
--   `created_by`
--       `user` -> `username`
--   `updated_by`
--       `user` -> `username`
--

-- --------------------------------------------------------

--
-- Table structure for table `funding_body_financed_project`
--

DROP TABLE IF EXISTS `funding_body_financed_project`;
CREATE TABLE IF NOT EXISTS `funding_body_financed_project` (
  `funding_body` int(11) NOT NULL,
  `financed_project` int(11) NOT NULL,
  `record` varchar(45) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `updated_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `funding_body_financed_project`:
--   `created_by`
--       `user` -> `username`
--   `updated_by`
--       `user` -> `username`
--   `funding_body`
--       `funding_body` -> `id`
--   `financed_project`
--       `financed_project` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
`id` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `degree` varchar(45) CHARACTER SET big5 NOT NULL,
  `year_in` int(11) NOT NULL,
  `year_out` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `cv` varchar(32) NOT NULL DEFAULT '',
  `photo` varchar(32) NOT NULL DEFAULT '',
  `created_by` varchar(45) NOT NULL,
  `updated_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `primary_status` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=278 ;

--
-- RELATIONS FOR TABLE `member`:
--   `created_by`
--       `user` -> `username`
--   `updated_by`
--       `user` -> `username`
--   `primary_status`
--       `status` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `member_publication`
--

DROP TABLE IF EXISTS `member_publication`;
CREATE TABLE IF NOT EXISTS `member_publication` (
  `member` int(11) NOT NULL,
  `publication` int(11) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `member_publication`:
--   `created_by`
--       `user` -> `username`
--   `member`
--       `member` -> `id`
--   `publication`
--       `publication` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `member_status`
--

DROP TABLE IF EXISTS `member_status`;
CREATE TABLE IF NOT EXISTS `member_status` (
  `member` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `member_status`:
--   `created_by`
--       `user` -> `username`
--   `member`
--       `member` -> `id`
--   `status`
--       `status` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `newspaper`
--

DROP TABLE IF EXISTS `newspaper`;
CREATE TABLE IF NOT EXISTS `newspaper` (
`id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `web` varchar(200) NOT NULL,
  `logo` varchar(32) NOT NULL DEFAULT '',
  `created_by` varchar(45) NOT NULL,
  `updated_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- RELATIONS FOR TABLE `newspaper`:
--   `created_by`
--       `user` -> `username`
--   `updated_by`
--       `user` -> `username`
--

-- --------------------------------------------------------

--
-- Table structure for table `partner`
--

DROP TABLE IF EXISTS `partner`;
CREATE TABLE IF NOT EXISTS `partner` (
`id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `web` varchar(45) NOT NULL,
  `logo` varchar(32) NOT NULL DEFAULT '',
  `same_department` tinyint(1) NOT NULL,
  `scope` varchar(45) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `updated_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='z' AUTO_INCREMENT=54 ;

--
-- RELATIONS FOR TABLE `partner`:
--   `created_by`
--       `user` -> `username`
--   `updated_by`
--       `user` -> `username`
--

-- --------------------------------------------------------

--
-- Table structure for table `partner_member`
--

DROP TABLE IF EXISTS `partner_member`;
CREATE TABLE IF NOT EXISTS `partner_member` (
  `partner` int(11) NOT NULL,
  `member` int(11) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `partner_member`:
--   `created_by`
--       `user` -> `username`
--   `partner`
--       `partner` -> `id`
--   `member`
--       `member` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
CREATE TABLE IF NOT EXISTS `permission` (
  `id` varchar(64) NOT NULL,
  `display_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `publication`
--

DROP TABLE IF EXISTS `publication`;
CREATE TABLE IF NOT EXISTS `publication` (
`id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `year` int(11) NOT NULL,
  `book_title` varchar(45) NOT NULL,
  `chapter` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `conference_name` varchar(45) NOT NULL,
  `edition` varchar(45) NOT NULL,
  `institution` varchar(45) NOT NULL,
  `isbn` varchar(45) NOT NULL,
  `issn` varchar(45) NOT NULL,
  `journal` varchar(45) NOT NULL,
  `language` varchar(45) NOT NULL,
  `nationality` varchar(45) NOT NULL,
  `number` varchar(45) NOT NULL,
  `organization` varchar(45) NOT NULL,
  `pages` varchar(45) NOT NULL,
  `school` varchar(45) NOT NULL COMMENT '	',
  `series` varchar(45) NOT NULL,
  `volume` varchar(45) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `updated_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `publication_type` int(11) NOT NULL,
  `publisher` int(11) NOT NULL,
  `primary_author` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- RELATIONS FOR TABLE `publication`:
--   `created_by`
--       `user` -> `username`
--   `updated_by`
--       `user` -> `username`
--   `publication_type`
--       `publication_type` -> `id`
--   `publisher`
--       `publisher` -> `id`
--   `primary_author`
--       `member` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `publication_type`
--

DROP TABLE IF EXISTS `publication_type`;
CREATE TABLE IF NOT EXISTS `publication_type` (
`id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `updated_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- RELATIONS FOR TABLE `publication_type`:
--   `created_by`
--       `user` -> `username`
--   `updated_by`
--       `user` -> `username`
--

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
CREATE TABLE IF NOT EXISTS `publisher` (
`id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `updated_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- RELATIONS FOR TABLE `publisher`:
--   `created_by`
--       `user` -> `username`
--   `updated_by`
--       `user` -> `username`
--

-- --------------------------------------------------------

--
-- Table structure for table `research_area`
--

DROP TABLE IF EXISTS `research_area`;
CREATE TABLE IF NOT EXISTS `research_area` (
`id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `logo` varchar(32) NOT NULL DEFAULT '',
  `created_by` varchar(45) NOT NULL,
  `updated_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- RELATIONS FOR TABLE `research_area`:
--   `created_by`
--       `user` -> `username`
--   `updated_by`
--       `user` -> `username`
--

-- --------------------------------------------------------

--
-- Table structure for table `research_area_research_line`
--

DROP TABLE IF EXISTS `research_area_research_line`;
CREATE TABLE IF NOT EXISTS `research_area_research_line` (
  `research_area` int(11) NOT NULL,
  `research_line` int(11) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `research_area_research_line`:
--   `created_by`
--       `user` -> `username`
--   `research_area`
--       `research_area` -> `id`
--   `research_line`
--       `research_line` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `research_line`
--

DROP TABLE IF EXISTS `research_line`;
CREATE TABLE IF NOT EXISTS `research_line` (
`id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `finished` tinyint(1) NOT NULL,
  `description` text NOT NULL,
  `logo` varchar(32) NOT NULL DEFAULT '',
  `created_by` varchar(45) NOT NULL,
  `updated_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `primary_research_area` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=76 ;

--
-- RELATIONS FOR TABLE `research_line`:
--   `created_by`
--       `user` -> `username`
--   `updated_by`
--       `user` -> `username`
--   `primary_research_area`
--       `research_area` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `research_line_article`
--

DROP TABLE IF EXISTS `research_line_article`;
CREATE TABLE IF NOT EXISTS `research_line_article` (
  `research_line` int(11) NOT NULL,
  `article` int(11) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `research_line_article`:
--   `created_by`
--       `user` -> `username`
--   `research_line`
--       `research_line` -> `id`
--   `article`
--       `article` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `research_line_financed_project`
--

DROP TABLE IF EXISTS `research_line_financed_project`;
CREATE TABLE IF NOT EXISTS `research_line_financed_project` (
  `research_line` int(11) NOT NULL,
  `financed_project` int(11) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `research_line_financed_project`:
--   `created_by`
--       `user` -> `username`
--   `research_line`
--       `research_line` -> `id`
--   `financed_project`
--       `financed_project` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `research_line_member`
--

DROP TABLE IF EXISTS `research_line_member`;
CREATE TABLE IF NOT EXISTS `research_line_member` (
  `research_line` int(11) NOT NULL,
  `member` int(11) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `research_line_member`:
--   `created_by`
--       `user` -> `username`
--   `research_line`
--       `research_line` -> `id`
--   `member`
--       `member` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `research_line_partner`
--

DROP TABLE IF EXISTS `research_line_partner`;
CREATE TABLE IF NOT EXISTS `research_line_partner` (
  `research_line` int(11) NOT NULL,
  `partner` int(11) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `research_line_partner`:
--   `created_by`
--       `user` -> `username`
--   `research_line`
--       `research_line` -> `id`
--   `partner`
--       `partner` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `research_line_publication`
--

DROP TABLE IF EXISTS `research_line_publication`;
CREATE TABLE IF NOT EXISTS `research_line_publication` (
  `research_line` int(11) NOT NULL,
  `publication` int(11) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `research_line_publication`:
--   `created_by`
--       `user` -> `username`
--   `research_line`
--       `research_line` -> `id`
--   `publication`
--       `publication` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `research_line_resource`
--

DROP TABLE IF EXISTS `research_line_resource`;
CREATE TABLE IF NOT EXISTS `research_line_resource` (
  `research_line` int(11) NOT NULL,
  `resource` varchar(32) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `research_line_resource`:
--   `created_by`
--       `user` -> `username`
--   `research_line`
--       `research_line` -> `id`
--   `resource`
--       `resource` -> `filename_hash`
--

-- --------------------------------------------------------

--
-- Table structure for table `research_line_student_work`
--

DROP TABLE IF EXISTS `research_line_student_work`;
CREATE TABLE IF NOT EXISTS `research_line_student_work` (
  `research_line` int(11) NOT NULL,
  `student_work` int(11) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `research_line_student_work`:
--   `created_by`
--       `user` -> `username`
--   `research_line`
--       `research_line` -> `id`
--   `student_work`
--       `student_work` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
CREATE TABLE IF NOT EXISTS `resource` (
  `filename_hash` varchar(32) NOT NULL,
  `filename` varchar(45) NOT NULL,
  `mime_type` varchar(45) NOT NULL,
  `size` int(11) NOT NULL,
  `private` tinyint(1) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `updated_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `resource`:
--   `created_by`
--       `user` -> `username`
--   `updated_by`
--       `user` -> `username`
--

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `id` varchar(45) NOT NULL,
  `display_name` varchar(45) NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rol_permission`
--

DROP TABLE IF EXISTS `rol_permission`;
CREATE TABLE IF NOT EXISTS `rol_permission` (
  `rol` varchar(45) NOT NULL,
  `permission` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `rol_permission`:
--   `rol`
--       `rol` -> `id`
--   `permission`
--       `permission` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
`id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(200) NOT NULL,
  `created_by` varchar(45) NOT NULL COMMENT '	',
  `updated_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=133 ;

--
-- RELATIONS FOR TABLE `status`:
--   `created_by`
--       `user` -> `username`
--   `updated_by`
--       `user` -> `username`
--

-- --------------------------------------------------------

--
-- Table structure for table `student_work`
--

DROP TABLE IF EXISTS `student_work`;
CREATE TABLE IF NOT EXISTS `student_work` (
`id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `year` int(11) NOT NULL,
  `school` varchar(200) NOT NULL,
  `volume` varchar(45) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `updated_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `student_work_type` int(11) NOT NULL,
  `author` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- RELATIONS FOR TABLE `student_work`:
--   `created_by`
--       `user` -> `username`
--   `updated_by`
--       `user` -> `username`
--   `student_work_type`
--       `student_work_type` -> `id`
--   `author`
--       `member` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `student_work_type`
--

DROP TABLE IF EXISTS `student_work_type`;
CREATE TABLE IF NOT EXISTS `student_work_type` (
`id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `updated_by` varchar(45) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- RELATIONS FOR TABLE `student_work_type`:
--   `created_by`
--       `user` -> `username`
--   `updated_by`
--       `user` -> `username`
--

-- --------------------------------------------------------

--
-- Table structure for table `timestamps`
--

DROP TABLE IF EXISTS `timestamps`;
CREATE TABLE IF NOT EXISTS `timestamps` (
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ugroup`
--

DROP TABLE IF EXISTS `ugroup`;
CREATE TABLE IF NOT EXISTS `ugroup` (
  `id` varchar(45) NOT NULL,
  `display_name` varchar(45) NOT NULL,
  `rol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `ugroup`:
--   `rol`
--       `rol` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(60) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `display_name` varchar(45) NOT NULL,
  `ugroup` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `user`:
--   `ugroup`
--       `ugroup` -> `id`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_article_1_idx` (`created_by`), ADD KEY `fk_article_2_idx` (`updated_by`), ADD KEY `fk_article_3_idx` (`newspaper`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_resource_type_1_idx` (`created_by`), ADD KEY `fk_resource_type_2_idx` (`updated_by`);

--
-- Indexes for table `category_resource`
--
ALTER TABLE `category_resource`
 ADD PRIMARY KEY (`category`,`resource`), ADD KEY `fk_category_resource_1_idx` (`created_by`), ADD KEY `fk_category_resource_3_idx` (`resource`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
 ADD PRIMARY KEY (`config_key`);

--
-- Indexes for table `financed_project`
--
ALTER TABLE `financed_project`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_financed_project_1_idx` (`created_by`), ADD KEY `fk_financed_project_2_idx` (`updated_by`), ADD KEY `fk_financed_project_4_idx` (`primary_leader`), ADD KEY `fk_financed_project_3_idx` (`primary_funding_body`);

--
-- Indexes for table `financed_project_leader`
--
ALTER TABLE `financed_project_leader`
 ADD PRIMARY KEY (`financed_project`,`member`), ADD KEY `fk_financed_project_leader_1_idx` (`created_by`), ADD KEY `fk_financed_project_leader_3_idx` (`member`);

--
-- Indexes for table `financed_project_member`
--
ALTER TABLE `financed_project_member`
 ADD PRIMARY KEY (`financed_project`,`member`), ADD KEY `fk_financed_project_member_1_idx` (`created_by`), ADD KEY `fk_financed_project_member_3_idx` (`member`);

--
-- Indexes for table `funding_body`
--
ALTER TABLE `funding_body`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_funding_body_1_idx` (`created_by`), ADD KEY `fk_funding_body_2_idx` (`updated_by`);

--
-- Indexes for table `funding_body_financed_project`
--
ALTER TABLE `funding_body_financed_project`
 ADD PRIMARY KEY (`funding_body`,`financed_project`), ADD KEY `fk_funding_body_financed_project_1_idx` (`created_by`), ADD KEY `fk_funding_body_financed_project_2_idx` (`updated_by`), ADD KEY `fk_funding_body_financed_project_4_idx` (`financed_project`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_member_1_idx` (`created_by`), ADD KEY `fk_member_2_idx` (`updated_by`), ADD KEY `fk_member_3_idx` (`primary_status`);

--
-- Indexes for table `member_publication`
--
ALTER TABLE `member_publication`
 ADD PRIMARY KEY (`member`,`publication`), ADD KEY `fk_member_publication_1_idx` (`created_by`), ADD KEY `fk_member_publication_3_idx` (`publication`);

--
-- Indexes for table `member_status`
--
ALTER TABLE `member_status`
 ADD PRIMARY KEY (`member`,`status`), ADD KEY `fk_member_status_1_idx` (`created_by`), ADD KEY `fk_member_status_3_idx` (`status`);

--
-- Indexes for table `newspaper`
--
ALTER TABLE `newspaper`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_newspaper_1_idx` (`created_by`), ADD KEY `fk_newspaper_2_idx` (`updated_by`);

--
-- Indexes for table `partner`
--
ALTER TABLE `partner`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_partner_1_idx` (`created_by`), ADD KEY `fk_partner_2_idx` (`updated_by`);

--
-- Indexes for table `partner_member`
--
ALTER TABLE `partner_member`
 ADD PRIMARY KEY (`partner`,`member`), ADD KEY `fk_partner_member_1_idx` (`created_by`), ADD KEY `fk_partner_member_3_idx` (`member`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `publication`
--
ALTER TABLE `publication`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_publication_1_idx` (`created_by`), ADD KEY `fk_publication_2_idx` (`updated_by`), ADD KEY `fk_publication_3_idx` (`publication_type`), ADD KEY `fk_publication_4_idx` (`publisher`), ADD KEY `fk_publication_5_idx` (`primary_author`);

--
-- Indexes for table `publication_type`
--
ALTER TABLE `publication_type`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_publication_type_1_idx` (`created_by`), ADD KEY `fk_publication_type_2_idx` (`updated_by`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_publisher_1_idx` (`created_by`), ADD KEY `fk_publisher_2_idx` (`updated_by`);

--
-- Indexes for table `research_area`
--
ALTER TABLE `research_area`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_research_area_1_idx` (`created_by`), ADD KEY `fk_research_area_2_idx` (`updated_by`);

--
-- Indexes for table `research_area_research_line`
--
ALTER TABLE `research_area_research_line`
 ADD PRIMARY KEY (`research_area`,`research_line`), ADD KEY `fk_research_area_research_line_1_idx` (`created_by`), ADD KEY `fk_research_area_research_line_3_idx` (`research_line`);

--
-- Indexes for table `research_line`
--
ALTER TABLE `research_line`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_research_line_1_idx` (`created_by`), ADD KEY `fk_research_line_2_idx` (`updated_by`), ADD KEY `fk_research_line_3_idx` (`primary_research_area`);

--
-- Indexes for table `research_line_article`
--
ALTER TABLE `research_line_article`
 ADD PRIMARY KEY (`research_line`,`article`), ADD KEY `fk_research_line_article_1_idx` (`created_by`), ADD KEY `fk_research_line_article_3_idx` (`article`);

--
-- Indexes for table `research_line_financed_project`
--
ALTER TABLE `research_line_financed_project`
 ADD PRIMARY KEY (`research_line`,`financed_project`), ADD KEY `fk_research_line_financed_project_1_idx` (`created_by`), ADD KEY `fk_research_line_financed_project_3_idx` (`financed_project`);

--
-- Indexes for table `research_line_member`
--
ALTER TABLE `research_line_member`
 ADD PRIMARY KEY (`research_line`,`member`), ADD KEY `fk_research_line_member_1_idx` (`created_by`), ADD KEY `fk_research_line_member_3_idx` (`member`);

--
-- Indexes for table `research_line_partner`
--
ALTER TABLE `research_line_partner`
 ADD PRIMARY KEY (`research_line`,`partner`), ADD KEY `fk_research_line_partner_1_idx` (`created_by`), ADD KEY `fk_research_line_partner_3_idx` (`partner`);

--
-- Indexes for table `research_line_publication`
--
ALTER TABLE `research_line_publication`
 ADD PRIMARY KEY (`research_line`,`publication`), ADD KEY `fk_research_line_publication_1_idx` (`created_by`), ADD KEY `fk_research_line_publication_3_idx` (`publication`);

--
-- Indexes for table `research_line_resource`
--
ALTER TABLE `research_line_resource`
 ADD PRIMARY KEY (`research_line`,`resource`), ADD KEY `fk_research_line_resource_1_idx` (`created_by`), ADD KEY `fk_research_line_resource_3_idx` (`resource`);

--
-- Indexes for table `research_line_student_work`
--
ALTER TABLE `research_line_student_work`
 ADD PRIMARY KEY (`research_line`,`student_work`), ADD KEY `fk_research_line_student_work_1_idx` (`created_by`), ADD KEY `fk_research_line_student_work_3_idx` (`student_work`);

--
-- Indexes for table `resource`
--
ALTER TABLE `resource`
 ADD PRIMARY KEY (`filename_hash`), ADD KEY `fk_resource_1_idx` (`created_by`), ADD KEY `fk_resource_2_idx` (`updated_by`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rol_permission`
--
ALTER TABLE `rol_permission`
 ADD PRIMARY KEY (`rol`,`permission`), ADD KEY `fk_rol_permission_3_idx` (`permission`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_status_1_idx` (`created_by`), ADD KEY `fk_status_2_idx` (`updated_by`);

--
-- Indexes for table `student_work`
--
ALTER TABLE `student_work`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_student_work_1_idx` (`created_by`), ADD KEY `fk_student_work_2_idx` (`updated_by`), ADD KEY `fk_student_work_3_idx` (`student_work_type`), ADD KEY `fk_student_work_4_idx` (`author`);

--
-- Indexes for table `student_work_type`
--
ALTER TABLE `student_work_type`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_student_work_type_1_idx` (`created_by`), ADD KEY `fk_student_work_type_2_idx` (`updated_by`);

--
-- Indexes for table `ugroup`
--
ALTER TABLE `ugroup`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_ugroup_rol_idx` (`rol`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`username`), ADD KEY `fk_user_ugroup_ugroup_idx` (`ugroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=194;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `financed_project`
--
ALTER TABLE `financed_project`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `funding_body`
--
ALTER TABLE `funding_body`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=278;
--
-- AUTO_INCREMENT for table `newspaper`
--
ALTER TABLE `newspaper`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `partner`
--
ALTER TABLE `partner`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `publication`
--
ALTER TABLE `publication`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `publication_type`
--
ALTER TABLE `publication_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `research_area`
--
ALTER TABLE `research_area`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `research_line`
--
ALTER TABLE `research_line`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=133;
--
-- AUTO_INCREMENT for table `student_work`
--
ALTER TABLE `student_work`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_work_type`
--
ALTER TABLE `student_work_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
ADD CONSTRAINT `fk_article_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_article_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_article_3` FOREIGN KEY (`newspaper`) REFERENCES `newspaper` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
ADD CONSTRAINT `fk_resource_type_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_resource_type_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `category_resource`
--
ALTER TABLE `category_resource`
ADD CONSTRAINT `fk_category_resource_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_category_resource_2` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_category_resource_3` FOREIGN KEY (`resource`) REFERENCES `resource` (`filename_hash`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `financed_project`
--
ALTER TABLE `financed_project`
ADD CONSTRAINT `fk_financed_project_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_financed_project_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_financed_project_3` FOREIGN KEY (`primary_funding_body`) REFERENCES `funding_body` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_financed_project_4` FOREIGN KEY (`primary_leader`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `financed_project_leader`
--
ALTER TABLE `financed_project_leader`
ADD CONSTRAINT `fk_financed_project_leader_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_financed_project_leader_2` FOREIGN KEY (`financed_project`) REFERENCES `financed_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_financed_project_leader_3` FOREIGN KEY (`member`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `financed_project_member`
--
ALTER TABLE `financed_project_member`
ADD CONSTRAINT `fk_financed_project_member_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_financed_project_member_2` FOREIGN KEY (`financed_project`) REFERENCES `financed_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_financed_project_member_3` FOREIGN KEY (`member`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `funding_body`
--
ALTER TABLE `funding_body`
ADD CONSTRAINT `fk_funding_body_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_funding_body_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `funding_body_financed_project`
--
ALTER TABLE `funding_body_financed_project`
ADD CONSTRAINT `fk_funding_body_financed_project_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_funding_body_financed_project_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_funding_body_financed_project_3` FOREIGN KEY (`funding_body`) REFERENCES `funding_body` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_funding_body_financed_project_4` FOREIGN KEY (`financed_project`) REFERENCES `financed_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `member`
--
ALTER TABLE `member`
ADD CONSTRAINT `fk_member_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_member_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_member_3` FOREIGN KEY (`primary_status`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `member_publication`
--
ALTER TABLE `member_publication`
ADD CONSTRAINT `fk_member_publication_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_member_publication_2` FOREIGN KEY (`member`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_member_publication_3` FOREIGN KEY (`publication`) REFERENCES `publication` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `member_status`
--
ALTER TABLE `member_status`
ADD CONSTRAINT `fk_member_status_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_member_status_2` FOREIGN KEY (`member`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_member_status_3` FOREIGN KEY (`status`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newspaper`
--
ALTER TABLE `newspaper`
ADD CONSTRAINT `fk_newspaper_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_newspaper_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `partner`
--
ALTER TABLE `partner`
ADD CONSTRAINT `fk_partner_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_partner_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `partner_member`
--
ALTER TABLE `partner_member`
ADD CONSTRAINT `fk_partner_member_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_partner_member_2` FOREIGN KEY (`partner`) REFERENCES `partner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_partner_member_3` FOREIGN KEY (`member`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `publication`
--
ALTER TABLE `publication`
ADD CONSTRAINT `fk_publication_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_publication_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_publication_3` FOREIGN KEY (`publication_type`) REFERENCES `publication_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_publication_4` FOREIGN KEY (`publisher`) REFERENCES `publisher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_publication_5` FOREIGN KEY (`primary_author`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `publication_type`
--
ALTER TABLE `publication_type`
ADD CONSTRAINT `fk_publication_type_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_publication_type_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `publisher`
--
ALTER TABLE `publisher`
ADD CONSTRAINT `fk_publisher_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_publisher_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `research_area`
--
ALTER TABLE `research_area`
ADD CONSTRAINT `fk_research_area_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_research_area_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `research_area_research_line`
--
ALTER TABLE `research_area_research_line`
ADD CONSTRAINT `fk_research_area_research_line_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_research_area_research_line_2` FOREIGN KEY (`research_area`) REFERENCES `research_area` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_research_area_research_line_3` FOREIGN KEY (`research_line`) REFERENCES `research_line` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `research_line`
--
ALTER TABLE `research_line`
ADD CONSTRAINT `fk_research_line_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_research_line_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_research_line_3` FOREIGN KEY (`primary_research_area`) REFERENCES `research_area` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `research_line_article`
--
ALTER TABLE `research_line_article`
ADD CONSTRAINT `fk_research_line_article_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_research_line_article_2` FOREIGN KEY (`research_line`) REFERENCES `research_line` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_research_line_article_3` FOREIGN KEY (`article`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `research_line_financed_project`
--
ALTER TABLE `research_line_financed_project`
ADD CONSTRAINT `fk_research_line_financed_project_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_research_line_financed_project_2` FOREIGN KEY (`research_line`) REFERENCES `research_line` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_research_line_financed_project_3` FOREIGN KEY (`financed_project`) REFERENCES `financed_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `research_line_member`
--
ALTER TABLE `research_line_member`
ADD CONSTRAINT `fk_research_line_member_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_research_line_member_2` FOREIGN KEY (`research_line`) REFERENCES `research_line` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_research_line_member_3` FOREIGN KEY (`member`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `research_line_partner`
--
ALTER TABLE `research_line_partner`
ADD CONSTRAINT `fk_research_line_partner_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_research_line_partner_2` FOREIGN KEY (`research_line`) REFERENCES `research_line` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_research_line_partner_3` FOREIGN KEY (`partner`) REFERENCES `partner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `research_line_publication`
--
ALTER TABLE `research_line_publication`
ADD CONSTRAINT `fk_research_line_publication_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_research_line_publication_2` FOREIGN KEY (`research_line`) REFERENCES `research_line` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_research_line_publication_3` FOREIGN KEY (`publication`) REFERENCES `publication` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `research_line_resource`
--
ALTER TABLE `research_line_resource`
ADD CONSTRAINT `fk_research_line_resource_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_research_line_resource_2` FOREIGN KEY (`research_line`) REFERENCES `research_line` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_research_line_resource_3` FOREIGN KEY (`resource`) REFERENCES `resource` (`filename_hash`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `research_line_student_work`
--
ALTER TABLE `research_line_student_work`
ADD CONSTRAINT `fk_research_line_student_work_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_research_line_student_work_2` FOREIGN KEY (`research_line`) REFERENCES `research_line` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_research_line_student_work_3` FOREIGN KEY (`student_work`) REFERENCES `student_work` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resource`
--
ALTER TABLE `resource`
ADD CONSTRAINT `fk_resource_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_resource_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `rol_permission`
--
ALTER TABLE `rol_permission`
ADD CONSTRAINT `fk_rol_permission_2` FOREIGN KEY (`rol`) REFERENCES `rol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rol_permission_3` FOREIGN KEY (`permission`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `status`
--
ALTER TABLE `status`
ADD CONSTRAINT `fk_status_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_status_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_work`
--
ALTER TABLE `student_work`
ADD CONSTRAINT `fk_student_work_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_student_work_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_student_work_3` FOREIGN KEY (`student_work_type`) REFERENCES `student_work_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_student_work_4` FOREIGN KEY (`author`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_work_type`
--
ALTER TABLE `student_work_type`
ADD CONSTRAINT `fk_student_work_type_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_student_work_type_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ugroup`
--
ALTER TABLE `ugroup`
ADD CONSTRAINT `fk_ugroup_rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
ADD CONSTRAINT `fk_user_ugroup_ugroup` FOREIGN KEY (`ugroup`) REFERENCES `ugroup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

