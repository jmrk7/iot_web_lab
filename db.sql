--
-- PostgreSQL database dump
--

-- Dumped from database version 12.10 (Debian 12.10-1.pgdg110+1)
-- Dumped by pg_dump version 12.10 (Debian 12.10-1.pgdg110+1)

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

--
-- Name: hdb_catalog; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA hdb_catalog;


ALTER SCHEMA hdb_catalog OWNER TO postgres;

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: gen_hasura_uuid(); Type: FUNCTION; Schema: hdb_catalog; Owner: postgres
--

CREATE FUNCTION hdb_catalog.gen_hasura_uuid() RETURNS uuid
    LANGUAGE sql
    AS $$select gen_random_uuid()$$;


ALTER FUNCTION hdb_catalog.gen_hasura_uuid() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: hdb_action_log; Type: TABLE; Schema: hdb_catalog; Owner: postgres
--

CREATE TABLE hdb_catalog.hdb_action_log (
    id uuid DEFAULT hdb_catalog.gen_hasura_uuid() NOT NULL,
    action_name text,
    input_payload jsonb NOT NULL,
    request_headers jsonb NOT NULL,
    session_variables jsonb NOT NULL,
    response_payload jsonb,
    errors jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    response_received_at timestamp with time zone,
    status text NOT NULL,
    CONSTRAINT hdb_action_log_status_check CHECK ((status = ANY (ARRAY['created'::text, 'processing'::text, 'completed'::text, 'error'::text])))
);


ALTER TABLE hdb_catalog.hdb_action_log OWNER TO postgres;

--
-- Name: hdb_cron_event_invocation_logs; Type: TABLE; Schema: hdb_catalog; Owner: postgres
--

