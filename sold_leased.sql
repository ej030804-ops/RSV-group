--
-- PostgreSQL database dump
--

\restrict dW0qd2QWAuFjXdy1gwMsGWB9JQ8Goi7ZOPb31L58q8fjsN8RY3n7reHBiLWBuEQ

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-05-24 10:57:00

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
-- TOC entry 230 (class 1259 OID 27320)
-- Name: sold_leased; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sold_leased (
    id integer NOT NULL,
    area character varying(255) NOT NULL,
    locality character varying(255),
    type character varying(100) NOT NULL,
    size character varying(100) NOT NULL,
    price character varying(100),
    category character varying(100) NOT NULL,
    age character varying(50),
    status character varying(50) DEFAULT 'sold'::character varying,
    description text,
    represented character varying(255) DEFAULT 'RSV GROURS Represented Both Buyer & Sellers'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.sold_leased OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 27319)
-- Name: sold_leased_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sold_leased_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sold_leased_id_seq OWNER TO postgres;

--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 229
-- Name: sold_leased_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sold_leased_id_seq OWNED BY public.sold_leased.id;


--
-- TOC entry 4779 (class 2604 OID 27323)
-- Name: sold_leased id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sold_leased ALTER COLUMN id SET DEFAULT nextval('public.sold_leased_id_seq'::regclass);


--
-- TOC entry 4934 (class 0 OID 27320)
-- Dependencies: 230
-- Data for Name: sold_leased; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sold_leased (id, area, locality, type, size, price, category, age, status, description, represented, created_at, updated_at) FROM stdin;
1	Kundrathur rajagopal nagar	Kundrathur	Land	600 to 2400 sqft	\N	Land	\N	sold	RSV GROURS Represented Both Buyer & Sellers	RSV GROURS Represented Both Buyer & Sellers	2026-05-15 16:35:54.385153	2026-05-15 16:35:54.385153
2	Kundrathur arul jothi nagar	Kundrathur	Land	600 to 2400 sqft	\N	Land	\N	sold	RSV GROURS Represented Both Buyer & Sellers	RSV GROURS Represented Both Buyer & Sellers	2026-05-15 16:35:54.385153	2026-05-15 16:35:54.385153
3	Kundrathur kumaran nagar	Kundrathur	Land	600 to 2400 sqft	\N	Land	\N	sold	RSV GROURS Represented Both Buyer & Sellers	RSV GROURS Represented Both Buyer & Sellers	2026-05-15 16:35:54.385153	2026-05-15 16:35:54.385153
4	Astalakshmi nagar, 2nd Main road	Valasaravakkam	Land	3500 sqft	\N	Land	\N	sold	RSV GROURS Represented Both Buyer & Sellers	RSV GROURS Represented Both Buyer & Sellers	2026-05-15 16:35:54.385153	2026-05-15 16:35:54.385153
5	Astalakshmi nagar, 14th street	Valasaravakkam	Land	2400 sqft	\N	Land	\N	sold	RSV GROURS Represented Both Buyer & Sellers	RSV GROURS Represented Both Buyer & Sellers	2026-05-15 16:35:54.385153	2026-05-15 16:35:54.385153
6	Ramaswami Street	T.Nagar	Flat	1014 Sq.ft	Rs.1,44,00,000/-	Flat	\N	sold	Hanu Reddy Realty Represented Both Buyer & Seller	RSV GROURS Represented Both Buyer & Sellers	2026-05-15 16:35:54.385153	2026-05-15 16:35:54.385153
7	Sathyapuri Street	West Mambalam	House	2475 Sq.ft Land With 6BHK	Rs.5,80,00,000/-	House	\N	sold	Hanu Reddy Realty Represented Buyer	RSV GROURS Represented Both Buyer & Sellers	2026-05-15 16:35:54.385153	2026-05-15 16:35:54.385153
8	Vijaya Nagar North Extension	Velachery	Flat	800 Sq.ft	Rs.72,00,000/-	Flat	\N	sold	Hanu Reddy Realty Represented Seller	RSV GROURS Represented Both Buyer & Sellers	2026-05-15 16:35:54.385153	2026-05-15 16:35:54.385153
\.


--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 229
-- Name: sold_leased_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sold_leased_id_seq', 8, true);


--
-- TOC entry 4785 (class 2606 OID 27336)
-- Name: sold_leased sold_leased_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sold_leased
    ADD CONSTRAINT sold_leased_pkey PRIMARY KEY (id);


-- Completed on 2026-05-24 10:57:01

--
-- PostgreSQL database dump complete
--

\unrestrict dW0qd2QWAuFjXdy1gwMsGWB9JQ8Goi7ZOPb31L58q8fjsN8RY3n7reHBiLWBuEQ

