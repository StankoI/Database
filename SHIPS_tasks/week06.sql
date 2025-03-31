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


														  