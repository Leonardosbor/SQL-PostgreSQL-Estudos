CREATE TABLE livros(
    id INTEGER PRIMARY KEY,
    titulo VARCHAR(100),
    autor VARCHAR(100),
    ano_publicacao INTEGER,
    preco DECIMAL(10, 2)
);

INSERT INTO livros (id, titulo, autor, ano_publicacao, preco)
VALUES(1, 'Harry Potter 1', 'JKR', 1999, 50 );

INSERT INTO livros (id, titulo, autor, ano_publicacao, preco)
VALUES(2, 'Harry Potter 2', 'JKR', 2000, 50);

INSERT INTO livros (id, titulo, autor, ano_publicacao, preco)
VALUES(3, 'Harry Potter 3', 'JKR', 2001, 50);

INSERT INTO livros (id, titulo, autor, ano_publicacao, preco)
VALUES(4, 'Harry Potter 4', 'JKR', 2002, 60);

INSERT INTO livros (id, titulo, autor, ano_publicacao, preco)
VALUES(5, 'Harry Potter 5', 'JKR', 2003, 70);

SELECT * FROM livros;


