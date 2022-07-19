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
    src bpchar NOT NULL,
    link bpchar
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
    icon bpchar NOT NULL,
    link bpchar
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
    "subHeading" text NOT NULL,
    priority integer DEFAULT 1 NOT NULL
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
-- Name: meta_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.meta_tags (
    id integer NOT NULL,
    title bpchar NOT NULL,
    description text,
    keywords json,
    host bpchar NOT NULL
);


ALTER TABLE public.meta_tags OWNER TO postgres;

--
-- Name: meta_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.meta_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meta_tags_id_seq OWNER TO postgres;

--
-- Name: meta_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.meta_tags_id_seq OWNED BY public.meta_tags.id;


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
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    avatar bpchar NOT NULL,
    name bpchar NOT NULL,
    post bpchar,
    review text NOT NULL
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_id_seq OWNER TO postgres;

--
-- Name: review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.review_id_seq OWNED BY public.reviews.id;


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
    collout text,
    is_show boolean DEFAULT true NOT NULL
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
-- Name: team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team (
    id integer NOT NULL,
    name bpchar NOT NULL,
    "position" bpchar NOT NULL,
    phone bpchar,
    email bpchar,
    photo bpchar NOT NULL
);


ALTER TABLE public.team OWNER TO postgres;

--
-- Name: team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_id_seq OWNER TO postgres;

--
-- Name: team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.team_id_seq OWNED BY public.team.id;


