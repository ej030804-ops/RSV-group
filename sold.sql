--
-- PostgreSQL database dump
--

\restrict nPt7Yi5vVh6XAYIbRO83Xe4qZb5DifXLB96RWK5c2Ne5QW4QMNKXEMSIOqke72p

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-05-24 10:58:22

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
-- TOC entry 232 (class 1259 OID 27339)
-- Name: sold; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sold (
    id integer NOT NULL,
    property_title text NOT NULL,
    location text NOT NULL,
    price text,
    size text,
    property_type text DEFAULT 'Land'::text,
    represented text DEFAULT 'Both Buyer & Sellers'::text,
    status text DEFAULT 'Sold Out'::text,
    customer_name text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sold OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 27338)
-- Name: sold_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sold_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sold_id_seq OWNER TO postgres;

--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 231
-- Name: sold_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sold_id_seq OWNED BY public.sold.id;


--
-- TOC entry 4779 (class 2604 OID 27342)
-- Name: sold id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sold ALTER COLUMN id SET DEFAULT nextval('public.sold_id_seq'::regclass);


--
-- TOC entry 4934 (class 0 OID 27339)
-- Dependencies: 232
-- Data for Name: sold; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sold (id, property_title, location, price, size, property_type, represented, status, customer_name, created_at) FROM stdin;
1	Land in Kundrathur Rajagopal Nagar	Kundrathur Rajagopal Nagar, Chennai	\N	600 sqft to 2400 sqft	Land	Both Buyer & Sellers	Sold Out	RSV Groups	2026-05-17 22:50:06.931382+05:30
2	2BHK Flat at VGK Sri Sai Gurusthan	Kannan Nagar Main Road, Chromepet	\N	936 Sq.ft	Flat	Both Buyer & Sellers	Sold Out	Surrya R K, Jenniffer Ferdinands	2026-05-17 22:50:06.931382+05:30
3	3BHK Flat at 7th Main Road	Anna Nagar, Chennai	\N	1402 Sq.ft	Flat	Both Buyer & Sellers	Sold Out	Jagadeesan M, Gowsalya	2026-05-17 22:50:06.931382+05:30
4	3BHK Brand New Flat at Appaswamy Altezza	Kadanchavadi, OMR	Rs.3,23,00,000/-	2108 Sq.ft	Flat	Both Buyer & Sellers	Sold Out	Srinivasan V G, Jagadeesan M, Sudhakar S, Gowsalya	2026-05-17 22:50:06.931382+05:30
\.


--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 231
-- Name: sold_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sold_id_seq', 4, true);


--
-- TOC entry 4785 (class 2606 OID 27353)
-- Name: sold sold_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sold
    ADD CONSTRAINT sold_pkey PRIMARY KEY (id);


-- Completed on 2026-05-24 10:58:22

--
-- PostgreSQL database dump complete
--

\unrestrict nPt7Yi5vVh6XAYIbRO83Xe4qZb5DifXLB96RWK5c2Ne5QW4QMNKXEMSIOqke72p

