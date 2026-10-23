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


-- Fazer uma consulta que mostre ID e nome do cliente → retornar somente clientes que nunca realizaram pedidos; ordenar alfabeticamente pelo nome
SELECT 
    c.id AS ID_Cliente,
    c.nome AS Nome_Cliente
FROM clientes_livraria c
WHERE c.id NOT IN (
    SELECT p.cliente_id
    FROM pedidos_livraria p
    WHERE p.cliente_id IS NOT NULL
)
ORDER BY c.nome ASC;



-- Fazer uma consulta que mostre ID, nome e preço do produto → retornar produtos que nunca apareceram em nenhum item de pedido; ordenar os produtos do maior para o menor preço
SELECT 
    pr.id AS ID_Produto,
    pr.nome AS Nome_Produto,
    pr.preco AS Preco_Produto
FROM produtos_livraria pr
WHERE pr.id NOT IN (
    SELECT i.produto_id  
    FROM item_pedido_livraria i
    WHERE i.produto_id IS NOT NULL
)
ORDER BY pr.preco ASC;



-- Fazer uma consulta que mostre o ID e nome do cliente → retornar somente clientes que nunca compraram produtos acima de R$100, incluindo os que nunca realizaram nenhum pedido; ordenar os resultados alfabeticamente pelo nome do cliente
SELECT
    c.id AS ID_Cliente,
    c.nome AS Nome_Cliente
FROM clientes_livraria c
WHERE c.id NOT IN (
    SELECT DISTINCT p.cliente_id
    FROM pedidos_livraria p
    INNER JOIN item_pedido_livraria i ON p. id = i.pedido_id
    INNER JOIN produtos_livraria pr ON i.produto_id = pr.id
    WHERE pr.preco > 100
    AND p.cliente_id IS NOT NULL
)
ORDER BY c.nome ASC;



