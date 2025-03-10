--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2024-12-05 21:36:27

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
-- TOC entry 221 (class 1259 OID 16483)
-- Name: Hitter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Hitter" (
    h_id integer NOT NULL,
    player_pid integer,
    h_position character varying(10),
    h_g integer,
    h_ab integer,
    h_r integer,
    h_2b integer,
    h_3b integer,
    h_hr integer,
    h_rbi integer,
    h_bb integer,
    h_so integer,
    h_sb integer,
    h_cs integer,
    h_avg numeric(4,3),
    h_obp numeric(4,3),
    h_slg numeric(4,3),
    h_ops numeric(4,3),
    h_h integer
);


ALTER TABLE public."Hitter" OWNER TO postgres;

--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN "Hitter".h_h; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Hitter".h_h IS 'hits';


--
-- TOC entry 219 (class 1259 OID 16459)
-- Name: Pitcher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pitcher" (
    p_id integer NOT NULL,
    player_pid integer,
    p_w integer,
    p_l integer,
    p_era numeric(5,2),
    p_g integer,
    p_gs integer,
    p_ip numeric(5,1),
    p_h integer,
    p_r integer,
    p_er integer,
    p_hr integer,
    p_bb integer,
    p_so integer,
    p_whip numeric(4,2)
);


ALTER TABLE public."Pitcher" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16468)
-- Name: Pitcher_p_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Pitcher_p_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Pitcher_p_id_seq" OWNER TO postgres;

--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 220
-- Name: Pitcher_p_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Pitcher_p_id_seq" OWNED BY public."Pitcher".p_id;


--
-- TOC entry 218 (class 1259 OID 16429)
-- Name: Players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Players" (
    player_pid integer NOT NULL,
    player_name character varying(100) NOT NULL,
    player_position character varying(20),
    player_bat_thr character varying(5),
    player_age integer,
    player_number integer
);


ALTER TABLE public."Players" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16428)
-- Name: Players_player_pid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Players_player_pid_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Players_player_pid_seq" OWNER TO postgres;

--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 217
-- Name: Players_player_pid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Players_player_pid_seq" OWNED BY public."Players".player_pid;


--
-- TOC entry 229 (class 1259 OID 17064)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17063)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 231 (class 1259 OID 17072)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17071)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 17058)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17057)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 233 (class 1259 OID 17078)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 17086)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17085)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 17077)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 237 (class 1259 OID 17092)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17091)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 239 (class 1259 OID 17150)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 17149)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 225 (class 1259 OID 17050)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17049)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 17042)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17041)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 240 (class 1259 OID 17178)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 17188)
-- Name: testdb_player; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.testdb_player (
    id bigint NOT NULL,
    player_id integer NOT NULL,
    name text NOT NULL,
    "position" text NOT NULL,
    bat_thr text NOT NULL,
    age integer NOT NULL
);


ALTER TABLE public.testdb_player OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 17187)
-- Name: testdb_player_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.testdb_player ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.testdb_player_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4759 (class 2604 OID 16469)
-- Name: Pitcher p_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pitcher" ALTER COLUMN p_id SET DEFAULT nextval('public."Pitcher_p_id_seq"'::regclass);


--
-- TOC entry 4758 (class 2604 OID 16432)
-- Name: Players player_pid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Players" ALTER COLUMN player_pid SET DEFAULT nextval('public."Players_player_pid_seq"'::regclass);


