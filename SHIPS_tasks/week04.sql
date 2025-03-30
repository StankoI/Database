use SHIPS;

--Напишете заявка,
--която за всеки кораб
--извежда името му,
--държавата, броя
--оръдия и годината на
--пускане (launched).
SELECT SH.NAME AS NAME, CL.COUNTRY AS COUNTRY, CL.NUMGUNS AS NUMGUNS, SH.LAUNCHED
FROM SHIPS AS SH
JOIN CLASSES AS CL ON SH.CLASS = CL.CLASS;

--Напишете заявка,
--която извежда
--имената на корабите,
--участвали в битка от
--1942 г.

SELECT OU.SHIP AS NAME
FROM OUTCOMES AS OU
JOIN BATTLES AS B ON B.NAME = OU.BATTLE
WHERE B.DATE LIKE '%1941%';