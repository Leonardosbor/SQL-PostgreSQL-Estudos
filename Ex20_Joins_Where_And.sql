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



-- Fazer uma consulta que mostre nome do cliente, nome e preço do produto e quantidade comprada para produtos cujo preço seja maior que 40
SELECT
    c.nome AS Nome_Cliente,
    pr.nome AS Nome_Produto,
    pr.preco AS Preço_Produto,
    i.quantidade AS Quantidade_Comprada
FROM clientes_livraria c
INNER JOIN pedidos_livraria p ON c.id = p.cliente_id
INNER JOIN item_pedido_livraria i ON p.id = i.pedido_id
INNER JOIN produtos_livraria pr ON i.produto_id = pr.id
WHERE pr.preco > 40;



-- Fazer uma consulta que mostre o nome do cliente, nome e preço do produto e quantidade comprada para produtos que tenham preço menor que 50 e que a quantidade comprada seja maior ou igual a 2
SELECT
    c.nome AS Nome_Cliente,
    pr.nome AS Nome_Produto,
    pr.preco AS Preco_Produto,
    i.quantidade AS Quantidade_Comprada
FROM clientes_livraria c
INNER JOIN pedidos_livraria p ON c.id = p.cliente_id
INNER JOIN item_pedido_livraria i ON p.id = i.pedido_id
INNER JOIN produtos_livraria pr ON i.produto_id = pr.id
WHERE pr.preco < 50
AND i.quantidade >= 2;