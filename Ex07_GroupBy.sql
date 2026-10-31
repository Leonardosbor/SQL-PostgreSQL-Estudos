-- Mostrar quantos livros existem para cada autor
SELECT autor, COUNT(*) AS quantidade_livros
FROM livros
GROUP BY autor;


-- Mostrar o preço médio dos livros de cada autor
SELECT autor, ROUND(AVG(preco), 2) AS valor_medio
FROM livros
GROUP BY autor;


-- Mostrar valor total dos livros de cada autor
SELECT AUTOR, ROUND(SUM(preco), 2) AS valor_total
FROM livros
GROUP BY autor;


-- Mostrar para cada autor a quantidade de livros e o menor e o maior preço
SELECT 
    autor, COUNT(*) AS quantidade_livros,
    MIN(preco) AS menor_preco,
    MAX(preco) AS maior_preco
FROM livros
GROUP BY autor;


-- Mostrar quantos livros cada autor possui, considerando apenas os livros publicados a partir de 2001
SELECT autor, COUNT(*) AS quantidade_livro
FROM livros
WHERE ano_publicacao >= 2001
GROUP BY autor;



-- Mostrar, para cada autor, a quantidade de livros e o preço médio, considerando somente livros com preço informado
SELECT autor, 
        COUNT(*) AS quantidade_livro,
        ROUND(AVG(preco), 2) AS preco_medio
FROM livros
WHERE preco IS NOT NULL
GROUP BY autor;
