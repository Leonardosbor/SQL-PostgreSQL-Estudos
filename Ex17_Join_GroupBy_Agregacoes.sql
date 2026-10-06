-- Mostrar o nome de cada cliente e a quantidade de pedidos que ele possui
SELECT
    c.nome, COUNT(p.id) AS quantidade_pedidos
FROM clientes_loja c
INNER JOIN pedidos_loja p
ON c.id = p.cliente_id
GROUP BY c.nome;


-- Mostrar o nome de cada cliente e o valor total gasto por ele
SELECT
    c.nome, SUM(p.valor) AS valor_total_gasto
FROM clientes_loja c
INNER JOIN pedidos_loja p
ON c.id = p.cliente_id
GROUP BY c.nome;



-- Mostrar nome do cliente, quantidade de pedidos, total gasto e valor médio dos pedidos; arredondar a média para 2 casas decimais
SELECT
    c.nome,
    COUNT(p.id) AS Quantidade_Pedidos,
    SUM(p.valor) AS Total_Gasto,
    ROUND(AVG(p.valor), 2) AS Valor_Médio_Pedidos
FROM clientes_loja c
INNER JOIN pedidos_loja p
ON c.id = p.cliente_id
GROUP BY c.nome;


-- Mostrar o nome dos clientes e o maior valor de pedido de cada um; ordenar pelo maior pedido em ordem decrescente
SELECT
    c.nome,
    MAX(p.valor) AS Maior_Valor_Pedido
FROM clientes_loja c
INNER JOIN pedidos_loja p
ON c.id = p.cliente_id    
GROUP BY c.nome
ORDER BY Maior_Valor_Pedido DESC;



-- Mostrar o nome dos clientes e o total gasto considerando somente pedidos acima de R$1500
SELECT
    c.nome, 
    SUM(p.valor) AS Total_Gasto
FROM clientes_loja c
INNER JOIN pedidos_loja p ON c.id = p.cliente_id
WHERE p.valor > 1500 
GROUP BY c.nome; 



-- Mostrar apenas os clientes que possuem mais de um pedido; o resultado deve mostrar: nome e quantidade de pedidos
SELECT
    c.nome,
    COUNT(p.id) AS Quantidade_Pedidos
FROM clientes_loja c
INNER JOIN pedidos_loja p ON c.id = p.cliente_id
GROUP BY c.nome
HAVING COUNT(p.id) > 1;
