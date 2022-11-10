-- -----------------------------------------------------
-- Database Oficina
-- -----------------------------------------------------
show databases;
-- -----------------------------------------------------
-- Criando Database
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS Oficina ;
USE Oficina ;
show tables;
use information_schema;
select * from referential_constraints where constraint_schema = 'oficina';

-- -----------------------------------------------------
-- Table mecanico
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mecanico (
  idmecanico INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  endereço VARCHAR(100),
  especialidade VARCHAR(45),
  PRIMARY KEY (idmecanico)
);


-- -----------------------------------------------------
-- Table cliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cliente (
  idcliente INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  telefone INT,
  PRIMARY KEY (idcliente)
  );


-- -----------------------------------------------------
-- Table veiculo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS veiculo (
  idveiculo INT NOT NULL AUTO_INCREMENT,
  cliente_idcliente INT NOT NULL,
  placa VARCHAR(45) NOT NULL,
  marca VARCHAR(45) NOT NULL,
  modelo VARCHAR(45) NOT NULL,
  renavam VARCHAR(45) NOT NULL,
  ano INT NOT NULL,
  Tipo ENUM("Gasolina", "Alcool", "Diesel", "Flex") NOT NULL,
  PRIMARY KEY (idveiculo, cliente_idcliente),
  CONSTRAINT fk_veiculo_cliente
    FOREIGN KEY (cliente_idcliente)
    REFERENCES cliente (idcliente)
    ON UPDATE CASCADE
);

ALTER TABLE veiculo MODIFY COLUMN placa CHAR(8);
desc veiculo;


-- -----------------------------------------------------
-- Table Serviços
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Serviços (
  idServiços INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(45) NOT NULL,
  Valor_serviço FLOAT NOT NULL,
  PRIMARY KEY (idServiços)
);


-- -----------------------------------------------------
-- Table Peças
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Peças (
  idPeças INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(45) NOT NULL,
  Quant_estoque INT,
  ValorUnit_peça FLOAT NOT NULL,
  PRIMARY KEY (idPeças)
);


-- -----------------------------------------------------
-- Table Ordem_serviço
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Ordem_serviço (
  idOrdem_serviço INT NOT NULL AUTO_INCREMENT,
  cliente_idcliente INT NOT NULL,
  DataEmissão DATE NOT NULL,
  ValorTotal FLOAT NOT NULL,
  DataConclusão DATE NOT NULL,
  Tipo_serviço ENUM("Revisão","Manutenção") NOT NULL,
  Status ENUM("Aprovado","Rejeitado") NOT NULL,
  PRIMARY KEY (idOrdem_serviço, cliente_idcliente),
  CONSTRAINT fk_Ordem_serviço_cliente
    FOREIGN KEY (cliente_idcliente)
    REFERENCES cliente (idcliente)
  ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table Serviços_na_OS
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Serviços_na_OS (
  Serviços_idServiços INT NOT NULL,
  Ordem_serviço_idOrdem_serviço INT NOT NULL,
  PRIMARY KEY (Serviços_idServiços, Ordem_serviço_idOrdem_serviço),
  CONSTRAINT fk_Serviços_na_OS_Serviços
    FOREIGN KEY (Serviços_idServiços)
    REFERENCES Serviços (idServiços)
    ON UPDATE CASCADE,
  CONSTRAINT fk_Serviços_na_OS_Ordem_serviço
    FOREIGN KEY (Ordem_serviço_idOrdem_serviço)
    REFERENCES Ordem_serviço (idOrdem_serviço)
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table Peças_na_OS
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Peças_na_OS (
  Ordem_serviço_idOrdem_serviço INT NOT NULL,
  Peças_idPeças INT NOT NULL,
  Quantidade INT,
  PRIMARY KEY (Ordem_serviço_idOrdem_serviço, Peças_idPeças),
  CONSTRAINT fk_Peças_na_OS_Ordem_serviço
    FOREIGN KEY (Ordem_serviço_idOrdem_serviço)
    REFERENCES Ordem_serviço (idOrdem_serviço)
    ON UPDATE CASCADE,
  CONSTRAINT fk_Peças_na_OS_Peças
    FOREIGN KEY (Peças_idPeças)
    REFERENCES Peças (idPeças)
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table mecanico_para_veiculo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mecanico_para_veiculo (
  mecanico_idmecanico INT NOT NULL,
  veiculo_idveiculo INT NOT NULL,
  PRIMARY KEY (mecanico_idmecanico, veiculo_idveiculo),
  CONSTRAINT fk_mecanico_para_veiculo_mecanico
    FOREIGN KEY (mecanico_idmecanico)
    REFERENCES mecanico (idmecanico)
    ON UPDATE CASCADE,
  CONSTRAINT fk_mecanico_para_veiculo_veiculo
    FOREIGN KEY (veiculo_idveiculo)
    REFERENCES veiculo (idveiculo)
    ON UPDATE CASCADE
);


