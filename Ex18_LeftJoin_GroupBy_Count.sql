-- Quantidade de pedidos: mostrar todos os clientes, inclusive os que não possuem pedidos
SELECT
    c.nome, COUNT(p.id) AS Quantidade_Pedidos
FROM clientes_loja c
LEFT JOIN pedidos_loja p
ON c.id = p.cliente_id
GROUP BY c.nome;



-- Total gasto: mostrar todos os clientes e o total gasto por cada um (clientes sem pedido devem aparecer com 0)
SELECT
    c.nome, COALESCE(SUM(p.valor), 0) AS Total_Gasto
FROM clientes_loja c
LEFT JOIN pedidos_loja p ON c.id = p.cliente_id
GROUP BY c.nome;



-- Mostrar apenas clientes sem pedido
SELECT
    c.nome
FROM clientes_loja c
LEFT JOIN pedidos_loja p ON c.id = p.cliente_id
WHERE p.id IS NULL;



-- Relatório: mostrar todos os clientes com nome, quantidade de pedidos e total gasto; clientes sem pedidos devem apresentar 0 no total gasto; ordenar pelo total gasto em ordem decrescente
SELECT
    c.nome, 
    COUNT(p.id) AS Quantidade_Pedidos,
    COALESCE(SUM(p.valor), 0) AS Total_Gasto
FROM clientes_loja c
LEFT JOIN pedidos_loja p ON c.id = p.cliente_id
GROUP BY c.nome
ORDER BY Total_Gasto DESC;



-- Mostrar todos os clientes com nome e quantidade de pedidos; ordenar de forma que os clientes com mais pedidos apareçam primeiro
SELECT
    c.nome, COUNT(p.id) AS Quantidade_Pedidos
FROM clientes_loja c
LEFT JOIN pedidos_loja p ON c.id = p.cliente_id
GROUP BY c.nome
ORDER BY Quantidade_Pedidos DESC;



-- Mostrar somente clientes que não possuem pedidos ou que possuem mais de um pedido; resultado deve mostrar nome e quantidade de pedidos
SELECT
    c.nome, COUNT(p.id) AS Quantidade_Pedidos
FROM clientes_loja c
LEFT JOIN pedidos_loja p ON c.id = p.cliente_id
GROUP BY c.nome
HAVING COUNT(p.id) = 0
OR COUNT(p.id) > 1;