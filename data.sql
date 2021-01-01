--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

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

DROP DATABASE warbler;
--
-- Name: warbler; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE warbler WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


\connect warbler

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
-- Name: follows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.follows (
    user_being_followed_id integer NOT NULL,
    user_following_id integer NOT NULL
);


--
-- Name: likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    user_id integer NOT NULL,
    message_id integer NOT NULL
);


--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    text character varying(140) NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email text NOT NULL,
    username text NOT NULL,
    image_url text,
    header_image_url text,
    bio text,
    location text,
    password text NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: follows; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.follows (user_being_followed_id, user_following_id) FROM stdin;
4	4
3	4
4	3
4	6
3	7
4	7
6	7
7	3
6	3
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.likes (id, user_id, message_id) FROM stdin;
1	4	1
2	4	2
3	7	1
4	7	4
5	7	3
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.messages (id, text, "timestamp", user_id) FROM stdin;
1	SDADASD	2020-10-23 21:20:33.254882	3
2	ASDSADASDASD	2020-10-23 21:20:33.254882	3
3	asdsadasdad	2020-10-23 23:01:58.44826	6
4	asdadasdasd	2020-10-23 23:01:58.44826	6
5	sdasdasddas	2020-10-23 23:01:58.44826	7
6	asdasdasd	2020-10-23 23:01:58.44826	7
7	asdadads	2020-10-23 23:41:49.413825	3
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, username, image_url, header_image_url, bio, location, password) FROM stdin;
8989	test@test.com	testuser	/static/images/default-pic.png	/static/images/warbler-hero.jpg	\N	\N	$2b$12$52BSxUP5Y6dDVcPMYzcUwu/1f9LkVJ/6PCgdWGAhW6Gh5TyNVof2.
778	test1@test.com	abc	/static/images/default-pic.png	/static/images/warbler-hero.jpg	\N	\N	$2b$12$vg0W.8fIZL52W.SWPVQTLemxHIY33YeO3Mdr64.IcywHMsC6pXbt6
884	test2@test.com	efg	/static/images/default-pic.png	/static/images/warbler-hero.jpg	\N	\N	$2b$12$pJi.pQqRXZHVJShXVRqZReh8g4FzG.B4BxdQ5PEY4NC8Mr8BYpfpW
1	test3@test.com	hij	/static/images/default-pic.png	/static/images/warbler-hero.jpg	\N	\N	$2b$12$F47xPoWEVkFDatQmuO4sWeCseJK4iQo6zsHI1yJcocNxlo1VrqzVO
2	test4@test.com	testing	/static/images/default-pic.png	/static/images/warbler-hero.jpg	\N	\N	$2b$12$og3meIH4kf6oQhtQ3y5KuOPjaRFB/G2LesJMlRJr0Bu3NtKIX7Lne
3	foobar@gmail.com	lucas	/static/images/default-pic.png	/static/images/warbler-hero.jpg	\N	\N	$2b$12$8Dq8rWirJnFHPwsf0O4G7..gzCLdloW3rteoYmkCfQa0JlXybZJH.
4	foobar1@gmail.com	lucas2	/static/images/default-pic.png	/static/images/warbler-hero.jpg	\N	\N	$2b$12$qfFzaeVFNIdt8F5ExiwS0eUd5DepvrZgdirhDi8PByzNypLaUQxHi
5	foobar4@gmail.com	newuser	/static/images/default-pic.png	/static/images/warbler-hero.jpg	\N	\N	$2b$12$frFG1pBcpMmYb/QZtRUN8OtRD2tEP.Jz2wu5Fe37EcOkQvgmQTvD.
6	foobar6@gmail.com	lucas3	/static/images/default-pic.png	/static/images/warbler-hero.jpg	\N	\N	$2b$12$xLWDS7eF6/Z3zsLZwqC0N.MjGxhEd3ES.bsEfJrANOGqs9L9BUpGy
7	foobar8@gmail.com	lucas5	/static/images/default-pic.png	/static/images/warbler-hero.jpg	\N	\N	$2b$12$cGL06TkrndOl1/jbeMiKz.6ihJsd1o5ibKjSeXJA1kzY65HdyBnVq
\.


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.likes_id_seq', 45, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.messages_id_seq', 8, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- Name: follows follows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (user_being_followed_id, user_following_id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: follows follows_user_being_followed_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_user_being_followed_id_fkey FOREIGN KEY (user_being_followed_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: follows follows_user_following_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_user_following_id_fkey FOREIGN KEY (user_following_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: likes likes_message_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_message_id_fkey FOREIGN KEY (message_id) REFERENCES public.messages(id) ON DELETE CASCADE;


--
-- Name: likes likes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: messages messages_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