--
-- Name: technologies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.technologies (
    id integer NOT NULL,
    title bpchar NOT NULL,
    svg bpchar NOT NULL,
    link bpchar,
    stack bpchar,
    sort_priority integer
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
-- Name: timeline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.timeline (
    id integer NOT NULL,
    color bpchar NOT NULL,
    year bpchar NOT NULL,
    title bpchar,
    decsription text
);


ALTER TABLE public.timeline OWNER TO postgres;

--
-- Name: timeline_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.timeline_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.timeline_id_seq OWNER TO postgres;

--
-- Name: timeline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.timeline_id_seq OWNED BY public.timeline.id;


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
    additional_text text,
    is_show boolean DEFAULT true NOT NULL
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
-- Name: meta_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meta_tags ALTER COLUMN id SET DEFAULT nextval('public.meta_tags_id_seq'::regclass);


--
-- Name: partners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners ALTER COLUMN id SET DEFAULT nextval('public.partners_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.review_id_seq'::regclass);


--
-- Name: scope_area id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_area ALTER COLUMN id SET DEFAULT nextval('public.skopes_id_seq'::regclass);


--
-- Name: team id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team ALTER COLUMN id SET DEFAULT nextval('public.team_id_seq'::regclass);


--
-- Name: technologies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.technologies ALTER COLUMN id SET DEFAULT nextval('public.technologies_id_seq'::regclass);


--
-- Name: timeline id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timeline ALTER COLUMN id SET DEFAULT nextval('public.timeline_id_seq'::regclass);


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
1	{"sources":[{"kind":"postgres","name":"iotweblab","tables":[{"table":{"schema":"public","name":"blockchain_clouds"}},{"table":{"schema":"public","name":"blockchain_technologies"}},{"table":{"schema":"public","name":"customer_requests"}},{"table":{"schema":"public","name":"ecommerce_scope"}},{"table":{"schema":"public","name":"features"}},{"table":{"schema":"public","name":"hero_carusel_item"}},{"table":{"schema":"public","name":"meta_tags"}},{"table":{"schema":"public","name":"partners"}},{"table":{"schema":"public","name":"projects"}},{"table":{"schema":"public","name":"reviews"}},{"table":{"schema":"public","name":"scope_area"}},{"table":{"schema":"public","name":"team"}},{"table":{"schema":"public","name":"technologies"}},{"table":{"schema":"public","name":"timeline"}},{"table":{"schema":"public","name":"websites_types"}}],"configuration":{"connection_info":{"use_prepared_statements":false,"database_url":{"from_env":"PG_DATABASE_URL"},"isolation_level":"read-committed"}}}],"version":3}	47
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
1	{"metadata":false,"remote_schemas":[],"sources":["iotweblab"]}	47	b84564ef-70c8-4982-8f16-fb6a5a058f0d	2022-03-01 13:56:20.993921+00
\.


--
-- Data for Name: hdb_version; Type: TABLE DATA; Schema: hdb_catalog; Owner: postgres
--

COPY hdb_catalog.hdb_version (hasura_uuid, version, upgraded_on, cli_state, console_state) FROM stdin;
9e753273-de81-4cb3-90ce-ef767064dcfb	47	2022-03-01 13:55:35.3171+00	{}	{"onboardingShown": true, "console_notifications": {"admin": {"date": "2022-05-20T16:33:40.922Z", "read": "default", "showBadge": false}}, "telemetryNotificationShown": true}
\.


--
-- Data for Name: blockchain_clouds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blockchain_clouds (id, name, src, link) FROM stdin;
1	Oracle Blockchain Cloud Service	/services/oracle.png	https://www.oracle.com/cis/blockchain/
3	Azure Blockchain Workbench	/services/azure2.png	https://azure.microsoft.com/en-us/features/blockchain-workbench/
2	IBM Blockchain Platform	/services/ibm2.png	https://www.ibm.com/blockchain/platform
5	Google Cloud Platform	/services/google2.png	https://cloud.google.com/customers/blockchain
4	Amazon Managed Blockchain	/services/aws2.png	https://aws.amazon.com/ru/managed-blockchain/
\.


--
-- Data for Name: blockchain_technologies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blockchain_technologies (id, name, icon, link) FROM stdin;
1	Ethereum	/services/blockchain/ethereum.svg	https://ethereum.org/ru/
2	Parity	/services/blockchain/parity.svg	https://www.parity.io/
3	Hyperledger Fabric	/services/blockchain/hlf.svg	https://www.hyperledger.org/use/fabric
4	Hyperledger Sawtooth	/services/blockchain/hyperledger-sawtooth.svg	https://www.hyperledger.org/use/sawtooth
5	Hyperledger Indy	/services/blockchain/hyperledger-indy.svg	https://hyperledger-indy.readthedocs.io/en/latest/
6	EOS	/services/blockchain/eosio.svg	https://coinmarketcap.com/ru/currencies/eos/
7	Corda R3	/services/blockchain/icon-r3.svg	https://www.r3.com/
8	Stellar	/services/blockchain/stellar-seeklogo.svg	https://www.stellar.org/
9	Exonum	/services/blockchain/icon-exonum.svg	https://exonum.com/index
10	Multichain	/services/blockchain/icon-multichain.svg	https://www.multichain.com/
11	NXT	/services/blockchain/icon-nxt.svg	https://nxtportal.org/monitor/
\.


--
-- Data for Name: customer_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_requests (id, name, email, subject, message, link, file) FROM stdin;
61	Marvall	marvallua@gmail.com	Some Theme	how i cat got answer on my question	localhost:0000	\\x756e646566696e6564
62	asdasdmar	yariknarik.xxx@gmail.com	asdasdasdasdas	asdasdasdasdasd	null	\\x756e646566696e6564
63	asdasdas	dasdasd@sdsd.sd	asdasdasd	asdasdasdasdasdasd	asdasdasd	\\x756e646566696e6564
64	asdasda	sdasd@sd.sd	asdasdas	sdasdasdasdasd	dasdasdasda	\\x756e646566696e6564
65	sdasdasd	asdasd@asd.asda	asdasdasd	asdasdasdas	asdasdasda	\\x756e646566696e6564
66	asdasdasd	asdasd@asd.asd	asdasdasd	asdasdasdasd	asdasdasd	\\x756e646566696e6564
67	dasdasd	asdasda@sds.sd	asdasdasd	sdasdasdasd	asdasdasda	\\x756e646566696e6564
68	asdasdasd	asdasdasd@sds.sd	asdasdas	asdadasd	dasdasdasdasdasd	\\x756e646566696e6564
69	MArvall	marvalbbblua@gmail.com	asdasd	asdasdasdasd	asdasdasd	\\x756e646566696e6564
70	asdasdasd	asdasd@sds.sd	asdasdasd	dasdasdasdasd	asdasdasdas	\\x756e646566696e6564
71	asdasd	yarinarik.xxx@gmail.com	asdas	dasdasd	dasdas	\\x756e646566696e6564
72	asdasd	asdasdasd@sd.sd	asdasd	dasdasdasd	asdasdas	\\x756e646566696e6564
73	sdasd	asdasd@asds.sd	sdasdasdasdasda	asdasdasdasd	sdasdasd	\N
74	asdasd	asdasda@sdd.sas	das	dasdasdasdasdasd	dasdasdasdas	\N
75	fsdfsd	fsdfsdf	sdfsdfs	fsdfsdf	dfsdfsd	\N
76	asdasd	asdasdasd@sds.dss	dasdas	asdasdasdasd	dasdasdasd	\N
77	sdfsdfsdf	sdfsds@sdf.dfs	fsdfs	dfsdfsdfsdfsdf	dfsdfsdfsdfsdfsdfsdfs	\N
78	dfgdfgd	fgdfgdfg@Dsf.dfs	sdfsdfsdf	dfsdfsdfsdfsdf	sdfsdfsdfs	\N
79	asdasd	asdasd@sd.sd	asdasdasda	dasdasdasdas	sdasdasdas	\N
80	asdasda	asdasdas@sdsd.sd	sdasd	asdasdasdasd	sadasdasdasda	\N
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

COPY public.hero_carusel_item (id, src, heading, "subHeading", priority) FROM stdin;
1	pexels-andrea-piacquadio-3884440.jpg	SOFTWARE DEVELOPMENT	IoTWebLab offers high-quality software development to businesses with an idea of great software but do not have the means to create it. We are here to help with the newest technology and best solutions to implement your vision.	1
3	pexels-thirdman-5961072.jpg	DIGITAL MARKETING	Effective digital marketing solutions to help your business increase visibility, convert leads, and boost profitability. From SEO optimization to advertising, everything you may need to succeed	4
2	pexels-peter-olexa-4012966.jpg	UI/UX DESIGN	From ideation to prototyping to designing we are here to help you throughout all of these steps. IoTWebLab will help you come up with a design that will solve complex user problems yet be easy to use.	2
4	pexels-andrea-piacquadio-3830745.jpg	OUTSOURCE & OUTSTAFF	Helping to find the best project managers, designers, developers, QA specialists as well as marketers, and advertisers so that you never have a lack of professional resources.	3
\.


--
-- Data for Name: meta_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.meta_tags (id, title, description, keywords, host) FROM stdin;
11	Web Development	IOT WEBLAB specializes in web development and application software development. Our specialists can help you solve your business problems.	["development","blockchain","mobile","website","solution","technologies"]	pages/index.vue
3	Contact Us	Visit our office 01032 Klovski Descent 7A Kyiv, Ukraine, or send email to info@iotwlab.com, support@iotwlab.com	\N	pages/contact.vue
2	About Us	IOT WEBLAB - outsourcing / outstaff company. Specializes in web application development	\N	pages/about.vue
4	Projects	You can see the list of our projects. We can develop any solution for you. 	["projects","development","example"]	pages/projects/index.vue
5	Cookies Policy	'Cookies policy on IOT WEBLAB	\N	pages/policy/cookies.vue
7	E-commerce	Development of electronic commerce, Creation of online stores, development of application software for your business.	["e-commerce","develop","development","shop","b2b","b2c"]	pages/services/ecommerce.vue
6	Blockchain development	Blockchain development, integration of your project into cloud services. Integration blockchain tools into your application.	["blockchain","developing","clouds","services","tools"]	pages/services/blockchain.vue
9	Websites	Creation of websites. Qualified approach to website development. Sites of any complexity.	["website","development","landing","internet","marketing"]	pages/services/websites.vue
8	Mobile Application	Mobile app development and PWA. Integration of your application into popular stores.	["mobile","application","develop","store","tools"]	pages/services/mobile.vue
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
9	Chanel	https://www.chanel.com/	https://www.chanel.com/media/images/apple-touch-icon-152x152.png
10	Maxihost	https://www.maxihost.com/	https://downloads.intercomcdn.com/i/o/137289/65ba56132d4af8ffc67b8160/46c12f629087ccc3ae7aae6df2b79adc.png
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (id, description, challenge, solution, technologies, urls, integrations, name, url_img) FROM stdin;
6	Finance Tax Application Development	["Architecture Development","Strapi Application Development","Own Email Server Development"]	["Architecture Implementation","Application Development","Testing"]	["JavaScript","NodeJS","REST API","ReactJS"]	[{"link":"http://taxfinance.itjedi.co.nz/","name":"Site"}]	\N	Tax Finance	projects/tax_finance.png
3		\N	\N	\N	[{"link":"https://dimusco.com/","name":"Site"}]	\N	Dimusco	\N
11	\N	\N	\N	["ReactJS","Apollo Server","Apollo Client","GraphQL"]	[{"link":"https://www.humanos.me/","name":"Site"}]	\N	HumanOS	projects/human_os.png
8	Web Development / Deployment	["Web Development"]	["Web Development","Testing"]	["JavaScript","NextJS","ReactJS"]	[{"link":"https://www.maxihost.com/","name":"Site"}]	\N	Maxihost	projects/maxihost.png
7	\N	\N	\N	\N	[{"link":"https://lunie.io/","name":"Site"}]	\N	Luine	projects/lunie.png
4	Marketing Platform/Dashboard Development	["Application Development/updates","Multicurrency Integration"]	["Application Dashboard Development","Testing"]	["JavaScript","ReactJS","NodeJS","MobX","Third party API integration (Facebook, LinkedIn, YouTube, Twitter, Google, Pinterest)"]	[{"link":"https://infinigrow.com","name":"Site"}]	\N	Infinigrow	projects/infinity.png
13	\N	\N	\N	["TypeScript","Angular"]	[{"link":"https://www.smartlifepath.com/web-site/home","name":"Site"}]	\N	SmartLifePath	\N
12	\N	\N	\N	["TypeScript","Angular"]	[{"link":"https://dvc.org/","name":"Site"}]	\N	DVC	\N
5	Upgrade UI	["Design"]	["Design Development","Design Implementation"]	["Java","Spring","JavaScript","VueJS, VueX","PostgreSQL"]	[{"link":"https://www.travelinsurancemaster.com/","name":"Site"}]	\N	Travel Insuranse	\N
2	FACEBOOK Chrome Extension Development / FACEBOOK API Integration	["MVP App support","Chrome Extension updates","New Features Development","UI/UX updates","Payment Subscription Integtration"]	["Customer Support","Chrome Extension Development and Testing","API Application Development","Stripe API Development Integration"]	["JavaScript","VueJS / VueX","Ruby (ActiveREcord)","Stripe","Facebook API","Chrome Extension API","PostgreSQL","AWS S3","Digital Ocean","DevOPS","Third party API integration (FreshDesk API, TapAffiliate API)"]	[{"link":"https://app.friendfilter.io/","name":"Application"},{"link":"https://friendfilter.io/","name":"Official Site"},{"link":"https://chrome.google.com/webstore/detail/friendfilter-for-facebook/bbahhbngjiangjdlmleihmlphoamikhg?hl=en","name":"Exstansion"}]	\N	FriendFilter	projects/friend_filter.png
9	IOS Remote Control Application / Desktop Application	["Desktop Application Development","IOS Remote Control Application for Desktop Application"]	["Design","IOS Application Development","Server Rendering Development","Desktop Application Development"]	["JavaScript","ElectronJS","React Native","PHP"]	[{"link":"https://www.chanel.com/","name":"Official Site"},{"link":"http://www.walterfilms.tv/","name":"Additional Site"}]	\N	Chanel	projects/chanel.png
1	Desktop Multiplatform Game Keyboard Configurator Application	["Connection and communication between Arduino and Application","Reset Arduino to default settings","Firmware updates","One touch setup, one touch text-creator","Usage external API for Arduino updates","New UI/UX Development","Multiplatform Development (Mac, Linux, Windows)"]	["Development Arduino listeners","Development Arduino flasher, firmware updates","Macros Development and Integration","Bazecor API Development and update","Development and update UI","Testing under Multiplatform"]	["JavaScript","C++","Arduino","BOSSA-Arduino","ReactJS","Material UI","ElectronJS","Lerna API","SerialPortJS","NodeJS"]	[{"link":"https://github.com/Dygmalab/Bazecor","name":"Repository Git"},{"link":"https://github.com/Dygmalab/Bazecor-api","name":"API Git"}]	\N	Dygma	projects/dygma.png
10	\N	["Having information is not enough nowadays. It's much more important to use it in a right way. The goal was to create a solution to gather the collective intelligence of people and help them improve their impact within communities."]	["Using data analysis algorithms, graph technology and blockchain, protecting the Users security, NetworkOS represents a cutting-edge collaborative tool based on data sharing. It enables people knowing how their team, community or group is performing. It activates people and increases the opportunities of networking."]	["JavaScript","ReactJS","Apollo","GraphQL","PostgreSQL","Redis"]	[{"link":"https://www.collaboration.ai/","name":"Official Site"},{"link":"https://os.collaboration.ai/networkos","name":"Additional Site"}]	["AWS","SendGrid","Ethereum"]	Collaboration	\N
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, avatar, name, post, review) FROM stdin;
1	person-4.jpg	Mario Speedwagon	Creative Editor of ABC LTD	Working with IoTWebLab was a genuinely transformative experience. The team helped us create the website we had always envisioned but could never formulate.
2	person-8.jpg	Petey Cruiser	CEO of Json LLC	IoTWLab helped us develop our mobile application. Working with these guys was amazing. If I were to describe them with a single phrase, that would be mission possible.
\.


