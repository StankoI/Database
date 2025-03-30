USE MOVIES;

SELECT AVG(netWorth) AS AVGNW
FROM MovieExec;

SELECT COUNT(*)
FROM StarsIn;

SELECT COUNT(DISTINCT starName)
FROM StarsIn;SELECT SUM(length)
FROM Movie
JOIN StarsIn
ON title = movietitle AND year = movieyear
WHERE starname = 'Harrison Ford';

SELECT studioName, SUM(length)
FROM Movie
GROUP BY studioName;

SELECT YEAR(birthdate), COUNT(*)
FROM MovieStar
GROUP BY YEAR(birthdate);

SELECT YEAR(birthdate), gender, COUNT(*)
FROM MovieStar
GROUP BY YEAR(birthdate), gender;

SELECT *
FROM movie
WHERE length = (SELECT MAX(length)
				FROM movie);SELECT studioName, SUM(length)
FROM Movie
GROUP BY studioName
HAVING COUNT(*) >= 2;

SELECT name, COUNT(starname) as moviesCount
FROM MovieStar
LEFT JOIN StarsIn ON name = starname
GROUP BY name;


