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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(32) NOT NULL,
    size_in_ly integer,
    apparent_brightness numeric(3,1),
    description text,
    is_visible boolean,
    is_active boolean,
    distance_in_mparsecs integer
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
    name character varying(32) NOT NULL,
    orbit_order integer,
    diameter integer,
    ecentricity numeric(5,4),
    description text,
    is_round boolean,
    is_locked boolean,
    planet_id integer
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
    name character varying(32) NOT NULL,
    orbit_order integer,
    mass_in_earths numeric(5,1),
    orbital_period integer,
    description text,
    has_water boolean,
    is_rocky boolean,
    star_id integer
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
-- Name: spacecraft; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spacecraft (
    spacecraft_id integer NOT NULL,
    name character varying(32) NOT NULL,
    planet_of_origin integer,
    is_interstellar boolean
);


ALTER TABLE public.spacecraft OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spacecraft_spacecraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spacecraft_spacecraft_id_seq OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spacecraft_spacecraft_id_seq OWNED BY public.spacecraft.spacecraft_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(32) NOT NULL,
    mass_in_sm integer,
    temperature_in_k integer,
    apparent_brightness numeric(3,1),
    description text,
    is_binary boolean,
    is_variable boolean
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
-- Name: spacecraft spacecraft_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft ALTER COLUMN spacecraft_id SET DEFAULT nextval('public.spacecraft_spacecraft_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 152000, 3.4, 'Nearest Galaxy', true, false, 1);
INSERT INTO public.galaxy VALUES (2, 'Bode', 96000, 6.9, NULL, false, false, 4);
INSERT INTO public.galaxy VALUES (3, 'Cigar', 41000, 8.4, 'Looks like a cigar.', false, false, 4);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel', 252000, 7.9, 'Looks like a pinwheel.', false, false, 7);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 77000, 8.1, 'Looks like a swirl.', false, false, 7);
INSERT INTO public.galaxy VALUES (6, 'NGC 2903', 88000, 12.0, NULL, false, true, 12);
INSERT INTO public.galaxy VALUES (7, 'Milkyway', 143000, 7.0, NULL, false, false, 0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, 0.0549, 'Earth''s only natural satellite', true, true, 27);
INSERT INTO public.moon VALUES (2, 'Phobos', 1, 22, 0.0151, 'Closer moon of Mars, orbits rapidly', false, true, 28);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, 0.0002, 'Smaller and more distant Mars moon', false, true, 28);
INSERT INTO public.moon VALUES (4, 'Io', 1, 3643, 0.0041, 'Most volcanically active body in solar system', true, true, 29);
INSERT INTO public.moon VALUES (5, 'Europa', 2, 3122, 0.0101, 'Subsurface ocean, potential for life', true, true, 29);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 5268, 0.0013, 'Largest moon in solar system', true, true, 29);
INSERT INTO public.moon VALUES (7, 'Callisto', 4, 4821, 0.0074, 'Heavily cratered, ancient surface', true, true, 29);
INSERT INTO public.moon VALUES (8, 'Titan', 1, 5150, 0.0288, 'Thick atmosphere, methane lakes', true, true, 30);
INSERT INTO public.moon VALUES (9, 'Triton', 1, 2707, 0.0000, 'Retrograde orbit, geysers of nitrogen', true, true, 32);
INSERT INTO public.moon VALUES (10, 'Luna-1', 1, 3200, 0.0032, 'Large habitable moon', true, true, 33);
INSERT INTO public.moon VALUES (11, 'Luna-2', 2, 2800, 0.0021, 'Second moon of AE-4933', true, true, 33);
INSERT INTO public.moon VALUES (12, 'Luna-3', 3, 1500, 0.0150, 'Smaller outer moon', false, true, 33);
INSERT INTO public.moon VALUES (13, 'Alpha', 1, 4500, 0.0015, 'Major moon with atmosphere', true, true, 34);
INSERT INTO public.moon VALUES (14, 'Beta', 2, 1200, 0.0250, 'Irregular captured asteroid', false, true, 34);
INSERT INTO public.moon VALUES (15, 'Gamma', 3, 800, 0.0450, 'Highly eccentric orbit', false, false, 34);
INSERT INTO public.moon VALUES (16, 'Hope', 1, 3800, 0.0050, 'Terraformed moon with water', true, true, 35);
INSERT INTO public.moon VALUES (17, 'Faith', 2, 2100, 0.0080, 'Rocky desert moon', true, true, 35);
INSERT INTO public.moon VALUES (18, 'Charity', 3, 950, 0.0120, 'Ice-covered moon', true, true, 35);
INSERT INTO public.moon VALUES (19, 'Patience', 4, 450, 0.0350, 'Small irregular moon', false, true, 35);
INSERT INTO public.moon VALUES (20, 'Valor', 5, 620, 0.0220, 'Volcanic moon with active plumes', false, false, 35);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (25, 'Mercury', 1, 0.1, 88, NULL, false, true, 6);
INSERT INTO public.planet VALUES (26, 'Venus', 2, 0.8, 224, NULL, false, true, 6);
INSERT INTO public.planet VALUES (27, 'Earth', 3, 1.0, 365, NULL, true, true, 6);
INSERT INTO public.planet VALUES (28, 'Mars', 4, 0.1, 687, NULL, false, true, 6);
INSERT INTO public.planet VALUES (29, 'Jupiter', 5, 317.8, 4333, NULL, false, false, 6);
INSERT INTO public.planet VALUES (30, 'Saturn', 6, 95.2, 10759, NULL, false, false, 6);
INSERT INTO public.planet VALUES (31, 'Uranus', 7, 14.5, 30687, NULL, false, false, 6);
INSERT INTO public.planet VALUES (32, 'Neptune', 8, 17.1, 60190, NULL, false, false, 6);
INSERT INTO public.planet VALUES (33, 'AE-4933', 5, 2.2, 104, 'Mock Data', false, true, 2);
INSERT INTO public.planet VALUES (34, 'AE-1344', 1, 1.2, 12, NULL, false, true, 1);
INSERT INTO public.planet VALUES (35, 'Pandora', 2, 1.6, 401, NULL, true, true, 5);
INSERT INTO public.planet VALUES (36, 'Krypton', 1, 3.3, 340, 'Super Planet', true, true, 3);


--
-- Data for Name: spacecraft; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spacecraft VALUES (1, 'Voyager II', 27, true);
INSERT INTO public.spacecraft VALUES (2, 'Voyager I', 27, true);
INSERT INTO public.spacecraft VALUES (3, 'Cassini', 27, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 7, 'Sirius', 2, 9940, -1.5, 'Brightest star in the night sky', false, false);
INSERT INTO public.star VALUES (2, 7, 'Betelgeuse', 20, 3500, 0.5, 'Red supergiant, expected to go supernova', false, true);
INSERT INTO public.star VALUES (3, 7, 'Vega', 2, 9600, 0.0, 'Used as reference star for brightness', false, false);
INSERT INTO public.star VALUES (4, 7, 'Proxima Centauri', 0, 3000, 11.0, 'Closest star to the Sun', false, true);
INSERT INTO public.star VALUES (5, 7, 'Polaris', 5, 6000, 2.0, 'North Star, used for navigation', true, true);
INSERT INTO public.star VALUES (6, 7, 'Sun', 1, 5800, -26.7, 'Our star.', false, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 36, true);


--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spacecraft_spacecraft_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: spacecraft spacecraft_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_name_key UNIQUE (name);


--
-- Name: spacecraft spacecraft_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_pkey PRIMARY KEY (spacecraft_id);


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

