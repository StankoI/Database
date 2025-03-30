use movies;

SELECT *
FROM MOVIE;

SELECT STUDIONAME, TITLE FROM MOVIE;

SELECT  TITLE, LENGTH / 60.0 AS HOURS FROM MOVIE;

SELECT * 
FROM MOVIE
WHERE STUDIONAME = 'DISNEY';

SELECT *
FROM MOVIE
WHERE TITLE LIKE 'STAR %';

SELECT * 
FROM MOVIESTAR
WHERE BIRTHDATE > '1970-01-01';

SELECT NAME, YEAR(BIRTHDATE)
FROM MOVIESTAR
WHERE MONTH(BIRTHDATE) = 7;\

SELECT YEAR, TITLE, LENGTH
FROM MOVIE
ORDER BY TITLE;

--Напишете заявка, която извежда
--адреса на студио ‘MGM’

SELECT ADDRESS
FROM STUDIO
WHERE NAME = 'MGM';


--Напишете заявка, която извежда
--рождената дата на актрисата Sandra
--Bullock

SELECT BIRTHDATE
FROM MOVIESTAR
WHERE NAME = 'SANDRA BULLOCK';


--Напишете заявка, която извежда
--имената на всички филмови звезди,
--които са участвали във филм през
--1980, в заглавието на които има
--думата ‘Empire’

SELECT STARNAME
FROM STARSIN
WHERE MOVIETITLE LIKE '%EMPIRE%' ;


--Напишете заявка, която извежда
--имената на всички изпълнители на
--филми с нетна стойност над
--10 000 000 долара

SELECT NAME
FROM MOVIEEXEC
WHERE NETWORTH >= 10000000;


--Напишете заявка, която извежда
--имената на всички актьори, които са
--мъже или живеят в Malibu
SELECT *
FROM MOVIESTAR
WHERE GENDER = 'M' OR ADDRESS LIKE '%Baldwin%';







