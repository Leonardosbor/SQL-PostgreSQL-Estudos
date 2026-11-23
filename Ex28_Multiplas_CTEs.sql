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


/* 

O gerente da livraria deseja identificar os clientes que realizaram pelo menos três pedidos e acumularam mais de R$ 1.500 em compras.

Sua consulta deverá:
1. Criar uma primeira CTE chamada resumo_clientes.
2. Nela, relacionar clientes e pedidos, calculando a quantidade de pedidos e o total gasto por cliente.
3. Criar uma segunda CTE chamada clientes_ativos, utilizando o resultado da primeira.
4. Na segunda CTE, manter somente os clientes que realizaram três pedidos ou mais.
5. Na consulta principal, utilizar clientes_ativos para mostrar somente clientes cujo total gasto seja superior a R$ 1.500.
6. Exibir ID, nome, quantidade de pedidos e total gasto.
7. Ordenar pelo total gasto, do maior para o menor.

*/

WITH resumo_clientes AS(
    SELECT
        c.id AS ID_Cliente,
        c.nome AS Nome_Cliente,
        COUNT(p.id) AS Quantidade_Pedidos,
        SUM(p.valor) AS Gasto_Total
    FROM clientes_livraria c
    INNER JOIN pedidos_livraria p ON c.id = p.cliente_id
    GROUP BY c.id, c.nome
),
clientes_ativos AS(
    SELECT
        ID_Cliente,
        Nome_Cliente,
        Quantidade_Pedidos,
        Gasto_Total
    FROM resumo_clientes
    WHERE Quantidade_Pedidos >= 3
)
SELECT
    ID_Cliente,
    Nome_Cliente,
    Quantidade_Pedidos,
    Gasto_Total
FROM clientes_ativos
WHERE Gasto_Total > 1500
ORDER BY Gasto_Total DESC;




/* 

Exercício 02 — Múltiplas CTEs: análise de vendas
O gerente da livraria deseja identificar os produtos que tiveram mais de 5 unidades vendidas no total e cujo preço unitário seja superior a R$ 50.

O relatório deverá apresentar:
- ID do produto.
- Nome do produto.
- Preço unitário.
- Quantidade total de unidades vendidas.
Os resultados deverão ser ordenados pela quantidade vendida, da maior para a menor.

Requisito técnico: utilize duas CTEs, sendo que a segunda deverá consumir o resultado da primeira.

*/

WITH resumo_vendas_produtos AS(
    SELECT
        pr.id AS ID_Produto,
        pr.nome AS Nome_Produto,
        pr.preco AS Preco_Produto,
        SUM(i.quantidade) AS Total_Quantidades_Vendidas
    FROM produtos_livraria pr
    INNER JOIN item_pedido_livraria i ON pr.id = i.produto_id
    GROUP BY pr.id, pr.nome, pr.preco 
),
produtos_mais_vendidos AS(
    SELECT
        ID_Produto,
        Nome_Produto,
        Preco_Produto,
        Total_Quantidades_Vendidas
    FROM resumo_vendas_produtos
    WHERE Total_Quantidades_Vendidas > 5
)
SELECT
    ID_Produto,
    Nome_Produto,
    Preco_Produto,
    Total_Quantidades_Vendidas
FROM produtos_mais_vendidos
WHERE Preco_Produto > 50
ORDER BY Total_Quantidades_Vendidas DESC;



/* 

CTE + Subquery + AVG
Intermediário

O gerente da livraria deseja identificar os produtos cujo preço unitário seja superior à média de preços de todos os produtos cadastrados.

Sua consulta deverá:
1. Criar uma CTE chamada resumo_produtos.
2. Dentro dela, selecionar o ID, nome e preço de cada produto.
3. Na consulta principal, utilizar resumo_produtos.
4. Aplicar uma subconsulta para calcular a média dos preços dos produtos.
5. Exibir somente os produtos com preço superior à média calculada.
6. Ordenar pelo preço, do maior para o menor.

*/

WITH resumo_produtos AS(
    SELECT 
        pr.id AS ID_Produto,
        pr.nome AS Nome_Produto,
        pr.preco AS Preco_Produto
    FROM produtos_livraria pr
)
SELECT 
    ID_Produto,
    Nome_Produto,
    Preco_Produto
FROM resumo_produtos
WHERE Preco_Produto > (
    SELECT AVG(Preco_Produto)
    FROM resumo_produtos
)
ORDER BY Preco_Produto DESC;


/* 

Desafio 01 — Análise de desempenho comercial
Autonomia

Você está trabalhando no desenvolvimento de um sistema para uma livraria.

O gerente deseja um relatório que identifique quais clientes gastaram mais do que a média de gastos dos clientes que realizaram compras.

O relatório deve apresentar o nome do cliente, a quantidade de pedidos realizados e o valor total gasto.

Os clientes deverão aparecer do maior para o menor valor gasto.

Requisito adicional: o gerente deseja visualizar apenas clientes que tenham realizado pelo menos dois pedidos.

*/


WITH resumo_clientes AS (
    SELECT
        c.id AS ID_Cliente,
        c.nome AS Nome_Cliente,
        COUNT(p.id) AS Quantidade_Pedidos_Realizados,
        SUM(p.valor) AS Valor_Total_Gasto
    FROM clientes_livraria c
    INNER JOIN pedidos_livraria p ON c.id = p.cliente_id
    GROUP BY c.id, c.nome
)
SELECT 
    ID_Cliente,
    Nome_Cliente,
    Quantidade_Pedidos_Realizados,
    Valor_Total_Gasto
FROM resumo_clientes
WHERE Quantidade_Pedidos_Realizados >= 2
AND Valor_Total_Gasto > (
    SELECT AVG(Valor_Total_Gasto)
    FROM resumo_clientes
)
ORDER BY Valor_Total_Gasto DESC;