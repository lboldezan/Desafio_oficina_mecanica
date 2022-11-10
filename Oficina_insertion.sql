-- -----------------------------------------------------
-- Insertion in Database Oficina
-- -----------------------------------------------------
show databases;
-- -----------------------------------------------------
-- Criando Database
-- -----------------------------------------------------

USE Oficina ;
show tables ;

-- -----------------------------------------------------
-- Table mecanico
-- -----------------------------------------------------
INSERT INTO mecanico (nome,endereço,especialidade)
	VALUES ('Pedro','Rua Arvore, 190','funilaria'),
		   ('Luiz','Rua Pedra, 220','mecanica'),
           ('Jair','Rua da Ave, 118','elétrica'),
           ('Neymar','Rua Azul, 800','ar condicionado');

-- DELETE FROM mecanico WHERE idmecanico IN (5,6,7,8);
select * from mecanico;

-- -----------------------------------------------------
-- Table cliente
-- -----------------------------------------------------
INSERT INTO cliente (nome,telefone)
	VALUES ('João',12994518338),
		   ('Paulo',11973438662),
           ('Cristina',11976622442),
           ('Lucas',11994518228);
           
select * from cliente;

-- -----------------------------------------------------
-- Table veiculo
-- -----------------------------------------------------
INSERT INTO veiculo (cliente_idcliente,placa,marca,modelo,renavam,ano,tipo)
	VALUES (2,'AMX-2110','Fiat','Punto',1234567,2009,'Flex'),
		   (4,'EMG-2990','Ford','Ka',3211234,2015,'Flex'),
           (3,'EHG-1010','Honda','Fit',7654321,2019,'Flex'),
           (1,'ABC-1234','Nissan','X-trail',0987654,2009,'Gasolina');

select * from veiculo;

-- -----------------------------------------------------
-- Table Serviços
-- -----------------------------------------------------
INSERT INTO Serviços (Nome,Valor_serviço)
	VALUES ('ar codicionado',500),
		   ('pintura',800),
           ('mecanica',300),
           ('elétrica',350);
           
select * from serviços;

-- -----------------------------------------------------
-- Table Peças
-- -----------------------------------------------------
INSERT INTO Peças (Nome,Quant_estoque,ValorUnit_peça)
	VALUES ('filtro',5,100),
		   ('fuzivel',20,20),
           ('rolamento',20,500),
           ('oleo',50,200),
           ('vela',50,150),
           ('tinta',10,100);

select * from peças;

-- -----------------------------------------------------
-- Table Ordem_serviço
-- -----------------------------------------------------
INSERT INTO Ordem_serviço (cliente_idcliente,DataEmissão,ValorTotal,DataConclusão,Tipo_serviço,Status)
	VALUES (1,'2022-07-31',1000,'2022-08-05','Revisão','Aprovado'),
		   (2,'2022-08-05',1500,'2022-08-07','Revisão','Aprovado'),
           (3,'2022-08-10',1250,'2022-08-12','Revisão','Aprovado'),
           (4,'2022-08-11',2000,'2022-08-15','Manutenção','Aprovado');

select * from ordem_serviço;

-- -----------------------------------------------------
-- Table Serviços_na_OS
-- -----------------------------------------------------
INSERT INTO Serviços_na_OS
	VALUES (1,1),(3,1),
		   (3,2),(4,2),
           (1,3),(3,3),(4,3),
           (2,4);

select * from Serviços_na_OS;

-- -----------------------------------------------------
-- Table Peças_na_OS
-- -----------------------------------------------------
INSERT INTO Peças_na_OS
	VALUES (1,1,1),(1,4,1),
		   (2,2,1),(2,3,2),
           (3,1,1),(3,2,1),(3,5,4),
           (4,6,1);

select * from peças_na_OS;

-- -----------------------------------------------------
-- Table mecanico_para_veiculo
-- -----------------------------------------------------
INSERT INTO mecanico_para_veiculo
	VALUES (2,4),(4,4),
		   (2,3),(3,3),(4,3),
           (1,2),
           (2,1),(3,1);
           
select * from mecanico_para_veiculo;
