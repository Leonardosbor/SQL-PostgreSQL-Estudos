-- alteração + correção da tabela 
ALTER TABLE veiculos
ADD CONSTRAINT estoque_nao_negativo
CHECK (estoque >= 0);

-- tentativa de violar a regra imposta acima na alteração da tabela com valor negativo no estoque
UPDATE veiculos
SET estoque = -10
WHERE id = 1; 


SELECT *
FROM veiculos;