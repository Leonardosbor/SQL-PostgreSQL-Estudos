
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

INSERT INTO livros(id, titulo, autor, ano_publicacao, preco)
VALUES(6, 'Harry Potter 6', 'JKR', 2004, NULL);

INSERT INTO livros(id, titulo, autor, ano_publicacao, preco)
VALUES(7, 'Harry Potter', NULL, 2020, 40)


-- Mostrar todos os livros que possuem preço igual a NULL
SELECT *
FROM livros
WHERE preco IS NULL;


-- Mostrar todos os livros que não possuem preço NULL
SELECT *
FROM livros
WHERE preco IS NOT NULL;


-- Mostrar todos os livros cujo autor seja NULL
SELECT *
FROM livros
WHERE autor IS NULL;


-- Mostrar todos os livros cujo autor não seja NULL
SELECT *
FROM livros
WHERE autor IS NOT NULL;


-- Mostrar título, autor e preço dos livros que possuem: autor e preço informado e cujo preço seja maior que 50
SELECT titulo, autor, preco
FROM livros
WHERE autor IS NOT NULL
AND preco IS NOT NULL
AND preco > 50;


-- Mostrar título, ano de publicação e preço dos livros que foram publicados a partir de 2000, que possuem preço informado e custam no máximo 60 reais
SELECT titulo, ano_publicacao, preco
FROM livros
WHERE ano_publicacao >= 2000
AND preco IS NOT NULL
AND preco <= 60;

