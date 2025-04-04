USE SHIPS;

--Намерете броя на потъналите американски кораби за всяка проведена битка с поне един потънал
--американски кораб.

SELECT COUNT(OU.RESULT)
FROM OUTCOMES AS OU 
JOIN SHIPS AS SH ON SH.NAME = OU.SHIP
JOIN CLASSES AS CL ON CL.CLASS = SH.CLASS
WHERE CL.COUNTRY = 'USA' AND OU.RESULT = 'sunk' 
GROUP BY OU.BATTLE;

-- Битките, в които са участвали поне 3 кораба на една и съща страна

SELECT OU.BATTLE
FROM OUTCOMES AS OU 
JOIN SHIPS AS SH ON SH.NAME = OU.SHIP
JOIN CLASSES AS CL ON CL.CLASS = SH.CLASS
GROUP BY OU.BATTLE
HAVING COUNT(*) >= 3;


/*Имената на класовете, за които няма кораб, пуснат на вода след 1921 г., но имат пуснат поне един
кораб. */

SELECT CL.CLASS
FROM CLASSES AS CL
JOIN SHIPS AS SH ON SH.CLASS = CL.CLASS
GROUP BY CL.CLASS 
HAVING MAX (SH.LAUNCHED) < 1921; 


/*За всеки кораб броя на битките, в които е бил увреден (result = ‘damaged’). Ако корабът не е участвал
в битки или пък никога не е бил увреждан, в резултата да се вписва 0.*/

SELECT COUNT(CASE WHEN OU.RESULT = 'damaged' THEN 1 ELSE NULL END) AS damage_count
FROM SHIPS SH
LEFT JOIN OUTCOMES OU ON OU.SHIP = SH.NAME
GROUP BY SH.NAME;

/*За всяка държава да се изведе броят на корабите и броят на потъналите кораби.*/

SELECT CL.COUNTRY, COUNT(CASE WHEN OU.RESULT = 'sunk' THEN 1 ELSE NULL END) AS SUNK_COUNT,
       COUNT(SH.NAME) AS SHIPS_COUNT
FROM CLASSES AS CL
LEFT JOIN SHIPS AS SH ON SH.CLASS = CL.CLASS
LEFT JOIN OUTCOMES AS OU ON OU.SHIP = SH.NAME
GROUP BY CL.COUNTRY;

/*За всяка държава да се изведе броят на повредените кораби и броят на потъналите кораби. Всяка от
бройките може да бъде и нула. */

SELECT CL.COUNTRY,
	   COUNT(CASE WHEN OU.RESULT = 'sunk' THEN 1 ELSE NULL END) AS SUNK_COUNT,
       COUNT(CASE WHEN OU.RESULT = 'damaged' THEN 1 ELSE NULL END) AS DAMAGED_COUNT
FROM CLASSES AS CL 
LEFT JOIN SHIPS AS SH ON SH.CLASS = CL.CLASS
LEFT JOIN OUTCOMES AS OU ON OU.SHIP = SH.NAME
GROUP BY CL.COUNTRY;

/*Намерете за всеки клас с поне 3 кораба броя на корабите от този клас, които са победили в битка
(result = 'ok')*/

SELECT CL.CLASS, COUNT(CASE WHEN OU.RESULT = 'OK' THEN 1 ELSE NULL END) AS OK_COUNT
FROM CLASSES AS CL 
LEFT JOIN SHIPS AS SH ON SH.CLASS = CL.CLASS
LEFT JOIN OUTCOMES AS OU ON OU.SHIP = SH.NAME
GROUP BY CL.CLASS
HAVING COUNT(DISTINCT SH.NAME) >= 3;







