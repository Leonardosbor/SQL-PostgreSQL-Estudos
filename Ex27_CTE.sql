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




/* Exercício 01 — CTE com WITH - Iniciante

O gerente da livraria deseja identificar os produtos que possuem preço superior a R$ 100,00, utilizando uma CTE para organizar a consulta.

Sua consulta deverá:
1. Criar uma CTE chamada produtos_cadastrados.
2. Dentro da CTE, selecionar o ID, nome e preço dos produtos da tabela produtos_livraria.
3. Na consulta principal, utilizar a CTE produtos_cadastrados.
4. Exibir somente os produtos cujo preço seja superior a R$ 100.
5. Ordenar os produtos alfabeticamente pelo nome.*/
WITH produtos_cadastrados AS (
    SELECT
        pr.id AS ID_Produtos,
        pr.nome AS Nome_Produtos, 
        pr.preco AS Preco_Produtos
    FROM produtos_livraria pr
)
SELECT 
    ID_Produtos,
    Nome_Produtos,
    Preco_Produtos
FROM produtos_cadastrados pr
WHERE Preco_Produtos > 100
ORDER BY Nome_Produtos ASC;




/* Exercício 02 — CTE + INNER JOIN - Iniciante +

O gerente da livraria deseja identificar os pedidos realizados com valor superior a R$ 500, mostrando também o nome do cliente responsável.

Sua consulta deverá:
1. Criar uma CTE chamada pedidos_clientes.
2. Dentro da CTE, relacionar pedidos_livraria e clientes_livraria utilizando INNER JOIN.
3. Selecionar o ID do pedido, o nome do cliente e o valor do pedido.
4. Na consulta principal, utilizar a CTE pedidos_clientes.
5. Exibir somente pedidos com valor superior a R$ 500.
6. Ordenar os resultados pelo valor do pedido, do maior para o menor. */
WITH pedidos_clientes AS(
    SELECT 
        p.id AS ID_Pedido,
        c.nome AS Nome_Cliente,
        p.valor AS Valor_Pedido
    FROM clientes_livraria c
    INNER JOIN pedidos_livraria p ON c.id = p.cliente_id
)
SELECT 
    ID_Pedido,
    Nome_Cliente,
    Valor_Pedido
FROM pedidos_clientes
WHERE Valor_Pedido > 500
ORDER BY Valor_Pedido DESC;





/*Exercício 03 — CTE + JOIN + GROUP BY - Intermediário

O gerente da livraria deseja identificar os clientes cujo valor total acumulado em pedidos seja superior a R$ 1.500,00.

Sua consulta deverá:
1. Criar uma CTE chamada gastos_clientes.
2. Dentro da CTE, relacionar clientes_livraria e pedidos_livraria utilizando INNER JOIN.
3. Calcular o valor total gasto por cada cliente utilizando SUM.
4. Exibir o ID, nome e total gasto de cada cliente.
5. Na consulta principal, utilizar a CTE gastos_clientes.
6. Mostrar somente clientes cujo total acumulado seja superior a R$ 1.500.
7. Ordenar pelo total gasto, do maior para o menor.*/
WITH gastos_clientes AS (
    SELECT
        c.id AS ID_Cliente,
        c.nome AS Nome_Cliente,
        SUM(p.valor) AS Total_Gasto
    FROM clientes_livraria c
    INNER JOIN pedidos_livraria p ON c.id = p.cliente_id
    GROUP BY c.id, c.nome
)
SELECT
    ID_Cliente,
    Nome_Cliente,
    Total_Gasto
FROM gastos_clientes
WHERE Total_Gasto > 1500
ORDER BY Total_Gasto DESC;
