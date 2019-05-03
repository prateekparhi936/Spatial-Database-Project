CREATE EXTENSION postgis;


CREATE TABLE spatial(
location_name TEXT,
longitude  FLOAT,
latitude   FLOAT,
where_is  GEOGRAPHY );


INSERT INTO spatial VALUES ('Ellendale Place',-118.288866,34.031748,NULL);
INSERT INTO spatial VALUES ('Orchard Ave',-118.288262,34.028371,NULL);
INSERT INTO spatial VALUES ('Vermont Ave',-118.291541,34.025607,NULL);
INSERT INTO spatial VALUES ('Figueroa St',-118.280103,34.021895,NULL);
INSERT INTO spatial VALUES ('Mcclintok Ave',-118.287602,34.024325,NULL);
INSERT INTO spatial VALUES ('SGM',-118.289053,34.021449,NULL);
INSERT INTO spatial VALUES ('USC BookStore',-118.286601,34.020773,NULL);
INSERT INTO spatial VALUES ('Tommy Trojan',-118.285451,34.020555,NULL);
INSERT INTO spatial VALUES ('Leavey Library',-118.282912,34.021787,NULL);
INSERT INTO spatial VALUES ('Exposition',-118.282274,34.018429,NULL);
INSERT INTO spatial VALUES ('Ralphs',-118.291335,34.032799,NULL);
INSERT INTO spatial VALUES ('West Adams Blvd',-118.286460,34.032707,NULL);


-- Set where_is to give geographic location of the point(long,lat)
UPDATE spatial SET where_is = ST_POINT(longitude,latitude);


SELECT * FROM spatial;


-- Convex Polygon Query
SELECT ST_AsText(ST_ConvexHull(ST_Collect(where_is::geometry))) AS convex_hull
FROM spatial;


-- Four Nearest Neighbor Query
SELECT ST_AsText(where_is::geometry),location_name,where_is
FROM spatial 
where location_name<>'Ellendale Place' 
ORDER BY where_is::geometry <-> st_setsrid(st_makepoint(-118.288866,34.031748),4326)				 
limit 4;

	