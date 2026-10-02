-- tabela de clientes
CREATE TABLE clientes_loja(
    id INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- tabela de pedidos que terá relação com a tabela de clientes
CREATE TABLE pedidos_loja(
    id INTEGER PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    valor DECIMAL (10, 2),
    cliente_id INTEGER,

    Foreign Key (cliente_id) REFERENCES clientes_loja(id)
);


INSERT INTO clientes_loja(id, nome, email)
VALUES(1, 'Adriano', 'adriano@email.com');

INSERT INTO clientes_loja(id, nome, email)
VALUES(2, 'Gustavo', 'gustavo@email.com');

INSERT INTO clientes_loja(id, nome, email)
VALUES(3, 'Rafael', 'Rafael@email.com');


INSERT INTO pedidos_loja(id, descricao, valor, cliente_id)
VALUES(1, 'Guitarra Ibanez 7 cordas', 2000, 1);

INSERT INTO pedidos_loja(id, descricao, valor, cliente_id)
VALUES(2, 'Guitarra Ibanez 6 cordas', 1500, 1);

INSERT INTO pedidos_loja(id, descricao, valor, cliente_id)
VALUES(3, 'Guitarra Solar 8 cordas', 3000, 2);

INSERT INTO pedidos_loja(id, descricao, valor, cliente_id)
VALUES(4, 'Contrabaixo Solar 4 cordas', 2000, 3);


-- teste de inserção de pedido com id de cliente inexistente
INSERT INTO pedidos_loja(id, descricao, valor, cliente_id)
VALUES(5, 'Contrabaixo Warwick 6 cordas', 4000, 99);


SELECT *
FROM clientes_loja;

SELECT *
FROM pedidos_loja;


ALTER TABLE clientes_loja
ADD CONSTRAINT clientes_loja_email
UNIQUE (email);


-- aplicação do INNER JOIN para consultas envolvendo as duas tabelas acima

-- mostrar ID, DESCRIÇÃO e VALOR do PEDIDO + NOME do CLIENTE
SELECT
    p.id,
    p.descricao,
    p.valor,
    c.nome
FROM pedidos_loja p
INNER JOIN clientes_loja c
ON p.cliente_id = c.id;


-- Mostrar somente os pedidos pelo cliente GUSTAVO
SELECT
    p.descricao,
    p.valor,
    c.nome
FROM pedidos_loja p
INNER JOIN clientes_loja c
ON p.cliente_id = c.id
WHERE c.nome = 'Gustavo';



-- Mostrar ID, DESCRIÇÃO, VALOR + NOME do CLIENTE ordenando os pedidos pelo valor do maior para o menor
SELECT
    p.id,
    p.descricao,
    p.valor,
    c.nome
FROM pedidos_loja p
INNER JOIN clientes_loja c
ON p.cliente_id = c.id
ORDER BY p.valor DESC;



-- mostrar NOME do CLIENTE e DESCRIÇÃO do PEDIDO e apenas pedidos com valor maior que 2000
SELECT
    c.nome,
    p.descricao
FROM pedidos_loja p
INNER JOIN clientes_loja c
ON p.cliente_id = c.id
WHERE p.valor > 2000;



-- Mostrar NOME do CLIENTE, DESCRIÇÃO e VALOR do PEDIDO para os pedidos do cliente ADRIANO cujo valor seja maior do que 2000
SELECT
    c.nome,
    p.descricao,
    p.valor
FROM pedidos_loja p
INNER JOIN clientes_loja c
ON p.cliente_id = c.id
WHERE c.nome = 'Adriano'
AND p.valor >= 2000;




