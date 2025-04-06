USE movies;

/*За всяка филмова звезда да се изведе името, рождената дата и с кое студио е записвала най-много
филми. (Ако има две студиа с еднакъв брой филми, да се изведе кое да е от тях) */

select name, birthdate, (select top 1 studioname
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
				WHERE TITLE = 'Terms of Endearment') OR LENGTH IS NULL);


/*Имената на всички продуценти, които са и филмови звезди и са играли в поне един филм преди 1980 г. и поне един
след 1985 г*/

SELECT ME.NAME 
FROM MOVIEEXEC ME
WHERE ME.NAME IN (SELECT NAME 
					FROM MOVIESTAR MS
					JOIN STARSIN SI ON SI.STARNAME = MS.NAME
					GROUP BY NAME
					HAVING
					SUM(CASE WHEN SI.MOVIEYEAR < 1980 THEN 1 ELSE 0 END) > 0 AND
					SUM(CASE WHEN SI.MOVIEYEAR > 1985 THEN 1 ELSE 0 END) > 0
					); 


/*Всички черно-бели филми, записани преди най-стария цветен филм (InColor='y'/'n') на същото студио*/

SELECT TITLE
FROM MOVIE OUT_M
WHERE INCOLOR = 'n' AND YEAR < (SELECT TOP 1 M.YEAR 
								FROM MOVIE M
								WHERE M.INCOLOR = 'y' AND
								M.STUDIONAME = OUT_M.STUDIONAME
								ORDER BY M.YEAR);



/*Имената и адресите на студиата, които са работили с по-малко от 5 различни филмови звезди. Студиа, за които няма
посочени филми или има, но не се знае кои актьори са играли в тях, също да бъдат изведени. Първо да се изведат
студиата, работили с най-много звезди. Напр. ако студиото има два филма, като в първия са играли A, B и C, а във
втория - C, D и Е, то студиото е работило с 5 звезди общо*/

SELECT S.NAME, S.ADDRESS 
FROM STUDIO S
WHERE 5 > (SELECT COUNT( DISTINCT SI.STARNAME)
			FROM MOVIE M
			LEFT JOIN STARSIN SI ON M.TITLE = SI.MOVIETITLE AND M.YEAR = SI.MOVIEYEAR
			WHERE M.STUDIONAME = S.NAME) 
ORDER BY (SELECT COUNT( DISTINCT SI.STARNAME)
			FROM MOVIE M
			LEFT JOIN STARSIN SI ON M.TITLE = SI.MOVIETITLE AND M.YEAR = SI.MOVIEYEAR
			WHERE M.STUDIONAME = S.NAME) ;
			

