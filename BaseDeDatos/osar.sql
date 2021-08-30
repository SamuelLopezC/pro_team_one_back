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
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `nombrecompleto` VARCHAR(100) NOT NULL,
  `tipopersona` VARCHAR(40) NOT NULL,
  `edad` INT NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `tipousuario` VARCHAR(45) NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idusuario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `osar`.`inversor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `osar`.`inversor` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `totaldinero` DECIMAL NULL DEFAULT 50,
  `totalmegusta` INT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_Inversor_usuario1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `osar`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `osar`.`founding`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `osar`.`founding` (
  `idusuario` INT NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_Founding_usuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `osar`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `osar`.`proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `osar`.`proyecto` (
  `idproyecto` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(80) NOT NULL,
  `fechainicio` DATE NOT NULL,
  `fechatermino` DATE NULL,
  `imagen` VARCHAR(100) NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  `estatus` VARCHAR(45) NOT NULL,
  `precioinversion` INT NOT NULL,
  `totalcorazones` INT NULL,
  `totalparticipantes` INT NULL,
  `idusuario` INT NOT NULL,
  `tipofounding` VARCHAR(45) NULL,
  PRIMARY KEY (`idproyecto`, `idusuario`),
  UNIQUE INDEX `idProyecto_UNIQUE` (`idproyecto` ASC) VISIBLE,
  CONSTRAINT `fk_Proyecto_Founding1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `osar`.`founding` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `osar`.`proyecto_has_Inversor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `osar`.`proyecto_has_Inversor` (
  `idproyectoinversion` INT NOT NULL AUTO_INCREMENT,
  `inversoridusuario` INT NOT NULL,
  `proyectoidproyecto` INT NOT NULL,
  `totalinvertido` INT NULL,
  `totaltiempo` INT NULL,
  `totalconocimientos` INT NULL,
  `tipoinversion` VARCHAR(45) NULL,
  PRIMARY KEY (`idproyectoinversion`, `inversoridusuario`, `proyectoidproyecto`),
  INDEX `fk_Proyecto_has_Inversor_Inversor1_idx` (`inversoridusuario` ASC) VISIBLE,
  INDEX `fk_Proyecto_has_Inversor_Proyecto1_idx` (`proyectoidproyecto` ASC) VISIBLE,
  UNIQUE INDEX `idProyectoInversion_UNIQUE` (`idproyectoinversion` ASC) VISIBLE,
  CONSTRAINT `fk_Proyecto_has_Inversor_Proyecto1`
    FOREIGN KEY (`proyectoidproyecto`)
    REFERENCES `osar`.`proyecto` (`idproyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecto_has_Inversor_Inversor1`
    FOREIGN KEY (`inversoridusuario`)
    REFERENCES `osar`.`inversor` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
