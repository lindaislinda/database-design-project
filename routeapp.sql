--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cansatisfy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cansatisfy (
    placeid integer NOT NULL,
    interestid integer NOT NULL
);


ALTER TABLE public.cansatisfy OWNER TO postgres;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    cityid integer NOT NULL,
    cityname character varying(40) NOT NULL,
    state character(2) NOT NULL,
    latitude character varying(50),
    longitude character varying(50)
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: dayplan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dayplan (
    dayid integer NOT NULL,
    tripid integer,
    daynumber integer,
    morningplaceid integer,
    afternoonplaceid integer,
    nightplaceid integer,
    breakfastrestaurantid integer NOT NULL,
    lunchrestaurantid integer NOT NULL,
    dinnerrestaurantid integer NOT NULL,
    hotelid integer,
    notes text
);


ALTER TABLE public.dayplan OWNER TO postgres;

--
-- Name: food; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food (
    foodid integer NOT NULL,
    foodname character varying(30)
);


ALTER TABLE public.food OWNER TO postgres;

--
-- Name: foodpreferences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.foodpreferences (
    userid integer NOT NULL,
    foodid integer NOT NULL
);


ALTER TABLE public.foodpreferences OWNER TO postgres;

--
-- Name: hotels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotels (
    hotelid integer NOT NULL,
    city integer,
    hotelname character varying(80),
    rating integer,
    pricerange character varying(15),
    latitude character varying(50),
    longitude character varying(50)
);


ALTER TABLE public.hotels OWNER TO postgres;

--
-- Name: interests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interests (
    interestid integer NOT NULL,
    interestname character varying(20)
);


ALTER TABLE public.interests OWNER TO postgres;

--
-- Name: placestovisit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.placestovisit (
    placeid integer NOT NULL,
    city integer,
    placename character varying(80),
    tags character varying(100),
    latitude character varying(50),
    longitude character varying(50)
);


ALTER TABLE public.placestovisit OWNER TO postgres;

--
-- Name: restaurants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurants (
    restaurantid integer NOT NULL,
    city integer,
    restaurantname character varying(80),
    cuisinetype character varying(20),
    mealtype character varying(20),
    latitude character varying(50),
    longitude character varying(50)
);


ALTER TABLE public.restaurants OWNER TO postgres;

--
-- Name: userpreferences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userpreferences (
    userid integer NOT NULL,
    interestid integer NOT NULL
);


ALTER TABLE public.userpreferences OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    userid integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(80) NOT NULL,
    password character varying(80)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: usertrips; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usertrips (
    tripid integer NOT NULL,
    userid integer,
    startingcity integer NOT NULL,
    endingcity integer NOT NULL,
    notes text,
    numberofdays integer
);


ALTER TABLE public.usertrips OWNER TO postgres;

--
-- Data for Name: cansatisfy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cansatisfy (placeid, interestid) FROM stdin;
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (cityid, cityname, state, latitude, longitude) FROM stdin;
1	Tampa	FL	27.94752	-82.45843
2	Miami	FL	25.77427	-80.19366
3	Orlando	FL	28.538336	-81.379234
4	Tallahassee	FL	30.455000	-84.253334
5	Sarasota	FL	27.341274	-82.528267
6	St. Petersburg	FL	27.773056	-82.639999
7	Cocoa Beach	FL	28.320007	-80.607552
8	Key West	FL	24.555059	-81.779984
9	St. Augustine	FL	29.901243	-81.312431
10	Jacksonville	FL	30.332184	-81.655647
11	Fort Myers	FL	26.640629	-81.872307
12	Naples	FL	26.177624	-81.806946
\.


--
-- Data for Name: dayplan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dayplan (dayid, tripid, daynumber, morningplaceid, afternoonplaceid, nightplaceid, breakfastrestaurantid, lunchrestaurantid, dinnerrestaurantid, hotelid, notes) FROM stdin;
\.


