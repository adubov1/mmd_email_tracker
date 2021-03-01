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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: email_tracker_emails; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.email_tracker_emails (
    id bigint NOT NULL,
    "from" character varying,
    "to" character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    track_id character varying,
    message_id character varying,
    origin_ip_address character varying
);


--
-- Name: email_tracker_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.email_tracker_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: email_tracker_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.email_tracker_emails_id_seq OWNED BY public.email_tracker_emails.id;


--
-- Name: email_tracker_opens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.email_tracker_opens (
    id bigint NOT NULL,
    ip_address character varying,
    city character varying,
    state character varying,
    email_tracker_emails_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    email_id integer
);


--
-- Name: email_tracker_opens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.email_tracker_opens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: email_tracker_opens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.email_tracker_opens_id_seq OWNED BY public.email_tracker_opens.id;


--
-- Name: que_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.que_jobs (
    priority smallint DEFAULT 100 NOT NULL,
    run_at timestamp with time zone DEFAULT now() NOT NULL,
    job_id bigint NOT NULL,
    job_class text NOT NULL,
    args json DEFAULT '[]'::json NOT NULL,
    error_count integer DEFAULT 0 NOT NULL,
    last_error text,
    queue text DEFAULT ''::text NOT NULL
);


--
-- Name: TABLE que_jobs; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.que_jobs IS '3';


--
-- Name: que_jobs_job_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.que_jobs_job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: que_jobs_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.que_jobs_job_id_seq OWNED BY public.que_jobs.job_id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: email_tracker_emails id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_tracker_emails ALTER COLUMN id SET DEFAULT nextval('public.email_tracker_emails_id_seq'::regclass);


--
-- Name: email_tracker_opens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_tracker_opens ALTER COLUMN id SET DEFAULT nextval('public.email_tracker_opens_id_seq'::regclass);


--
-- Name: que_jobs job_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.que_jobs ALTER COLUMN job_id SET DEFAULT nextval('public.que_jobs_job_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: email_tracker_emails email_tracker_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_tracker_emails
    ADD CONSTRAINT email_tracker_emails_pkey PRIMARY KEY (id);


--
-- Name: email_tracker_opens email_tracker_opens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_tracker_opens
    ADD CONSTRAINT email_tracker_opens_pkey PRIMARY KEY (id);


--
-- Name: que_jobs que_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.que_jobs
    ADD CONSTRAINT que_jobs_pkey PRIMARY KEY (queue, priority, run_at, job_id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_email_tracker_email_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_email_tracker_email_id ON public.email_tracker_opens USING btree (email_id);


--
-- Name: index_email_tracker_opens_on_email_tracker_emails_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_email_tracker_opens_on_email_tracker_emails_id ON public.email_tracker_opens USING btree (email_tracker_emails_id);


--
-- Name: email_tracker_opens fk_rails_b7c600da4a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_tracker_opens
    ADD CONSTRAINT fk_rails_b7c600da4a FOREIGN KEY (email_tracker_emails_id) REFERENCES public.email_tracker_emails(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20210223022553'),
('20210223023010'),
('20210223031427'),
('20210223033007'),
('20210223180809'),
('20210223192348'),
('20210301190715');


