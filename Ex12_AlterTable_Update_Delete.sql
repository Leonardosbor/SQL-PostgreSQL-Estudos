-- alterar o preço do uninho de 5K para 5.5K
UPDATE veiculos
SET preco = 5500
WHERE id = 1;


-- alterar o estoque do corsinha de 5 para 8
UPDATE veiculos
SET estoque = 8
WHERE id = 2;


-- ajeitar o estoque do gol bola que até aqui está negativado
UPDATE veiculos
SET estoque = 0
WHERE id = 3;


-- adicionar uma nova coluna MARCA 
ALTER TABLE veiculos
ADD COLUMN marca VARCHAR(50);


-- adicionar as informações na coluna MARCA
UPDATE veiculos
SET marca = 'Fiat'
WHERE id = 1;

UPDATE veiculos
SET marca = 'Chevrolet'
WHERE id = 2;

UPDATE veiculos
SET marca = 'Volkswagen'
WHERE id = 3;


-- remover o veículo CORSINHA
DELETE FROM veiculos
WHERE id = 2; 


-- consulta para verificar como ficou a tabela
SELECT *
FROM veiculos;



