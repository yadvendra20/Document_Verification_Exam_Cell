CREATE TABLE `Users` (
	`ID` TIMESTAMP NOT NULL AUTO_INCREMENT,
	`ACK_No` VARCHAR(255) NOT NULL,
	`name` varchar NOT NULL,
	`PRN` varchar NOT NULL,
	`email` varchar NOT NULL,
	`date_of_application` DATE NOT NULL,
	PRIMARY KEY (`ID`,`ACK_No`)
);

CREATE TABLE `Verification Status of Users` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`user_ID` TIMESTAMP NOT NULL,
	`verification_ID` INT NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Verified Users` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`user_ID` TIMESTAMP NOT NULL AUTO_INCREMENT,
	`date_of_verification` DATE NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Verification Status` (
	`ID` INT NOT NULL,
	`status` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Documents` (
	`ID` INT NOT NULL,
	`name` varchar NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `User Docs` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`user_ID` INT NOT NULL,
	`doc_ID` INT NOT NULL,
	`doc_link` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Verified User's Docs` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`doc_ID` INT NOT NULL,
	`doc_link` VARCHAR(255) NOT NULL,
	`verified_user_ID` INT NOT NULL,
	PRIMARY KEY (`ID`)
);

ALTER TABLE `Verification Status of Users` ADD CONSTRAINT `Verification Status of Users_fk0` FOREIGN KEY (`user_ID`) REFERENCES `Users`(`ID`);

ALTER TABLE `Verification Status of Users` ADD CONSTRAINT `Verification Status of Users_fk1` FOREIGN KEY (`verification_ID`) REFERENCES `Verification Status`(`ID`);

ALTER TABLE `Verified Users` ADD CONSTRAINT `Verified Users_fk0` FOREIGN KEY (`user_ID`) REFERENCES `Users`(`ID`);

ALTER TABLE `User Docs` ADD CONSTRAINT `User Docs_fk0` FOREIGN KEY (`user_ID`) REFERENCES `Users`(`ID`);

ALTER TABLE `User Docs` ADD CONSTRAINT `User Docs_fk1` FOREIGN KEY (`doc_ID`) REFERENCES `Documents`(`ID`);

ALTER TABLE `Verified User's Docs` ADD CONSTRAINT `Verified User's Docs_fk0` FOREIGN KEY (`doc_ID`) REFERENCES `Documents`(`ID`);

ALTER TABLE `Verified User's Docs` ADD CONSTRAINT `Verified User's Docs_fk1` FOREIGN KEY (`verified_user_ID`) REFERENCES `Verified Users`(`ID`);

