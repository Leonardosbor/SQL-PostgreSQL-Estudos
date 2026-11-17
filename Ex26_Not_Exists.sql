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


-- Fazer consulta que mostre o ID e nome do cliente; incluir somente clientes que não possuem nenhum pedido registrado; excluir clientes que tenham realizado pelo menos um pedido, independente do valor; ordenar alfabeticamente pelo nome do cliente
SELECT
    c.id AS ID_Cliente,
    c.nome AS Nome_Cliente
FROM clientes_livraria c
WHERE NOT EXISTS (
    SELECT 1
    FROM pedidos_livraria p
    WHERE c.id = p.cliente_id
)
ORDER BY c.nome ASC;



-- Fazer consulta que exiba o ID, nome e preço do protudo; excluir produtos que apareceram pelo menos uma vez em pedidos com valor superior a R$900; incluir produtos que apareceram somente em pedidos de R$900 ou menos; incluir pedidos que nunca foram vendidos; ordenar alfabeticamente pelo nome do produto
SELECT
    pr.id AS ID_Produto,
    pr.nome AS Nome_Produto,
    pr.preco AS Preco_Produto
FROM produtos_livraria pr
WHERE NOT EXISTS (
    SELECT 1
    FROM item_pedido_livraria i
    INNER JOIN pedidos_livraria p ON i.pedido_id = p.id
    WHERE pr.id = i.produto_id
    AND p.valor > 900
)
ORDER BY pr.nome ASC;




-- Fazer consulta que mostre o ID  e nome do cliente; incluir clientes que compraram somente produtos de R$200 ou menos; incluir clientes que nunca realizaram pedidos; excluir clientes que compraram pelo menos uma vez algum produto com preço superior a R$200; ordenar alfabeticamente pelo nome do cliente
SELECT
    c.id AS ID_Cliente, 
    c.nome AS Nome_Cliente
FROM clientes_livraria c
WHERE NOT EXISTS (
    SELECT 1
    FROM pedidos_livraria p
    INNER JOIN item_pedido_livraria i ON p.id = i.pedido_id
    INNER JOIN produtos_livraria pr ON i.produto_id = pr.id
    WHERE c.id = p.cliente_id
    AND pr.preco > 200
)
ORDER BY c.nome ASC;