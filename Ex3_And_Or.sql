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


-- Exercício 1: Mostrar os livros publicados a partir de 2001 E com preço maior ou igual a 60
SELECT *
FROM livros
WHERE ano_publicacao >= 2001
AND preco >= 60;


-- Exercício 2: Mostrar os livros publicados antes de 2001 OU com preço igual a 70
SELECT *
FROM livros
WHERE ano_publicacao < 2001
OR preco = 70; 


-- Exercício 3: Mostrar titulo e preco dos livros com preço maior que 50 E menor que 70
SELECT titulo, preco
FROM livros
WHERE preco > 50 
AND preco < 70;


-- Exercício 4: Mostrar os livros publicados em 1999 OU 2002 OU 2003
SELECT *
FROM livros
WHERE ano_publicacao = 1999 
OR ano_publicacao = 2002 
OR ano_publicacao = 2003;


-- Exercício 5: Mostrar titulo, ano de publicação e preco dos livros que foram publicados a partir de 2000 E custam 50 OU 70
SELECT titulo, ano_publicacao, preco
FROM livros
WHERE ano_publicacao >= 2000 
AND (preco = 50 OR preco = 70);


-- Exercício 6: Mostrar os livros que foram publicados depois de 1999 E custam menos de 70 OU foram publicados em 2003
SELECT *
FROM livros
WHERE (ano_publicacao > 1999 AND preco < 70) 
OR ano_publicacao = 2003;
