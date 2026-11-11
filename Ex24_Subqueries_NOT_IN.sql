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



-- Fazer uma consulta que mostre o ID e nome do cliente → retornar somente clientes que nunca compraram produtos abaixo de R$50; incluir clientes que nunca realizaram pedidos; ordenar os resultados alfabeticamente pelo nome
SELECT 
    c.id AS ID_Cliente,
    c.nome AS Nome_cliente
FROM clientes_livraria c
WHERE c.id NOT IN (
    SELECT DISTINCT p.cliente_id
    FROM pedidos_livraria p
    INNER JOIN item_pedido_livraria i ON p.id = i.pedido_id
    INNER JOIN produtos_livraria pr ON i.produto_id = pr.id
    WHERE pr.preco < 50
    AND p.cliente_id IS NOT NULL
)
ORDER BY c.nome ASC;




-- Fazer consulta mostrando o ID, nome e preço do produto → incluir produtos que nunca foram vendidos; excluir produtos que apareceram pelo menos uma vez em um item de pedido com quantidade > 3; ordenar os produtos pelo preço, do maior para o menor
SELECT
    pr.id AS ID_Produto,
    pr.nome AS Nome_Produto,
    pr.preco AS Preco_Produto
FROM produtos_livraria pr
WHERE pr.id NOT IN (
    SELECT DISTINCT i.produto_id
    FROM item_pedido_livraria i
    WHERE i.quantidade > 3
    AND i.produto_id IS NOT NULL
)
ORDER BY pr.preco DESC;



-- Fazer uma consulta que mostre o ID e nome dos clientes → retornar somente clientes que nunca realizaram pedidos com valor superior a R$500; incluir clientes que nunca fizeram pedidos; ordenar os clientes alfabeticamente
SELECT
    c.id AS ID_Clientes,
    c.nome AS Nome_Clientes
FROM clientes_livraria c
WHERE c.id NOT IN (
    SELECT DISTINCT p.cliente_id
    FROM pedidos_livraria p
    WHERE p.valor > 500
    AND p.cliente_id IS NOT NULL
)
ORDER BY c.nome ASC;



-- Fazer consulta mostrando id, nome e preço do produto → incluir produtos que nunca foram vendidos; excluir produtos que apareceram pelo menos uma vez em um pedido com valor superior a 800; ordenar os produtos alfabeticamente pelo nome
SELECT
    pr.id AS id_Produto,
    pr.nome AS Nome_Produto,
    pr.preco AS Preco_Produto
FROM produtos_livraria pr
WHERE pr.id NOT IN (
    SELECT DISTINCT i.produto_id
    FROM item_pedido_livraria i
    INNER JOIN pedidos_livraria p ON p.id = i.pedido_id 
    WHERE p.valor > 800
    AND i.produto_id IS NOT NULL
)
ORDER BY pr.nome ASC;



-- Fazer consulta que mostre o id e nome do cliente → excluir clientes que compraram pelo menos um produto com preço entre 80 e 150; incluir clientes que compraram produtos exclusivamente fora dessa faixa de preço; ordenar os clientes alfabeticamente pelo nome
SELECT 
    c.id AS id_cliente,
    c.nome AS Nome_Cliente
FROM clientes_livraria c
WHERE c.id NOT IN (
    SELECT DISTINCT p.cliente_id
    FROM pedidos_livraria p
    INNER JOIN item_pedido_livraria i ON p.id = i.pedido_id
    INNER JOIN produtos_livraria pr ON i.produto_id = pr.id
    WHERE pr.preco BETWEEN 80 AND 150
    AND p.cliente_id IS NOT NULL
)
ORDER BY c.nome ASC;



-- Fazer consulta mostrando o id e nome do cliente → excluir clientes que nunca realizaram pedidos; incluir clientes que compraram várias vezes, desde que nenhum item individual tenha quantidade superior a 2; ordenar os clientes alfabeticamente
SELECT
    c.id AS ID_Cliente,
    c.nome AS Nome_Cliente
FROM clientes_livraria c
WHERE c.id NOT IN (
    SELECT DISTINCT p.cliente_id
    FROM pedidos_livraria p
    INNER JOIN item_pedido_livraria i ON p.id = i.pedido_id
    WHERE i.quantidade > 2
    AND p.cliente_id IS NOT NULL  
)
ORDER BY c.nome ASC;



-- Fazer consulta mostrando id, nome e preço do produto → excluir produtos que foram comprados pelo menos uma vez por clientes de Fpolis; incluir produtos comprados exclusivamente por clientes de outras cidades; incluir produtos que nunca foram vendidos; ordenar os produtos alfabeticamente pelo nome
SELECT
    pr.id AS ID_Produto,
    pr.nome AS Nome_Produto,
    pr.preco AS Preco_Produto
FROM produtos_livraria pr
WHERE pr.id NOT IN (
    SELECT DISTINCT i.produto_id
    FROM item_pedido_livraria i 
    INNER JOIN pedidos_livraria p ON i.pedido_id = p.id
    INNER JOIN clientes_livraria c ON p.cliente_id = c.id
    WHERE c.cidade = 'Florianópolis'
    AND i.produto_id IS NOT NULL
)
ORDER BY pr.nome ASC;



-- Fazer consulta que mostre o ID e nome do cliente → excluir clientes que fizeram pelo menos um pedido de R$700 ou mais; incluir clientes que nunca fizeram pedidos; incluir clientes que fizeram vários pedidos, desde que todos sejam inferiores a R$700; ordenar os resultados alfabeticamente pelo nome do cliente
SELECT 
    c.id AS ID_Cliente,
    c.nome AS Nome_Cliente
FROM clientes_livraria c
WHERE c.id NOT IN (
    SELECT DISTINCT p.cliente_id
    FROM pedidos_livraria p
    WHERE p.valor >= 700
    AND p.cliente_id IS NOT NULL
)
ORDER BY c.nome ASC;



-- Fazer consulta que mostre o ID, nome e preço do produto → excluir produtos que apareçam pelo menos uma vez em pedidos com valor superior e R$1000; incluir produtos que apareçam apenas em pedidos de R$1000 ou menos; incluir produtos que nunca foram vendidos; ordenar os produtos alfabeticamente pelo nome
SELECT
    pr.id as ID_Produto,
    pr.nome AS Nome_Produto,
    pr.preco AS Preco_Produto
FROM produtos_livraria pr
WHERE pr.id NOT IN (
    SELECT DISTINCT i.produto_id
    FROM item_pedido_livraria i
    INNER JOIN pedidos_livraria p ON i.pedido_id = p.id
    WHERE p.valor > 1000
    AND i.produto_id IS NOT NULL
)
ORDER BY pr.nome ASC;
