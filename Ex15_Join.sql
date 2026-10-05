-- Consulta para mostrar nome e email do cliente, descrição e valor do pedido
SELECT 
    c.nome,
    c.email,
    p.descricao,
    p.valor
FROM pedidos_loja p
INNER JOIN clientes_loja c
ON p.cliente_id = c.id;


-- Consulta para mostrar nome do cliente e descrição + valor do pedido
SELECT
    c.nome, 
    p.descricao,
    p.valor
FROM pedidos_loja p
INNER JOIN clientes_loja c
ON p.cliente_id = c.id
WHERE p.valor > 1500;


-- Consulta para mostrar nome do cliente, descrição e valor do produto somente para pedidos do Gustavo ou Rafael, ordenando pelo valor do maior para o menor
SELECT
    c.nome, 
    p.descricao,
    p.valor
FROM pedidos_loja p
INNER JOIN clientes_loja c
ON p.cliente_id = c.id
WHERE c.nome IN('Gustavo', 'Rafael')
ORDER BY p.valor DESC;


-- Consulta para mostrar nome do cliente, descrição e valor do produto, somente para pedidos com valor igual ou maior a 2000, ordenando pelo nome do cliente em ordem alfabética
SELECT
    c.nome, 
    p.descricao, 
    p.valor
FROM pedidos_loja p
INNER JOIN clientes_loja c
ON p.cliente_id = c.id
WHERE p.valor >= 2000
ORDER BY c.nome ASC;


-- Consulta para mostrar nome e email do cliente, descrição e valor do produto; somente para pedidos do cliente Adriano ou Gustavo com valor maior que 1500; ordenar pelo valor do maior para o menor
SELECT
    c.nome, 
    c.email,
    p.descricao, 
    p.valor
FROM pedidos_loja p
INNER JOIN clientes_loja c
ON p.cliente_id = c.id
WHERE c.nome IN('Adriano', 'Gustavo') 
AND p.valor > 1500
ORDER BY p.valor DESC;