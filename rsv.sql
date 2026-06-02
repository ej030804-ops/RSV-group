--
-- PostgreSQL database dump
--

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-05-25 16:39:38

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
-- TOC entry 219 (class 1259 OID 26943)
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    id integer NOT NULL,
    username character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 26950)
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admins_id_seq OWNER TO postgres;

--
-- TOC entry 5099 (class 0 OID 0)
-- Dependencies: 220
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- TOC entry 225 (class 1259 OID 26989)
-- Name: leads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.leads (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    phone character varying(20) NOT NULL,
    email character varying(255),
    interest_region character varying(100),
    budget character varying(100),
    source character varying(50),
    status character varying(50) DEFAULT 'New'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT leads_status_check CHECK (((status)::text = ANY (ARRAY['New'::text, 'Contacted'::text, 'Qualified'::text, 'Closed'::text])))
);


ALTER TABLE public.leads OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 27000)
-- Name: leads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.leads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.leads_id_seq OWNER TO postgres;

--
-- TOC entry 5100 (class 0 OID 0)
-- Dependencies: 226
-- Name: leads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.leads_id_seq OWNED BY public.leads.id;


--
-- TOC entry 223 (class 1259 OID 26970)
-- Name: plots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plots (
    id integer NOT NULL,
    project_id integer,
    name character varying(255) NOT NULL,
    location character varying(255),
    size character varying(50),
    price character varying(50),
    status character varying(50) DEFAULT 'Available'::character varying,
    tag character varying(100),
    image_url text,
    approval character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT plots_status_check CHECK (((status)::text = ANY (ARRAY['Available'::text, 'Booked'::text, 'Sold'::text])))
);


ALTER TABLE public.plots OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 26980)
-- Name: plots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.plots_id_seq OWNER TO postgres;

--
-- TOC entry 5101 (class 0 OID 0)
-- Dependencies: 224
-- Name: plots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plots_id_seq OWNED BY public.plots.id;


--
-- TOC entry 221 (class 1259 OID 26956)
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    status character varying(50) DEFAULT 'Available'::character varying,
    price_range character varying(100),
    image_url text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT projects_status_check CHECK (((status)::text = ANY (ARRAY['Available'::text, 'Fast Filling'::text, 'Sold Out'::text])))
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 26966)
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_id_seq OWNER TO postgres;

--
-- TOC entry 5102 (class 0 OID 0)
-- Dependencies: 222
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- TOC entry 231 (class 1259 OID 27038)
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
-- TOC entry 232 (class 1259 OID 27050)
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
-- TOC entry 5103 (class 0 OID 0)
-- Dependencies: 232
-- Name: sold_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sold_id_seq OWNED BY public.sold.id;


--
-- TOC entry 229 (class 1259 OID 27020)
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
-- TOC entry 230 (class 1259 OID 27034)
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
-- TOC entry 5104 (class 0 OID 0)
-- Dependencies: 230
-- Name: sold_leased_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sold_leased_id_seq OWNED BY public.sold_leased.id;


--
-- TOC entry 227 (class 1259 OID 27004)
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
    CONSTRAINT sold_properties_status_check CHECK (((status)::text = ANY (ARRAY[('pending'::character varying)::text, ('approved'::character varying)::text, ('rejected'::character varying)::text]))),
    CONSTRAINT sold_properties_type_check CHECK (((type)::text = ANY (ARRAY[('land'::character varying)::text, ('house'::character varying)::text, ('flat'::character varying)::text])))
);


ALTER TABLE public.sold_properties OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 27016)
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
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 228
-- Name: sold_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sold_properties_id_seq OWNED BY public.sold_properties.id;


--
-- TOC entry 4886 (class 2604 OID 26951)
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- TOC entry 4894 (class 2604 OID 27001)
-- Name: leads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leads ALTER COLUMN id SET DEFAULT nextval('public.leads_id_seq'::regclass);


--
-- TOC entry 4891 (class 2604 OID 26981)
-- Name: plots id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plots ALTER COLUMN id SET DEFAULT nextval('public.plots_id_seq'::regclass);


--
-- TOC entry 4888 (class 2604 OID 26967)
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- TOC entry 4906 (class 2604 OID 27051)
-- Name: sold id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sold ALTER COLUMN id SET DEFAULT nextval('public.sold_id_seq'::regclass);


--
-- TOC entry 4901 (class 2604 OID 27035)
-- Name: sold_leased id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sold_leased ALTER COLUMN id SET DEFAULT nextval('public.sold_leased_id_seq'::regclass);


--
-- TOC entry 4897 (class 2604 OID 27017)
-- Name: sold_properties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sold_properties ALTER COLUMN id SET DEFAULT nextval('public.sold_properties_id_seq'::regclass);


