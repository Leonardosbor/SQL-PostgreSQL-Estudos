-- Mostrar autores que possuem mais de 2 livros
SELECT autor, COUNT(*) AS quantidade_livros
FROM livros
GROUP BY autor
HAVING COUNT(*) > 2;


-- Mostrar autores cujo preço médio dos livros seja maior que R$60
SELECT autor, ROUND(AVG(preco), 2) AS preco_medio
FROM livros
GROUP BY autor
HAVING AVG(preco) > 60;


-- Mostrar autores cujo valor total dos livros seja maior que R$200
SELECT autor, ROUND(SUM(preco),2) AS valor_total
FROM livros
GROUP BY autor
HAVING SUM(preco) > 200;


-- Mostrar autores que possuem pelo menos 2 livros e cujo preço médio seja maior que R$60
SELECT autor, 
        COUNT(*) AS quantidade_livros,
        ROUND(AVG(preco), 2) AS preco_medio
FROM livros
GROUP BY autor
HAVING COUNT(*) >= 2
AND AVG(preco) > 60;


-- Mostrar autores que possuem pelo menos 2 livros publicados a partir de 2000
SELECT autor, COUNT(*) AS quantidade_livros
FROM livros
WHERE ano_publicacao >= 2000
GROUP BY autor
HAVING COUNT(*) >= 2; 


-- Mostrar autor, quantidade de livros, menor preço, maior preço e preço médio para autores que tenham pelo menos 2 livros e que o preço médio seja maior que R$60
SELECT autor, 
    COUNT(*) AS quantidade_livros,
    MIN(preco) AS menor_preco,
    MAX(preco) AS maior_preco,
    ROUND(AVG(preco), 2) AS preco_medio
FROM livros
GROUP BY autor
HAVING COUNT(*) >= 2
AND AVG(preco) > 60;