--
-- TOC entry 4976 (class 0 OID 16483)
-- Dependencies: 221
-- Data for Name: Hitter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Hitter" (h_id, player_pid, h_position, h_g, h_ab, h_r, h_2b, h_3b, h_hr, h_rbi, h_bb, h_so, h_sb, h_cs, h_avg, h_obp, h_slg, h_ops, h_h) FROM stdin;
1	1	CF	158	589	121	22	14	22	74	73	130	35	2	0.231	0.322	0.428	0.749	136
2	2	3B	158	571	60	2	2	30	101	84	176	7	2	0.256	0.319	0.469	0.788	148
3	3	LF	133	504	82	23	2	18	75	29	101	7	5	0.262	0.321	0.435	0.757	120
4	4	2B	136	504	101	23	2	36	95	65	106	6	0	0.292	0.372	0.560	0.932	147
5	5	1B	130	479	72	26	0	26	84	55	133	2	1	0.251	0.335	0.468	0.803	120
6	6	CF	142	442	126	13	7	8	56	31	78	25	2	0.285	0.349	0.400	0.749	13
7	7	DH	132	367	101	17	1	23	64	55	105	7	0	0.275	0.393	0.515	0.908	17
8	8	SS	98	337	92	21	2	3	37	36	58	3	2	0.273	0.344	0.374	0.718	21
9	9	C	97	305	81	18	1	5	45	41	52	3	2	0.266	0.353	0.380	0.734	18
10	10	SS	111	288	80	17	1	3	28	15	48	8	2	0.278	0.311	0.375	0.686	17
11	11	RF	106	254	74	20	2	12	46	20	101	3	0	0.291	0.348	0.528	0.875	20
12	12	1B	61	166	41	7	0	3	21	15	49	3	2	0.247	0.321	0.343	0.664	7
13	13	1B	41	140	39	5	0	5	22	11	49	0	1	0.279	0.361	0.436	0.796	5
14	14	LF	60	137	37	11	0	3	36	18	32	0	1	0.270	0.348	0.547	0.896	11
15	15	C	42	97	22	4	1	3	9	9	27	0	1	0.227	0.290	0.320	0.609	4
16	16	CF	39	95	13	5	1	5	14	7	27	4	1	0.189	0.245	0.358	0.603	5
17	17	C	31	81	14	0	0	2	7	9	23	0	1	0.173	0.287	0.210	0.497	0
18	18	C	31	81	25	6	1	1	9	8	9	1	0	0.313	0.368	0.525	0.893	6
19	19	2B	18	37	6	2	0	0	4	2	9	0	1	0.162	0.347	0.216	0.563	2
20	20	SS	14	22	3	0	1	0	4	2	7	0	0	0.045	0.154	0.045	0.199	0
21	21	LF	8	17	3	0	0	0	2	1	4	0	0	0.176	0.176	0.294	0.471	3
22	22	RP	2	1	0	0	0	0	0	0	1	0	0	0.000	0.000	0.000	0.000	0
\.


--
-- TOC entry 4974 (class 0 OID 16459)
-- Dependencies: 219
-- Data for Name: Pitcher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pitcher" (p_id, player_pid, p_w, p_l, p_era, p_g, p_gs, p_ip, p_h, p_r, p_er, p_hr, p_bb, p_so, p_whip) FROM stdin;
1	14	11	10	4.71	32	32	181.2	183	95	95	24	42	168	1.25
2	13	8	8	4.71	28	26	150.2	159	79	79	23	50	104	1.24
3	3	17	5	3.15	28	28	148.0	133	54	54	24	54	156	1.03
4	12	11	7	5.46	25	25	117.0	149	71	71	14	25	83	1.64
5	1	1	7	5.01	12	12	73.2	82	41	41	11	17	77	1.34
6	7	5	1	3.29	13	13	73.2	67	33	33	11	18	73	1.20
7	9	0	0	3.48	7	0	72.2	59	22	22	10	30	91	1.12
8	4	4	2	3.96	67	0	66.1	64	35	35	5	20	77	1.35
9	18	1	3	5.04	44	0	59.1	56	28	28	8	19	47	1.43
10	8	2	1	4.35	59	0	59.1	52	24	24	6	18	57	1.22
\.


--
-- TOC entry 4973 (class 0 OID 16429)
-- Dependencies: 218
-- Data for Name: Players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Players" (player_pid, player_name, player_position, player_bat_thr, player_age, player_number) FROM stdin;
1	Slade Cecconi	SP	RR	25	43
2	Yilber Diaz	SP	RR	24	45
3	Zac Gallen	SP	RR	29	23
4	Kevin Ginkel	RP	LR	30	37
5	Tommy Henry	SP	LL	27	47
6	Brandon Hughes	RP	BL	28	56
7	Merrill Kelly	SP	RR	35	29
8	Joe Mantiply	RP	RL	33	35
9	Justin Martinez	RP	RR	23	63
10	Scott McGough	RP	RR	34	30
11	Cristian Mena	SP	RR	21	64
12	Jordan Montgomery	SP	LL	31	52
13	Ryne Nelson	SP	RR	26	19
14	Brandon Pfaadt	SP	RR	25	32
15	A.J. Puk	RP	LL	29	33
16	Eduardo Rodriguez	SP	LL	31	57
17	Paul Sewald	RP	RR	34	38
18	Ryan Thompson	RP	RR	32	81
19	Blake Walston	SP	LL	23	48
20	Adrian Del Castillo	C	RL	25	25
21	Jose Herrera	C	BR	27	11
22	Gabriel Moreno	C	RR	24	14
23	Blaze Alexander	SS	RR	25	9
24	Josh Bell	1B	BR	32	36
25	Jordan Lawlar	SS	RR	22	10
26	Ketel Marte	2B	BR	30	42
27	Kevin Newman	SS	RR	31	18
28	Geraldo Perdomo	SS	BR	24	2
29	Eugenio Suarez	3B	RR	33	28
30	Christian Walker	1B	RR	33	53
31	Jorge Barrosa	LF	BL	23	1
32	Corbin Carroll	CF	LL	24	7
33	Randal Grichuk	RF	RR	33	15
34	Lourdes Gurriel Jr.	LF	RR	31	12
35	Jake McCarthy	CF	LL	27	31
36	Pavin Smith	LF	LL	28	26
37	Alek Thomas	CF	LL	24	5
38	Joc Pederson	DH	LL	32	3
\.


