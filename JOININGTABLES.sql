use movies;


SELECT  title, year, studioname, address
FROM MOVIE
JOIN STUDIO ON STUDIONAME = NAME
WHERE INCOLOR = 'y';

SELECT M1.TITLE
FROM MOVIE M1, MOVIE M2
WHERE M2.TITLE = 'Star Wars'
	AND M1.LENGTH > M2.LENGTH;

SELECT NAME, TITLE 
FROM MOVIESTAR
JOIN STARSIN ON NAME = STARNAME
JOIN MOVIE ON MOVIETITLE = TITLE AND MOVIEYEAR = YEAR
WHERE GENDER = 'F' AND STUDIONAME = 'MGM';

SELECT NAME 
FROM MOVIESTAR
JOIN STARSIN ON NAME = STARNAME
WHERE MOVIETITLE = 'Terms of Endearment' AND GENDER = 'F';

select name
from starsin
join moviestar on starname = name
where gender = 'F'
	and movietitle = 'Terms of Endearment';

SELECT NAME
FROM MOVIESTAR
JOIN STARSIN ON NAME = STARNAME
JOIN MOVIE ON MOVIETITLE = TITLE AND MOVIEYEAR = YEAR
WHERE STUDIONAME = 'MGM' AND  YEAR = 1995;

select distinct starname
from starsin
join movie on movietitle = title
	and movieyear = year
where studioname = 'MGM' and movieyear = 1995;

SELECT * FROM STARSIN;

(SELECT title, year
FROM Movie
WHERE incolor = 'y')
UNION
(SELECT movietitle, movieyear
FROM StarsIn
WHERE starname = 'Harrison Ford');

(SELECT NAME, ADDRESS
FROM MOVIEEXEC
WHERE NETWORTH > 1000000)
INTERSECT
(SELECT NAME, ADDRESS 
FROM MOVIESTAR
WHERE GENDER = 'F');



USE PC;

SELECT MAKER, LAPTOP.MODEL, PRICE
FROM LAPTOP
JOIN PRODUCT 
	ON Laptop.model = Product.model
WHERE SCREEN = 15;

SELECT maker, Laptop.model, price
FROM Laptop
JOIN Product
 ON Laptop.model = Product.model
WHERE screen = 15;