CREATE TABLE hdb_catalog.hdb_cron_event_invocation_logs (
    id text DEFAULT hdb_catalog.gen_hasura_uuid() NOT NULL,
    event_id text,
    status integer,
    request json,
    response json,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE hdb_catalog.hdb_cron_event_invocation_logs OWNER TO postgres;

--
-- Name: hdb_cron_events; Type: TABLE; Schema: hdb_catalog; Owner: postgres
--

CREATE TABLE hdb_catalog.hdb_cron_events (
    id text DEFAULT hdb_catalog.gen_hasura_uuid() NOT NULL,
    trigger_name text NOT NULL,
    scheduled_time timestamp with time zone NOT NULL,
    status text DEFAULT 'scheduled'::text NOT NULL,
    tries integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    next_retry_at timestamp with time zone,
    CONSTRAINT valid_status CHECK ((status = ANY (ARRAY['scheduled'::text, 'locked'::text, 'delivered'::text, 'error'::text, 'dead'::text])))
);


ALTER TABLE hdb_catalog.hdb_cron_events OWNER TO postgres;

--
-- Name: hdb_metadata; Type: TABLE; Schema: hdb_catalog; Owner: postgres
--

CREATE TABLE hdb_catalog.hdb_metadata (
    id integer NOT NULL,
    metadata json NOT NULL,
    resource_version integer DEFAULT 1 NOT NULL
);


ALTER TABLE hdb_catalog.hdb_metadata OWNER TO postgres;

--
-- Name: hdb_scheduled_event_invocation_logs; Type: TABLE; Schema: hdb_catalog; Owner: postgres
--

CREATE TABLE hdb_catalog.hdb_scheduled_event_invocation_logs (
    id text DEFAULT hdb_catalog.gen_hasura_uuid() NOT NULL,
    event_id text,
    status integer,
    request json,
    response json,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE hdb_catalog.hdb_scheduled_event_invocation_logs OWNER TO postgres;

--
-- Name: hdb_scheduled_events; Type: TABLE; Schema: hdb_catalog; Owner: postgres
--

CREATE TABLE hdb_catalog.hdb_scheduled_events (
    id text DEFAULT hdb_catalog.gen_hasura_uuid() NOT NULL,
    webhook_conf json NOT NULL,
    scheduled_time timestamp with time zone NOT NULL,
    retry_conf json,
    payload json,
    header_conf json,
    status text DEFAULT 'scheduled'::text NOT NULL,
    tries integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    next_retry_at timestamp with time zone,
    comment text,
    CONSTRAINT valid_status CHECK ((status = ANY (ARRAY['scheduled'::text, 'locked'::text, 'delivered'::text, 'error'::text, 'dead'::text])))
);


ALTER TABLE hdb_catalog.hdb_scheduled_events OWNER TO postgres;

--
-- Name: hdb_schema_notifications; Type: TABLE; Schema: hdb_catalog; Owner: postgres
--

CREATE TABLE hdb_catalog.hdb_schema_notifications (
    id integer NOT NULL,
    notification json NOT NULL,
    resource_version integer DEFAULT 1 NOT NULL,
    instance_id uuid NOT NULL,
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT hdb_schema_notifications_id_check CHECK ((id = 1))
);


ALTER TABLE hdb_catalog.hdb_schema_notifications OWNER TO postgres;

--
-- Name: hdb_version; Type: TABLE; Schema: hdb_catalog; Owner: postgres
--

CREATE TABLE hdb_catalog.hdb_version (
    hasura_uuid uuid DEFAULT hdb_catalog.gen_hasura_uuid() NOT NULL,
    version text NOT NULL,
    upgraded_on timestamp with time zone NOT NULL,
    cli_state jsonb DEFAULT '{}'::jsonb NOT NULL,
    console_state jsonb DEFAULT '{}'::jsonb NOT NULL
);


ALTER TABLE hdb_catalog.hdb_version OWNER TO postgres;

--
-- Name: blockchain_clouds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blockchain_clouds (
    id integer NOT NULL,
    name bpchar NOT NULL,
    src bpchar NOT NULL
);


ALTER TABLE public.blockchain_clouds OWNER TO postgres;

--
-- Name: blockchain_clouds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blockchain_clouds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blockchain_clouds_id_seq OWNER TO postgres;

--
-- Name: blockchain_clouds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blockchain_clouds_id_seq OWNED BY public.blockchain_clouds.id;


--
-- Name: blockchain_technologies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blockchain_technologies (
    id integer NOT NULL,
    name bpchar NOT NULL,
    icon bpchar NOT NULL
);


ALTER TABLE public.blockchain_technologies OWNER TO postgres;

--
-- Name: blockchain_technologies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blockchain_technologies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blockchain_technologies_id_seq OWNER TO postgres;

--
-- Name: blockchain_technologies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blockchain_technologies_id_seq OWNED BY public.blockchain_technologies.id;


--
-- Name: customer_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_requests (
    id integer NOT NULL,
    name bpchar NOT NULL,
    email bpchar NOT NULL,
    subject bpchar NOT NULL,
    message text NOT NULL,
    link bpchar,
    file bytea
);


ALTER TABLE public.customer_requests OWNER TO postgres;

--
-- Name: TABLE customer_requests; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.customer_requests IS 'customer requests';


--
-- Name: customer_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_requests_id_seq OWNER TO postgres;

--
-- Name: customer_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_requests_id_seq OWNED BY public.customer_requests.id;


--
-- Name: ecommerce_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ecommerce_scope (
    id integer NOT NULL,
    name bpchar NOT NULL,
    text text NOT NULL,
    icon bpchar
);


ALTER TABLE public.ecommerce_scope OWNER TO postgres;

--
-- Name: ecommerce_scope_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ecommerce_scope_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ecommerce_scope_id_seq OWNER TO postgres;

--
-- Name: ecommerce_scope_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ecommerce_scope_id_seq OWNED BY public.ecommerce_scope.id;


--
-- Name: features; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.features (
    id integer NOT NULL,
    title bpchar NOT NULL,
    text text NOT NULL,
    callout bpchar,
    subtitle bpchar NOT NULL
);


ALTER TABLE public.features OWNER TO postgres;

--
-- Name: TABLE features; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.features IS 'List of Features section items  ';


--
-- Name: features_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.features_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.features_id_seq OWNER TO postgres;

--
-- Name: features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.features_id_seq OWNED BY public.features.id;


--
-- Name: hero_carusel_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hero_carusel_item (
    id integer NOT NULL,
    src bpchar NOT NULL,
    heading text NOT NULL,
    "subHeading" text NOT NULL
);


ALTER TABLE public.hero_carusel_item OWNER TO postgres;

--
-- Name: TABLE hero_carusel_item; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.hero_carusel_item IS 'Information of item in Hero carusel';


--
-- Name: hero_carusel_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hero_carusel_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hero_carusel_item_id_seq OWNER TO postgres;

--
-- Name: hero_carusel_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hero_carusel_item_id_seq OWNED BY public.hero_carusel_item.id;


--
-- Name: partners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partners (
    id integer NOT NULL,
    name bpchar NOT NULL,
    url bpchar,
    logo_url bpchar
);


ALTER TABLE public.partners OWNER TO postgres;

--
-- Name: TABLE partners; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.partners IS 'partners';


--
-- Name: partners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.partners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partners_id_seq OWNER TO postgres;

--
-- Name: partners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.partners_id_seq OWNED BY public.partners.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    description text,
    challenge json,
    solution json,
    technologies json,
    urls json,
    integrations json,
    name bpchar NOT NULL,
    url_img text
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Name: TABLE projects; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.projects IS 'projects';


--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: scope_area; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scope_area (
    id integer NOT NULL,
    title bpchar NOT NULL,
    subtitle text,
    tools json,
    svg bpchar,
    description text,
    collout text
);


ALTER TABLE public.scope_area OWNER TO postgres;

--
-- Name: TABLE scope_area; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.scope_area IS 'skopes of solutions';


--
-- Name: skopes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skopes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skopes_id_seq OWNER TO postgres;

--
-- Name: skopes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skopes_id_seq OWNED BY public.scope_area.id;


--
-- Name: technologies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.technologies (
    id integer NOT NULL,
    title bpchar NOT NULL,
    svg bpchar NOT NULL
);


ALTER TABLE public.technologies OWNER TO postgres;

--
-- Name: technologies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.technologies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.technologies_id_seq OWNER TO postgres;

--
-- Name: technologies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.technologies_id_seq OWNED BY public.technologies.id;


--
-- Name: websites_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.websites_types (
    id integer NOT NULL,
    name bpchar NOT NULL,
    icon bpchar,
    image bpchar,
    benefits json,
    text text,
    additional_text text
);


ALTER TABLE public.websites_types OWNER TO postgres;

--
-- Name: websites_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.websites_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.websites_types_id_seq OWNER TO postgres;

--
-- Name: websites_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.websites_types_id_seq OWNED BY public.websites_types.id;


--
-- Name: blockchain_clouds id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blockchain_clouds ALTER COLUMN id SET DEFAULT nextval('public.blockchain_clouds_id_seq'::regclass);


--
-- Name: blockchain_technologies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blockchain_technologies ALTER COLUMN id SET DEFAULT nextval('public.blockchain_technologies_id_seq'::regclass);


--
-- Name: customer_requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_requests ALTER COLUMN id SET DEFAULT nextval('public.customer_requests_id_seq'::regclass);


--
-- Name: ecommerce_scope id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecommerce_scope ALTER COLUMN id SET DEFAULT nextval('public.ecommerce_scope_id_seq'::regclass);


--
-- Name: features id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.features ALTER COLUMN id SET DEFAULT nextval('public.features_id_seq'::regclass);


--
-- Name: hero_carusel_item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero_carusel_item ALTER COLUMN id SET DEFAULT nextval('public.hero_carusel_item_id_seq'::regclass);


--
-- Name: partners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners ALTER COLUMN id SET DEFAULT nextval('public.partners_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: scope_area id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_area ALTER COLUMN id SET DEFAULT nextval('public.skopes_id_seq'::regclass);


--
-- Name: technologies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.technologies ALTER COLUMN id SET DEFAULT nextval('public.technologies_id_seq'::regclass);


--
-- Name: websites_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.websites_types ALTER COLUMN id SET DEFAULT nextval('public.websites_types_id_seq'::regclass);


--
-- Data for Name: hdb_action_log; Type: TABLE DATA; Schema: hdb_catalog; Owner: postgres
--

COPY hdb_catalog.hdb_action_log (id, action_name, input_payload, request_headers, session_variables, response_payload, errors, created_at, response_received_at, status) FROM stdin;
\.


--
-- Data for Name: hdb_cron_event_invocation_logs; Type: TABLE DATA; Schema: hdb_catalog; Owner: postgres
--

COPY hdb_catalog.hdb_cron_event_invocation_logs (id, event_id, status, request, response, created_at) FROM stdin;
\.


--
-- Data for Name: hdb_cron_events; Type: TABLE DATA; Schema: hdb_catalog; Owner: postgres
--

COPY hdb_catalog.hdb_cron_events (id, trigger_name, scheduled_time, status, tries, created_at, next_retry_at) FROM stdin;
\.


--
-- Data for Name: hdb_metadata; Type: TABLE DATA; Schema: hdb_catalog; Owner: postgres
--

COPY hdb_catalog.hdb_metadata (id, metadata, resource_version) FROM stdin;
1	{"sources":[{"kind":"postgres","name":"iotweblab","tables":[{"table":{"schema":"public","name":"blockchain_clouds"}},{"table":{"schema":"public","name":"blockchain_technologies"}},{"table":{"schema":"public","name":"customer_requests"}},{"table":{"schema":"public","name":"ecommerce_scope"}},{"table":{"schema":"public","name":"features"}},{"table":{"schema":"public","name":"hero_carusel_item"}},{"table":{"schema":"public","name":"partners"}},{"table":{"schema":"public","name":"projects"}},{"table":{"schema":"public","name":"scope_area"}},{"table":{"schema":"public","name":"technologies"}},{"table":{"schema":"public","name":"websites_types"}}],"configuration":{"connection_info":{"use_prepared_statements":false,"database_url":{"from_env":"PG_DATABASE_URL"},"isolation_level":"read-committed"}}}],"version":3}	32
\.


--
-- Data for Name: hdb_scheduled_event_invocation_logs; Type: TABLE DATA; Schema: hdb_catalog; Owner: postgres
--

COPY hdb_catalog.hdb_scheduled_event_invocation_logs (id, event_id, status, request, response, created_at) FROM stdin;
\.


--
-- Data for Name: hdb_scheduled_events; Type: TABLE DATA; Schema: hdb_catalog; Owner: postgres
--

COPY hdb_catalog.hdb_scheduled_events (id, webhook_conf, scheduled_time, retry_conf, payload, header_conf, status, tries, created_at, next_retry_at, comment) FROM stdin;
\.


--
-- Data for Name: hdb_schema_notifications; Type: TABLE DATA; Schema: hdb_catalog; Owner: postgres
--

COPY hdb_catalog.hdb_schema_notifications (id, notification, resource_version, instance_id, updated_at) FROM stdin;
1	{"metadata":false,"remote_schemas":[],"sources":[]}	32	9afa1be0-4b8a-4cf8-8566-808b06bbd1b9	2022-03-01 13:56:20.993921+00
\.


--
-- Data for Name: hdb_version; Type: TABLE DATA; Schema: hdb_catalog; Owner: postgres
--

COPY hdb_catalog.hdb_version (hasura_uuid, version, upgraded_on, cli_state, console_state) FROM stdin;
9e753273-de81-4cb3-90ce-ef767064dcfb	47	2022-03-01 13:55:35.3171+00	{}	{"onboardingShown": true, "console_notifications": {"admin": {"date": "2022-03-10T08:48:01.779Z", "read": [], "showBadge": false}}, "telemetryNotificationShown": true}
\.


--
-- Data for Name: blockchain_clouds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blockchain_clouds (id, name, src) FROM stdin;
1	Oracle Blockchain Cloud Service	/services/oracle.png
2	IBM Blockchain Platform	/services/ibm2.png
3	Azure Blockchain Workbench	/services/azure2.png
4	Amazon Managed Blockchain	/services/aws2.png
5	Google Cloud Platform	/services/google2.png
\.


--
-- Data for Name: blockchain_technologies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blockchain_technologies (id, name, icon) FROM stdin;
1	Ethereum	/services/blockchain/ethereum.svg
2	Parity	/services/blockchain/parity.svg
3	Hyperledger Fabric	/services/blockchain/hlf.svg
4	Hyperledger Sawtooth	/services/blockchain/hyperledger-sawtooth.svg
5	Hyperledger Indy	/services/blockchain/hyperledger-indy.svg
6	EOS	/services/blockchain/eosio.svg
7	Corda R3	/services/blockchain/icon-r3.svg
8	Stellar	/services/blockchain/stellar-seeklogo.svg
9	Exonum	/services/blockchain/icon-exonum.svg
10	Multichain	/services/blockchain/icon-multichain.svg
11	NXT	/services/blockchain/icon-nxt.svg
\.


--
-- Data for Name: customer_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_requests (id, name, email, subject, message, link, file) FROM stdin;
1	Marvall	yariknarik.xxx@gmail.com	WebSite	How cost the landing with 15 sections?	\N	\N
30	asdasd	asd@aa.ss	asdasdasd	asdasdasdasdasd	\N	\N
31	asdas	asdas@ff.ff	asdasdasdasdasdas	asdasdasdasdasdasd	\N	\N
32	asdasd	asda@sdasd.asd	asdasd	asdasdasdasda	\N	\N
33	asd	asdasd	asda	sdasd	\N	\N
34	NAme	asda@gg.do	asdasd	asdasdasdasdasdasdsa	\N	\N
35	asdasdas	asdas@gg.asd	asdasd	asdasdsaddasd	\N	\N
36	asd	asda@asd.sds	asdasdasd	asdasdasdasdasdasd	\N	\N
37	asd	asda@sd.sd	asdasd	asdasdasdasdasdasdas	\N	\N
38	asdasd	aasd@ss.ss	asdasd	asdasdasdasdad	\N	\N
40	asdasdasda	sdfsdf@sdf.dd	asdasdasdas	asdasdasdasdasdasd	asdasdasdasdasdasdasd	\N
41	asdasdasda	sdfsdf@sdf.dd	asdasdasdas	asdasdasdasdasdasd	asdasdasdasdasdasdasd	\N
42	NAme	ASD@sads.sds	asdasd	asdasdasdasdasd	asdasdasda	\N
43	NAme 	mail@mail.ss	Hey	sadasdasdasdasd	limnl/sd	\N
44						\N
45	Name	Asd@sd.sd	sadasdasdasd	sdasdasdasdasd	asdasdasda	\\x5b6f626a6563742041727261794275666665725d
46	Name	dsf@asd.com	asdasdas	as;kdjajs;dlal;sdl;aksldkl;asdl;		\\x5b6f626a6563742041727261794275666665725d
47	NAmee	sad@gv.sd	ASdasdk;	asdasdasdasdasd	null	\\x6e756c6c
48	asda	asdasdasa@sd.sd	asdasd	dasdasdasdasd	asdasdas	\\x5b6f626a6563742041727261794275666665725d
49	asdaa	sd@asd.sds	asd	asdasdasdasdasdasdas	asdasdasdac.sadasda	\\x5b6f626a6563742041727261794275666665725d
50	asdasd	asd@asd.sds	asdasdasd	asdasdasdasd	asdasdasd	\\x756e646566696e6564
51	asdasd	asda@sd.dds	asdasdasasdas	asdasdasdasdasd	asdasdasd	\\x756e646566696e6564
52	asdas	asdasd@sd.sd	asdasd	asdasdasdasdasd	asdasda	\\x756e646566696e6564
53	asdas	asdasda@wsdss.dsd	sdasda	asdasdasdasdasd	asdasdasda	\\x756e646566696e6564
54	asdsdasda	asssda@sd.sd	asdasd	asdasdasdasd	asdasd	\\x756e646566696e6564
55	12311	QWEQWE@SD.SDS	ASDASD	asdasdasdasd	ASDasdasd	\\x756e646566696e6564
56	asdasd	asdasdasd@sds.sd	asdasdasd	asdasdasdasd	asdasdasdasd	\\x756e646566696e6564
57	Marvall	marvallff@gmail.com	HowtoCreate	I find develoret how make sute for me	marvall.com	\\x756e646566696e6564
58	asdas	asdasdasd@sdsd.sd	asdasdasdas	asdasdasdasdasdasd	dasdasdasdasd	\\x756e646566696e6564
59	asdasdasdas	asdasdasdsa@asd.sd	asdasdasd	asdasdasdasdasdasdasd	asdasdasdasd	\\x756e646566696e6564
60	asdasda	asdasdsssasd@sds.sd	asdasdasd	asdasdasdasdasd	undefined	\\x756e646566696e6564
\.


--
-- Data for Name: ecommerce_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ecommerce_scope (id, name, text, icon) FROM stdin;
1	B2B	The niche "Business for business" implies commercial relations between legal entities, economic entities of the market. That is, companies, manufacturers interact with each other - conclude deals, partnership contracts for the supply, sale, purchase of goods or services. To establish contacts, search for partners and negotiate in B2B, specialized Internet platforms, interactive databases are used.	/services/Ecommerce/b2b.svg
2	B2C	The sphere "Business for the consumer" involves the trade in goods and services between legal entities and individuals. This is a kind of retail sales, but only with the help of online platforms - shops, services, banks, and so on. The advantage of customers in a larger range of choices, ease of ordering and delivery of goods to your home or office. E-commerce allows an entrepreneur to reduce the cost of maintaining retail and warehouse space.	/services/Ecommerce/b2c.svg
3	B2E	The sphere of relations with personnel can also be commercialized. "Business for employees" implies the use of various automation systems for managing business processes and corporate tasks. Such systems are combined into an intracorporate network - an intranet, which has access to the global system through secure channels.	/services/Ecommerce/b2e.svg
4	B2G	The “Business for Government” niche includes the following market participants: legal entities - companies, corporations, brands on the one hand, and municipal authorities, government agencies - on the other. A striking example is the public procurement portal of the Russian Federation. Transactions in B2G are carried out on the basis of competitions, tenders or quotations. This area of e-commerce operates with large transaction sizes, which places strict requirements on market participants. The company participating in the auction must have a high status and impeccable reputation.	/services/Ecommerce/b2g.svg
5	B2P	The "Business for Partners" niche is a commercial relationship with service and product providers, between affiliates, partner organizations of the same network, or third-party companies.	/services/Ecommerce/b2p.svg
6	C2B	An interesting type of e-commerce "Consumer for the company", where the client himself sets the cost of goods and services. That is, buyers, by voting, determine the price for which they would like to purchase the proposed product. However, the final decision “to sell or not” is made by the owner of the product. In the C2B system, the site or any other electronic platform acts as an intermediary broker who is looking for sellers for the formed price of potential buyers.	/services/Ecommerce/c2b.svg
7	C2C	E-commerce in the "Consumer to Consumer" niche involves transactions between individuals. The success of such Internet sites as Avito, Yula, Ebay, Molotok and others is based on the commercial relations of users through the electronic ad system.	/services/Ecommerce/c2c.svg
8	E2E	A highly specialized type of e-commerce "Exchange for the exchange", when sellers and buyers interact between various electronic exchanges. For example, e-currency exchange services.	/services/Ecommerce/e2e.svg
9	G2C	Quite a popular type of e-commerce in recent years is "Government for Citizens" - providing access to government information through online services. For example, payment of taxes and fines, registration of projects and forms of commercial activity, obtaining permits and more. This category also includes information support for citizens, so G2C does not fully belong to the commercial niche.	/services/Ecommerce/g2c.svg
10	G2G	The sphere of e-commerce "Government for Government" implies business relations between government agencies: the supply of products, the provision of services, and so on. Such interaction is realized through online technologies.	/services/Ecommerce/g2g.svg
11	B2B2C	An example of combining two types of e-commerce is Business to Business and Consumer. Integration of B2B and B2C systems in a single platform. For example, a company purchases goods in China, enters into contracts with Cargo warehouses to send orders to buyers' addresses. It turns out the chain: the seller company (B2B) - the warehouse (B2B) - the buyer (B2C)	/services/Ecommerce/b2b2c.svg
\.


--
-- Data for Name: features; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.features (id, title, text, callout, subtitle) FROM stdin;
\.


--
-- Data for Name: hero_carusel_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hero_carusel_item (id, src, heading, "subHeading") FROM stdin;
1	pexels-andrea-piacquadio-3884440.jpg	SOFTWARE DEVELOPMENT	Desktop, Web and Mobile development with the hint of data-science and data-engineering.
2	pexels-peter-olexa-4012966.jpg	UI/UX DESIGN	Great products are designed around users. From ideation to prototyping and design, we have got you covered.
3	pexels-thirdman-5961072.jpg	DIGITAL MARKETING	Modern approaches to the implementation of digital marketing tasks. Seo-optimization, as well as solutions for offline advertising companies.
4	pexels-andrea-piacquadio-3830745.jpg	OUTSOURCE & OUTSTAFF	Hire flexible, on-demand remote UI/UX Designers, Software Developers, Project Managers and QA Engineers to help you manage dynamic workloads and new projects.
\.


--
-- Data for Name: partners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partners (id, name, url, logo_url) FROM stdin;
1	Walter Films	http://www.walterfilms.tv/	http://www.walterfilms.tv/wp-content/uploads/2012/08/walter-films-camera-carre6.png
2	Chanel	https://www.chanel.com/	https://www.chanel.com/media/images/apple-touch-icon-152x152.png
3	Dygma	https://www.dygma.com/	https://www.dygma.com/wp-content/themes/dygma_theme/img/animlogo.svg
4	Maxihost	https://www.maxihost.com/	https://downloads.intercomcdn.com/i/o/137289/65ba56132d4af8ffc67b8160/46c12f629087ccc3ae7aae6df2b79adc.png
5	FriendFilter	https://friendfilter.io/	https://friendfilter.io/images/logo.png
6	InfiniGrow	https://infinigrow.com/	https://media-exp1.licdn.com/dms/image/C4D0BAQHBEbryHT4f6A/company-logo_200_200/0?e=1595462400&v=beta&t=VnP_zF7v42rcah-C78ReeI2BkBB_XtuLE9GYVde1Afo
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (id, description, challenge, solution, technologies, urls, integrations, name, url_img) FROM stdin;
3		\N	\N	\N	["https://dimusco.com/"]	\N	Dimusco	\N
5	Upgrade UI	["Design"]	["Design Development","Design Implementation"]	["Java","Spring","JavaScript","VueJS, VueX","PostgreSQL"]	["https://www.travelinsurancemaster.com/"]	\N	Travel Insuranse	\N
10	\N	["Having information is not enough nowadays. It's much more important to use it in a right way. The goal was to create a solution to gather the collective intelligence of people and help them improve their impact within communities."]	["Using data analysis algorithms, graph technology and blockchain, protecting the Users security, NetworkOS represents a cutting-edge collaborative tool based on data sharing. It enables people knowing how their team, community or group is performing. It activates people and increases the opportunities of networking."]	["JavaScript","ReactJS","Apollo","GraphQL","PostgreSQL","Redis"]	["https://www.collaboration.ai/","https://os.collaboration.ai/networkos"]	["AWS","SendGrid","Ethereum"]	Collaboration	\N
12	\N	\N	\N	["TypeScript","Angular"]	["https://dvc.org/"]	\N	DVC	\N
13	\N	\N	\N	["TypeScript","Angular"]	["https://www.smartlifepath.com/web-site/home"]	\N	SmartLifePath	\N
2	FACEBOOK Chrome Extension Development / FACEBOOK API Integration	["MVP App support","Chrome Extension updates","New Features Development","UI/UX updates","Payment Subscription Integtration"]	["Customer Support","Chrome Extension Development and Testing","API Application Development","Stripe API Development Integration"]	["JavaScript","VueJS / VueX","Ruby (ActiveREcord)","Stripe","Facebook API","Chrome Extension API","PostgreSQL","AWS S3","Digital Ocean","DevOPS","Third party API integration (FreshDesk API, TapAffiliate API)"]	["https://app.friendfilter.io/","https://friendfilter.io/","https://chrome.google.com/webstore/detail/friendfilter-for-facebook/bbahhbngjiangjdlmleihmlphoamikhg?hl=en"]	\N	FriendFilter	https://app.friendfilter.io/img/friendfilter_logo.579102a1.svg
1	Desktop Multiplatform Game Keyboard Configurator Application	["Connection and communication between Arduino and Application","Reset Arduino to default settings","Firmware updates","One touch setup, one touch text-creator","Usage external API for Arduino updates","New UI/UX Development","Multiplatform Development (Mac, Linux, Windows)"]	["Development Arduino listeners","Development Arduino flasher, firmware updates","Macros Development and Integration","Bazecor API Development and update","Development and update UI","Testing under Multiplatform"]	["JavaScript","C++","Arduino","BOSSA-Arduino","ReactJS","Material UI","ElectronJS","Lerna API","SerialPortJS","NodeJS"]	["https://github.com/Dygmalab/Bazecor","https://github.com/Dygmalab/Bazecor-api"]	\N	Dygma	projects/dygma.png
4	Marketing Platform/Dashboard Development	["Application Development/updates","Multicurrency Integration"]	["Application Dashboard Development","Testing"]	["JavaScript","ReactJS","NodeJS","MobX","Third party API integration (Facebook, LinkedIn, YouTube, Twitter, Google, Pinterest)"]	["https://infinigrow.com"]	\N	Infinigrow	projects/infinity.png
6	Finance Tax Application Development	["Architecture Development","Strapi Application Development","Own Email Server Development"]	["Architecture Implementation","Application Development","Testing"]	["JavaScript","NodeJS","REST API","ReactJS"]	["http://taxfinance.itjedi.co.nz/"]	\N	Tax Finance	projects/tax_finance.png
7	\N	\N	\N	\N	["https://lunie.io/"]	\N	Luine	projects/lunie.png
8	Web Development / Deployment	["Web Development"]	["Web Development","Testing"]	["JavaScript","NextJS","ReactJS"]	["https://www.maxihost.com/"]	\N	Maxihost	projects/maxihost.png
11	\N	\N	\N	["ReactJS","Apollo Server","Apollo Client","GraphQL"]	["https://www.humanos.me/"]	\N	HumanOS	projects/human_os.png
9	IOS Remote Control Application / Desktop Application	["Desktop Application Development","IOS Remote Control Application for Desktop Application"]	["Design","IOS Application Development","Server Rendering Development","Desktop Application Development"]	["JavaScript","ElectronJS","React Native","PHP"]	["https://www.chanel.com/","http://www.walterfilms.tv/"]	\N	Chanel	projects/chanel.png
\.


--
-- Data for Name: scope_area; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scope_area (id, title, subtitle, tools, svg, description, collout) FROM stdin;
1	Industry	Production automation	["Production automation tools","Prototyping and design","Integration of devices and services","Administration and control systems"]	icon/industry-15.svg	\N	01
6	Finance	Market and bank instruments	["Implementation of E-commerce services","Bank plugin implementation","Implementation and developing accounting services","Analysis tools developing"]	icon/dollar-svgrepo-com.svg	\N	06
5	Clouds	Databases and clouds	["Data storage architecture design","Data analysis systems","SQL query optimization","Running of your projects in Amazon Cloud Services or Google Cloud"]	icon/cloud-svgrepo-com.svg	\N	05
4	Marketplace	Retail and wholesale	["Analysis and statistics tools","Implementation of E-commerce services","Development and launch of trading platforms and marketplaces","Development of plugins for popular marketplaces"]	icon/grocery-15.svg	\N	04
3	Media	Digital technologies	["Media content tools","Billing systems","Implementation of communication services and voip tools","Software development for broadcasting systems"]	icon/play-button-svgrepo-com.svg	\N	03
2	Marketing	Product promotion tools	["SEO-optimization","Social media tools","Analysis and content implementation","Contextual advertising tools","Tools for mailing and feedback"]	icon/1515442620.svg	\N	02
\.


--
-- Data for Name: technologies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.technologies (id, title, svg) FROM stdin;
1	Javascript	icon/tech/javascript2.svg
2	Apollo	icon/tech/apollo.svg
3	AWS	icon/tech/aws.svg
4	Django	icon/tech/django.svg
5	Firebase	icon/tech/firebase.svg
6	Typescript	icon/tech/typescript2.svg
7	Graphql	icon/tech/graphQL.svg
8	Hasura	icon/tech/hasura.svg
9	Heroku	icon/tech/heroku2.svg
10	Laravel	icon/tech/laravel.svg
11	MariaDB	icon/tech/mariadb.svg
12	MongoDB	icon/tech/mongodb2.svg
13	Mysql	icon/tech/mysql.svg
14	Nest	icon/tech/nest.svg
15	.NET	icon/tech/net3.svg
16	Node	icon/tech/node.svg
17	Nuxt	icon/tech/nuxt.svg
18	PHP	icon/tech/php.svg
19	Postgres	icon/tech/postgresql.svg
20	Python	icon/tech/python.svg
21	Ruby & Rails	icon/tech/rails.svg
22	React	icon/tech/react.svg
23	Redux	icon/tech/redux.svg
24	Vue	icon/tech/vue.svg
25	Quasar	icon/tech/quasar.svg
26	Angular	icon/tech/angular.svg
27	React Native	icon/tech/react-native.svg
\.


--
-- Data for Name: websites_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.websites_types (id, name, icon, image, benefits, text, additional_text) FROM stdin;
1	Website-Card	\N	/services/websites/landing.png	["low cost of creation","quick launch","it is possible to upgrade to more advanced types of websites (but this possibility should be discussed in advance)"]	A business card site is, one might say, the ancestor of the Internet. It was this type of sites that stood at the dawn of the emergence of the global network. Of course, now such business pages have visually changed, become more beautiful and more elegant. But the very essence remains the same. What is a business card site? These are just a few pages: information about the company, information about the goods sold / services provided, contact information. There may be several more sections such as Promotions, News and the like. The presented information is static, that is, the business card site does not assume active user interaction with the site. Of all the interaction with the client, only a feedback form for sending email directly from the site.	\N
2	CORPORATE WEBSITE	\N	\N	["centralized repository of detailed information about the company, products and services","a large amount of reference information for user support","various help services for choosing goods and services: calculators and the like","the possibility of interaction between employees of the organization through internal services","actively attracting customers through customer focus"]	A corporate website is understood as a multifunctional website of an organization, the purpose of which is both to convey information to the client and directly to pursue commercial goals. That is, this is a site that works for your business.  When compared with the previous type of web sites - business cards, the following analogy is obtained. There you handed a small business card and said goodbye in the hope that you will someday be remembered. Here you immediately give the most complete amount of information, almost a book, which has everything to solve the needs of the client. This is not just a business card, it is already a full-fledged office with all its advantages.  Just as a person is greeted by their appearance, a company is greeted by its website. As a rule, the client always, even if unconsciously, sees / feels seriousness in intentions (or lack of it). A corporate website is a great way to show a serious attitude to business.  Moreover, by creating a corporate type of site, you give the client what he needs. The client feels the respect shown to him when he sees how much necessary and useful information has been created and posted specially for him. Pleasant design, convenient management, reliable and regularly updated information - these are the characteristic features that distinguish a corporate website from business cards.  Well, okay, all of the above is somewhat subjective (although verified from personal experience), so let's add objectivity and highlight the specific pros and cons of a corporate website.	\N
3	PORTAL	\N	\N	\N	The portal is, in fact, a heavily pumped and improved corporate website. This type of site is aimed at a much wider range of users and is designed to make their lives much easier in all available ways.  An example of portal functionality: posting and displaying photos, audio and video in the form of convenient galleries and playlists, reading, viewing and listening online, forums, blogs and user diaries, ratings, voting, a commenting and comment management system, private messaging between users, etc. Further. This list is endless. The main feature of the portal is a very active interaction with visitors. There can be thousands of types of these interactions. Each audience has its own needs, and it is the portal site that is able to satisfy them all.  Actually, it is on this that the success or failure of the portal is built. The main thing is to understand the needs of your target audience. If you know what your users need, then you can give it to them through the Internet portal. A portal is a modern look and feel for a site that allows you to effectively meet the needs of your audience. Thus, you will undoubtedly make your business successful. A properly designed portal is a guarantee that everything will work out for you.	\N
4	SITE-CATALOG	\N	/services/websites/catalog.png	\N	A catalog is a site with a showcase of goods, but without the ability to add them to the cart and place an order. The purchase of goods from the catalog is made through e-mail, telephone or other means of communication with the owner of the resource.	It is worth noting that at this point in time, a catalog website is not the best solution for business (the exception is catalogs with expensive goods, such as special equipment, cars, etc.). Clients are now picky: he needs to be simple and convenient. And what is simple and convenient in that he has to look for an opportunity to contact the owner of the catalog, spend time communicating with them, and only after going through this difficult path, the client will finally be able to get what he needs. In general, this is not the best type of site for developing an online business.  Of course, there are situations when a company has some kind of unique offer or an individual approach to pricing for each person. But even in this case, everything can be automated! Customers will be grateful to you if you screw on the usual shopping cart and give them the opportunity to place an order. But then the next type of site will already turn out.
5	SITE SERVICE	\N	\N	\N	The service, as a rule, is focused on solving one or more of the same type of customer needs.  The best example would be online consultants. Probably, each of us met pop-up windows on modern sites with an appeal from managers or an offer to enter our number so that they would quickly call us back and advise. So, such online assistants are an example of a service - a type of site that provides services to meet a specific user need.  The same cloud hosting (Dropbox, Yandex.Disk), video hosting (Youtube, RuTube), various services for online file conversion, etc. — are a prime example of good and useful service.  There are a huge number of services on the Internet, new ones appear every day. In order to create your own successful service, you just need to understand what people lack. Guess how to solve someone's problem, become useful to people - and the service will certainly succeed. Of course, provided that it is developed and put into operation by professionals. Since a cool idea without a competent technical implementation is most likely to fail.	\N
6	ONLINE STORE		/services/websites/store.png	["the possibility of buying with a few clicks of the mouse","wide audience coverage (no geo-referencing)","unlimited number of products in the showcase","24/7 availability","the ability to compare and evaluate products","low prices due to lower costs compared to an offline store"]	An online store is a form of electronic commerce that allows consumers to purchase goods or services using a web browser. Consumers find the product of interest by visiting the retailer's website directly or by searching among alternative suppliers. Trading can take place through a small local store, a large retailer, an e-commerce store, or an individual who sells goods through a third-party service. If you need to know what an online store is and how it works, in this article we will describe in detail its structure and tell you how to run a successful online business. The online store has a rather complex structure, which includes both the main menu and submenu elements. The main menu should display the most important information about product categories and promotions. One of the best ways to know which pages to include in the navigation bar and which to skip or use as part of a dropdown is to view user flow data in Google Analytics.	 An example of a successfully created structure can be seen on the websites of many sports brands. Each site displays very simple navigation, despite the fact that the site offers a wide variety of products. This simplicity makes sense. When you want to shop for shorts, you wouldn't want to start with the shorts category because it will show products for both men and women. Instead, when you land on a global sports brand site, you can start by scrolling through the main category you need, and then the options get more and more specific. In this case, the main category is half-customer.  The structure of the online store is based on the "from simple to complex" model, where each category contains even more categories. The structure of a good service includes a convenient search by category, which should be displayed both on the main page and in subcategories.
7	LANDING	\N	\N	\N	Landing or landing page (landing page) is a one-page type of site for capturing the attention of the client for the subsequent performance of the targeted action. A minimum of all distractions: the landing page contains only key information that can interest and encourage you to make a purchase of a product or order services.  Other names for a landing page are a landing page, a capture page.  What is the correct landing?  First, it is a simple and user-friendly design. Due to its lightness, the landing page loads quickly and does not cause unnecessary questions.  Secondly, the landing page contains key information about why the client should make a purchase or take another targeted action (for example, subscribe to a newsletter). Benefits, time-limited promotions, high-quality photos, calls to action are the main points that make up a landing page.  Now there is a real flowering of landings. And there are reasons for this. The main advantage of this type of sites is increased conversion due to narrow focus (a specific product / service for a specific audience). Nothing superfluous - that's the secret to the success of the capture page.  Unlike a huge storefront of an online store, a landing page visitor sees only one thing. When we do not have a wide choice, then often we are even glad of this - there is no need to waste time and energy on comparison and choice.  The disadvantage of landing is just its advantage in the form of a narrow focus. It's like a double-edged sword. If you have a second (third, tenth, thousandth) product / service, then there are two ways out. The first one is once again to make a new landing page for it. The second is to create an online store with a wide range of products.  Some owners of online stores use landing pages at the same time. And this is quite justified. For example, they have a very popular product on sale. It sells well in the store, but if you additionally organize a landing page specifically for this product, then sales will go even better. This tactic of simultaneously attacking on all fronts is becoming more common in online commerce. Why not? After all, it is effective and does not require special costs.	\N
\.


--
-- Name: blockchain_clouds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blockchain_clouds_id_seq', 5, true);


--
-- Name: blockchain_technologies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blockchain_technologies_id_seq', 11, true);


--
-- Name: customer_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_requests_id_seq', 60, true);


--
-- Name: ecommerce_scope_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ecommerce_scope_id_seq', 11, true);


--
-- Name: features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.features_id_seq', 1, false);


--
-- Name: hero_carusel_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hero_carusel_item_id_seq', 4, true);


--
-- Name: partners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partners_id_seq', 6, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 13, true);


--
-- Name: skopes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skopes_id_seq', 6, true);


--
-- Name: technologies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.technologies_id_seq', 24, true);


--
-- Name: websites_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.websites_types_id_seq', 7, true);


--
-- Name: hdb_action_log hdb_action_log_pkey; Type: CONSTRAINT; Schema: hdb_catalog; Owner: postgres
--

ALTER TABLE ONLY hdb_catalog.hdb_action_log
    ADD CONSTRAINT hdb_action_log_pkey PRIMARY KEY (id);


--
-- Name: hdb_cron_event_invocation_logs hdb_cron_event_invocation_logs_pkey; Type: CONSTRAINT; Schema: hdb_catalog; Owner: postgres
--

ALTER TABLE ONLY hdb_catalog.hdb_cron_event_invocation_logs
    ADD CONSTRAINT hdb_cron_event_invocation_logs_pkey PRIMARY KEY (id);


--
-- Name: hdb_cron_events hdb_cron_events_pkey; Type: CONSTRAINT; Schema: hdb_catalog; Owner: postgres
--

ALTER TABLE ONLY hdb_catalog.hdb_cron_events
    ADD CONSTRAINT hdb_cron_events_pkey PRIMARY KEY (id);


--
-- Name: hdb_metadata hdb_metadata_pkey; Type: CONSTRAINT; Schema: hdb_catalog; Owner: postgres
--

ALTER TABLE ONLY hdb_catalog.hdb_metadata
    ADD CONSTRAINT hdb_metadata_pkey PRIMARY KEY (id);


--
-- Name: hdb_metadata hdb_metadata_resource_version_key; Type: CONSTRAINT; Schema: hdb_catalog; Owner: postgres
--

ALTER TABLE ONLY hdb_catalog.hdb_metadata
    ADD CONSTRAINT hdb_metadata_resource_version_key UNIQUE (resource_version);


--
-- Name: hdb_scheduled_event_invocation_logs hdb_scheduled_event_invocation_logs_pkey; Type: CONSTRAINT; Schema: hdb_catalog; Owner: postgres
--

ALTER TABLE ONLY hdb_catalog.hdb_scheduled_event_invocation_logs
    ADD CONSTRAINT hdb_scheduled_event_invocation_logs_pkey PRIMARY KEY (id);


--
-- Name: hdb_scheduled_events hdb_scheduled_events_pkey; Type: CONSTRAINT; Schema: hdb_catalog; Owner: postgres
--

ALTER TABLE ONLY hdb_catalog.hdb_scheduled_events
    ADD CONSTRAINT hdb_scheduled_events_pkey PRIMARY KEY (id);


--
-- Name: hdb_schema_notifications hdb_schema_notifications_pkey; Type: CONSTRAINT; Schema: hdb_catalog; Owner: postgres
--

ALTER TABLE ONLY hdb_catalog.hdb_schema_notifications
    ADD CONSTRAINT hdb_schema_notifications_pkey PRIMARY KEY (id);


--
-- Name: hdb_version hdb_version_pkey; Type: CONSTRAINT; Schema: hdb_catalog; Owner: postgres
--

ALTER TABLE ONLY hdb_catalog.hdb_version
    ADD CONSTRAINT hdb_version_pkey PRIMARY KEY (hasura_uuid);


--
-- Name: blockchain_clouds blockchain_clouds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blockchain_clouds
    ADD CONSTRAINT blockchain_clouds_pkey PRIMARY KEY (id);


--
-- Name: blockchain_technologies blockchain_technologies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blockchain_technologies
    ADD CONSTRAINT blockchain_technologies_pkey PRIMARY KEY (id);


--
-- Name: customer_requests customer_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_requests
    ADD CONSTRAINT customer_requests_pkey PRIMARY KEY (id);


--
-- Name: ecommerce_scope ecommerce_scope_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecommerce_scope
    ADD CONSTRAINT ecommerce_scope_name_key UNIQUE (name);


--
-- Name: ecommerce_scope ecommerce_scope_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecommerce_scope
    ADD CONSTRAINT ecommerce_scope_pkey PRIMARY KEY (id);


--
-- Name: features features_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_pkey PRIMARY KEY (id);


--
-- Name: hero_carusel_item hero_carusel_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero_carusel_item
    ADD CONSTRAINT hero_carusel_item_pkey PRIMARY KEY (id);


--
-- Name: partners partners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);


--
-- Name: projects projects_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_name_key UNIQUE (name);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: scope_area skopes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_area
    ADD CONSTRAINT skopes_pkey PRIMARY KEY (id);


--
-- Name: scope_area skopes_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_area
    ADD CONSTRAINT skopes_title_key UNIQUE (title);


--
-- Name: technologies technologies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.technologies
    ADD CONSTRAINT technologies_pkey PRIMARY KEY (id);


--
-- Name: technologies technologies_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.technologies
    ADD CONSTRAINT technologies_title_key UNIQUE (title);


--
-- Name: websites_types websites_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.websites_types
    ADD CONSTRAINT websites_types_pkey PRIMARY KEY (id);


--
-- Name: hdb_cron_event_invocation_event_id; Type: INDEX; Schema: hdb_catalog; Owner: postgres
--

CREATE INDEX hdb_cron_event_invocation_event_id ON hdb_catalog.hdb_cron_event_invocation_logs USING btree (event_id);


--
-- Name: hdb_cron_event_status; Type: INDEX; Schema: hdb_catalog; Owner: postgres
--

CREATE INDEX hdb_cron_event_status ON hdb_catalog.hdb_cron_events USING btree (status);


--
-- Name: hdb_cron_events_unique_scheduled; Type: INDEX; Schema: hdb_catalog; Owner: postgres
--

CREATE UNIQUE INDEX hdb_cron_events_unique_scheduled ON hdb_catalog.hdb_cron_events USING btree (trigger_name, scheduled_time) WHERE (status = 'scheduled'::text);


--
-- Name: hdb_scheduled_event_status; Type: INDEX; Schema: hdb_catalog; Owner: postgres
--

CREATE INDEX hdb_scheduled_event_status ON hdb_catalog.hdb_scheduled_events USING btree (status);


--
-- Name: hdb_version_one_row; Type: INDEX; Schema: hdb_catalog; Owner: postgres
--

CREATE UNIQUE INDEX hdb_version_one_row ON hdb_catalog.hdb_version USING btree (((version IS NOT NULL)));


--
-- Name: hdb_cron_event_invocation_logs hdb_cron_event_invocation_logs_event_id_fkey; Type: FK CONSTRAINT; Schema: hdb_catalog; Owner: postgres
--

ALTER TABLE ONLY hdb_catalog.hdb_cron_event_invocation_logs
    ADD CONSTRAINT hdb_cron_event_invocation_logs_event_id_fkey FOREIGN KEY (event_id) REFERENCES hdb_catalog.hdb_cron_events(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: hdb_scheduled_event_invocation_logs hdb_scheduled_event_invocation_logs_event_id_fkey; Type: FK CONSTRAINT; Schema: hdb_catalog; Owner: postgres
--

ALTER TABLE ONLY hdb_catalog.hdb_scheduled_event_invocation_logs
    ADD CONSTRAINT hdb_scheduled_event_invocation_logs_event_id_fkey FOREIGN KEY (event_id) REFERENCES hdb_catalog.hdb_scheduled_events(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