--
-- TOC entry 4984 (class 0 OID 17064)
-- Dependencies: 229
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 4986 (class 0 OID 17072)
-- Dependencies: 231
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 4982 (class 0 OID 17058)
-- Dependencies: 227
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add player	1	add_player
2	Can change player	1	change_player
3	Can delete player	1	delete_player
4	Can view player	1	view_player
5	Can add log entry	2	add_logentry
6	Can change log entry	2	change_logentry
7	Can delete log entry	2	delete_logentry
8	Can view log entry	2	view_logentry
9	Can add permission	3	add_permission
10	Can change permission	3	change_permission
11	Can delete permission	3	delete_permission
12	Can view permission	3	view_permission
13	Can add group	4	add_group
14	Can change group	4	change_group
15	Can delete group	4	delete_group
16	Can view group	4	view_group
17	Can add user	5	add_user
18	Can change user	5	change_user
19	Can delete user	5	delete_user
20	Can view user	5	view_user
21	Can add content type	6	add_contenttype
22	Can change content type	6	change_contenttype
23	Can delete content type	6	delete_contenttype
24	Can view content type	6	view_contenttype
25	Can add session	7	add_session
26	Can change session	7	change_session
27	Can delete session	7	delete_session
28	Can view session	7	view_session
\.


--
-- TOC entry 4988 (class 0 OID 17078)
-- Dependencies: 233
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- TOC entry 4990 (class 0 OID 17086)
-- Dependencies: 235
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 4992 (class 0 OID 17092)
-- Dependencies: 237
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 4994 (class 0 OID 17150)
-- Dependencies: 239
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 4980 (class 0 OID 17050)
-- Dependencies: 225
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	testdb	player
2	admin	logentry
3	auth	permission
4	auth	group
5	auth	user
6	contenttypes	contenttype
7	sessions	session
\.


--
-- TOC entry 4978 (class 0 OID 17042)
-- Dependencies: 223
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-11-21 00:19:50.442489-07
2	auth	0001_initial	2024-11-21 00:19:50.493207-07
3	admin	0001_initial	2024-11-21 00:19:50.509268-07
4	admin	0002_logentry_remove_auto_add	2024-11-21 00:19:50.509761-07
5	admin	0003_logentry_add_action_flag_choices	2024-11-21 00:19:50.526812-07
6	contenttypes	0002_remove_content_type_name	2024-11-21 00:19:50.543215-07
7	auth	0002_alter_permission_name_max_length	2024-11-21 00:19:50.543215-07
8	auth	0003_alter_user_email_max_length	2024-11-21 00:19:50.543215-07
9	auth	0004_alter_user_username_opts	2024-11-21 00:19:50.543215-07
10	auth	0005_alter_user_last_login_null	2024-11-21 00:19:50.560191-07
11	auth	0006_require_contenttypes_0002	2024-11-21 00:19:50.560191-07
12	auth	0007_alter_validators_add_error_messages	2024-11-21 00:19:50.560191-07
13	auth	0008_alter_user_username_max_length	2024-11-21 00:19:50.576755-07
14	auth	0009_alter_user_last_name_max_length	2024-11-21 00:19:50.576755-07
15	auth	0010_alter_group_name_max_length	2024-11-21 00:19:50.59187-07
16	auth	0011_update_proxy_permissions	2024-11-21 00:19:50.593373-07
17	auth	0012_alter_user_first_name_max_length	2024-11-21 00:19:50.593373-07
18	sessions	0001_initial	2024-11-21 00:19:50.609309-07
19	testdb	0001_initial	2024-11-21 00:19:50.610039-07
20	testdb	0002_alter_player_bat_thr_alter_player_name_and_more	2024-11-21 00:19:50.610039-07
21	testdb	0003_remove_player_number	2024-11-21 00:19:50.610039-07
\.