--
-- TOC entry 5080 (class 0 OID 26943)
-- Dependencies: 219
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins (id, username, password, created_at) FROM stdin;
1	admin	$2y$10$YourHashedPasswordHere	2026-05-15 10:51:33.635213
\.


--
-- TOC entry 5086 (class 0 OID 26989)
-- Dependencies: 225
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.leads (id, name, phone, email, interest_region, budget, source, status, created_at) FROM stdin;
\.


--
-- TOC entry 5084 (class 0 OID 26970)
-- Dependencies: 223
-- Data for Name: plots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plots (id, project_id, name, location, size, price, status, tag, image_url, approval, created_at) FROM stdin;
\.


--
-- TOC entry 5082 (class 0 OID 26956)
-- Dependencies: 221
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (id, name, status, price_range, image_url, created_at) FROM stdin;
1	The Royal Estate	Available	₹45L - ₹1.5Cr	\N	2026-05-25 16:39:01.634508
2	Emerald Valley	Fast Filling	₹85L - ₹2.5Cr	\N	2026-05-25 16:39:01.634508
3	Heritage West	Available	₹32L - ₹65L	\N	2026-05-25 16:39:01.634508
\.


--
-- TOC entry 5092 (class 0 OID 27038)
-- Dependencies: 231
-- Data for Name: sold; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sold (id, property_title, location, price, size, property_type, represented, status, customer_name, created_at) FROM stdin;
1	Land in Kundrathur Rajagopal Nagar	Kundrathur Rajagopal Nagar, Chennai	\N	600 sqft to 2400 sqft	Land	Both Buyer & Sellers	Sold Out	RSV Groups	2026-05-17 22:50:06.931382+05:30
2	2BHK Flat at VGK Sri Sai Gurusthan	Kannan Nagar Main Road, Chromepet	\N	936 Sq.ft	Flat	Both Buyer & Sellers	Sold Out	Surrya R K, Jenniffer Ferdinands	2026-05-17 22:50:06.931382+05:30
3	3BHK Flat at 7th Main Road	Anna Nagar, Chennai	\N	1402 Sq.ft	Flat	Both Buyer & Sellers	Sold Out	Jagadeesan M, Gowsalya	2026-05-17 22:50:06.931382+05:30
4	3BHK Brand New Flat at Appaswamy Altezza	Kadanchavadi, OMR	Rs.3,23,00,000/-	2108 Sq.ft	Flat	Both Buyer & Sellers	Sold Out	Srinivasan V G, Jagadeesan M, Sudhakar S, Gowsalya	2026-05-17 22:50:06.931382+05:30
\.


--
-- TOC entry 5090 (class 0 OID 27020)
-- Dependencies: 229
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
-- TOC entry 5088 (class 0 OID 27004)
-- Dependencies: 227
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
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 220
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admins_id_seq', 1, true);


--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 226
-- Name: leads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.leads_id_seq', 1, false);


--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 224
-- Name: plots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plots_id_seq', 1, false);


--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 222
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 3, true);


--
-- TOC entry 5110 (class 0 OID 0)
-- Dependencies: 232
-- Name: sold_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sold_id_seq', 4, true);


--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 230
-- Name: sold_leased_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sold_leased_id_seq', 8, true);


--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 228
-- Name: sold_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sold_properties_id_seq', 5, true);


--
-- TOC entry 4917 (class 2606 OID 26953)
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- TOC entry 4919 (class 2606 OID 26955)
-- Name: admins admins_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_username_key UNIQUE (username);


--
-- TOC entry 4925 (class 2606 OID 27003)
-- Name: leads leads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leads
    ADD CONSTRAINT leads_pkey PRIMARY KEY (id);


--
-- TOC entry 4923 (class 2606 OID 26983)
-- Name: plots plots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plots
    ADD CONSTRAINT plots_pkey PRIMARY KEY (id);


--
-- TOC entry 4921 (class 2606 OID 26969)
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- TOC entry 4929 (class 2606 OID 27037)
-- Name: sold_leased sold_leased_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sold_leased
    ADD CONSTRAINT sold_leased_pkey PRIMARY KEY (id);


--
-- TOC entry 4931 (class 2606 OID 27053)
-- Name: sold sold_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sold
    ADD CONSTRAINT sold_pkey PRIMARY KEY (id);


--
-- TOC entry 4927 (class 2606 OID 27019)
-- Name: sold_properties sold_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sold_properties
    ADD CONSTRAINT sold_properties_pkey PRIMARY KEY (id);


--
-- TOC entry 4932 (class 2606 OID 26984)
-- Name: plots plots_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plots
    ADD CONSTRAINT plots_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


-- Completed on 2026-05-25 16:39:39

--
-- PostgreSQL database dump complete
--

\unrestrict jkrbKG86DcsAkeNzAbmlPfrPitG0N8a8y5PDlYWwLb9UBIn17jAWKipvLEfbYKS

