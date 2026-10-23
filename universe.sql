--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying,
    has_shown_activity boolean NOT NULL,
    has_moons boolean NOT NULL,
    asteroid_composition character varying
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying,
    galaxy_type character varying NOT NULL,
    features text,
    has_active_nucleus boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying,
    planet_id integer,
    orbital_period_in_days numeric NOT NULL,
    moon_composition character varying NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying,
    star_id integer,
    planet_temperature integer NOT NULL,
    planet_type character varying NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying,
    galaxy_id integer,
    age_in_millions_of_years integer NOT NULL,
    star_color character varying NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Bennu', true, false, 'C-type: carbon-rich, with hydrated minerals and organic compounds');
INSERT INTO public.asteroid VALUES (2, 'Ida', false, true, 'S-TYPE: stony, silicates and nickel-iron');
INSERT INTO public.asteroid VALUES (3, 'Psyche', false, false, 'M-type: metallic, mostly nickel-iron');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred spiral', 'Our home galaxy, about 100,000 light-years across, with a central bar and roughly 100-400 billion stars', false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Nearest large galaxy, about 2.5 million light-years away, on course to merge with the Milky Way', false);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'Irregular', 'Satellite of the Milky Way, gas-rich, with the Tarantula Nebula', false);
INSERT INTO public.galaxy VALUES (4, 'M87', 'Elliptical', 'Giant galaxy at the center of the Virgo Cluster, with a huge jet and a supermassive black hole', true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy (M51)', 'Spiral', 'Face-on spiral interacting with a smaller companion, with a Seyfert-type nucleus', true);
INSERT INTO public.galaxy VALUES (6, 'NGC 1300', 'Barred Spiral', 'Textbook example of a barred spiral with a prominent central bar', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 15, 27.3, 'Rock and metal');
INSERT INTO public.moon VALUES (2, 'Phobos', 16, 0.32, 'Carbon-rich rock');
INSERT INTO public.moon VALUES (3, 'Deimos', 16, 1.26, 'Carbon-rich rock');
INSERT INTO public.moon VALUES (4, 'Io', 17, 1.77, 'Silicate rock, sulfur compounds');
INSERT INTO public.moon VALUES (5, 'Europa', 17, 3.55, 'Rock with water-ice shell');
INSERT INTO public.moon VALUES (6, 'Ganymede', 17, 7.15, 'Rock and water ice');
INSERT INTO public.moon VALUES (7, 'Callisto', 17, 16.69, 'Ice and rock');
INSERT INTO public.moon VALUES (8, 'Mimas', 18, 0.94, 'Mostly water ice');
INSERT INTO public.moon VALUES (9, 'Enceladus', 18, 1.37, 'Water ice');
INSERT INTO public.moon VALUES (10, 'Tethys', 18, 1.89, 'Almost pure water ice');
INSERT INTO public.moon VALUES (11, 'Dione', 18, 2.74, 'Water ice and rock');
INSERT INTO public.moon VALUES (12, 'Rhea', 18, 4.52, 'Water ice with some rock');
INSERT INTO public.moon VALUES (13, 'Titan', 18, 15.95, 'Ice and rock, nitrogen atmosphere');
INSERT INTO public.moon VALUES (14, 'Iapetus', 18, 79.3, 'Water ice with dark material');
INSERT INTO public.moon VALUES (15, 'Miranda', 19, 1.41, 'Ice and rock');
INSERT INTO public.moon VALUES (16, 'Ariel', 19, 2.52, 'Ice and rock');
INSERT INTO public.moon VALUES (17, 'Umbriel', 19, 4.14, 'Ice and rock, dark surface');
INSERT INTO public.moon VALUES (18, 'Titania', 19, 8.71, 'Ice and rock');
INSERT INTO public.moon VALUES (19, 'Oberon', 19, 13.46, 'Ice and rock');
INSERT INTO public.moon VALUES (20, 'Triton', 20, 5.88, 'Nitrogen ice, water ice, rock');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Mercury', 1, 167, 'Terrestrial');
INSERT INTO public.planet VALUES (14, 'Venus', 1, 464, 'Terrestrial');
INSERT INTO public.planet VALUES (15, 'Earth', 1, 15, 'Terrestrial');
INSERT INTO public.planet VALUES (16, 'Mars', 1, -65, 'Terrestrial');
INSERT INTO public.planet VALUES (17, 'Jupiter', 1, -110, 'Gas Giant');
INSERT INTO public.planet VALUES (18, 'Saturn', 1, -140, 'Gas Giant');
INSERT INTO public.planet VALUES (19, 'Uranus', 1, -195, 'Ice Giant');
INSERT INTO public.planet VALUES (20, 'Neptune', 1, -200, 'Ice Giant');
INSERT INTO public.planet VALUES (21, 'Proxima B', 2, -39, 'Terrestrial');
INSERT INTO public.planet VALUES (22, 'TRAPPIST-1e', 3, -22, 'Terrestrial');
INSERT INTO public.planet VALUES (23, 'Kepler-186f', 4, -85, 'Terrestrial');
INSERT INTO public.planet VALUES (24, '51 Pegasi b', 5, 930, 'Hot Jupiter');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 'Yellow-white');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4850, 'Red');
INSERT INTO public.star VALUES (3, 'TRAPPIST-1', 1, 7600, 'Red');
INSERT INTO public.star VALUES (4, 'Kepler-186', 1, 4000, 'Red-orange');
INSERT INTO public.star VALUES (5, '51 Pegasi', 1, 4800, 'Yellow');
INSERT INTO public.star VALUES (6, 'R136a1', 3, 1, 'Blue');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

