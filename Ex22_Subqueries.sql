-- Mantive os dados das tabelas para ser mais fácil a consulta na hora de resolver os exercícios

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



-- Fazer uma consulta que mostre o nome e preço do produto → retornar somente produtos cujo preço seja inferior à média dos preços de todos os produtos cadastrados; ordenar os resultados do menor para o maior preço
SELECT
    pr.nome AS Nome_Produto,
    pr.preco AS Preco_Produto
FROM produtos_livraria pr
WHERE pr.preco < (
    SELECT AVG(preco)
    FROM produtos_livraria pr
)
ORDER BY Preco_Produto ASC;



-- Fazer uma consulta que mostre o ID e valor do pedido → retornar somente pedidos cujo valor seja superior à média dos valores de todos os pedidos; ordenar os pedidos do maior para o menor valor
SELECT
    p.id AS Identificador_Pedido,
    p.valor AS Valor_Pedido
FROM pedidos_livraria p
WHERE p.valor > (
    SELECT AVG(valor)
    FROM pedidos_livraria p
)
ORDER BY Valor_Pedido DESC;

