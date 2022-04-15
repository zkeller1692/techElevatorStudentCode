BEGIN TRANSACTION;

DROP TABLE IF EXISTS reviews;
DROP SEQUENCE IF EXISTS seq_review_id;
DROP TABLE IF EXISTS beers;
DROP SEQUENCE IF EXISTS seq_beer_id;
DROP TABLE IF EXISTS brewers;
DROP TABLE IF EXISTS breweries;
DROP SEQUENCE IF EXISTS seq_brewery_id;
DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) UNIQUE NOT NULL,
	password_hash varchar(200) NOT NULL,
	zipcode varchar(10),
	email varchar(100),
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);


INSERT INTO users (username,password_hash, zipcode, email, role) 
VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', '55555', 'example@email.com','ROLE_USER');

INSERT INTO users (username,password_hash, zipcode, email, role) 
VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', '55555', 'example@email.com','ROLE_ADMIN');

INSERT INTO users (username, password_hash, zipcode, email, role) 
VALUES ('Zach','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 
		'45236', 'zach@email.com', 'ROLE_BREWER');
		
insert into users(username, password_hash, role)
values ('brewer', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_BREWER');

CREATE SEQUENCE seq_brewery_id
 INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
CREATE TABLE breweries (
	brewery_id int DEFAULT nextval('seq_brewery_id'::regclass) NOT NULL,
	brewery_name varchar(50) UNIQUE NOT NULL,
	brewery_location varchar(60) NOT NULL,
	phone_number varchar(20) NOT NULL,
	hours_of_operation varchar(300) NOT NULL,
	address varchar(300) NOT NULL,
	bio varchar(50000) NOT NULL,
	brewery_img varchar(10000) NOT NULL,
	active boolean NOT NULL,
	CONSTRAINT PK_brewery PRIMARY KEY (brewery_id)
);


INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('Madtree Brewing', 'Cincinnati, OH', '513-836-8733', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '3301 Madison Road Cincinnati, OH 45209', 'Madtree is a cool brewery in Cincinnati.', true, 'https://cincinnatiusa.com/sites/default/files/styles/Array/public/Venues/MadTree-00.jpg');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('Great Lakes Brewering Company', 'Cleveland, OH', '216-771-4404', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '2516 Market Ave, Cleveland, OH 44113', 'Great lakes is a cool Brewery', true, 'https://d1ynl4hb5mx7r8.cloudfront.net/wp-content/uploads/2020/02/17140001/great-lakes-1024x633.jpg');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('50 West Brewery', 'Cincinnati, OH', '555-555-5555', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '1010 Street Address, City, State 01010', 'They make beers', true, 'https://media1.citybeat.com/citybeat/imager/u/original/12086253/copy_of_20180412_4e9a2481.5c9e70e104fc3.png');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('Fretboard', 'Cincinnati, OH', '555-555-5555', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '1010 Street Address, City, State 01010', 'They make beers', true, 'https://www.gannett-cdn.com/presto/2021/11/03/PCIN/49bf6db3-ff37-4b74-b615-fab35b87d110-Fretboard.jpg');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('High Grain Brewery', 'Cincinnati, OH', '555-555-5555', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '1010 Street Address, City, State 01010', 'They make beers', true, 'https://media.bizj.us/view/img/11339109/highgrain29*1200xx1800-1013-0-94.jpg');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('Nine Giant Brewery', 'Cincinnati, OH', '555-555-5555', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '1010 Street Address, City, State 01010', 'They make beers', true, 'https://www.gannett-cdn.com/media/2016/06/23/Cincinnati/Cincinnati/636022930752296332-062316-NINE-GIANT-335.jpg?width=640');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('Rhinegeist', 'Cincinnati, OH', '555-555-5555', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '1010 Street Address, City, State 01010', 'They make beers', true, 'https://media-exp1.licdn.com/dms/image/C4E1BAQGCkrtCNsSMMg/company-background_10000/0/1578514862862?e=2147483647&v=beta&t=Tbeps4MHeNRqWXULVPPqvyG_fYdFIBf3bT3_twwQgXg');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('Braxton', 'Covington, Ky', '555-555-5555', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '1010 Street Address, City, State 01010', 'They make beers', true, 'https://www.americanway.com/public/uploads/Cincinnati-Braxton-Brewing-Co-courtesy.jpg');

CREATE TABLE brewers (
	brewer_id int CONSTRAINT fk_users REFERENCES users(user_id),
	brewery_id int CONSTRAINT fk_breweries REFERENCES breweries(brewery_id)
);


INSERT INTO brewers (brewer_id, brewery_id)
VALUES ((SELECT user_id
		FROM users 
		WHERE username= 'Zach'),
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name ='Madtree Brewery'));
	   
VALUES ((SELECT user_id
		FROM users 
		WHERE username= 'brewer'),
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name ='Great Lakes Brewery'));

CREATE SEQUENCE seq_beer_id
 INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
