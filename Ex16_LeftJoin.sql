-- Consulta que mostre nome do cliente, descrição e valor do pedido; todos os clientes devem aparecer, mesmo os que não possuem pedidos
SELECT
    c.nome, 
    p.descricao, 
    p.valor
FROM clientes_loja c
LEFT JOIN pedidos_loja p
ON c.id = p.cliente_id;


-- Consulta que mostre nome e email do cliente e descrição do pedido; todos os clientes devem aparecer
SELECT
    c.nome, 
    c.email, 
    p.descricao
FROM clientes_loja c
LEFT JOIN pedidos_loja p
ON c.id = p.cliente_id



-- Consulta para mostrar somente os clientes que não possuem nenhum pedido
SELECT
    c.nome,
    c.email
FROM clientes_loja c
LEFT JOIN pedidos_loja p
ON c.id = p.cliente_id
WHERE p.id IS NULL;



-- Consulta para mostrar nome do cliente, descrição e valor do produto; todos os clientes devem aparecer, mas os pedidos devem ser apresentados do maior para o menor
SELECT
    c.nome, 
    p.descricao,
    p.valor
FROM clientes_loja c
LEFT JOIN pedidos_loja p
ON c.id = p.cliente_id
ORDER BY p.valor DESC;



-- Consulta para mostrar o nome e email do cliente, descrição e valor do pedido; todos os clientes devem aparecer; os pedidos devem aparecer somente quando o valor for maior que 1500, sem fazer com que os clientes que não possuem pedidos desapareçam
SELECT
    c.nome, 
    p.descricao,
    p.valor
FROM clientes_loja c
LEFT JOIN pedidos_loja p
ON c.id = p.cliente_id
WHERE p.valor > 1500
OR p.id IS NULL;
