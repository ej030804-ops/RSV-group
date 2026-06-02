--
-- PostgreSQL database dump
--

\restrict 8M9TMb9e3zjX6unu7yr5pVx0P7cEzXcj4WVHiHPy1o5JlWBzuj0OxeZvfsqkrFb

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-05-24 11:32:32

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 228 (class 1259 OID 27258)
-- Name: sold_properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sold_properties (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    location character varying(255),
    sqft character varying(100),
    price character varying(100),
    type character varying(50) DEFAULT 'land'::character varying,
    represented character varying(255),
    customer_name character varying(255),
    status character varying(50) DEFAULT 'approved'::character varying,
    image_url text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT sold_properties_status_check CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'approved'::character varying, 'rejected'::character varying])::text[]))),
    CONSTRAINT sold_properties_type_check CHECK (((type)::text = ANY ((ARRAY['land'::character varying, 'house'::character varying, 'flat'::character varying])::text[])))
);


ALTER TABLE public.sold_properties OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 27257)
-- Name: sold_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sold_properties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sold_properties_id_seq OWNER TO postgres;

--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 227
-- Name: sold_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sold_properties_id_seq OWNED BY public.sold_properties.id;


--
-- TOC entry 4779 (class 2604 OID 27261)
-- Name: sold_properties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sold_properties ALTER COLUMN id SET DEFAULT nextval('public.sold_properties_id_seq'::regclass);


--
-- TOC entry 4935 (class 0 OID 27258)
-- Dependencies: 228
-- Data for Name: sold_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sold_properties (id, title, location, sqft, price, type, represented, customer_name, status, image_url, created_at) FROM stdin;
1	Land in Kundrathur Rajagopal Nagar	Kundrathur Rajagopal Nagar, Chennai	600 sqft to 2400 sqft	Market Rate	land	Both Buyer & Sellers	Multiple Clients	approved	\N	2026-05-15 10:51:33.635213
2	Land in Kundrathur Arul Jothi Nagar	Kundrathur Arul Jothi Nagar, Chennai	600 sqft to 2400 sqft	Market Rate	land	Both Buyer & Sellers	Multiple Clients	approved	\N	2026-05-15 10:51:33.635213
3	Land in Valasaravakkam Astalakshmi Nagar	Valasaravakkam Astalakshmi Nagar, Chennai	3500 sqft	Market Rate	land	Both Buyer & Sellers	Private Client	approved	\N	2026-05-15 10:51:33.635213
4	Premium House in Adyar	Adyar, Chennai	2500 sqft	₹2.5Cr	house	Seller	Mr. Kumar	approved	\N	2026-05-15 10:51:33.635213
5	Luxury Flat in OMR	OMR, Chennai	1800 sqft	₹1.8Cr	flat	Buyer	Mrs. Priya	pending	\N	2026-05-15 10:51:33.635213
\.


--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 227
-- Name: sold_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sold_properties_id_seq', 5, true);


--
-- TOC entry 4786 (class 2606 OID 27272)
-- Name: sold_properties sold_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sold_properties
    ADD CONSTRAINT sold_properties_pkey PRIMARY KEY (id);


-- Completed on 2026-05-24 11:32:32

--
-- PostgreSQL database dump complete
--

\unrestrict 8M9TMb9e3zjX6unu7yr5pVx0P7cEzXcj4WVHiHPy1o5JlWBzuj0OxeZvfsqkrFb

