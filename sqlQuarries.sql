SELECT * from city;
SELECT name from city order by name asc;
SELECT * from city where Lower(name) REGEXP'r% | g% | m%' ORDER BY name DESC;
SELECT cd.* from country c INNER JOIN country_details cd ON c.id = cd.country_id where cd.population > 1000000;
SELECT cd.* from country c INNER JOIN country_details cd ON c.id = cd.country_id where cd.population % 2 = 0 
&& cd.population BETWEEN 500000 AND 1000000;
SELECT * FROM resident WHERE YEAR(birth_date) BETWEEN 1999 AND 2005;
SELECT cd.* from country_details cd INNER JOIN country c 
	on cd.country_id = c.id INNER JOIN city ci 
	on ci.country_id = c.id INNER JOIN resident_per_city rpc 
	on rpc.city_id = ci.id INNER JOIN resident r 
	on r.id = rpc.resident_id 
	WHERE r.name = "Jimmy";
ALTER table country ADD COLUMN official_language varchar(100) DEFAULT "none";

ALTER Table country_details drop FOREIGN KEY country_id;
ALTER Table country_details
ADD FOREIGN KEY(country_id) REFERENCES country(id) ON UPDATE CASCADE;

ALTER Table city drop FOREIGN KEY country_id;
ALTER Table city
ADD FOREIGN KEY(country_id) REFERENCES country(id) ON UPDATE CASCADE;

UPDATE country c
SET c.id = CONCAT('_',c.id);

SELECT population FROM country_details WHERE climate_type = "temperat";

//v1
SELECT c.*,cd.population FROM country c INNER JOIN country_details cd
	ON c.id = cd.country_id HAVING cd.population = MAX(cd.population);
//v2
SELECT c.* , cd.population FROM country c INNER JOIN country_details cd ON c.id = cd.country_id WHERE cd.population = (SELECT MAX(population) from country_details);