--
-- Data for Name: scope_area; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scope_area (id, title, subtitle, tools, svg, description, collout, is_show) FROM stdin;
5	Clouds	Databases and clouds	["Data storage architecture design","Data analysis systems","SQL query optimization","Running of your projects in Amazon Cloud Services or Google Cloud"]	icon/cloud-svgrepo-com.svg	\N	05	f
2	Marketing	Product promotion tools	["SEO-optimization","Social media tools","Analysis and content implementation","Contextual advertising tools","Tools for mailing and feedback"]	icon/1515442620.svg	\N	02	f
1	Production industry	Helping companies that are producing automobile, electrical, and heavy machinery with automation.	["Production automation tools","Prototyping and design","Integration of devices and services","Administration and control systems"]	icon/industry-15.svg	\N	01	t
6	Finance industry	Supporting banks and financial companies in developing websites, applications, and platforms for internal use.	["Implementation of E-commerce services","Bank plugin implementation","Implementation and developing accounting services","Analysis tools developing"]	icon/dollar-svgrepo-com.svg	\N	06	t
4	Retail and wholesale companies	Creating trading platforms and marketplaces as well as adding plugins to enhance the existing ones.	["Analysis and statistics tools","Implementation of E-commerce services","Development and launch of trading platforms and marketplaces","Development of plugins for popular marketplaces"]	icon/grocery-15.svg	\N	04	t
3	Broadcasting and media industry	Developing software for broadcasting systems, and providing solutions from implementing billing systems to media content tools. 	["Media content tools","Billing systems","Implementation of communication services and voip tools","Software development for broadcasting systems"]	icon/play-button-svgrepo-com.svg	\N	03	t
\.


