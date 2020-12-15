CREATE DATABASE IF NOT EXISTS interview;

USE interview;

DROP TABLE IF EXISTS `interview`.`users`;

CREATE TABLE `interview`.`users` (
  `Firstname` VARCHAR(40) NOT NULL,
  `Lastname` VARCHAR(40) NOT NULL,
  `Password` VARCHAR(40) NOT NULL,
  `Companyemailid` VARCHAR(40)NOT NULL,
  `Mobilenumber` INT(15) NOT NULL,
  `Companyname` VARCHAR(40) NOT NULL,
  `City`VARCHAR(40)NOT NULL,
  alter Table users add Userid int not null auto_increment primary key first;