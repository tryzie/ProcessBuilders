--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6 - Percona Distribution
-- Dumped by pg_dump version 16.6 - Percona Distribution

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
-- Name: answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.answers (
    answer_id integer NOT NULL,
    answer_choice integer NOT NULL,
    pupil_id integer NOT NULL,
    date_created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    date_modified timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.answers OWNER TO postgres;

--
-- Name: answers_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.answers_answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.answers_answer_id_seq OWNER TO postgres;

--
-- Name: answers_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.answers_answer_id_seq OWNED BY public.answers.answer_id;


--
-- Name: class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.class (
    class_id integer NOT NULL,
    class_name character varying(10) NOT NULL,
    teachers_id integer NOT NULL,
    date_created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    date_modified timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.class OWNER TO postgres;

--
-- Name: class_class_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.class_class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.class_class_id_seq OWNER TO postgres;

--
-- Name: class_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.class_class_id_seq OWNED BY public.class.class_id;


--
-- Name: exam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exam (
    exam_id integer NOT NULL,
    teachers_id integer NOT NULL,
    subject_id integer NOT NULL,
    exam_type character varying(100) NOT NULL,
    exam_title character varying(100) NOT NULL,
    exam_description character varying(255),
    date_created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    date_modified timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.exam OWNER TO postgres;

--
-- Name: exam_exam_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exam_exam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.exam_exam_id_seq OWNER TO postgres;

--
-- Name: exam_exam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exam_exam_id_seq OWNED BY public.exam.exam_id;


--
-- Name: options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.options (
    options_id integer NOT NULL,
    question_id integer NOT NULL,
    option_choice character(1) NOT NULL,
    options_description character varying(255) NOT NULL,
    is_correct boolean DEFAULT false,
    date_created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    date_modified timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.options OWNER TO postgres;

--
-- Name: options_options_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.options_options_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.options_options_id_seq OWNER TO postgres;

--
-- Name: options_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.options_options_id_seq OWNED BY public.options.options_id;


--
-- Name: pupil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pupil (
    pupil_id integer NOT NULL,
    class_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    admission_number integer NOT NULL,
    date_of_birth date NOT NULL,
    password character varying(255) NOT NULL,
    date_created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    date_modified timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.pupil OWNER TO postgres;

--
-- Name: pupil_exam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pupil_exam (
    pupil_exam_id integer NOT NULL,
    pupil_id integer NOT NULL,
    exam_id integer NOT NULL,
    date_created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    date_modified timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.pupil_exam OWNER TO postgres;

--
-- Name: pupil_exam_pupil_exam_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pupil_exam_pupil_exam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pupil_exam_pupil_exam_id_seq OWNER TO postgres;

--
-- Name: pupil_exam_pupil_exam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pupil_exam_pupil_exam_id_seq OWNED BY public.pupil_exam.pupil_exam_id;


--
-- Name: pupil_pupil_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pupil_pupil_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pupil_pupil_id_seq OWNER TO postgres;

--
-- Name: pupil_pupil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pupil_pupil_id_seq OWNED BY public.pupil.pupil_id;


--
-- Name: question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question (
    question_id integer NOT NULL,
    exam_id integer NOT NULL,
    question_name character varying(255) NOT NULL,
    question_description character varying(255) NOT NULL,
    date_created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    date_modified timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.question OWNER TO postgres;

--
-- Name: question_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.question_question_id_seq OWNER TO postgres;

--
-- Name: question_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.question_question_id_seq OWNED BY public.question.question_id;


--
-- Name: subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subject (
    subject_id integer NOT NULL,
    subject_name character varying(100) NOT NULL,
    date_created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    date_modified timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.subject OWNER TO postgres;

--
-- Name: subject_subject_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subject_subject_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subject_subject_id_seq OWNER TO postgres;

--
-- Name: subject_subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subject_subject_id_seq OWNED BY public.subject.subject_id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    teachers_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email_address character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    tsc_number character varying(255) NOT NULL,
    id_number integer NOT NULL,
    phone_number character varying(100) NOT NULL,
    date_created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    date_modified timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- Name: teachers_subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers_subject (
    teachers_subject_id integer NOT NULL,
    teachers_id integer NOT NULL,
    subject_id integer NOT NULL,
    date_created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    date_modified timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.teachers_subject OWNER TO postgres;

--
-- Name: teachers_subject_teachers_subject_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_subject_teachers_subject_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teachers_subject_teachers_subject_id_seq OWNER TO postgres;

--
-- Name: teachers_subject_teachers_subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_subject_teachers_subject_id_seq OWNED BY public.teachers_subject.teachers_subject_id;


--
-- Name: teachers_teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teachers_teachers_id_seq OWNER TO postgres;

--
-- Name: teachers_teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_teachers_id_seq OWNED BY public.teachers.teachers_id;


--
-- Name: answers answer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers ALTER COLUMN answer_id SET DEFAULT nextval('public.answers_answer_id_seq'::regclass);


--
-- Name: class class_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class ALTER COLUMN class_id SET DEFAULT nextval('public.class_class_id_seq'::regclass);


--
-- Name: exam exam_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam ALTER COLUMN exam_id SET DEFAULT nextval('public.exam_exam_id_seq'::regclass);


--
-- Name: options options_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options ALTER COLUMN options_id SET DEFAULT nextval('public.options_options_id_seq'::regclass);


--
-- Name: pupil pupil_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pupil ALTER COLUMN pupil_id SET DEFAULT nextval('public.pupil_pupil_id_seq'::regclass);


--
-- Name: pupil_exam pupil_exam_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pupil_exam ALTER COLUMN pupil_exam_id SET DEFAULT nextval('public.pupil_exam_pupil_exam_id_seq'::regclass);


--
-- Name: question question_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question ALTER COLUMN question_id SET DEFAULT nextval('public.question_question_id_seq'::regclass);


--
-- Name: subject subject_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject ALTER COLUMN subject_id SET DEFAULT nextval('public.subject_subject_id_seq'::regclass);


--
-- Name: teachers teachers_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers ALTER COLUMN teachers_id SET DEFAULT nextval('public.teachers_teachers_id_seq'::regclass);


--
-- Name: teachers_subject teachers_subject_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_subject ALTER COLUMN teachers_subject_id SET DEFAULT nextval('public.teachers_subject_teachers_subject_id_seq'::regclass);


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.answers (answer_id, answer_choice, pupil_id, date_created, date_modified) FROM stdin;
1	1	3	2024-12-18 14:09:32.452804	2024-12-18 14:09:32.452804
2	3	2	2024-12-18 14:09:32.452804	2024-12-18 14:09:32.452804
3	2	5	2024-12-18 14:09:32.452804	2024-12-18 14:09:32.452804
4	2	4	2024-12-18 14:09:32.452804	2024-12-18 14:09:32.452804
5	3	1	2024-12-18 14:09:32.452804	2024-12-18 14:09:32.452804
\.


--
-- Data for Name: class; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.class (class_id, class_name, teachers_id, date_created, date_modified) FROM stdin;
1	5 east	1	2024-12-18 13:46:56.251406	2024-12-18 13:46:56.251406
\.


--
-- Data for Name: exam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exam (exam_id, teachers_id, subject_id, exam_type, exam_title, exam_description, date_created, date_modified) FROM stdin;
1	1	1	opener	targeter	read well	2024-12-18 13:57:58.425265	2024-12-18 13:57:58.425265
\.


--
-- Data for Name: options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.options (options_id, question_id, option_choice, options_description, is_correct, date_created, date_modified) FROM stdin;
1	1	a	kilimanjaro	f	2024-12-18 14:00:53.574648	2024-12-18 14:00:53.574648
2	1	b	everest	t	2024-12-18 14:02:53.462223	2024-12-18 14:02:53.462223
3	1	c	kenya	f	2024-12-18 14:02:53.462223	2024-12-18 14:02:53.462223
\.


--
-- Data for Name: pupil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pupil (pupil_id, class_id, first_name, last_name, admission_number, date_of_birth, password, date_created, date_modified) FROM stdin;
1	1	derrick	machirra	9001	2015-09-03	machira2015	2024-12-18 13:49:31.022762	2024-12-18 13:49:31.022762
2	1	jolie	andrea	9003	2015-12-04	jolie1123	2024-12-18 13:50:49.753176	2024-12-18 13:50:49.753176
3	1	edel	imanii	9010	2014-05-22	edel@1	2024-12-18 13:53:09.630111	2024-12-18 13:53:09.630111
4	1	dennis	kahiro	9013	2015-02-28	kahiro90	2024-12-18 13:55:12.005257	2024-12-18 13:55:12.005257
5	1	henry	st	90004	2015-03-15	st@123	2024-12-18 13:56:22.785876	2024-12-18 13:56:22.785876
\.


--
-- Data for Name: pupil_exam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pupil_exam (pupil_exam_id, pupil_id, exam_id, date_created, date_modified) FROM stdin;
1	1	1	2024-12-18 14:04:27.060222	2024-12-18 14:04:27.060222
2	2	1	2024-12-18 14:05:43.676063	2024-12-18 14:05:43.676063
3	3	1	2024-12-18 14:05:43.676063	2024-12-18 14:05:43.676063
4	4	1	2024-12-18 14:05:43.676063	2024-12-18 14:05:43.676063
5	5	1	2024-12-18 14:06:28.510465	2024-12-18 14:06:28.510465
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question (question_id, exam_id, question_name, question_description, date_created, date_modified) FROM stdin;
1	1	question1 1)	what is the tallest mountain	2024-12-18 13:59:09.716187	2024-12-18 13:59:09.716187
\.


--
-- Data for Name: subject; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subject (subject_id, subject_name, date_created, date_modified) FROM stdin;
1	geography	2024-12-18 13:56:54.122673	2024-12-18 13:56:54.122673
\.


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teachers (teachers_id, first_name, last_name, email_address, password, tsc_number, id_number, phone_number, date_created, date_modified) FROM stdin;
1	james	mocheche	mocheche@gmail.com	mocheche662	200101	29036484	0718903499	2024-12-18 13:46:04.210694	2024-12-18 13:46:04.210694
\.


--
-- Data for Name: teachers_subject; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teachers_subject (teachers_subject_id, teachers_id, subject_id, date_created, date_modified) FROM stdin;
1	1	1	2024-12-18 14:03:35.316444	2024-12-18 14:03:35.316444
\.


--
-- Name: answers_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.answers_answer_id_seq', 5, true);


--
-- Name: class_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.class_class_id_seq', 1, true);


--
-- Name: exam_exam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exam_exam_id_seq', 1, true);


--
-- Name: options_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.options_options_id_seq', 3, true);


--
-- Name: pupil_exam_pupil_exam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pupil_exam_pupil_exam_id_seq', 5, true);


--
-- Name: pupil_pupil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pupil_pupil_id_seq', 4, true);


--
-- Name: question_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_question_id_seq', 1, true);


--
-- Name: subject_subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subject_subject_id_seq', 1, true);


--
-- Name: teachers_subject_teachers_subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_subject_teachers_subject_id_seq', 1, true);


--
-- Name: teachers_teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_teachers_id_seq', 1, true);


--
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (answer_id);


--
-- Name: class class_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_pkey PRIMARY KEY (class_id);


--
-- Name: exam exam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_pkey PRIMARY KEY (exam_id);


--
-- Name: options options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_pkey PRIMARY KEY (options_id);


--
-- Name: pupil pupil_admission_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pupil
    ADD CONSTRAINT pupil_admission_number_key UNIQUE (admission_number);


--
-- Name: pupil_exam pupil_exam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pupil_exam
    ADD CONSTRAINT pupil_exam_pkey PRIMARY KEY (pupil_exam_id);


--
-- Name: pupil pupil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pupil
    ADD CONSTRAINT pupil_pkey PRIMARY KEY (pupil_id);


--
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (question_id);


--
-- Name: subject subject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (subject_id);


--
-- Name: subject subject_subject_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_subject_name_key UNIQUE (subject_name);


--
-- Name: teachers teachers_email_address_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_email_address_key UNIQUE (email_address);


--
-- Name: teachers teachers_id_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_id_number_key UNIQUE (id_number);


--
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (teachers_id);


--
-- Name: teachers_subject teachers_subject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_subject
    ADD CONSTRAINT teachers_subject_pkey PRIMARY KEY (teachers_subject_id);


--
-- Name: teachers teachers_tsc_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_tsc_number_key UNIQUE (tsc_number);


--
-- Name: answers_answer_id_answer_choice_date_created_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX answers_answer_id_answer_choice_date_created_index ON public.answers USING btree (answer_id, answer_choice, date_created);


--
-- Name: answers_answer_id_pupil_id_date_modified_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX answers_answer_id_pupil_id_date_modified_index ON public.answers USING btree (answer_id, pupil_id, date_modified);


--
-- Name: class_class_id_date_created_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX class_class_id_date_created_index ON public.class USING btree (class_id, date_created);


--
-- Name: class_class_id_date_modified_class_name_date_modified_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX class_class_id_date_modified_class_name_date_modified_index ON public.class USING btree (class_id, date_modified, class_name);


--
-- Name: class_class_id_teachers_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX class_class_id_teachers_id_index ON public.class USING btree (class_id, teachers_id);


--
-- Name: exam_exam_id_date_modified_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exam_exam_id_date_modified_index ON public.exam USING btree (exam_id, date_modified);


--
-- Name: exam_exam_id_exam_type_exam_title_date_created_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exam_exam_id_exam_type_exam_title_date_created_index ON public.exam USING btree (exam_id, exam_type, exam_title, date_created);


--
-- Name: exam_exam_id_teachers_id_subject_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exam_exam_id_teachers_id_subject_id_index ON public.exam USING btree (exam_id, teachers_id, subject_id);


--
-- Name: options_options_id_option_choice_is_correct_date_created_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX options_options_id_option_choice_is_correct_date_created_index ON public.options USING btree (options_id, option_choice, is_correct, date_created);


--
-- Name: options_options_id_question_id_date_modified_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX options_options_id_question_id_date_modified_index ON public.options USING btree (options_id, question_id, date_modified);


--
-- Name: pupil_exam_exam_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pupil_exam_exam_id_index ON public.pupil_exam USING btree (exam_id);


--
-- Name: pupil_exam_pupil_id_date_created_date_modified_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pupil_exam_pupil_id_date_created_date_modified_index ON public.pupil_exam USING btree (pupil_id, date_created, date_modified);


--
-- Name: pupil_pupil_id_class_id_first_name_last_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pupil_pupil_id_class_id_first_name_last_name_index ON public.pupil USING btree (pupil_id, class_id, first_name, last_name);


--
-- Name: pupil_pupil_id_date_created_date_modified_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pupil_pupil_id_date_created_date_modified_index ON public.pupil USING btree (pupil_id, date_created, date_modified);


--
-- Name: pupil_pupil_id_date_of_birth_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pupil_pupil_id_date_of_birth_index ON public.pupil USING btree (pupil_id, date_of_birth);


--
-- Name: question_exam_id_question_name_date_created_date_modified_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX question_exam_id_question_name_date_created_date_modified_index ON public.question USING btree (exam_id, question_name, date_created, date_modified);


--
-- Name: subject_date_modified_date_created_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX subject_date_modified_date_created_index ON public.subject USING btree (date_modified, date_created);


--
-- Name: teachers_first_name_date_created_date_modified_last_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teachers_first_name_date_created_date_modified_last_name_index ON public.teachers USING btree (first_name, date_created, date_modified, last_name);


--
-- Name: teachers_phone_number_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teachers_phone_number_index ON public.teachers USING btree (phone_number);


--
-- Name: teachers_subject_date_created_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teachers_subject_date_created_index ON public.teachers_subject USING btree (date_created);


--
-- Name: teachers_subject_teachers_id_subject_id_date_modified_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teachers_subject_teachers_id_subject_id_date_modified_index ON public.teachers_subject USING btree (teachers_id, subject_id, date_modified);


--
-- Name: teachers_teachers_id_tsc_number_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teachers_teachers_id_tsc_number_index ON public.teachers USING btree (teachers_id, tsc_number);


--
-- Name: answers answers_answer_choice_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_answer_choice_fkey FOREIGN KEY (answer_choice) REFERENCES public.options(options_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: answers answers_pupil_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pupil_id_fkey FOREIGN KEY (pupil_id) REFERENCES public.pupil(pupil_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: class class_teachers_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_teachers_id_fkey FOREIGN KEY (teachers_id) REFERENCES public.teachers(teachers_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: exam exam_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subject(subject_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: exam exam_teachers_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_teachers_id_fkey FOREIGN KEY (teachers_id) REFERENCES public.teachers(teachers_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: options options_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question(question_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pupil pupil_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pupil
    ADD CONSTRAINT pupil_class_id_fkey FOREIGN KEY (class_id) REFERENCES public.class(class_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: pupil_exam pupil_exam_exam_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pupil_exam
    ADD CONSTRAINT pupil_exam_exam_id_fkey FOREIGN KEY (exam_id) REFERENCES public.exam(exam_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pupil_exam pupil_exam_pupil_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pupil_exam
    ADD CONSTRAINT pupil_exam_pupil_id_fkey FOREIGN KEY (pupil_id) REFERENCES public.pupil(pupil_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: question question_exam_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_exam_id_fkey FOREIGN KEY (exam_id) REFERENCES public.exam(exam_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: teachers_subject teachers_subject_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_subject
    ADD CONSTRAINT teachers_subject_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subject(subject_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: teachers_subject teachers_subject_teachers_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_subject
    ADD CONSTRAINT teachers_subject_teachers_id_fkey FOREIGN KEY (teachers_id) REFERENCES public.teachers(teachers_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

