-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema loja_eletronicos
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Table `loja_eletronicos`.`Transportadora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_eletronicos`.`Transportadora` (
  `cnpj` VARCHAR(25) NOT NULL,
  `tipo_fretagem` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cnpj`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja_eletronicos`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_eletronicos`.`Cliente` (
  `cpf` VARCHAR(12) NOT NULL,
  `telefone1` VARCHAR(12) NOT NULL,
  `telefone2` VARCHAR(12) NULL,
  `nome` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(15) NOT NULL,
  `cidade` VARCHAR(25) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(6) NOT NULL,
  `Transportadora_cnpj` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`cpf`),
  INDEX `fk_Cliente_Transportadora_idx` (`Transportadora_cnpj` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Transportadora`
    FOREIGN KEY (`Transportadora_cnpj`)
    REFERENCES `loja_eletronicos`.`Transportadora` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja_eletronicos`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_eletronicos`.`Fornecedor` (
  `cnpj` VARCHAR(45) NOT NULL,
  `telefone1` VARCHAR(45) NOT NULL,
  `telefone2` VARCHAR(12) NULL,
  `estado` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cnpj`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja_eletronicos`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_eletronicos`.`Categoria` (
  `idCategoria` INT NOT NULL,
  `periodo_garantia` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja_eletronicos`.`Componente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_eletronicos`.`Componente` (
  `idComponente` INT NOT NULL,
  `tem_no_estoque` TINYINT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `Categoria_idCategoria` INT NOT NULL,
  `Fornecedor_cnpj` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idComponente`),
  INDEX `fk_Componente_Categoria1_idx` (`Categoria_idCategoria` ASC) VISIBLE,
  INDEX `fk_Componente_Fornecedor1_idx` (`Fornecedor_cnpj` ASC) VISIBLE,
  CONSTRAINT `fk_Componente_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `loja_eletronicos`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Componente_Fornecedor1`
    FOREIGN KEY (`Fornecedor_cnpj`)
    REFERENCES `loja_eletronicos`.`Fornecedor` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja_eletronicos`.`Cliente_Componente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_eletronicos`.`Cliente_Componente` (
  `Cliente_cpf` VARCHAR(12) NOT NULL,
  `Componente_idComponente` INT NOT NULL,
  PRIMARY KEY (`Cliente_cpf`, `Componente_idComponente`),
  INDEX `fk_Cliente_has_Componente_Componente1_idx` (`Componente_idComponente` ASC) VISIBLE,
  INDEX `fk_Cliente_has_Componente_Cliente1_idx` (`Cliente_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_has_Componente_Cliente1`
    FOREIGN KEY (`Cliente_cpf`)
    REFERENCES `loja_eletronicos`.`Cliente` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Componente_Componente1`
    FOREIGN KEY (`Componente_idComponente`)
    REFERENCES `loja_eletronicos`.`Componente` (`idComponente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja_eletronicos`.`Operador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_eletronicos`.`Operador` (
  `cpf` INT NOT NULL,
  `turno_trabalho` VARCHAR(45) NOT NULL,
  `unidade_operacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja_eletronicos`.`Componente_Transportadora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_eletronicos`.`Componente_Transportadora` (
  `Componente_idComponente` INT NOT NULL,
  `Transportadora_cnpj` VARCHAR(25) NOT NULL,
  `Operador_cpf` INT NOT NULL,
  PRIMARY KEY (`Componente_idComponente`, `Transportadora_cnpj`),
  INDEX `fk_Componente_has_Transportadora_Transportadora1_idx` (`Transportadora_cnpj` ASC) VISIBLE,
  INDEX `fk_Componente_has_Transportadora_Componente1_idx` (`Componente_idComponente` ASC) VISIBLE,
  INDEX `fk_Componente_Transportadora_Operador1_idx` (`Operador_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Componente_has_Transportadora_Componente1`
    FOREIGN KEY (`Componente_idComponente`)
    REFERENCES `loja_eletronicos`.`Componente` (`idComponente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Componente_has_Transportadora_Transportadora1`
    FOREIGN KEY (`Transportadora_cnpj`)
    REFERENCES `loja_eletronicos`.`Transportadora` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Componente_Transportadora_Operador1`
    FOREIGN KEY (`Operador_cpf`)
    REFERENCES `loja_eletronicos`.`Operador` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;