CREATE TABLE beers(
	beer_id int DEFAULT nextval('seq_beer_id'::regclass) NOT NULL,
	beer_name varchar(50) UNIQUE NOT NULL,
	abv decimal NOT NULL,
	beer_type varchar(30) NOT NULL,
	ibu int NOT NULL,
	hops varchar(100) NOT NULL,
	description varchar(50000) NOT NULL,
	beer_img varchar(300),
	malts varchar(100),
	available boolean,
	brewery_id int CONSTRAINT fk_breweries REFERENCES breweries(brewery_id),
	CONSTRAINT PK_beer PRIMARY KEY (beer_id)
);


INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)
VALUES ('Madtree beer 1', 4.6, 'sour', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Madtree Brewing'), 10, 'Perle', 'A sour beer from Madtree', 'https://s3-us-east-2.amazonaws.com/cincylabwp/wp-content/uploads/20180802194151/madtree-logo.png');

INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)
VALUES ('Madtree beer 2', 6.0, 'pilsner', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Madtree Brewing'), 10, 'test hops', 'A pilsner from Madtree', 'https://s3-us-east-2.amazonaws.com/cincylabwp/wp-content/uploads/20180802194151/madtree-logo.png');
	
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)
VALUES ('Madtree beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Madtree Brewing'), 10, 'test hops', 'A placeholder beer from Madtree', 'https://s3-us-east-2.amazonaws.com/cincylabwp/wp-content/uploads/20180802194151/madtree-logo.png');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)
VALUES ('Madtree beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Madtree Brewing'), 10, 'test hops', 'A placeholder beer from Madtree', 'https://s3-us-east-2.amazonaws.com/cincylabwp/wp-content/uploads/20180802194151/madtree-logo.png');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)
VALUES ('Great lakes beer 1', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Great Lakes Brewering Company'), 10, 'test hops', 'A placeholder beer from Great lakes', 'https://untappd.akamaized.net/site/brewery_logos_hd/brewery-3125_6b7ee_hd.jpeg');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)
VALUES ('Great lakes beer 2', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Great Lakes Brewering Company'), 10, 'test hops', 'A placeholder beer from Great lakes', 'https://untappd.akamaized.net/site/brewery_logos_hd/brewery-3125_6b7ee_hd.jpeg');
	 
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)
VALUES ('Great lakes beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Great Lakes Brewering Company'), 10, 'test hops', 'A placeholder beer from Great lakes', 'https://untappd.akamaized.net/site/brewery_logos_hd/brewery-3125_6b7ee_hd.jpeg');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)
VALUES ('Great lakes beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Great Lakes Brewering Company'), 10, 'test hops', 'A placeholder beer from Great lakes', 'https://untappd.akamaized.net/site/brewery_logos_hd/brewery-3125_6b7ee_hd.jpeg');

INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)
VALUES ('50 west beer 1', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = '50 West Brewery'), 10, 'test hops', 'A placeholder beer from 50 west', 'https://fiftywestbrew.com/wp-content/uploads/sites/90/2018/04/50W-Logo.png');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)
VALUES ('50 west beer 2', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = '50 West Brewery'), 10, 'test hops', 'A placeholder beer from 50 west', 'https://fiftywestbrew.com/wp-content/uploads/sites/90/2018/04/50W-Logo.png');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)
VALUES ('50 west beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = '50 West Brewery'), 10, 'test hops', 'A placeholder beer from 50 west', 'https://fiftywestbrew.com/wp-content/uploads/sites/90/2018/04/50W-Logo.png');	 
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)
VALUES ('50 west beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = '50 West Brewery'), 10, 'test hops', 'A placeholder beer from 50 west', 'https://fiftywestbrew.com/wp-content/uploads/sites/90/2018/04/50W-Logo.png');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)
VALUES ('Fretboard beer 1', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Fretboard Brewery'), 10, 'test hops', 'A placeholder beer from Fretboard', 'https://cdn.myportfolio.com/c095b82c-a3b5-48f0-84f0-ec13c96e1627/563cf9b3-9856-4127-8560-6d4c421b796b_rwc_0x0x3000x3000x3000.jpg?h=a46f98ae91c1d837371792cecf3c8188');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)
VALUES ('Fretboard beer 2', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Fretboard Brewery'), 10, 'test hops', 'A placeholder beer from Fretboard', 'https://cdn.myportfolio.com/c095b82c-a3b5-48f0-84f0-ec13c96e1627/563cf9b3-9856-4127-8560-6d4c421b796b_rwc_0x0x3000x3000x3000.jpg?h=a46f98ae91c1d837371792cecf3c8188');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)
VALUES ('Fretboard beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Fretboard Brewery'), 10, 'test hops', 'A placeholder beer from Fretboard', 'https://cdn.myportfolio.com/c095b82c-a3b5-48f0-84f0-ec13c96e1627/563cf9b3-9856-4127-8560-6d4c421b796b_rwc_0x0x3000x3000x3000.jpg?h=a46f98ae91c1d837371792cecf3c8188');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)
VALUES ('Fretboard beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Fretboard Brewery'), 10, 'test hops', 'A placeholder beer from Fretboard', 'https://cdn.myportfolio.com/c095b82c-a3b5-48f0-84f0-ec13c96e1627/563cf9b3-9856-4127-8560-6d4c421b796b_rwc_0x0x3000x3000x3000.jpg?h=a46f98ae91c1d837371792cecf3c8188');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)
VALUES ('High Grain beer 1', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'High Grain Brewery'), 10, 'test hops', 'A placeholder beer from High Grain', 'https://untappd.akamaized.net/venuelogos/venue_8983189_dccbebe7.png?v=1');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)
VALUES ('High Grain beer 2', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'High Grain Brewery'), 10, 'test hops', 'A placeholder beer from High Grain', 'https://untappd.akamaized.net/venuelogos/venue_8983189_dccbebe7.png?v=1');

INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)
VALUES ('High Grain beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'High Grain Brewery'), 10, 'test hops', 'A placeholder beer from High Grain', 'https://untappd.akamaized.net/venuelogos/venue_8983189_dccbebe7.png?v=1');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)
VALUES ('High Grain beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'High Grain Brewery'), 10, 'test hops', 'A placeholder beer from High Grain', 'https://untappd.akamaized.net/venuelogos/venue_8983189_dccbebe7.png?v=1');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)	   
VALUES ('Nine Giant beer 1', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Nine Giant Brewery'), 10, 'test hops', 'A placeholder beer from Nine Giant', 'https://untappd.akamaized.net/venuelogos/venue_2951948_e77b523b.png?v=1');	
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)	   
VALUES ('Nine Giant beer 2', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Nine Giant Brewery'), 10, 'test hops', 'A placeholder beer from Nine Giant', 'https://untappd.akamaized.net/venuelogos/venue_2951948_e77b523b.png?v=1');		

INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)	   
VALUES ('Nine Giant beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Nine Giant Brewery'), 10, 'test hops', 'A placeholder beer from Nine Giant', 'https://untappd.akamaized.net/venuelogos/venue_2951948_e77b523b.png?v=1');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)	   
VALUES ('Nine Giant beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Nine Giant Brewery'), 10, 'test hops', 'A placeholder beer from Nine Giant', 'https://untappd.akamaized.net/venuelogos/venue_2951948_e77b523b.png?v=1');		
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)	   
VALUES ('Rhinegeist beer 1', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Rhinegeist Brewery'), 10, 'test hops', 'A placeholder beer from Rhinegeist', 'https://www.pngfind.com/pngs/m/688-6884712_rhinegeist-brewery-logo-hd-png-download.png');	
	  
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)	   
VALUES ('Rhinegeist beer 2', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Rhinegeist Brewery'), 10, 'test hops', 'A placeholder beer from Rhinegeist', 'https://www.pngfind.com/pngs/m/688-6884712_rhinegeist-brewery-logo-hd-png-download.png');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)	   
VALUES ('Rhinegeist beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Rhinegeist Brewery'), 10, 'test hops', 'A placeholder beer from Rhinegeist', 'https://www.pngfind.com/pngs/m/688-6884712_rhinegeist-brewery-logo-hd-png-download.png');	
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)	   
VALUES ('Rhinegeist beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Rhinegeist Brewery'), 10, 'test hops', 'A placeholder beer from Rhinegeist', 'https://www.pngfind.com/pngs/m/688-6884712_rhinegeist-brewery-logo-hd-png-download.png');	
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)	   
VALUES ('Braxton beer 1', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Braxton'), 10, 'test hops', 'A placeholder beer from Braxton', 'https://absolutebeer.com/wp-content/uploads/2020/02/AB-Breweries-Braxton-Brewing-Company-Logo-1.jpg');	
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)	   
VALUES ('Braxton beer 2', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Braxton'), 10, 'test hops', 'A placeholder beer from Braxton', 'https://absolutebeer.com/wp-content/uploads/2020/02/AB-Breweries-Braxton-Brewing-Company-Logo-1.jpg');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)	   
VALUES ('Braxton beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Braxton'), 10, 'test hops', 'A placeholder beer from Braxton', 'https://absolutebeer.com/wp-content/uploads/2020/02/AB-Breweries-Braxton-Brewing-Company-Logo-1.jpg');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, beer_img)	   
VALUES ('Braxton beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Braxton'), 10, 'test hops', 'A placeholder beer from Braxton', 'https://absolutebeer.com/wp-content/uploads/2020/02/AB-Breweries-Braxton-Brewing-Company-Logo-1.jpg');
	   
CREATE SEQUENCE seq_review_id
 INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
CREATE TABLE reviews(
	review_id int DEFAULT nextval('seq_review_id'::regclass) NOT NULL,
	review varchar(10000) NOT NULL,
	rating int NOT NULL CHECK (rating >= 5),
	beer_id int CONSTRAINT fk_beers REFERENCES beers(beer_id),
	reviewer_id int CONSTRAINT fk_users REFERENCES users(user_id)
);


INSERT INTO reviews (review, rating, beer_id, reviewer_id)
VALUES ('That is one good beer!', 5, (
SELECT beer_id
FROM beers
WHERE beer_name = 'Shade'),(
SELECT user_id
FROM users
WHERE username = 'Zach'));

COMMIT TRANSACTION;
