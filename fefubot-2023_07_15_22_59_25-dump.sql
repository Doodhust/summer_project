--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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

DROP TABLE public."User";
DROP TABLE public."Documents";
DROP TABLE public."Application";
DROP EXTENSION adminpack;
--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Application; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Application" (
    id bigint NOT NULL,
    user_telegram_id bigint NOT NULL,
    status character varying(50) DEFAULT 'В процессе заполнения'::character varying NOT NULL
);


ALTER TABLE public."Application" OWNER TO postgres;

--
-- Name: Application_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Application" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Application_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Documents" (
    id bigint NOT NULL,
    application_id bigint NOT NULL,
    passport_path character varying(255) DEFAULT ''::character varying NOT NULL,
    insurance_number_path character varying(255) DEFAULT ''::character varying NOT NULL,
    taxpayer_number_path character varying(255) DEFAULT ''::character varying NOT NULL,
    bank_statement_path character varying(255) DEFAULT ''::character varying NOT NULL,
    data_processing_path character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public."Documents" OWNER TO postgres;

--
-- Name: Documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Documents" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Documents_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id bigint NOT NULL,
    telegram_id bigint NOT NULL,
    fullname character varying(255) NOT NULL,
    date_of_last_application character varying(25) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: TABLE "User"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."User" IS 'save infomattion about bot users';


--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."User" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."User_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: Application; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Documents; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: Application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Application_id_seq"', 1, false);


--
-- Name: Documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Documents_id_seq"', 1, false);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

