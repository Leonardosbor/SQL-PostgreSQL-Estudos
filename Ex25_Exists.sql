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



-- Fazer uma consulta mostrando ID e nome do cliente; incluir clientes com pelo menos um pedido superior a R$500; excluir clientes cujos pedidos sejam todos de R$500 ou menos; excluir clientes que nunca realizaram pedidos; ordenar alfabeticamente pelo nome do cliente
SELECT
    c.id AS ID_Cliente,
    c.nome AS Nome_Cliente
FROM clientes_livraria c
WHERE EXISTS (
    SELECT 1
    FROM pedidos_livraria p
    WHERE c.id = p.cliente_id
    AND p.valor > 500
)
ORDER BY c.nome ASC;



-- Fazer uma consulta que mostre o ID, nome e preço do produto; incluir produtos que apareceram pelo menos uma vez em pedidos superiores a R$800; excluir produtos que apareceram somente em pedidos de R$800 ou menos; excluir produtos que nunca foram vendidos; ordenar os produtos alfabeticamente pelo nome

SELECT 
    pr.id AS ID_Produto,
    pr.nome AS Nome_Produto,
    pr.preco AS Preco_Produto
FROM produtos_livraria pr
WHERE EXISTS (
    SELECT 1
    FROM item_pedido_livraria i 
    INNER JOIN pedidos_livraria p ON i.pedido_id = p.id
    WHERE pr.id = i.produto_id 
    AND p.valor > 800
) 
ORDER BY pr.nome ASC;



-- Fazer consulta que mostre ID e nome do cliente; incluir clientes que compraram pelo menos um produto com preço superior a R$150; excluir clientes que compraram somente produtos de R$150 ou menos; excluir clientes que nunca fizeram pedidos; ordenar alfabeticamente pelo nome do cliente
SELECT
    c.id AS ID_Cliente,
    c.nome AS  Nome_Cliente
FROM clientes_livraria c
WHERE EXISTS (
    SELECT 1
    FROM pedidos_livraria p 
    INNER JOIN item_pedido_livraria i ON p.id = i.pedido_id
    INNER JOIN produtos_livraria pr ON i.produto_id = pr.id
    WHERE c.id = p.cliente_id
    AND pr.preco > 150
)
ORDER BY c.nome ASC;
