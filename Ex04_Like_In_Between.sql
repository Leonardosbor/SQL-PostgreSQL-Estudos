CREATE TABLE livros(
    id INTEGER PRIMARY KEY,
    titulo VARCHAR(100),
    autor VARCHAR(100),
    ano_publicacao INTEGER,
    preco DECIMAL(10, 2)
);

INSERT INTO livros(id, titulo, autor, ano_publicacao, preco)
VALUES(1, 'Harry Potter 1', 'JKR', 1999, 50);

INSERT INTO livros(id, titulo, autor, ano_publicacao, preco)
VALUES(2, 'Harry Potter 2', 'JKR', 2000, 60);

INSERT INTO livros(id, titulo, autor, ano_publicacao, preco)
VALUES(3, 'Harry Potter 3', 'JKR', 2001, 70);

INSERT INTO livros(id, titulo, autor, ano_publicacao, preco)
VALUES(4, 'Harry Potter 4', 'JKR', 2002, 80);

INSERT INTO livros(id, titulo, autor, ano_publicacao, preco)
VALUES(5, 'Harry Potter 5', 'JKR', 2003, 90);


SELECT *
FROM livros
WHERE titulo like ('%Harry%');

SELECT *
FROM livros
WHERE titulo like ('Harry%');

SELECT *
FROM livros
WHERE titulo like ('%3');

SELECT *
FROM livros
WHERE ano_publicacao IN (1999, 2001, 2003);

SELECT *
FROM livros
WHERE preco IN (50, 70);

SELECT *
FROM livros
WHERE preco BETWEEN 50 AND 60;

SELECT titulo, ano_publicacao, preco
FROM livros
WHERE ano_publicacao BETWEEN 2000 AND 2003
AND preco BETWEEN 50 AND 60;

SELECT titulo, preco
FROM livros
WHERE titulo like('%Harry%')
AND ano_publicacao IN (2001, 2002, 2003)
AND preco <= 60
ORDER BY preco DESC;
