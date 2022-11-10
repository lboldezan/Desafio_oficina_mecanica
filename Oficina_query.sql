-- -----------------------------------------------------
-- Queries
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Cliente e seu respectivo carro
-- -----------------------------------------------------
SELECT c.nome, v.marca, v.modelo, v.ano, v.tipo
FROM cliente c JOIN veiculo v ON idcliente = cliente_idcliente;

-- -----------------------------------------------------
-- Mecanico para veiculo e cliente
-- -----------------------------------------------------
SELECT e.nome AS 'Nome Mecanico', v.marca, v.modelo, v.placa, c.nome AS 'Nome Cliente' 
FROM veiculo v JOIN mecanico_para_veiculo m ON v.idveiculo = m.veiculo_idveiculo 
	JOIN cliente c ON v.cliente_idcliente = c.idcliente 
    JOIN mecanico e ON e.idmecanico = m.mecanico_idmecanico;

-- -----------------------------------------------------
-- Informações da OS e dos serviços para cada veículo
-- -----------------------------------------------------
SELECT idveiculo, c.nome AS 'Cliente', os.Tipo_Serviço, os.DataEmissão AS 'Entrada', os.DataConclusão AS 'Saída', DATEDIFF (os.DataConclusão, os.DataEmissão) AS 'Dias na Oficina', os.ValorTotal, s.nome AS 'Serviço'
FROM veiculo v JOIN cliente c ON v.cliente_idcliente = idcliente 
	JOIN Ordem_serviço os ON os.cliente_idcliente = idcliente 
    JOIN Serviços_na_OS ON Ordem_serviço_idOrdem_serviço = idOrdem_serviço
    JOIN Serviços s ON Serviços_idServiços = idServiços;
    
-- -----------------------------------------------------
-- Informações serviços e peças para cada veículo
-- -----------------------------------------------------
SELECT idveiculo, c.nome AS 'Cliente', os.Tipo_Serviço, pe.nome AS 'Peça', pOS.quantidade 
FROM veiculo v JOIN cliente c ON v.cliente_idcliente = idcliente 
	JOIN Ordem_serviço os ON os.cliente_idcliente = idcliente 
    JOIN Peças_na_OS pOS ON pOS.Ordem_serviço_idOrdem_serviço = os.idOrdem_serviço
    JOIN Peças pe ON pOS.peças_idPeças = pe.idPeças;