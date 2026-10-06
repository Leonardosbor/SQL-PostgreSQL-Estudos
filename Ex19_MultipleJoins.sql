CREATE TABLE Clientes_Livraria(
    id INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);


CREATE TABLE Pedidos_Livraria(
    id INTEGER PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL, 
    valor DECIMAL(10, 2) NOT NULL,
    cliente_id INTEGER NOT NULL,
    Foreign Key (cliente_id) REFERENCES Clientes_Livraria(id)

);


CREATE TABLE Produtos_Livraria(
    id INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);


CREATE TABLE Item_Pedido_Livraria(
    id INTEGER PRIMARY KEY,
    pedido_id INTEGER NOT NULL,
    produto_id INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
    Foreign Key (pedido_id) REFERENCES Pedidos_Livraria(id),
    Foreign Key (produto_id) REFERENCES Produtos_Livraria(id)
);

-- Clientes da Livraria
INSERT INTO clientes_livraria(id, nome, email)
VALUES(1, 'Rogério', 'Rogerio123@email.com');

INSERT INTO clientes_livraria(id, nome, email)
VALUES(2, 'Ricardo', 'Ricardo.Ricardo@email.com');

INSERT INTO clientes_livraria(id, nome, email)
VALUES(3, 'Antonio', 'Tonho2026@email.com');

INSERT INTO clientes_livraria(id, nome, email)
VALUES(4, 'Fernanda', 'Feh2010@email.com');

INSERT INTO clientes_livraria(id, nome, email)
VALUES(5, 'Juliana', 'Juliana@email.com');


-- Produtos da Livraria
INSERT INTO produtos_livraria(id, nome, preco)
VALUES(1, 'O Senhor dos Aneis', 50);

INSERT INTO produtos_livraria(id, nome, preco)
VALUES(2, 'Harry Potter', 40);

INSERT INTO produtos_livraria(id, nome, preco)
VALUES(3, 'Game of Thrones', 60);

INSERT INTO produtos_livraria(id, nome, preco)
VALUES(4, 'Jogos Vorazes', 40);

INSERT INTO produtos_livraria(id, nome, preco)
VALUES(5, 'A Revolução dos Bichos', 35);



-- Pedidos da Livraria
INSERT INTO pedidos_livraria(id, descricao, valor, cliente_id)
VALUES(1, 'O Senhor dos Aneis', 50, 1);

INSERT INTO pedidos_livraria(id, descricao, valor, cliente_id)
VALUES(2, 'A Revolução dos Bichos', 35, 1);

INSERT INTO pedidos_livraria(id, descricao, valor, cliente_id)
VALUES(3, 'Harry Potter', 50, 1);

INSERT INTO pedidos_livraria(id, descricao, valor, cliente_id)
VALUES(4, 'Jogos Vorazes', 40, 2);

INSERT INTO pedidos_livraria(id, descricao, valor, cliente_id)
VALUES(5, 'Harry Potter', 50, 2);

INSERT INTO pedidos_livraria(id, descricao, valor, cliente_id)
VALUES(6, 'Game of Thrones', 60, 3);

INSERT INTO pedidos_livraria(id, descricao, valor, cliente_id)
VALUES(7, 'O Senhor dos Aneis', 50, 3);

INSERT INTO pedidos_livraria(id, descricao, valor, cliente_id)
VALUES(8, 'Harry Potter', 50, 3);

INSERT INTO pedidos_livraria(id, descricao, valor, cliente_id)
VALUES(9, 'A Revolução dos Bichos', 35, 4);

INSERT INTO pedidos_livraria(id, descricao, valor, cliente_id)
VALUES(10, 'Jogos Vorazes', 40, 5);



-- Itens dos Pedidos

-- Pedido 1 - Rogério
INSERT INTO item_pedido_livraria(id, pedido_id, produto_id, quantidade)
VALUES(1, 1, 1, 2);

INSERT INTO item_pedido_livraria(id, pedido_id, produto_id, quantidade)
VALUES(2, 1, 2, 1);


-- Pedido 2 - Rogério
INSERT INTO item_pedido_livraria(id, pedido_id, produto_id, quantidade)
VALUES(3, 2, 5, 3);


-- Pedido 3 - Rogério
INSERT INTO item_pedido_livraria(id, pedido_id, produto_id, quantidade)
VALUES(4, 3, 2, 2);

INSERT INTO item_pedido_livraria(id, pedido_id, produto_id, quantidade)
VALUES(5, 3, 4, 1);


-- Pedido 4 - Ricardo
INSERT INTO item_pedido_livraria(id, pedido_id, produto_id, quantidade)
VALUES(6, 4, 4, 1);


-- Pedido 5 - Ricardo
INSERT INTO item_pedido_livraria(id, pedido_id, produto_id, quantidade)
VALUES(7, 5, 2, 3);


-- Pedido 6 - Antonio
INSERT INTO item_pedido_livraria(id, pedido_id, produto_id, quantidade)
VALUES(8, 6, 3, 3);

INSERT INTO item_pedido_livraria(id, pedido_id, produto_id, quantidade)
VALUES(9, 6, 1, 1);


-- Pedido 7 - Antonio
INSERT INTO item_pedido_livraria(id, pedido_id, produto_id, quantidade)
VALUES(10, 7, 1, 2);


-- Pedido 8 - Antonio
INSERT INTO item_pedido_livraria(id, pedido_id, produto_id, quantidade)
VALUES(11, 8, 2, 3);


-- Pedido 9 - Fernanda
INSERT INTO item_pedido_livraria(id, pedido_id, produto_id, quantidade)
VALUES(12, 9, 5, 3);


-- Pedido 10 - Juliana
INSERT INTO item_pedido_livraria(id, pedido_id, produto_id, quantidade)
VALUES(13, 10, 4, 1);


-- Correção de alguns valores da tabela Pedidos_Livraria
UPDATE pedidos_livraria
SET valor = 140
WHERE id = 1;

UPDATE pedidos_livraria
SET valor = 105
WHERE id = 2;

UPDATE pedidos_livraria
SET valor = 120
WHERE id = 3;

UPDATE pedidos_livraria
SET valor = 120
WHERE id = 5;

UPDATE pedidos_livraria
SET valor = 230
WHERE id = 6;

UPDATE pedidos_livraria
SET valor = 100
WHERE id = 7;

UPDATE pedidos_livraria
SET valor = 120
WHERE id = 8;

UPDATE pedidos_livraria
SET valor = 105
WHERE id = 9;



SELECT
    c.nome AS Nome_Cliente,
    p.descricao AS Descricao_Pedido,
    pr.nome AS Nome_Produto
FROM clientes_livraria c
INNER JOIN pedidos_livraria p ON c.id = p.cliente_id
INNER JOIN item_pedido_livraria i ON p.id = i.pedido_id
INNER JOIN produtos_livraria pr ON i.produto_id = pr.id;


-- Mostrar nome do cliente, id do pedido, nome do produto e a quantidade comprada
SELECT
    c.nome AS Nome_Cliente,
    p.id AS ID_Pedido,
    pr.nome AS Nome_Produto,
    i.quantidade AS Quantidade_Comprada
FROM clientes_livraria c
INNER JOIN pedidos_livraria p ON c.id = p.cliente_id
INNER JOIN item_pedido_livraria i ON p.id = i.pedido_id
INNER JOIN produtos_livraria pr ON i.produto_id = pr.id;
