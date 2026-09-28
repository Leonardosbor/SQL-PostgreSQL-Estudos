-- Mostrar todos os autores diferentes existentes na tabela 
SELECT DISTINCT autor
FROM livros;


-- Mostrar todos os anos de publicação diferentes existentes na tabela
SELECT DISTINCT ano_publicacao
FROM livros;


-- Mostrar todas as combinações diferentes de autor e ano de publicação
SELECT DISTINCT autor, ano_publicacao
FROM livros;


-- Mostrar a quantidade de autores diferenets existentes na tabela
SELECT COUNT(DISTINCT autor)
FROM livros;


-- Mostrar as combinações diferentes de autor e ano de publicação para livros publicados a partir de 2000, ordenado pelo ano de publicação em ordem crescente
SELECT DISTINCT autor, ano_publicacao
FROM livros
WHERE ano_publicacao >= 2000
ORDER BY ano_publicacao ASC;


-- Mostrar a quantidade de anos de publicação diferentes dos livros cujo preço esteja informado
SELECT COUNT(DISTINCT ano_publicacao)
FROM livros
WHERE preco IS NOT NULL;