--
-- TOC entry 4995 (class 0 OID 17178)
-- Dependencies: 240
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- TOC entry 4997 (class 0 OID 17188)
-- Dependencies: 242
-- Data for Name: testdb_player; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.testdb_player (id, player_id, name, "position", bat_thr, age) FROM stdin;
\.


--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 220
-- Name: Pitcher_p_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Pitcher_p_id_seq"', 1, false);


--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 217
-- Name: Players_player_pid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Players_player_pid_seq"', 1, false);


--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 228
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 230
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 226
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 28, true);


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 234
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 232
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 236
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 238
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 224
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 7, true);


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 222
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 241
-- Name: testdb_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.testdb_player_id_seq', 1, false);


--
-- TOC entry 4766 (class 2606 OID 16489)
-- Name: Hitter Hitter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Hitter"
    ADD CONSTRAINT "Hitter_pkey" PRIMARY KEY (h_id);


--
-- TOC entry 4764 (class 2606 OID 16473)
-- Name: Pitcher Pitcher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pitcher"
    ADD CONSTRAINT "Pitcher_pkey" PRIMARY KEY (p_id);


--
-- TOC entry 4762 (class 2606 OID 16434)
-- Name: Players Players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Players"
    ADD CONSTRAINT "Players_pkey" PRIMARY KEY (player_pid);


--
-- TOC entry 4780 (class 2606 OID 17176)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 4785 (class 2606 OID 17107)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 4788 (class 2606 OID 17076)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4782 (class 2606 OID 17068)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 4775 (class 2606 OID 17098)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 4777 (class 2606 OID 17062)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 4796 (class 2606 OID 17090)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 4799 (class 2606 OID 17122)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 4790 (class 2606 OID 17082)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 4802 (class 2606 OID 17096)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4805 (class 2606 OID 17136)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 4793 (class 2606 OID 17171)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 4808 (class 2606 OID 17157)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 4770 (class 2606 OID 17056)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 4772 (class 2606 OID 17054)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4768 (class 2606 OID 17048)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4812 (class 2606 OID 17184)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 4815 (class 2606 OID 17192)
-- Name: testdb_player testdb_player_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.testdb_player
    ADD CONSTRAINT testdb_player_pkey PRIMARY KEY (id);


--
-- TOC entry 4778 (class 1259 OID 17177)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 4783 (class 1259 OID 17118)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 4786 (class 1259 OID 17119)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 4773 (class 1259 OID 17104)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 4794 (class 1259 OID 17134)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 4797 (class 1259 OID 17133)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 4800 (class 1259 OID 17148)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 4803 (class 1259 OID 17147)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 4791 (class 1259 OID 17172)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 4806 (class 1259 OID 17168)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 4809 (class 1259 OID 17169)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 4810 (class 1259 OID 17186)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 4813 (class 1259 OID 17185)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 4817 (class 2606 OID 16490)
-- Name: Hitter Hitter_player_pid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Hitter"
    ADD CONSTRAINT "Hitter_player_pid_fkey" FOREIGN KEY (player_pid) REFERENCES public."Players"(player_pid);


--
-- TOC entry 4816 (class 2606 OID 16474)
-- Name: Pitcher Pitcher_player_pid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pitcher"
    ADD CONSTRAINT "Pitcher_player_pid_fkey" FOREIGN KEY (player_pid) REFERENCES public."Players"(player_pid);


--
-- TOC entry 4819 (class 2606 OID 17113)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4820 (class 2606 OID 17108)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4818 (class 2606 OID 17099)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4821 (class 2606 OID 17128)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4822 (class 2606 OID 17123)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4823 (class 2606 OID 17142)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4824 (class 2606 OID 17137)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4825 (class 2606 OID 17158)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4826 (class 2606 OID 17163)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2024-12-05 21:36:28

--
-- PostgreSQL database dump complete
--

