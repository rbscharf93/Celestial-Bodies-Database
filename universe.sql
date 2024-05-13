--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(50) NOT NULL,
    type character varying(40),
    size_in_light_years integer,
    number_stars_in_millions integer,
    has_central_black_hole boolean
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
-- Name: life_form; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.life_form (
    life_form_id integer NOT NULL,
    name character varying(50),
    is_a_good_boy boolean NOT NULL
);


ALTER TABLE public.life_form OWNER TO freecodecamp;

--
-- Name: life_form_life_form_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.life_form_life_form_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.life_form_life_form_id_seq OWNER TO freecodecamp;

--
-- Name: life_form_life_form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.life_form_life_form_id_seq OWNED BY public.life_form.life_form_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    mass_scalar_kg numeric(3,2),
    mass_power_10_kg integer
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
    name character varying(50) NOT NULL,
    star_id integer,
    mass_scalar_kg numeric(3,2),
    mass_power_10_kg integer,
    description text,
    is_habitable boolean
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
-- Name: planets_life_forms; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planets_life_forms (
    planets_life_forms_id integer NOT NULL,
    planet_id integer NOT NULL,
    life_form_id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.planets_life_forms OWNER TO freecodecamp;

--
-- Name: planets_life_forms_planets_life_forms_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_life_forms_planets_life_forms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_life_forms_planets_life_forms_id_seq OWNER TO freecodecamp;

--
-- Name: planets_life_forms_planets_life_forms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_life_forms_planets_life_forms_id_seq OWNED BY public.planets_life_forms.planets_life_forms_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer,
    mass_scalar_kg numeric(3,2),
    mass_power_10_kg integer
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
-- Name: life_form life_form_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life_form ALTER COLUMN life_form_id SET DEFAULT nextval('public.life_form_life_form_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planets_life_forms planets_life_forms_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_life_forms ALTER COLUMN planets_life_forms_id SET DEFAULT nextval('public.planets_life_forms_planets_life_forms_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000, 100000, true);
INSERT INTO public.galaxy VALUES (2, 'Eaerad', 'Spiral', 100000, 100000, true);
INSERT INTO public.galaxy VALUES (3, 'Gadfeaas 2', 'Spiral', 100000, 100000, true);
INSERT INTO public.galaxy VALUES (4, 'Reasdges', 'Spiral', 100000, 100000, true);
INSERT INTO public.galaxy VALUES (5, 'Nahdfhes 3', 'Spiral', 100000, 100000, true);
INSERT INTO public.galaxy VALUES (6, 'X-Wing-Y', 'Spiral', 100000, 100000, false);


--
-- Data for Name: life_form; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.life_form VALUES (1, 'Human', false);
INSERT INTO public.life_form VALUES (3, 'Cat', false);
INSERT INTO public.life_form VALUES (2, 'Dog', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 7.35, 22);
INSERT INTO public.moon VALUES (2, 'Vread', 1, 7.35, 22);
INSERT INTO public.moon VALUES (3, 'Mread', 2, 7.35, 22);
INSERT INTO public.moon VALUES (4, 'Exceleres', 2, 7.35, 22);
INSERT INTO public.moon VALUES (5, 'Treadf 2', 3, 7.35, 22);
INSERT INTO public.moon VALUES (6, 'Vreadfadsf', 3, 7.35, 22);
INSERT INTO public.moon VALUES (7, 'Bbre', 3, 7.35, 22);
INSERT INTO public.moon VALUES (8, 'Deadfdss', 4, 7.35, 22);
INSERT INTO public.moon VALUES (9, 'Regegegegegeg', 4, 7.35, 22);
INSERT INTO public.moon VALUES (10, 'QQQQQQ', 5, 7.35, 22);
INSERT INTO public.moon VALUES (11, 'Vcedsd', 6, 7.35, 22);
INSERT INTO public.moon VALUES (12, 'Aadfsdf', 8, 7.35, 22);
INSERT INTO public.moon VALUES (13, 'Llolololl', 8, 7.35, 22);
INSERT INTO public.moon VALUES (14, 'Vrarabared', 10, 7.35, 22);
INSERT INTO public.moon VALUES (15, 'euuuttytyuutuytuuyt', 1, 7.35, 22);
INSERT INTO public.moon VALUES (16, 'Bradd', 10, 7.35, 22);
INSERT INTO public.moon VALUES (17, 'Vereead', 10, 7.35, 22);
INSERT INTO public.moon VALUES (18, 'Bnbneeeer', 10, 7.35, 22);
INSERT INTO public.moon VALUES (19, 'Vodka', 11, 7.35, 22);
INSERT INTO public.moon VALUES (20, 'Poooooo', 11, 7.35, 22);
INSERT INTO public.moon VALUES (21, 'Atlanta', 12, 7.35, 22);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 5.97, 24, 'A rocky planet covered mostly in water', true);
INSERT INTO public.planet VALUES (2, 'Afasdfew', 2, 5.97, 24, 'A rocky planet covered mostly in water', true);
INSERT INTO public.planet VALUES (3, 'EHdfadffe', 2, 5.97, 24, 'A rocky planet covered mostly in water', true);
INSERT INTO public.planet VALUES (4, 'Vasdfe', 3, 5.97, 24, 'A rocky planet covered mostly in water', true);
INSERT INTO public.planet VALUES (5, 'Vcdxfewefsdf 2', 4, 5.97, 24, 'A rocky planet covered mostly in water', true);
INSERT INTO public.planet VALUES (6, 'vasfeasdfa', 4, 5.97, 24, 'A rocky planet covered mostly in water', true);
INSERT INTO public.planet VALUES (7, 'Feasdfac', 4, 5.97, 24, 'A rocky planet covered mostly in water', true);
INSERT INTO public.planet VALUES (8, 'Vbheiafdf', 4, 5.97, 24, 'A rocky planet covered mostly in water', true);
INSERT INTO public.planet VALUES (9, 'Vajkdjdfkjd', 4, 5.97, 24, 'A rocky planet covered mostly in water', true);
INSERT INTO public.planet VALUES (10, 'Vijfasdfas', 4, 5.97, 24, 'A rocky planet covered mostly in water', true);
INSERT INTO public.planet VALUES (11, 'Ererererdsf III', 4, 5.97, 24, 'A rocky planet covered mostly in water', true);
INSERT INTO public.planet VALUES (12, 'Vroppefsdfsd', 5, 5.97, 24, 'A rocky planet covered mostly in water', true);
INSERT INTO public.planet VALUES (13, 'Chicago', 5, 5.97, 24, 'A rocky planet covered mostly in water', true);


