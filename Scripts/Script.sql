-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vendaPDV` DEFAULT CHARACTER SET utf8 ;
USE `vendaPDV` ;

-- -----------------------------------------------------
-- Table `vendaPDV`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendaPDV`.`Produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `nomeProduto` VARCHAR(45) NOT NULL,
  `unidade` INT NOT NULL,
  `preco` DOUBLE NOT NULL,
  `quantidadeEstoque` INT NOT NULL,
  `dataUltimaVenda` DATE NOT NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendaPDV`.`Cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `nomeCliente` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(11) NULL,
  `email` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NULL,
  `CEP` VARCHAR(9) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`formaPagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendaPDV`.`formaPagamento` (
  `idformaPagamento` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idformaPagamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendaPDV`.`Venda` (
  `idVenda` INT NOT NULL AUTO_INCREMENT,
  `dataVenda` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `valorTotal` DOUBLE NOT NULL,
  `idCliente` INT NULL,
  `idformaPagamento` INT NULL,
  PRIMARY KEY (`idVenda`),
  INDEX `idCliente_idx` (`idCliente` ASC) VISIBLE,
  INDEX `idformaPagamento_idx` (`idformaPagamento` ASC) VISIBLE,
  CONSTRAINT `idCliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `vendaPDV`.`Cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idformaPagamento`
    FOREIGN KEY (`idformaPagamento`)
    REFERENCES `vendaPDV`.`formaPagamento` (`idformaPagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`itemVenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendaPDV`.`itemVenda` (
  `iditemVenda` INT NOT NULL AUTO_INCREMENT,
  `numerodoItem` VARCHAR(45) NOT NULL,
  `quantidadeVendida` INT NOT NULL,
  `precoUnitario` DOUBLE NOT NULL,
  `totaldeItem` INT NOT NULL,
  `idproduto` INT NULL,
  `idvenda` INT NULL,
  PRIMARY KEY (`iditemVenda`),
  INDEX `idproduto_idx` (`idproduto` ASC) VISIBLE,
  INDEX `idvenda_idx` (`idvenda` ASC) VISIBLE,
  CONSTRAINT `idproduto`
    FOREIGN KEY (`idproduto`)
    REFERENCES `vendaPDV`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idvenda`
    FOREIGN KEY (`idvenda`)
    REFERENCES `vendaPDV`.`Venda` (`idVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