--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team (id, name, "position", phone, email, photo) FROM stdin;
1	John Churchill	Marketing Director	+1 (987) 1625346	john@example.com	person-1.jpg
2	Fiona\tRoss	Project Manager	+1 (987) 5894684	fiona@example.com	person-2.jpg
3	Justin\tRees	VP Marketing	+1 (987) 6982456	justin@example.com	person-3.jpg
\.


--
-- Data for Name: technologies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.technologies (id, title, svg, link, stack, sort_priority) FROM stdin;
5	Firebase	icon/tech/firebase.svg	https://firebase.google.com/	cloud	10
3	AWS	icon/tech/aws.svg	https://aws.amazon.com/free/	cloud	10
9	Heroku	icon/tech/heroku2.svg	https://www.heroku.com/	cloud	10
1	Javascript	icon/tech/javascript2.svg	https://developer.mozilla.org/en-US/docs/Web/JavaScript	js	1
6	Typescript	icon/tech/typescript2.svg	https://www.typescriptlang.org/	js	1
16	Node	icon/tech/node.svg	https://nodejs.org/	js	1
24	Vue	icon/tech/vue.svg	https://vuejs.org/	vue	2
29	Vuex	icon/tech/vuex.svg	https://vuex.vuejs.org/guide/getters.html#property-style-access	vue	2
17	Nuxt	icon/tech/nuxt.svg	https://nuxtjs.org/	vue	2
14	Nest	icon/tech/nest.svg	https://nestjs.com/	js	1
25	Quasar	icon/tech/quasar.svg	https://quasar.dev/	vue	2
22	React	icon/tech/react.svg	https://reactjs.org/	react	3
23	Redux	icon/tech/redux.svg	https://redux.js.org/	react	3
27	React Native	icon/tech/react-native.svg	https://reactnative.dev/	react	3
28	C#	icon/tech/csharp.svg	https://docs.microsoft.com/en-us/dotnet/csharp/	c	4
15	.NET	icon/tech/net3.svg	https://dotnet.microsoft.com/en-us/	c	4
33	Entity	icon/tech/entity.svg	https://docs.microsoft.com/en-us/ef/	c	4
30	Java	icon/tech/java.svg	https://docs.oracle.com/en/java/	java	5
31	Spring	icon/tech/spring.svg	https://spring.io/	java	5
32	Hibernate	icon/tech/hibernate.svg	https://hibernate.org/	java	5
26	Angular	icon/tech/angular.svg	https://angular.io/	angular	6
18	PHP	icon/tech/php.svg	https://www.php.net/	php	6
10	Laravel	icon/tech/laravel.svg	https://laravel.com/	php	6
4	Django	icon/tech/django.svg	https://www.djangoproject.com/	python	7
20	Python	icon/tech/python.svg	https://www.python.org/	python	7
21	Ruby & Rails	icon/tech/rails.svg	https://rubyonrails.org/	framework	8
2	Apollo	icon/tech/apollo.svg	https://www.apollographql.com/	framework	8
8	Hasura	icon/tech/hasura.svg	https://hasura.io/	framework	8
7	Graphql	icon/tech/graphQL.svg	https://graphql.org/	framework	8
19	Postgres	icon/tech/postgresql.svg	https://www.postgresql.org/	db	9
11	MariaDB	icon/tech/mariadb.svg	https://mariadb.com/	db	9
12	MongoDB	icon/tech/mongodb2.svg	https://www.mongodb.com/	db	9
13	Mysql	icon/tech/mysql.svg	https://www.mysql.com/	db	9
\.


