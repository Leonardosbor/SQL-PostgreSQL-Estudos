-- Criar uma tabela chamada CLIENETS contendo: ID (inteiro e chave primária), NOME (até 100 caracteres e obg) e EMAIL (até 150 caracteres e obg)
CREATE TABLE clientes(
    id INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL
);



-- Criar uma tabela chamada USUÁRIOS contendo: ID, NOME (obg) e EMAIL (obg e não pode se repetir)
CREATE TABLE usuarios(
    id INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL
);


-- Inserir dois usuários com o mesmo email na tabela USUARIOS para ver o erro acontecer
INSERT INTO usuarios(id, nome, email)
VALUES(1, 'Ademir', 'ademir@email.com');

INSERT INTO usuarios(id, nome, email)
VALUES(2, 'Sandro', 'ademir@email.com');


-- Inserir um usuário com nome NULL para ver o erro
INSERT INTO usuarios(id, nome, email)
VALUES(3, NULL, 'usuario@email.com');



-- criar uma tabela PRODUTOS contendo: ID, NOME (obg), CÓDIGO DE BARRAS (obg e único) e PREÇO (null)
CREATE TABLE produtos(
    id INTEGER PRIMARY KEY,
    nome VARCHAR NOT NULL, 
    codigo_barras VARCHAR UNIQUE NOT NULL,
    preco DECIMAL NULL
);



-- criar uma tabela CONTAS contendo: ID, TITULAR (obg), CPF (obg e único) NÚMERO DA CONTA (obg e único) e SALDO (null)
CREATE TABLE contas(
    id INTEGER PRIMARY KEY,
    titular VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    numero_conta VARCHAR(20) UNIQUE NOT NULL,
    saldo DECIMAL NULL
);