--
-- Data for Name: planets_life_forms; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planets_life_forms VALUES (1, 1, 1, 'Human');
INSERT INTO public.planets_life_forms VALUES (2, 1, 2, 'Dog');
INSERT INTO public.planets_life_forms VALUES (3, 1, 3, 'Cat');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 1.99, 30);
INSERT INTO public.star VALUES (2, 'Zxcy', 2, 2.00, 30);
INSERT INTO public.star VALUES (3, 'Eferas', 2, 2.00, 29);
INSERT INTO public.star VALUES (4, 'Vreeasse', 3, 2.00, 28);
INSERT INTO public.star VALUES (5, 'Vreacx', 4, 2.00, 27);
INSERT INTO public.star VALUES (6, 'Detroit', 5, 2.00, 36);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: life_form_life_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.life_form_life_form_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planets_life_forms_planets_life_forms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_life_forms_planets_life_forms_id_seq', 3, true);


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
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: life_form life_form_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life_form
    ADD CONSTRAINT life_form_name_key UNIQUE (name);


--
-- Name: life_form life_form_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life_form
    ADD CONSTRAINT life_form_pkey PRIMARY KEY (life_form_id);


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
-- Name: planets_life_forms planets_life_forms_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_life_forms
    ADD CONSTRAINT planets_life_forms_name_key UNIQUE (name);


--
-- Name: planets_life_forms planets_life_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_life_forms
    ADD CONSTRAINT planets_life_forms_pkey PRIMARY KEY (planets_life_forms_id);


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
-- Name: planets_life_forms planets_life_forms_life_form_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_life_forms
    ADD CONSTRAINT planets_life_forms_life_form_id_fkey FOREIGN KEY (life_form_id) REFERENCES public.life_form(life_form_id);


--
-- Name: planets_life_forms planets_life_forms_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_life_forms
    ADD CONSTRAINT planets_life_forms_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

