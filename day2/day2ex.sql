SELECT *
FROM tv_show
ORDER BY rating, name
LIMIT 3 OFFSET 3;

SELECT *
FROM tv_show
WHERE name LIKE "T%" AND name NOT LIKE "%he good place";

SELECT rating, COUNT(*)
FROM tv_show
GROUP BY rating;

/*SELECT rating
FROM tv_show
GROUP BY */

SELECT s.name
FROM tv_show s
JOIN show_genre sg on s.ID = sg.showID
JOIN genre g on g.ID = sg.genreID
WHERE g.name = "Comedy";

DELETE s.*
FROM tv_show s
JOIN show_genre sg on s.ID = sg.showID
JOIN genre g on g.ID = sg.genreID
WHERE g.name = "Drama";
#trebuie facut ON DELETE CASCADE la coloanele alea

UPDATE tv_show s
JOIN show_genre sg on s.ID = sg.showID
JOIN genre g ON g.ID = sg.genreID
SET s.rating = s.rating + 1
WHERE g.name = "Romance";

SELECT name, no_of_shows
FROM director
WHERE no_of_shows > 3;

UPDATE director d
SET d.no_of_shows = (
	SELECT COUNT(*)
	FROM tv_show t
	WHERE t.directorID = d.ID
	);

SELECT name
FROM director
ORDER BY no_of_shows, (DATEDIFF((SELECT CURDATE()), birth_date)/365), name;

SELECT s.id, s.name, COUNT(*)
FROM streaming_platform s
JOIN tv_show t ON s.id = t.streaming_platformID
GROUP by s.id, s.name;

SELECT CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT("The Director named ", d.name), " aged "), DATEDIFF((SELECT CURDATE()), d.birth_date)/365), " released "), s.name), " in "), s.release_date)
FROM tv_show s
JOIN director d ON d.ID = s.directorID
WHERE DATEDIFF((SELECT CURDATE()), d.birth_date)/365 < (SELECT AVG(DATEDIFF((SELECT CURDATE()), d2.birth_date))/365 FROM director d2)
ORDER BY s.release_date;

SELECT g.name, sp.name, COUNT(*)
FROM streaming_platform sp
JOIN tv_show s ON sp.ID = s.streaming_platformID
JOIN show_genre sg ON s.ID = sg.showID
JOIN genre g ON sg.genreID = g.ID
GROUP BY g.name, sp.name;

SELECT name
FROM tv_show
ORDER BY IFNULL(rating, DATEDIFF((SELECT CURDATE()), release_date)/365);