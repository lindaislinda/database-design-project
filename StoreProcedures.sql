-- Function
-- Returning all rows of a table based on some input or ALL
create or replace function check_select_fn()
returns setof placestovisit
language plpgsql
as $check_select_fn$
declare
-- variable declaration
begin
	return query
	select * from placestovisit;
end; $check_select_fn$

select * from check_select_fn()

-- Returning selective columns based on an input parameter of a table 
create or replace function check_selective_fn(city_in integer)
returns table (place integer, city_place integer, tags character varying(100))
language plpgsql
as $check_selective_fn$
declare
-- variable declaration
begin
	return query
	select x.placeid, x.city,x.tags from placestovisit x where x.city = city_in;
end; $check_selective_fn$

select * from check_selective_fn(3)

--The following for creating a stored proc to enter hotel information
CREATE TABLE IF NOT EXISTS public.hotels
(
    hotelid integer NOT NULL,
    city integer,
    hotelname character varying(80) COLLATE pg_catalog."default",
    rating integer,
    pricerange character varying(15) COLLATE pg_catalog."default",
    latitude character varying(50) COLLATE pg_catalog."default",
    longitude character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT hotels_pkey PRIMARY KEY (hotelid),
    CONSTRAINT hotels_city_fkey FOREIGN KEY (city)
        REFERENCES public.cities (cityid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

-- Function
-- Returning all rows of a table based on some input or ALL
create or replace procedure insert_hotels(city_in varchar(40), rest_in varchar(80), priceRange_in varchar(15), lati varchar(50), longi  varchar(50))
language plpgsql
as $insert_hotels$
begin

WITH newID 
    AS 
      (
        SELECT MAX(hotelid) + 1 AS id 
          FROM hotels
      ), 
    newCityID 
    AS 
      (
        SELECT cityid AS cityToAdd 
          FROM cities 
          WHERE LOWER(cityname) = LOWER(city_in)
      ) 
    INSERT INTO hotels (hotelid, city, hotelname, pricerange, latitude, longitude) 
      SELECT newID.id, newCityID.cityToAdd, rest_in, priceRange_in, lati, longi FROM newID, newCityID;
	  
end; $insert_hotels$

select * from hotels
select * from cities

call insert_hotels('Fort Myers','Test Hotel 1121', '90-120$/Night', '45.89 N', '77.12345 W')
