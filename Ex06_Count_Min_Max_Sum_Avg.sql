SELECT COUNT(*) AS quantidade_livros
FROM livros;

SELECT COUNT(*) AS quantidade_livros
FROM livros
WHERE preco IS NOT NULL;


SELECT SUM(preco) AS valor_total
FROM livros;


SELECT ROUND(AVG(preco), 2) AS preco_medio
FROM livros;


SELECT MIN(preco) AS valor_minimo
FROM livros;


SELECT MAX(preco) AS valor_maximo
FROM livros;


SELECT 
    COUNT(*) AS quantidade_livros,
    ROUND(SUM(preco), 2) AS valor_total,
    ROUND(AVG(preco), 2) AS preco_medio,
    MIN(preco) AS menor_preco,
    MAX(preco) AS maior_preco
FROM livros;



SELECT ROUND(AVG(preco), 2) AS preco_medio
FROM livros
WHERE ano_publicacao >= 2001;


SELECT ROUND(SUM(preco), 2) AS valor_total
FROM livros
WHERE preco >= 60;


SELECT 
    COUNT(*) AS quantidade_livros,
    ROUND(AVG(preco), 2) AS preco_medio,
    MAX(preco) AS maior_preco,
    MIN(preco) AS menor_preco
FROM livros
WHERE ano_publicacao >= 2000;


