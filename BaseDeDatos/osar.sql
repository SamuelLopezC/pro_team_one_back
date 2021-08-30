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
-- Table `osar`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `osar`.`usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
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
-- Table `osar`.`inversor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `osar`.`inversor` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `totalDinero` DECIMAL NULL DEFAULT 50,
  `totalMeGusta` INT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Inversor_usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `osar`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `osar`.`founding`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `osar`.`founding` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Founding_usuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `osar`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `osar`.`proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `osar`.`proyecto` (
  `idProyecto` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(80) NOT NULL,
  `fechaInicio` DATE NOT NULL,
  `fechaTermino` DATE NULL,
  `imagen` VARCHAR(100) NULL,
  `Descripcion` VARCHAR(300) NOT NULL,
  `Estatus` VARCHAR(45) NOT NULL,
  `precioInversion` INT NOT NULL,
  `totalCorazones` INT NULL,
  `totalParticipantes` INT NULL,
  `idUsuario` INT NOT NULL,
  `tipoFounding` VARCHAR(45) NULL,
  PRIMARY KEY (`idProyecto`, `idUsuario`),
  UNIQUE INDEX `idProyecto_UNIQUE` (`idProyecto` ASC) VISIBLE,
  CONSTRAINT `fk_Proyecto_Founding1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `osar`.`founding` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `osar`.`proyecto_has_Inversor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `osar`.`proyecto_has_Inversor` (
  `idProyectoInversion` INT NOT NULL AUTO_INCREMENT,
  `inversor_idUsuario` INT NOT NULL,
  `proyecto_idProyecto` INT NOT NULL,
  `totalInvertido` INT NULL,
  `totalTiempo` INT NULL,
  `totalConocimientos` INT NULL,
  `tipoInversion` VARCHAR(45) NULL,
  PRIMARY KEY (`idProyectoInversion`, `inversor_idUsuario`, `proyecto_idProyecto`),
  INDEX `fk_Proyecto_has_Inversor_Inversor1_idx` (`inversor_idUsuario` ASC) VISIBLE,
  INDEX `fk_Proyecto_has_Inversor_Proyecto1_idx` (`proyecto_idProyecto` ASC) VISIBLE,
  UNIQUE INDEX `idProyectoInversion_UNIQUE` (`idProyectoInversion` ASC) VISIBLE,
  CONSTRAINT `fk_Proyecto_has_Inversor_Proyecto1`
    FOREIGN KEY (`proyecto_idProyecto`)
    REFERENCES `osar`.`proyecto` (`idProyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecto_has_Inversor_Inversor1`
    FOREIGN KEY (`inversor_idUsuario`)
    REFERENCES `osar`.`inversor` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
