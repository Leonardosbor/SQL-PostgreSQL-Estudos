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

-- consulta de título e autor dos livros 
SELECT titulo, autor
FROM livros;

-- consulta dos livros publicados a partir de 2000
SELECT * 
FROM livros
WHERE ano_publicacao > 2000;

-- consulta dos livros que custam a partir de R$60
SELECT *
FROM livros
WHERE preco >= 60;

-- consulta de título e autor dos livros a partir de R$60
SELECT titulo, preco
FROM livros
WHERE preco >= 60;

-- mostrar livros ordenados pelo preço crescente
SELECT *
FROM livros
ORDER BY preco ASC;

-- mostrar livros ordenados pelo ano de publicação em ordem decrescente
SELECT *
FROM livros
ORDER BY ano_publicacao DESC;

-- mostrar título e preço dos livros publicados a partir de 2002 ordenando os preços do maior para o menor 
SELECT titulo, preco
FROM livros
WHERE ano_publicacao >= 2002
ORDER BY preco DESC;

-- mostrar título, ano de publicação e preço dos livros onde preço seja menor que 70, ordenados pelo ano de publicação do mais recente para o mais antigo
SELECT titulo, ano_publicacao, preco
FROM livros
WHERE preco < 70
ORDER BY ano_publicacao DESC; 
