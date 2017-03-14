CREATE TABLE `test`.`User` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  `age` INT(8) NOT NULL,
  `isAdmin` BIT NOT NULL DEFAULT 0,
  `createdDate` TIMESTAMP NOT NULL,
  PRIMARY KEY (`ID`));