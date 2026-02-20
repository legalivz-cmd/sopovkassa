--
-- PostgreSQL database dump
--

\restrict B904dU25uKPx0Zw4xGBbEGeWcXbVPElxWQDM3SSWOUYE5e0EiU0mpt0rnhWZ4gI

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-02-19 22:01:05

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
-- TOC entry 220 (class 1259 OID 16410)
-- Name: menu_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_items (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE public.menu_items OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16409)
-- Name: menu_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_items_id_seq OWNER TO postgres;

--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 219
-- Name: menu_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_items_id_seq OWNED BY public.menu_items.id;


--
-- TOC entry 224 (class 1259 OID 16438)
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    order_id integer NOT NULL,
    item_name character varying(150) NOT NULL,
    price numeric(10,2) NOT NULL,
    quantity integer DEFAULT 1
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16437)
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_items_id_seq OWNER TO postgres;

--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 223
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- TOC entry 222 (class 1259 OID 16420)
-- Name: orders_report; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_report (
    order_id integer NOT NULL,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    total_sum numeric(12,2) DEFAULT 0.00 NOT NULL,
    items_count integer DEFAULT 0 NOT NULL,
    status character varying(20) DEFAULT 'в обработке'::character varying,
    cashier_login character varying(50) DEFAULT NULL::character varying,
    notes text,
    CONSTRAINT orders_report_status_check CHECK (((status)::text = ANY ((ARRAY['в обработке'::character varying, 'выполнен'::character varying, 'отменён'::character varying])::text[])))
);


ALTER TABLE public.orders_report OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16419)
-- Name: orders_report_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_report_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_report_order_id_seq OWNER TO postgres;

--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 221
-- Name: orders_report_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_report_order_id_seq OWNED BY public.orders_report.order_id;


--
-- TOC entry 4765 (class 2604 OID 16413)
-- Name: menu_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items ALTER COLUMN id SET DEFAULT nextval('public.menu_items_id_seq'::regclass);


--
-- TOC entry 4772 (class 2604 OID 16441)
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- TOC entry 4766 (class 2604 OID 16423)
-- Name: orders_report order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_report ALTER COLUMN order_id SET DEFAULT nextval('public.orders_report_order_id_seq'::regclass);


--
-- TOC entry 4930 (class 0 OID 16410)
-- Dependencies: 220
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_items (id, name, price) FROM stdin;
1	Мисо Расенган	220.00
2	Тонкоцу Чакра	250.00
3	Шаринган Шою	200.00
4	Узумаки Мiso Чашу	280.00
5	Расен Рамен	240.00
6	Хокаге Спайси	260.00
7	Акацуки Блэк	270.00
8	Коноха Классик	190.00
9	Наруто Даттебайо	300.00
10	Сенджу Веган	210.00
11	Камуи Тонкоцу	290.00
12	Скрытый Лист Суп	180.00
\.


--
-- TOC entry 4934 (class 0 OID 16438)
-- Dependencies: 224
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, order_id, item_name, price, quantity) FROM stdin;
1	1	Хокаге Спайси	260.00	1
2	1	Хокаге Спайси	260.00	1
3	1	Хокаге Спайси	260.00	1
4	2	Сенджу Веган	210.00	1
5	2	Сенджу Веган	210.00	1
6	2	Сенджу Веган	210.00	1
7	2	Сенджу Веган	210.00	1
8	2	Сенджу Веган	210.00	1
9	2	Сенджу Веган	210.00	1
10	2	Сенджу Веган	210.00	1
11	2	Сенджу Веган	210.00	1
12	2	Сенджу Веган	210.00	1
13	3	Мисо Расенган	220.00	1
14	3	Мисо Расенган	220.00	1
15	3	Мисо Расенган	220.00	1
16	3	Тонкоцу Чакра	250.00	1
17	3	Шаринган Шою	200.00	1
18	4	Хокаге Спайси	260.00	1
19	4	Хокаге Спайси	260.00	1
20	5	Шаринган Шою	200.00	1
21	5	Расен Рамен	240.00	1
22	6	Тонкоцу Чакра	250.00	1
23	6	Тонкоцу Чакра	250.00	1
24	6	Тонкоцу Чакра	250.00	1
25	6	Тонкоцу Чакра	250.00	1
\.


--
-- TOC entry 4932 (class 0 OID 16420)
-- Dependencies: 222
-- Data for Name: orders_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_report (order_id, order_date, total_sum, items_count, status, cashier_login, notes) FROM stdin;
1	2026-02-12 09:44:10.291262	780.00	3	в обработке	\N	\N
2	2026-02-12 09:45:12.345079	1890.00	9	в обработке	\N	\N
3	2026-02-12 09:47:15.507311	1110.00	5	в обработке	\N	\N
4	2026-02-12 09:53:19.576619	520.00	2	в обработке	\N	\N
5	2026-02-12 10:44:47.34117	440.00	2	в обработке	\N	\N
6	2026-02-19 21:50:47.842702	1000.00	4	в обработке	\N	\N
\.


--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 219
-- Name: menu_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_items_id_seq', 12, true);


--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 223
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_id_seq', 25, true);


--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 221
-- Name: orders_report_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_report_order_id_seq', 6, true);


--
-- TOC entry 4776 (class 2606 OID 16418)
-- Name: menu_items menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4780 (class 2606 OID 16448)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4778 (class 2606 OID 16436)
-- Name: orders_report orders_report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_report
    ADD CONSTRAINT orders_report_pkey PRIMARY KEY (order_id);


--
-- TOC entry 4781 (class 2606 OID 16449)
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders_report(order_id) ON DELETE CASCADE;


-- Completed on 2026-02-19 22:01:05

--
-- PostgreSQL database dump complete
--

\unrestrict B904dU25uKPx0Zw4xGBbEGeWcXbVPElxWQDM3SSWOUYE5e0EiU0mpt0rnhWZ4gI

