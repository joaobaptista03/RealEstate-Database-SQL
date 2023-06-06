CREATE DATABASE IF NOT EXISTS LTR;

CREATE TABLE IF NOT EXISTS `LTR`.`Funcionário` (
  `ID` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `DataNascimento` DATE NULL,
  `Género` CHAR(1) NULL,
  `ÁreaResidência` VARCHAR(45) NULL,
  `Função` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  `Supervisor` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `Supervisor_idx` (`Supervisor` ASC) VISIBLE,
  CONSTRAINT `Supervisor`
    FOREIGN KEY (`Supervisor`)
    REFERENCES `LTR`.`Funcionário` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `LTR`.`Local` (
  `ID` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `ValorMedM2` DECIMAL(7,2) NULL,
  `ValorMedArrendar` DECIMAL(7,2) NULL,
  PRIMARY KEY (`ID`));

CREATE TABLE IF NOT EXISTS `LTR`.`Propriedade` (
  `ID` INT NOT NULL,
  `Local` INT NULL,
  `Valor` DECIMAL(9,2) NULL,
  `Área` INT NULL,
  `Utilização` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  INDEX `Local_idx` (`Local` ASC) VISIBLE,
  CONSTRAINT `Local`
    FOREIGN KEY (`Local`)
    REFERENCES `LTR`.`Local` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `LTR`.`Arrendatário` (
  `ID` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `DataNascimento` DATE NULL,
  `Género` CHAR(1) NULL,
  `ÁreaResidência` VARCHAR(45) NULL,
  `Profissão` TEXT NULL,
  PRIMARY KEY (`ID`));

CREATE TABLE IF NOT EXISTS `LTR`.`Proprietário` (
  `ID` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `DataNascimento` DATE NULL,
  `Género` CHAR(1) NULL,
  `ÁreaResidência` VARCHAR(45) NULL,
  `Profissão` TEXT NULL,
  PRIMARY KEY (`ID`));
  
CREATE TABLE IF NOT EXISTS `LTR`.`GerePropriedade` (
  `Funcionário` INT NULL,
  `Propriedade` INT NULL,
  INDEX `Propriedade_idx` (`Propriedade` ASC) VISIBLE,
  CONSTRAINT `Funcionário`
    FOREIGN KEY (`Funcionário`)
    REFERENCES `LTR`.`Funcionário` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Propriedade`
    FOREIGN KEY (`Propriedade`)
    REFERENCES `LTR`.`Propriedade` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `LTR`.`Compra` (
  `ID` INT NOT NULL,
  `Propriedade` INT NULL,
  `AntigoProprietário` INT NULL,
  `NovoProprietário` INT NULL,
  `ValorAquisição` DOUBLE NULL,
  `DataAquisição` DATETIME NULL,
  PRIMARY KEY (`ID`),
  INDEX `NovoProp_idx` (`NovoProprietário` ASC) VISIBLE,
  INDEX `AntigoProp_idx` (`AntigoProprietário` ASC) VISIBLE,
  INDEX `Propriedade_idx` (`Propriedade` ASC) VISIBLE,
  CONSTRAINT `AntigoProp`
    FOREIGN KEY (`AntigoProprietário`)
    REFERENCES `LTR`.`Proprietário` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `NovoProp`
    FOREIGN KEY (`NovoProprietário`)
    REFERENCES `LTR`.`Proprietário` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Prop`
    FOREIGN KEY (`Propriedade`)
    REFERENCES `LTR`.`Propriedade` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE IF NOT EXISTS `LTR`.`Arrendamento` (
  `ID` INT NOT NULL,
  `Propriedade` INT NULL,
  `Arrendatário` INT NULL,
  `DataAssinatura` DATE NULL,
  `Duração` INT NULL,
  `ValorMensal` DECIMAL(8,2) NULL,
  PRIMARY KEY (`ID`),
  INDEX `Arrendatário_idx` (`Arrendatário` ASC) VISIBLE,
  INDEX `Propriedade_idx` (`Propriedade` ASC) VISIBLE,
  CONSTRAINT `Arrendatário`
    FOREIGN KEY (`Arrendatário`)
    REFERENCES `LTR`.`Arrendatário` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Propp`
    FOREIGN KEY (`Propriedade`)
    REFERENCES `LTR`.`Propriedade` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
