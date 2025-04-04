USE movies;

/*За всяка филмова звезда да се изведе името, рождената дата и с кое студио е записвала най-много
филми. (Ако има две студиа с еднакъв брой филми, да се изведе кое да е от тях) */select name, birthdate, (select top 1 studioname
						 from starsin
						 join movie on movietitle = title and movieyear = year
						 where starname = name
						 group by studioname
						 order by count(*) desc) studioName
from moviestar;

/*Без повторение заглавията и годините на всички филми, заснети преди 1982, в които е играл поне един актьор
(актриса), чието име не съдържа нито буквата 'k', нито 'b'. Първо да се изведат най-старите филми.*/

SELECT DISTINCT M.TITLE, M.YEAR
FROM MOVIE M
JOIN STARSIN S ON M.TITLE = S.MOVIETITLE AND M.YEAR = S.MOVIEYEAR
JOIN MOVIESTAR MS ON MS.NAME = S.STARNAME
WHERE M.YEAR < 1982
  AND LOWER(MS.NAME) NOT LIKE '%b%'
  AND LOWER(MS.NAME) NOT LIKE '%k%'
ORDER BY M.YEAR;


/*Заглавията и дължините в часове (length е в минути) на всички филми, които са от същата година, от която е и филмът
Terms of Endearment, но дължината им е по-малка или неизвестна.*/

SELECT TITLE, (LENGTH / 60.0) AS HOURS
FROM MOVIE
WHERE YEAR = (SELECT YEAR 
              FROM MOVIE
			  WHERE TITLE = 'Terms of Endearment')
	  AND
	  (LENGTH < (SELECT LENGTH
				FROM MOVIE
				WHERE TITLE = 'Terms of Endearment') OR LENGTH IS NULL)