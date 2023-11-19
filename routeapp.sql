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
    mealtype character varying(20),
    latitude character varying(50),
    longitude character varying(50),
    cuisinetype integer
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

COPY public.restaurants (restaurantid, city, restaurantname, mealtype, latitude, longitude, cuisinetype) FROM stdin;
1	1	Yummy House	Lunch, Dinner	\N	\N	1
2	2	Dumpling King	Lunch, Dinner	\N	\N	1
3	3	China Tea	Lunch, Dinner	\N	\N	1
4	4	Ming Tree Chinese Restaurant	Lunch, Dinner	\N	\N	1
5	5	Asian Kitchen Chinese Restaurant	Lunch, Dinner	\N	\N	1
6	6	Ha Long Bay	Lunch, Dinner	\N	\N	1
7	7	Kim Bo Chinese Restaurant	Lunch, Dinner	\N	\N	1
8	8	Sister Noodle House	Lunch, Dinner	\N	\N	1
9	9	Green Tea Chinese Restaurant	Brunch, Dinner	\N	\N	1
10	10	Timwah Dim Sum Restaurant	Brunch, Lunch	\N	\N	1
11	11	Ginger Bistro	Lunch, Dinner	\N	\N	1
12	12	Golden Leaf	Lunch, Dinner	\N	\N	1
13	1	Chanko	Lunch, Dinner	\N	\N	2
14	2	Makoto	Lunch, Dinner	\N	\N	2
15	3	Sushi Katana	Lunch, Dinner	\N	\N	2
16	4	Sakura Sushi & Grill	Lunch, Dinner	\N	\N	2
17	5	Tsunami Sushi & Hibachi	Lunch, Dinner	\N	\N	2
18	6	The Lure	Lunch, Dinner	\N	\N	2
19	7	Siam Orchid	Lunch, Dinner	\N	\N	2
20	8	Benihana Key West	Lunch, Dinner	\N	\N	2
21	9	Corner-Sushi	Lunch, Dinner	\N	\N	2
22	10	Sake House	Lunch, Dinner	\N	\N	2
23	11	Rockn Sushi Asian Bistro	Lunch, Dinner	\N	\N	2
24	12	Hibachi of Japan II	Lunch, Dinner	\N	\N	2
25	1	Donatello Italian Restaurant	Lunch, Dinner	\N	\N	3
26	2	Crust	Lunch, Dinner	\N	\N	3
27	3	Maggianos Little Italy	Lunch, Dinner	\N	\N	3
28	4	Tour of Italy Italian Kitchen	Lunch, Dinner	\N	\N	3
29	5	Cafe Gibbiano	Lunch, Dinner	\N	\N	3
30	6	Gratzzi Italian Grill	Lunch, Dinner	\N	\N	3
31	7	Branos Italian Grill	Lunch, Dinner	\N	\N	3
32	8	New York Pasta Garden	Lunch, Dinner	\N	\N	3
33	9	La Strada Italian Kitchen	Lunch, Dinner	\N	\N	3
34	10	Taverna	Lunch, Dinner	\N	\N	3
35	11	Osteria Celli	Lunch, Dinner	\N	\N	3
36	12	Caffe Milano	Lunch, Dinner	\N	\N	3
37	1	Millers Ale House	Lunch, Dinner	\N	\N	4
38	2	Grails Miami	Lunch, Dinner	\N	\N	4
39	3	Ocean Prime	Lunch, Dinner	\N	\N	4
40	4	Kool Beanz Cafe	Lunch, Dinner	\N	\N	4
41	5	Shore	Lunch, Dinner	\N	\N	4
42	6	Harold Seltzers Steakhouse	Lunch, Dinner	\N	\N	4
43	7	Sandbar Sports Grill	Lunch, Dinner	\N	\N	4
44	8	Blue Heaven	Lunch, Dinner	\N	\N	4
45	9	Forgotten Tunic	Lunch, Dinner	\N	\N	4
46	10	Restaurant Orsay	Lunch, Dinner	\N	\N	4
47	11	KJs Steakhouse	Lunch, Dinner	\N	\N	4
48	12	Tommy Bahama Restaurant	Lunch, Dinner	\N	\N	4
49	1	Zekos Mediterranean Grill	Lunch, Dinner	\N	\N	8
50	2	Strawberry Moon	Lunch, Dinner	\N	\N	8
51	3	Kosher Grill	Lunch, Dinner	\N	\N	8
52	4	Sahara Greek Lebanese	Lunch, Dinner	\N	\N	8
53	5	Blue Kouzina	Lunch, Dinner	\N	\N	8
54	6	Mios Grill and Cafe	Lunch, Dinner	\N	\N	8
55	7	Pita Paradise	Lunch, Dinner	\N	\N	8
56	8	Salute! On the Beach	Lunch, Dinner	\N	\N	8
57	9	Gaufres and Goods	Lunch, Dinner	\N	\N	8
58	10	Mandaloun	Lunch, Dinner	\N	\N	8
59	11	Nomikis Plakka Greek Restaurant	Lunch, Dinner	\N	\N	8
60	12	Mediterrano	Lunch, Dinner	\N	\N	8
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
-- Name: restaurants restaurants_cuisinetype_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_cuisinetype_fkey FOREIGN KEY (cuisinetype) REFERENCES public.food(foodid);


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

