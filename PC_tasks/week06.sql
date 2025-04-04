use pc;

/*Намерете за всички производители на поне 2 лазерни принтера броя на произвежданите от тях PC-та
(конкретни конфигурации), евентуално 0.*/

SELECT PR.MAKER, COUNT(DISTINCT PC.CODE) AS PC_COUNT
FROM PRODUCT PR
JOIN PRINTER P ON P.MODEL = PR.MODEL
LEFT JOIN PC ON PC.MODEL = PR.MODEL
WHERE P.TYPE = 'Laser'
GROUP BY PR.MAKER
HAVING COUNT(P.CODE) > 1;

select maker, count(pc.code)
from product p
left join pc on p.model = pc.model
where maker in (select maker
				from product
				join printer on product.model = printer.model
				where printer.type = 'Laser' -- в Product също има колона type
				group by maker
				having count(*) >= 2)
group by maker;

/*Да се изведат всички производители, за които средната цена на произведените компютри е по-ниска
от средната цена на техните лаптопи*/

SELECT P.MAKER
FROM PRODUCT P
LEFT JOIN LAPTOP L ON L.MODEL = P.MODEL
LEFT JOIN PC ON PC.MODEL = P.MODEL
GROUP BY P.MAKER 
HAVING AVG(L.PRICE) > AVG(PC.PRICE);

--Един модел компютри може да се предлага в няколко конфигурации 
-- с евентуално различна цена. Да се изведат тези модели компютри,
-- чиято средна цена (на различните му конфигурации) е по-ниска
-- от най-евтиния лаптоп, произвеждан от същия производител.

SELECT PC.MODEL 
FROM PC 
JOIN PRODUCT P ON P.MODEL = PC.MODEL
GROUP BY PC.MODEL, P.MAKER
HAVING AVG(PRICE) < (SELECT MIN(PRICE)
					 FROM LAPTOP 
					 JOIN PRODUCT T
					 ON LAPTOP.MODEL = T.MODEL
					 WHERE LAPTOP.MODEL = T.MODEL);


