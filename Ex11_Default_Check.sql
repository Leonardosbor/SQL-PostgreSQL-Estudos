-- criei a tabela com alguns erros e irei corrigi-los em outro exercício usando UPDATE, DELETE e ALTER TABLE

 
CREATE TABLE veiculos(

    id INTEGER PRIMARY KEY,
    modelo VARCHAR(100) NOT NULL,
    preco DECIMAL (10, 2) CHECK (preco > 0), -- não aceita preço 0
    estoque DECIMAL DEFAULT 0, -- estoque aceita valor negativo e está como decimal
    disponivel BOOLEAN DEFAULT TRUE

);

-- Inserir um veículo sem informar estoque e disponibilidade
INSERT INTO veiculos(id, modelo, preco)
VALUES(1, 'Uninho', 5000.00);

-- consultar o veículo e verificar os valores DEFAULT e  DISPONIVEL
SELECT *
FROM veiculos;


-- inserir outro veículo informando manualmente os valores de ESTOQUE e DISPONIVEL
INSERT INTO veiculos(id, modelo, preco, estoque, disponivel)
VALUES(2, 'Corsinha', 6000.00, 5, FALSE);


-- tentar inserir um veículo com valor negativo para ver o que acontece
INSERT INTO veiculos(id, modelo, preco, estoque, disponivel)
VALUES(3, 'Gol bola', 5000.00, -5, FALSE);


-- inserir um veículo sem informar o modelo 
INSERT INTO veiculos(id, preco, estoque, disponivel)
VALUES(4, 3000.00, 10, TRUE);
