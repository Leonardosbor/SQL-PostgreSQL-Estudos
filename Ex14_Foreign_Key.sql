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