--
-- Data for Name: food; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food (foodid, foodname) FROM stdin;
1	chinese
2	japanese
3	italian
4	american
5	indian
6	mexican
7	pizza
9	bars
8	mediterranean
10	korean
11	thai
12	russian
\.


--
-- Data for Name: foodpreferences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.foodpreferences (userid, foodid) FROM stdin;
\.


--
-- Data for Name: hotels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hotels (hotelid, city, hotelname, rating, pricerange, latitude, longitude) FROM stdin;
\.


--
-- Data for Name: interests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interests (interestid, interestname) FROM stdin;
1	hiking
2	fishing
3	sports
4	history
5	museums
6	swimming
7	sightseeing
8	biking
9	nightlife
10	fine dining
11	skiing
12	shopping
13	culture
14	holes-in-the-walls
\.


--
-- Data for Name: placestovisit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.placestovisit (placeid, city, placename, tags, latitude, longitude) FROM stdin;
1	1	Riverwalk	Walkable, Family, Anytime	\N	\N
2	1	MOSI	Family, Daytime, Science, Interactive	\N	\N
3	6	St. Petersburg Pier	Family, Anytime, Bars, View	\N	\N
4	1	USF	Walk, Daytime, Events, Food	\N	\N
5	1	Hyde Park	Walk, Anytime, Food	\N	\N
6	2	Miami Beach	Walk, Daytrip, Daytime, Family, Ocean	\N	\N
7	9	Castillo de San Marcos	Daytime, Family, Historical	\N	\N
8	9	Fountain of Youth	Daytime, Family, Historical, Premium	\N	\N
9	9	St. Augustine Beach	Daytime, Family, Ocean, Daytrip	\N	\N
10	3	Magic Kingdom	Daytime, Family, Daytrip, Premium, Disney	\N	\N
11	3	Epcot	Daytime, Family, Daytrip, Premium, Disney, Culture	\N	\N
12	3	Animal Kingdom	Daytime, Family, Daytrip, Premium, Disney, Animals	\N	\N
13	3	Hollywood Studios	Daytime, Family, Daytrip, Premium, Disney	\N	\N
14	3	Disney Springs	Anytime, Family, Disney, Shopping	\N	\N
\.


--
-- Data for Name: restaurants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restaurants (restaurantid, city, restaurantname, cuisinetype, mealtype, latitude, longitude) FROM stdin;
\.


--
-- Data for Name: userpreferences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.userpreferences (userid, interestid) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (userid, username, email, password) FROM stdin;
\.


--
-- Data for Name: usertrips; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usertrips (tripid, userid, startingcity, endingcity, notes, numberofdays) FROM stdin;
\.


--
-- Name: cansatisfy cansatisfy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cansatisfy
    ADD CONSTRAINT cansatisfy_pkey PRIMARY KEY (placeid, interestid);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (cityid);


--
-- Name: dayplan dayplan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dayplan
    ADD CONSTRAINT dayplan_pkey PRIMARY KEY (dayid);


--
-- Name: food food_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food
    ADD CONSTRAINT food_pkey PRIMARY KEY (foodid);


--
-- Name: foodpreferences foodpreferences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foodpreferences
    ADD CONSTRAINT foodpreferences_pkey PRIMARY KEY (userid, foodid);


--
-- Name: hotels hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (hotelid);


--
-- Name: interests interests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interests
    ADD CONSTRAINT interests_pkey PRIMARY KEY (interestid);


--
-- Name: placestovisit placestovisit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.placestovisit
    ADD CONSTRAINT placestovisit_pkey PRIMARY KEY (placeid);


--
-- Name: restaurants restaurants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (restaurantid);


--
-- Name: userpreferences userpreferences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userpreferences
    ADD CONSTRAINT userpreferences_pkey PRIMARY KEY (userid, interestid);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: usertrips usertrips_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usertrips
    ADD CONSTRAINT usertrips_pkey PRIMARY KEY (tripid);


