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



-- Fazer uma consulta que mostre: nome do cliente, quantidade de pedidos realizados, quantidade total de itens comprados e valor total gasto pelo cliente
SELECT
    c.nome, COUNT(DISTINCT p.id) AS Quantidade_Pedidos_Realizados,
    SUM(i.quantidade) AS Quantidade_Total_Itens_Comprados,
    SUM(pr.preco * i.quantidade) AS Valor_Total_Gasto
FROM clientes_livraria c
INNER JOIN pedidos_livraria p ON c.id = p.cliente_id
INNER JOIN item_pedido_livraria i ON p.id = i.pedido_id
INNER JOIN produtos_livraria pr ON i.produto_id = pr.id
GROUP BY c.id, c.nome;



-- Fazer uma consulta que mostre nome do cliente, quantidade de pedidos realizados e valor total gasto pelo cliente → considerar todos os produtos comprados; exibir somente clientes cujo valor total gasto seja superior a 500 e ordenar o resultado do maior para o menor valor total gasto
SELECT
    c.nome, COUNT(DISTINCT p.id) AS Quantidade_Pedidos_Realizados,
    SUM(pr.preco * i.quantidade) AS Valor_Total_Gasto
FROM clientes_livraria c
INNER JOIN pedidos_livraria p ON c.id = p.cliente_id
INNER JOIN item_pedido_livraria i ON p.id = i.pedido_id
INNER JOIN produtos_livraria pr ON i.produto_id = pr.id
GROUP BY c.id, c.nome
HAVING SUM(pr.preco * i.quantidade) > 500
ORDER BY Valor_Total_Gasto DESC;



-- Fazer uma consulta que mostre o nome do cliente e valor total gasto em produtos → considerar somente itens referentes a produtos com preço unitário superior a 40; exibir os clientes cujo total calculado seja superior a 300; ordenar pelo total calculado, do maior para o menor
SELECT
    c.nome, SUM(pr.preco * i.quantidade) AS Valor_Total_Gasto
FROM clientes_livraria c
INNER JOIN pedidos_livraria p ON c.id = p.cliente_id
INNER JOIN item_pedido_livraria i ON p.id = i.pedido_id
INNER JOIN produtos_livraria pr ON i.produto_id = pr.id
WHERE pr.preco  > 40
GROUP BY c.id, c.nome
HAVING SUM(pr.preco * i.quantidade) > 300
ORDER BY Valor_Total_Gasto DESC;



-- Fazer uma consulta que mostre o nome do cliente, quantidade de pedidos realizados, valor total gasto, que considere apenas produtos com preço unitário inferior a 100, que exiba apenas clientes que tenham realizado pelo menos 2 pedidos e cujo gasto calculado nesses produtos seja superior a 500; ordenar pelo valor total gasto, do maior para o menor
SELECT
    c.nome, COUNT(DISTINCT p.id) AS Quantidade_Pedidos_Realizados,
    SUM(pr.preco * i.quantidade) AS Valor_Total_Gasto
FROM clientes_livraria c
INNER JOIN pedidos_livraria p ON c.id = p.cliente_id
INNER JOIN item_pedido_livraria i ON p.id = i.pedido_id
INNER JOIN produto_livraria pr ON i.produto_id = pr.id
WHERE pr.preco < 100
GROUP BY c.id, c.nome
HAVING COUNT(DISTINCT p.id) >= 2 
AND SUM(pr.preco * i.quantidade) > 500
ORDER BY Valor_Total_Gasto DESC; 



-- Fazer uma consulta que mostre o nome do cliente, a quantidade de pedidos realizados, a quantidade total de unidades compradas e o valor total gasto → considerar produtos com preço unitário entre 30 e 120, incluindo os dois limites; mostra somente clientes que tenham realizado pelo menos 2 pedidos que contenham itens considerados pelo filtro; depois de aplicado o filtro de preço, o gasto total considerado por cliente deve ser superior a 400; ordenar o valor total gasto, do maior para o menor
SELECT 
    c.nome, COUNT(DISTINCT p.id) AS Quantidade_Pedidos_Realizados,
    SUM(i.quantidade) AS Quantidade_Total_Unidades_Compradas,
    SUM(pr.preco * i.quantidade) AS Valor_Total_Gasto
FROM clientes_livraria c
INNER JOIN pedidos_livraria p ON c.id = p.cliente_id
INNER JOIN item_pedido_livraria i ON p.id = i.pedido_id
INNER JOIN produtos_livraria pr ON i.produto_id = pr.id
WHERE pr.preco BETWEEN 30 AND 120
GROUP BY c.id, c.nome
HAVING COUNT(DISTINCT p.id) >= 2
AND SUM(pr.preco * i.quantidade) > 400
ORDER BY Valor_Total_Gasto DESC;