-- Mantive os dados das tabelas para ser mais fácil a consulta na hora de resolver os exercícios

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


-- Fazer uma consulta mostrando o ID e nome dos clientes → retornar somente clientes que tenham realizado pelo menos um pedido com valor superior a R$1000; ordenar os resultados pelo nome do cliente, em ordem alfabética
SELECT
    c.id AS ID_Cliente,
    c.nome AS Nome_Cliente
FROM clientes_livraria c
WHERE c.id IN (
    SELECT p.cliente_id
    FROM pedidos_livraria p
    WHERE p.valor > 1000
)
ORDER BY Nome_Cliente ASC;


-- Fazer uma consulta que mostre o ID, nome e preço do produto → retornar somente produtos que já tenham sido incluídos em pelo menos um pedido; ordenar alfabeticamente pelo nome do produto
SELECT 
    pr.id AS ID_Produto,
    pr.nome AS Nome_Produto,
    pr.preco AS Preco_Produto
FROM produtos_livraria pr
WHERE pr.id IN (
    SELECT i.produto_id
    FROM item_pedido_livraria i
)
ORDER BY pr.nome ASC;