USE PC;

--За всеки 15-инчов лаптоп
--да се изведе
--производител, модел и цена:

SELECT MAKER, LAPTOP.MODEL, PRICE
FROM LAPTOP
JOIN PRODUCT 
	ON Laptop.model = Product.model
WHERE SCREEN = 15;
