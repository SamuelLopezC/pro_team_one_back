-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema osar
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `osar` ;

-- -----------------------------------------------------
-- Schema osar
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `osar` DEFAULT CHARACTER SET utf8 ;
USE `osar` ;

-- -----------------------------------------------------
-- Table `osar`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `osar`.`Usuario` (
  `idUsuario` INT NOT NULL,
  `nombreCompleto` VARCHAR(100) NOT NULL,
  `tipoPersona` VARCHAR(40) NOT NULL,
  `edad` INT NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `tipoUsuario` VARCHAR(45) NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `osar`.`Inversor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `osar`.`Inversor` (
  `idUsuario` INT NOT NULL,
  `totalDinero` DECIMAL NULL DEFAULT 50,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Inversor_usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `osar`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `osar`.`Founding`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `osar`.`Founding` (
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Founding_usuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `osar`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `osar`.`Proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `osar`.`Proyecto` (
  `idProyecto` INT NOT NULL,
  `name` VARCHAR(80) NOT NULL,
  `fechaInicio` DATE NOT NULL,
  `fechaTermino` DATE NULL,
  `imagen` BLOB NOT NULL,
  `Descripcion` VARCHAR(300) NOT NULL,
  `Estatus` VARCHAR(45) NOT NULL,
  `precioInversion` INT NOT NULL,
  `totalCorazones` INT NULL,
  `totalParticipantes` INT NULL,
  `idUsuario` INT NOT NULL,
  `Founding_idUsuario` INT NOT NULL,
  `tipoFounding` VARCHAR(45) NULL,
  PRIMARY KEY (`idProyecto`, `Founding_idUsuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) VISIBLE,
  UNIQUE INDEX `idProyecto_UNIQUE` (`idProyecto` ASC) VISIBLE,
  INDEX `fk_Proyecto_Founding1_idx` (`Founding_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Proyecto_Founding1`
    FOREIGN KEY (`Founding_idUsuario`)
    REFERENCES `osar`.`Founding` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `osar`.`Proyecto_has_Inversor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `osar`.`Proyecto_has_Inversor` (
  `Proyecto_idProyecto` INT NOT NULL,
  `Inversor_idUsuario` INT NOT NULL,
  `totalInvertido` DECIMAL(10,2) NULL,
  `totalTiempo` INT NULL,
  `totalConocimientos` INT NULL,
  `tipoInversion` VARCHAR(45) NULL,
  PRIMARY KEY (`Proyecto_idProyecto`, `Inversor_idUsuario`),
  INDEX `fk_Proyecto_has_Inversor_Inversor1_idx` (`Inversor_idUsuario` ASC) VISIBLE,
  INDEX `fk_Proyecto_has_Inversor_Proyecto1_idx` (`Proyecto_idProyecto` ASC) VISIBLE,
  CONSTRAINT `fk_Proyecto_has_Inversor_Proyecto1`
    FOREIGN KEY (`Proyecto_idProyecto`)
    REFERENCES `osar`.`Proyecto` (`idProyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecto_has_Inversor_Inversor1`
    FOREIGN KEY (`Inversor_idUsuario`)
    REFERENCES `osar`.`Inversor` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
