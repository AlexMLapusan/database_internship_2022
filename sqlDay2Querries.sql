/*ex1*/
SELECT * from my_show ORDER BY rating, name ASC;
/*ex2 changed start letter and final string to have result*/
SELECT * from my_show WHERE Lower(name) LIKE 'n%to';
/*ex3*/ 
SELECT COUNT(*),rating from my_show GROUP BY rating;
/*ex4 cred ca asa dar datele nu m-au ajutat asa mult sa vad exact ce se intampla*/ 
SELECT COUNT(*),rating from my_show WHERE 
	rating BETWEEN 0 and 2
    or rating BETWEEN 2 and 4
    or rating BETWEEN 4 and 6
    or rating BETWEEN 6 and 8
    or rating BETWEEN 8 and 10
    GROUP BY rating;
/*ex5*/ 
SELECT s.* from my_show s
	inner join genre_per_show gs
 	INNER join genre g 
	on( s.id = gs.show_id AND gs.genre_id = g.id) 
WHERE g.name = "comedy";
/*ex6*/ 
DELETE s.* from my_show s
	inner join genre_per_show gs
 	INNER join genre g 
	on( s.id = gs.show_id AND gs.genre_id = g.id) 
WHERE g.name = "comedy"; 
/*ex7 : da, doar daca se lucreaza cu tranzactii si rollback-ul se face inainte de commit , altfel datele sunt pierdute*/
/*ex8*/
UPDATE my_show
SET my_show.rating = my_show.rating + 1
WHERE my_show.id = (
    SELECT gs.show_id FROM genre_per_show gs
        INNER join genre g 
        on(gs.genre_id = g.id) 
        WHERE g.name = "comedy" AND my_show.id = gs.show_id
    );
/*ex9*/
SELECT name, nr_of_shows from director where director.nr_of_shows > 0;
/*ex10*/ 
UPDATE director SET nr_of_shows = (SELECT COUNT(*) FROM my_show WHERE director_id = director.id);
/*ex11 nu trebuie calculata varsta, daca x e mai batran ca y, atunci x s-a nascut inaintea lui y*/
SELECT name from director ORDER BY nr_of_shows, birth_date,name ASC;
/*ex12*/
SELECT * ,  (Select count(*) from my_show
                WHERE
                streaming_platform.id = my_show.platform_id
               ) as show_count
FROM streaming_platform;

/*ex13 I guess?*/
SELECT 
concat( "The director ", name," aged ",
       Round(DATEDIFF(NOW(), (SELECT my_show.release_date FROM my_show WHERE 																				my_show.director_id = director.id)
                                                       )/365.0) ,
       " years since released ", (SELECT concat(my_show.name , " in ", my_show.release_date) 
                            FROM my_show WHERE my_show.director_id = director.id) ) as info
FROM director
WHERE director.birth_date > (SELECT avg(birth_date) from director)
ORDER BY birth_date;

/*14*/
SELECT g.name, str.name , COUNT(*) as counts from streaming_platform str INNER JOIN my_show s ON (s.platform_id = str.id) 
INNER JOIN genre_per_show gs on(gs.show_id = s.id) 
INNER JOIN genre g on(gs.genre_id = g.id) 
GROUP by g.name,str.name 
ORDER by str.name, g.name; 

/*15*/
SELECT *, Round( DATEDIFF(NOW(),my_show.release_date)/365.0 ) as age
FROM my_show
ORDER BY IF(rating is not null,rating,age);
/*16*/
( SELECT score.name, Sum(IF(score.age > 20, 5 , IF(score.age BETWEEN 10 AND 20, 3,2)))/(MIN(age))
 as scored from
	(SELECT director.name as name, Round( DATEDIFF(NOW(),my_show.release_date)/365.0 ) as age 
     	from my_show INNER JOIN director on(director.id = my_show.director_id)) as score
 	GROUP BY score.name
);
