Create table country(
	id varchar(15) primary key
);
Create table country_details(
	id int primary key,
	population int,
	climate_type varchar(40),
	country_id varchar(15),
	Foreign key(country_id) references country(id)
);
Create table city(
	id int primary key,
	name varchar(40) unique,
	country_id varchar(15),
	Foreign key(country_id) references country(id)
);
Create table resident(
	id int primary key,
	name varchar(40),
	birth_date date,
	country_id varchar(15),
	Foreign key(country_id) references country(id)
);
Create table resident_per_city(
	city_id int,
	resident_id int,
	Primary key(city_id, resident_id),
	Foreign key(city_id) references country(id),
	Foreign key(resident_id) references country(id)
);