--
-- Name: cansatisfy cansatisfy_interestid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cansatisfy
    ADD CONSTRAINT cansatisfy_interestid_fkey FOREIGN KEY (interestid) REFERENCES public.interests(interestid);


--
-- Name: cansatisfy cansatisfy_placeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cansatisfy
    ADD CONSTRAINT cansatisfy_placeid_fkey FOREIGN KEY (placeid) REFERENCES public.placestovisit(placeid);


--
-- Name: dayplan dayplan_afternoonplaceid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dayplan
    ADD CONSTRAINT dayplan_afternoonplaceid_fkey FOREIGN KEY (afternoonplaceid) REFERENCES public.placestovisit(placeid);


--
-- Name: dayplan dayplan_breakfastrestaurantid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dayplan
    ADD CONSTRAINT dayplan_breakfastrestaurantid_fkey FOREIGN KEY (breakfastrestaurantid) REFERENCES public.restaurants(restaurantid);


--
-- Name: dayplan dayplan_dinnerrestaurantid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dayplan
    ADD CONSTRAINT dayplan_dinnerrestaurantid_fkey FOREIGN KEY (dinnerrestaurantid) REFERENCES public.restaurants(restaurantid);


--
-- Name: dayplan dayplan_hotelid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dayplan
    ADD CONSTRAINT dayplan_hotelid_fkey FOREIGN KEY (hotelid) REFERENCES public.hotels(hotelid);


--
-- Name: dayplan dayplan_lunchrestaurantid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dayplan
    ADD CONSTRAINT dayplan_lunchrestaurantid_fkey FOREIGN KEY (lunchrestaurantid) REFERENCES public.restaurants(restaurantid);


--
-- Name: dayplan dayplan_morningplaceid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dayplan
    ADD CONSTRAINT dayplan_morningplaceid_fkey FOREIGN KEY (morningplaceid) REFERENCES public.placestovisit(placeid);


--
-- Name: dayplan dayplan_nightplaceid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dayplan
    ADD CONSTRAINT dayplan_nightplaceid_fkey FOREIGN KEY (nightplaceid) REFERENCES public.placestovisit(placeid);


--
-- Name: dayplan dayplan_tripid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dayplan
    ADD CONSTRAINT dayplan_tripid_fkey FOREIGN KEY (tripid) REFERENCES public.usertrips(tripid);


--
-- Name: foodpreferences foodpreferences_foodid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foodpreferences
    ADD CONSTRAINT foodpreferences_foodid_fkey FOREIGN KEY (foodid) REFERENCES public.food(foodid);


--
-- Name: foodpreferences foodpreferences_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foodpreferences
    ADD CONSTRAINT foodpreferences_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- Name: hotels hotels_city_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_city_fkey FOREIGN KEY (city) REFERENCES public.cities(cityid);


--
-- Name: placestovisit placestovisit_city_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.placestovisit
    ADD CONSTRAINT placestovisit_city_fkey FOREIGN KEY (city) REFERENCES public.cities(cityid);


--
-- Name: restaurants restaurants_city_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_city_fkey FOREIGN KEY (city) REFERENCES public.cities(cityid);


--
-- Name: userpreferences userpreferences_interestid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userpreferences
    ADD CONSTRAINT userpreferences_interestid_fkey FOREIGN KEY (interestid) REFERENCES public.interests(interestid);


--
-- Name: userpreferences userpreferences_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userpreferences
    ADD CONSTRAINT userpreferences_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- Name: usertrips usertrips_endingcity_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usertrips
    ADD CONSTRAINT usertrips_endingcity_fkey FOREIGN KEY (endingcity) REFERENCES public.cities(cityid);


--
-- Name: usertrips usertrips_startingcity_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usertrips
    ADD CONSTRAINT usertrips_startingcity_fkey FOREIGN KEY (startingcity) REFERENCES public.cities(cityid);


--
-- Name: usertrips usertrips_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usertrips
    ADD CONSTRAINT usertrips_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- PostgreSQL database dump complete
--