--
-- Data for Name: timeline; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.timeline (id, color, year, title, decsription) FROM stdin;
5	cyan	2019	Birthday	The idea of founding IoTWlab was born when our founders noticed the increasing demand for technologies to solve business needs. They saw the big gap between the business and tech worlds and decided to bridge that.
2	green	2020	\N	After researching and understanding the market needs more deeply, we defined a set of services that would be able to meet those needs from A to Z. We recruited a team of leading professionals to empower businesses through high technology.
3	pink	2021	\N	We have reached our milestone of having ten long-term clients for whom the IoTWebLab created and continues to enhance an online platform. We have also helped some of our clients successfully outsource to solve the issues that IoTWLab did not cover.
4	amber	2022	\N	IoTWebLab is a well-established and successful company that keeps growing every day while perfecting its services to meet market needs with the most up-to-date solutions.
\.


--
-- Data for Name: websites_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.websites_types (id, name, icon, image, benefits, text, additional_text, is_show) FROM stdin;
2	CORPORATE WEBSITE	\N	\N	["A centralized website covering everything you want to share about your business","Increasing the interaction between an organization and target audiences","A great tool for marketing purposes and conversions"]	At IoTWLac we will help you create a corporate website to communicate about your business with leads and clients as well as for achieving commercial goals. We will ensure that the information about your company is effectively communicated and presented to the target audiences in the most effective way possible.	\N	t
3	PORTAL	\N	\N	["Targeted to the main audience","Interactive for visitors","Flexible and adjustable","Can meet the different needs people may have"]	Here at IoTWebLab, we will help to identify the needs of your target users and design portal websites specifically for meeting their needs. Such websites can be flexible enough to cover a variety of content and yet be designed in a way that does not overwhelm the visitors.	\N	t
4	SITE-CATALOG	\N	/services/websites/catalog.png	["Fast to develop and launch","Simple to use for people who are not very tech-savvy","Budget-friendly solution for businesses with limited resources"]	A solution to showcase your products that does not support buying the products from the website (usually done through email, phone, or other methods).	\N	t
6	ONLINE STORE		/services/websites/store.png	["A perfect solution for reaching as many people as possible","An affordable solution especially compared to on-site stores","A quick and convenient experience for users"]	We also develop websites that can serve as online stores. IoTWLab provides the best solution for presenting your products and enabling people to have an easy, simple, and transparent shopping experience.	\N	t
5	SITE SERVICE	\N	\N	\N	The service, as a rule, is focused on solving one or more of the same type of customer needs.  The best example would be online consultants. Probably, each of us met pop-up windows on modern sites with an appeal from managers or an offer to enter our number so that they would quickly call us back and advise. So, such online assistants are an example of a service - a type of site that provides services to meet a specific user need.  The same cloud hosting (Dropbox, Yandex.Disk), video hosting (Youtube, RuTube), various services for online file conversion, etc. — are a prime example of good and useful service.  There are a huge number of services on the Internet, new ones appear every day. In order to create your own successful service, you just need to understand what people lack. Guess how to solve someone's problem, become useful to people - and the service will certainly succeed. Of course, provided that it is developed and put into operation by professionals. Since a cool idea without a competent technical implementation is most likely to fail.	\N	f
1	Website-Card	\N	/services/websites/landing.png	["Low cost","Quick to launch","Easy to maintain","Can be upgraded to a more complex website"]	We design, develop and launch business card sites that have a simple structure covering company information, provided services, contact information, and some other section if necessary. These websites are static and are not designed for active user interaction.	\N	t
8	Landing pages	\N	\N	["Perfect for startups and new products that need to be validated","Ideal solution for collecting a customer base","Has a high potential to increase conversions"]	IotWebLab.com is the perfect place to start if you need a landing page. We have the perfect experience of developing targeted, effective landing pages with minimum distractions that are perfect for triggering interest in the right people and encouraging them to take an action.	\N	t
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

SELECT pg_catalog.setval('public.customer_requests_id_seq', 80, true);


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
-- Name: meta_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.meta_tags_id_seq', 11, true);


--
-- Name: partners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partners_id_seq', 10, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 13, true);


--
-- Name: review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.review_id_seq', 2, true);


--
-- Name: skopes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skopes_id_seq', 6, true);


--
-- Name: team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.team_id_seq', 3, true);


--
-- Name: technologies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.technologies_id_seq', 34, true);


--
-- Name: timeline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.timeline_id_seq', 5, true);


--
-- Name: websites_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.websites_types_id_seq', 8, true);


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
-- Name: meta_tags meta_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meta_tags
    ADD CONSTRAINT meta_tags_pkey PRIMARY KEY (id);


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
-- Name: reviews review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT review_pkey PRIMARY KEY (id);


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
-- Name: team team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


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
-- Name: timeline timeline_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timeline
    ADD CONSTRAINT timeline_pkey PRIMARY KEY (id);


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

