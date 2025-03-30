USE PC;
--Напишете заявка, която извежда средната честота на процесорите на
--компютрите.

SELECT AVG(SPEED) 
FROM PC;

--Напишете заявка, която за всеки производител извежда средния
--размер на екраните на неговите лаптопи

SELECT AVG(SCREEN)
FROM LAPTOP 
JOIN PRODUCT ON PRODUCT.MODEL = LAPTOP.MODEL
GROUP BY PRODUCT.MAKER;

--Напишете заявка, която извежда средната честота на лаптопите с
--цена над 1000

SELECT AVG(HD), PRICE
FROM LAPTOP 
GROUP BY PRICE;

--Напишете заявка, която извежда средната цена на компютрите,
--произведени от производител ‘A’

SELECT AVG(PRICE)
FROM PC 
LEFT JOIN PRODUCT ON PRODUCT.MODEL = PC.MODEL
WHERE PRODUCT.MAKER = 'A';