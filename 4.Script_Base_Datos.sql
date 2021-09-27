-- MySQL Script generated by MySQL Workbench
-- Fri Sep 24 21:44:22 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema CristianAyala_Supermercado_10092021
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CristianAyala_Supermercado_10092021
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CristianAyala_Supermercado_10092021` DEFAULT CHARACTER SET utf8 ;
USE `CristianAyala_Supermercado_10092021` ;

-- -----------------------------------------------------
-- Table `CristianAyala_Supermercado_10092021`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CristianAyala_Supermercado_10092021`.`producto` (
  `codigoBarras` VARCHAR(255) NOT NULL,
  `nombre` VARCHAR(255) NOT NULL,
  `precioBase` INT NOT NULL,
  PRIMARY KEY (`codigoBarras`))
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `CristianAyala_Supermercado_10092021`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CristianAyala_Supermercado_10092021`.`Departamento` (
  `idDepartamento` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idDepartamento`))
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `CristianAyala_Supermercado_10092021`.`TipoDocumento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CristianAyala_Supermercado_10092021`.`TipoDocumento` (
  `abreviatura` VARCHAR(2) NOT NULL,
  `nombre` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`abreviatura`))
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `CristianAyala_Supermercado_10092021`.`Ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CristianAyala_Supermercado_10092021`.`Ciudad` (
  `idCiudad` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `idDepartamento` INT NOT NULL,
  PRIMARY KEY (`idCiudad`),
  INDEX `fk_Ciudad_Departamento1_idx` (`idDepartamento` ASC) VISIBLE,
  CONSTRAINT `fk_Ciudad_Departamento1`
    FOREIGN KEY (`idDepartamento`)
    REFERENCES `CristianAyala_Supermercado_10092021`.`Departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `CristianAyala_Supermercado_10092021`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CristianAyala_Supermercado_10092021`.`Persona` (
  `idPersona` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(255) NOT NULL,
  `apellidos` VARCHAR(255) NOT NULL,
  `idCiudad` INT NOT NULL,
  PRIMARY KEY (`idPersona`),
  INDEX `fk_Persona_Ciudad1_idx` (`idCiudad` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_Ciudad1`
    FOREIGN KEY (`idCiudad`)
    REFERENCES `CristianAyala_Supermercado_10092021`.`Ciudad` (`idCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = INNODB;

-- -----------------------------------------------------
-- Table `CristianAyala_Supermercado_10092021`.`Documento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CristianAyala_Supermercado_10092021`.`Documento` (
  `idNumeroDocumento` INT NOT NULL AUTO_INCREMENT,
  `numeroDocumento` INT NOT NULL,
  `abreviatura` VARCHAR(2) NOT NULL,
  `idPersona` INT NOT NULL,
  PRIMARY KEY (`idNumeroDocumento`),
  INDEX `fk_Documento_TipoDocumento_idx` (`abreviatura` ASC) VISIBLE,
  INDEX `fk_Documento_Persona1_idx` (`idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Documento_TipoDocumento`
    FOREIGN KEY (`abreviatura`)
    REFERENCES `CristianAyala_Supermercado_10092021`.`TipoDocumento` (`abreviatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Documento_Persona1`
    FOREIGN KEY (`idPersona`)
    REFERENCES `CristianAyala_Supermercado_10092021`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CristianAyala_Supermercado_10092021`.`Domicilio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CristianAyala_Supermercado_10092021`.`Domicilio` (
  `idDomicilio` INT NOT NULL AUTO_INCREMENT,
  `direccionDomicilio` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idDomicilio`))
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `CristianAyala_Supermercado_10092021`.`Telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CristianAyala_Supermercado_10092021`.`Telefono` (
  `idNumero` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idNumero`))
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `CristianAyala_Supermercado_10092021`.`DomiciliosPersona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CristianAyala_Supermercado_10092021`.`DomiciliosPersona` (
  `idPersona` INT NOT NULL,
  `idDomicilio` INT NOT NULL,
  PRIMARY KEY (`idPersona`, `idDomicilio`),
  INDEX `fk_Persona_has_Domicilio_Domicilio1_idx` (`idDomicilio` ASC) VISIBLE,
  INDEX `fk_Persona_has_Domicilio_Persona1_idx` (`idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_has_Domicilio_Persona1`
    FOREIGN KEY (`idPersona`)
    REFERENCES `CristianAyala_Supermercado_10092021`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_has_Domicilio_Domicilio1`
    FOREIGN KEY (`idDomicilio`)
    REFERENCES `CristianAyala_Supermercado_10092021`.`Domicilio` (`idDomicilio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `CristianAyala_Supermercado_10092021`.`TelefonosPersona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CristianAyala_Supermercado_10092021`.`TelefonosPersona` (
  `idPersona` INT NOT NULL,
  `idNumero` INT NOT NULL,
  PRIMARY KEY (`idPersona`, `idNumero`),
  INDEX `fk_Persona_has_Telefono_Telefono1_idx` (`idNumero` ASC) VISIBLE,
  INDEX `fk_Persona_has_Telefono_Persona1_idx` (`idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_has_Telefono_Persona1`
    FOREIGN KEY (`idPersona`)
    REFERENCES `CristianAyala_Supermercado_10092021`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_has_Telefono_Telefono1`
    FOREIGN KEY (`idNumero`)
    REFERENCES `CristianAyala_Supermercado_10092021`.`Telefono` (`idNumero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `CristianAyala_Supermercado_10092021`.`Email`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CristianAyala_Supermercado_10092021`.`Email` (
  `email` VARCHAR(255) NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`email`),
  INDEX `fk_Email_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Email_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `CristianAyala_Supermercado_10092021`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `CristianAyala_Supermercado_10092021`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CristianAyala_Supermercado_10092021`.`Usuario` (
  `usuario` VARCHAR(255) NOT NULL,
  `contraseña` VARCHAR(255) NOT NULL,
  `idNumeroDocumento` INT NOT NULL,
  PRIMARY KEY (`usuario`),
  INDEX `fk_Usuario_Documento1_idx` (`idNumeroDocumento` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_Documento1`
    FOREIGN KEY (`idNumeroDocumento`)
    REFERENCES `CristianAyala_Supermercado_10092021`.`Documento` (`idNumeroDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `CristianAyala_Supermercado_10092021`.`Ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CristianAyala_Supermercado_10092021`.`Ventas` (
  `idVenta` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(255) NOT NULL,
  `idNumeroDocumento` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `total` INT NOT NULL,
  PRIMARY KEY (`idVenta`),
  INDEX `fk_Documento_has_Usuario_Usuario1_idx` (`usuario` ASC) VISIBLE,
  INDEX `fk_Documento_has_Usuario_Documento1_idx` (`idNumeroDocumento` ASC) VISIBLE,
  CONSTRAINT `fk_Documento_has_Usuario_Documento1`
    FOREIGN KEY (`idNumeroDocumento`)
    REFERENCES `CristianAyala_Supermercado_10092021`.`Documento` (`idNumeroDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Documento_has_Usuario_Usuario1`
    FOREIGN KEY (`usuario`)
    REFERENCES `CristianAyala_Supermercado_10092021`.`Usuario` (`usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `CristianAyala_Supermercado_10092021`.`DetalleVentas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CristianAyala_Supermercado_10092021`.`DetalleVentas` (
  `idVenta` INT NOT NULL,
  `codigoBarras` VARCHAR(255) NOT NULL,
  `precioVenta` INT NOT NULL,
  `cantidad` INT NOT NULL,
  INDEX `fk_DetalleVentas_Ventas1_idx` (`idVenta` ASC) VISIBLE,
  PRIMARY KEY (`idVenta`, `codigoBarras`),
  CONSTRAINT `fk_DetalleVentas_Ventas1`
    FOREIGN KEY (`idVenta`)
    REFERENCES `CristianAyala_Supermercado_10092021`.`Ventas` (`idVenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleVentas_producto1`
    FOREIGN KEY (`codigoBarras`)
    REFERENCES `CristianAyala_Supermercado_10092021`.`producto` (`codigoBarras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = INNODB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
