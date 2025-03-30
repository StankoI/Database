USE PC;

--За всеки модел компютри да се
--изведат цените на различните
--конфигурации от този модел.
--Ако няма конфигурации за
--даден модел, да се изведе
--NULL. Резултатът да има две
--колони: model и price.

SELECT PR.MODEL AS MODEL , PC.PRICE AS PRICE
FROM PRODUCT AS PR
LEFT JOIN PC AS PC ON PC.MODEL = PR.MODEL
WHERE TYPE = 'PC';

--Напишете заявка, която
--извежда производител, модел и
--тип на продукт за тези
--производители, за които
--съответният продукт не се
--продава (няма го в таблиците
--PC, Laptop или Printer).

SELECT PR.MAKER, PR.MODEL, PR.TYPE
FROM PRODUCT PR
LEFT JOIN PRINTER P ON P.MODEL = PR.MODEL
LEFT JOIN PC PC ON PC.MODEL = PR.MODEL
LEFT JOIN LAPTOP L ON L.MODEL = PR.MODEL
WHERE P.CODE IS NULL AND PC.CODE IS NULL AND L.CODE IS NULL;

