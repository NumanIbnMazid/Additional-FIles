--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2019-10-23 04:59:04 +06

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

SET default_with_oids = false;

--
-- TOC entry 213 (class 1259 OID 16512)
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(190) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16510)
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO postgres;

--
-- TOC entry 3667 (class 0 OID 0)
-- Dependencies: 212
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- TOC entry 215 (class 1259 OID 16522)
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16520)
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO postgres;

--
-- TOC entry 3668 (class 0 OID 0)
-- Dependencies: 214
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- TOC entry 278 (class 1259 OID 17246)
-- Name: accounts_userpermission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_userpermission (
    id integer NOT NULL,
    can_browse boolean NOT NULL,
    can_donate boolean NOT NULL,
    can_ask_for_a_donor boolean NOT NULL,
    can_manage_bank boolean NOT NULL,
    can_chat boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.accounts_userpermission OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 17244)
-- Name: accounts_userpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_userpermission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_userpermission_id_seq OWNER TO postgres;

--
-- TOC entry 3669 (class 0 OID 0)
-- Dependencies: 277
-- Name: accounts_userpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_userpermission_id_seq OWNED BY public.accounts_userpermission.id;


--
-- TOC entry 219 (class 1259 OID 16559)
-- Name: accounts_userprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_userprofile (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    account_type smallint NOT NULL,
    gender character varying(10),
    dob date,
    blood_group character varying(10) NOT NULL,
    contact character varying(20),
    address text,
    city character varying(100),
    state character varying(100),
    country character varying(2),
    about text,
    facebook character varying(300),
    linkedin character varying(300),
    website character varying(300),
    image character varying(100),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT accounts_userprofile_account_type_check CHECK ((account_type >= 0))
);


ALTER TABLE public.accounts_userprofile OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16557)
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_userprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_userprofile_id_seq OWNER TO postgres;

--
-- TOC entry 3670 (class 0 OID 0)
-- Dependencies: 218
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_userprofile_id_seq OWNED BY public.accounts_userprofile.id;


--
-- TOC entry 276 (class 1259 OID 17209)
-- Name: accounts_userreport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_userreport (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    category character varying(100) NOT NULL,
    details text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    reported_by_id integer NOT NULL
);


ALTER TABLE public.accounts_userreport OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 17207)
-- Name: accounts_userreport_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_userreport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_userreport_id_seq OWNER TO postgres;

--
-- TOC entry 3671 (class 0 OID 0)
-- Dependencies: 275
-- Name: accounts_userreport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_userreport_id_seq OWNED BY public.accounts_userreport.id;


--
-- TOC entry 217 (class 1259 OID 16549)
-- Name: accounts_userstripe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_userstripe (
    id integer NOT NULL,
    stripe_id character varying(200),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.accounts_userstripe OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16547)
-- Name: accounts_userstripe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_userstripe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_userstripe_id_seq OWNER TO postgres;

--
-- TOC entry 3672 (class 0 OID 0)
-- Dependencies: 216
-- Name: accounts_userstripe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_userstripe_id_seq OWNED BY public.accounts_userstripe.id;


--
-- TOC entry 203 (class 1259 OID 16416)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16414)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 3673 (class 0 OID 0)
-- Dependencies: 202
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 205 (class 1259 OID 16426)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16424)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3674 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 201 (class 1259 OID 16408)
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
-- TOC entry 200 (class 1259 OID 16406)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 3675 (class 0 OID 0)
-- Dependencies: 200
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 207 (class 1259 OID 16434)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16444)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16442)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3676 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 206 (class 1259 OID 16432)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 3677 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 211 (class 1259 OID 16452)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16450)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3678 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 282 (class 1259 OID 17281)
-- Name: blog_attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blog_attachment (
    id integer NOT NULL,
    file character varying(100),
    blog_id integer NOT NULL,
    slug character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.blog_attachment OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 17279)
-- Name: blog_attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blog_attachment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_attachment_id_seq OWNER TO postgres;

--
-- TOC entry 3679 (class 0 OID 0)
-- Dependencies: 281
-- Name: blog_attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blog_attachment_id_seq OWNED BY public.blog_attachment.id;


--
-- TOC entry 280 (class 1259 OID 17261)
-- Name: blog_blog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blog_blog (
    id integer NOT NULL,
    slug character varying(255) NOT NULL,
    title character varying(250) NOT NULL,
    details text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    tags character varying(150),
    category character varying(250) NOT NULL
);


ALTER TABLE public.blog_blog OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 17259)
-- Name: blog_blog_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blog_blog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_blog_id_seq OWNER TO postgres;

--
-- TOC entry 3680 (class 0 OID 0)
-- Dependencies: 279
-- Name: blog_blog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blog_blog_id_seq OWNED BY public.blog_blog.id;


--
-- TOC entry 286 (class 1259 OID 17339)
-- Name: blog_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blog_comment (
    id integer NOT NULL,
    comment text NOT NULL,
    is_selected boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    blog_id integer NOT NULL,
    commented_by_id integer NOT NULL
);


ALTER TABLE public.blog_comment OWNER TO postgres;

--
-- TOC entry 285 (class 1259 OID 17337)
-- Name: blog_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blog_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_comment_id_seq OWNER TO postgres;

--
-- TOC entry 3681 (class 0 OID 0)
-- Dependencies: 285
-- Name: blog_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blog_comment_id_seq OWNED BY public.blog_comment.id;


--
-- TOC entry 288 (class 1259 OID 17363)
-- Name: blog_commentreply; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blog_commentreply (
    id integer NOT NULL,
    reply text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    comment_id integer NOT NULL,
    replied_by_id integer NOT NULL
);


ALTER TABLE public.blog_commentreply OWNER TO postgres;

--
-- TOC entry 287 (class 1259 OID 17361)
-- Name: blog_commentreply_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blog_commentreply_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_commentreply_id_seq OWNER TO postgres;

--
-- TOC entry 3682 (class 0 OID 0)
-- Dependencies: 287
-- Name: blog_commentreply_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blog_commentreply_id_seq OWNED BY public.blog_commentreply.id;


--
-- TOC entry 225 (class 1259 OID 16627)
-- Name: chat_chatmessage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_chatmessage (
    id integer NOT NULL,
    message text NOT NULL,
    is_seen boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    thread_id integer,
    user_id integer NOT NULL
);


ALTER TABLE public.chat_chatmessage OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16625)
-- Name: chat_chatmessage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_chatmessage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_chatmessage_id_seq OWNER TO postgres;

--
-- TOC entry 3683 (class 0 OID 0)
-- Dependencies: 224
-- Name: chat_chatmessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_chatmessage_id_seq OWNED BY public.chat_chatmessage.id;


--
-- TOC entry 223 (class 1259 OID 16619)
-- Name: chat_thread; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_thread (
    id integer NOT NULL,
    updated timestamp with time zone NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    first_id integer NOT NULL,
    second_id integer NOT NULL
);


ALTER TABLE public.chat_thread OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16617)
-- Name: chat_thread_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_thread_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_thread_id_seq OWNER TO postgres;

--
-- TOC entry 3684 (class 0 OID 0)
-- Dependencies: 222
-- Name: chat_thread_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_thread_id_seq OWNED BY public.chat_thread.id;


--
-- TOC entry 229 (class 1259 OID 16678)
-- Name: checkout_checkout; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.checkout_checkout (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    plan_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.checkout_checkout OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16676)
-- Name: checkout_checkout_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.checkout_checkout_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checkout_checkout_id_seq OWNER TO postgres;

--
-- TOC entry 3685 (class 0 OID 0)
-- Dependencies: 228
-- Name: checkout_checkout_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.checkout_checkout_id_seq OWNED BY public.checkout_checkout.id;


--
-- TOC entry 221 (class 1259 OID 16586)
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
-- TOC entry 220 (class 1259 OID 16584)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 3686 (class 0 OID 0)
-- Dependencies: 220
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 199 (class 1259 OID 16398)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16396)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 3687 (class 0 OID 0)
-- Dependencies: 198
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 197 (class 1259 OID 16387)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16385)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3688 (class 0 OID 0)
-- Dependencies: 196
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 254 (class 1259 OID 16989)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 17001)
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 16999)
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- TOC entry 3689 (class 0 OID 0)
-- Dependencies: 255
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- TOC entry 241 (class 1259 OID 16763)
-- Name: donationBank_bankmember; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."donationBank_bankmember" (
    id integer NOT NULL,
    role smallint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    bank_id integer NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT "donationBank_bankmember_role_check" CHECK ((role >= 0))
);


ALTER TABLE public."donationBank_bankmember" OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16761)
-- Name: donationBank_bankmember_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."donationBank_bankmember_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."donationBank_bankmember_id_seq" OWNER TO postgres;

--
-- TOC entry 3690 (class 0 OID 0)
-- Dependencies: 240
-- Name: donationBank_bankmember_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."donationBank_bankmember_id_seq" OWNED BY public."donationBank_bankmember".id;


--
-- TOC entry 243 (class 1259 OID 16815)
-- Name: donationBank_campaign; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."donationBank_campaign" (
    id integer NOT NULL,
    title character varying(150) NOT NULL,
    slug character varying(50) NOT NULL,
    held_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    contact character varying(20) NOT NULL,
    email character varying(254),
    address character varying(200) NOT NULL,
    city character varying(100) NOT NULL,
    state character varying(100),
    country character varying(2) NOT NULL,
    details text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    bank_id integer NOT NULL,
    image character varying(100)
);


ALTER TABLE public."donationBank_campaign" OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16813)
-- Name: donationBank_campaign_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."donationBank_campaign_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."donationBank_campaign_id_seq" OWNER TO postgres;

--
-- TOC entry 3691 (class 0 OID 0)
-- Dependencies: 242
-- Name: donationBank_campaign_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."donationBank_campaign_id_seq" OWNED BY public."donationBank_campaign".id;


--
-- TOC entry 231 (class 1259 OID 16698)
-- Name: donationBank_donation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."donationBank_donation" (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(254),
    gender character varying(10) NOT NULL,
    dob date NOT NULL,
    blood_group character varying(10) NOT NULL,
    diseases character varying(250),
    contact character varying(20) NOT NULL,
    address character varying(250) NOT NULL,
    city character varying(100) NOT NULL,
    state character varying(100),
    country character varying(2) NOT NULL,
    donation_type smallint NOT NULL,
    organ_name character varying(100),
    tissue_name character varying(100),
    quantity integer,
    description text,
    collection_date date NOT NULL,
    expiration_date date NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    bank_id integer NOT NULL,
    CONSTRAINT "donationBank_donation_donation_type_check" CHECK ((donation_type >= 0)),
    CONSTRAINT "donationBank_donation_quantity_check" CHECK ((quantity >= 0))
);


ALTER TABLE public."donationBank_donation" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16696)
-- Name: donationBank_donation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."donationBank_donation_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."donationBank_donation_id_seq" OWNER TO postgres;

--
-- TOC entry 3692 (class 0 OID 0)
-- Dependencies: 230
-- Name: donationBank_donation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."donationBank_donation_id_seq" OWNED BY public."donationBank_donation".id;


--
-- TOC entry 233 (class 1259 OID 16713)
-- Name: donationBank_donationbank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."donationBank_donationbank" (
    id integer NOT NULL,
    institute character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    address character varying(250) NOT NULL,
    city character varying(100) NOT NULL,
    state character varying(100),
    country character varying(2) NOT NULL,
    contact character varying(100) NOT NULL,
    email character varying(254),
    description text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    is_verified boolean NOT NULL,
    services character varying(100) NOT NULL
);


ALTER TABLE public."donationBank_donationbank" OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16711)
-- Name: donationBank_donationbank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."donationBank_donationbank_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."donationBank_donationbank_id_seq" OWNER TO postgres;

--
-- TOC entry 3693 (class 0 OID 0)
-- Dependencies: 232
-- Name: donationBank_donationbank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."donationBank_donationbank_id_seq" OWNED BY public."donationBank_donationbank".id;


--
-- TOC entry 239 (class 1259 OID 16752)
-- Name: donationBank_donationbanksetting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."donationBank_donationbanksetting" (
    id integer NOT NULL,
    member_request smallint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    bank_id integer NOT NULL,
    privacy smallint NOT NULL,
    CONSTRAINT "donationBank_donationbanksetting_member_request_check" CHECK ((member_request >= 0)),
    CONSTRAINT "donationBank_donationbanksetting_privacy_check" CHECK ((privacy >= 0))
);


ALTER TABLE public."donationBank_donationbanksetting" OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16750)
-- Name: donationBank_donationbanksetting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."donationBank_donationbanksetting_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."donationBank_donationbanksetting_id_seq" OWNER TO postgres;

--
-- TOC entry 3694 (class 0 OID 0)
-- Dependencies: 238
-- Name: donationBank_donationbanksetting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."donationBank_donationbanksetting_id_seq" OWNED BY public."donationBank_donationbanksetting".id;


--
-- TOC entry 237 (class 1259 OID 16738)
-- Name: donationBank_donationprogress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."donationBank_donationprogress" (
    id integer NOT NULL,
    progress_status smallint NOT NULL,
    completion_date date,
    first_name character varying(50),
    last_name character varying(50),
    gender character varying(10),
    blood_group character varying(10),
    dob date,
    contact character varying(20),
    email character varying(254),
    address character varying(250),
    city character varying(100),
    state character varying(100),
    country character varying(2),
    details text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    donation_id integer NOT NULL,
    CONSTRAINT "donationBank_donationprogress_progress_status_check" CHECK ((progress_status >= 0))
);


ALTER TABLE public."donationBank_donationprogress" OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16736)
-- Name: donationBank_donationprogress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."donationBank_donationprogress_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."donationBank_donationprogress_id_seq" OWNER TO postgres;

--
-- TOC entry 3695 (class 0 OID 0)
-- Dependencies: 236
-- Name: donationBank_donationprogress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."donationBank_donationprogress_id_seq" OWNED BY public."donationBank_donationprogress".id;


--
-- TOC entry 245 (class 1259 OID 16846)
-- Name: donationBank_donationrequest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."donationBank_donationrequest" (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    donation_type smallint NOT NULL,
    blood_group character varying(20),
    organ_name character varying(100),
    tissue_name character varying(100),
    quantity character varying(3) NOT NULL,
    details text,
    publication_status smallint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    bank_id integer NOT NULL,
    CONSTRAINT "donationBank_donationrequest_donation_type_4d2517ad_check" CHECK ((donation_type >= 0)),
    CONSTRAINT "donationBank_donationrequest_publication_status_check" CHECK ((publication_status >= 0))
);


ALTER TABLE public."donationBank_donationrequest" OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 16844)
-- Name: donationBank_donationrequest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."donationBank_donationrequest_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."donationBank_donationrequest_id_seq" OWNER TO postgres;

--
-- TOC entry 3696 (class 0 OID 0)
-- Dependencies: 244
-- Name: donationBank_donationrequest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."donationBank_donationrequest_id_seq" OWNED BY public."donationBank_donationrequest".id;


--
-- TOC entry 284 (class 1259 OID 17319)
-- Name: donationBank_donationrequestprogress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."donationBank_donationrequestprogress" (
    id integer NOT NULL,
    progress_status smallint NOT NULL,
    completion_date date,
    first_name character varying(50),
    last_name character varying(50),
    gender character varying(10),
    blood_group character varying(10),
    dob date,
    contact character varying(20),
    email character varying(254),
    address character varying(250),
    city character varying(100),
    state character varying(100),
    country character varying(2),
    details text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    donation_id integer NOT NULL,
    CONSTRAINT "donationBank_donationrequestprogress_progress_status_check" CHECK ((progress_status >= 0))
);


ALTER TABLE public."donationBank_donationrequestprogress" OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 17317)
-- Name: donationBank_donationrequestprogress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."donationBank_donationrequestprogress_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."donationBank_donationrequestprogress_id_seq" OWNER TO postgres;

--
-- TOC entry 3697 (class 0 OID 0)
-- Dependencies: 283
-- Name: donationBank_donationrequestprogress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."donationBank_donationrequestprogress_id_seq" OWNED BY public."donationBank_donationrequestprogress".id;


--
-- TOC entry 235 (class 1259 OID 16726)
-- Name: donationBank_memberrequest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."donationBank_memberrequest" (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    bank_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public."donationBank_memberrequest" OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16724)
-- Name: donationBank_memberrequest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."donationBank_memberrequest_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."donationBank_memberrequest_id_seq" OWNER TO postgres;

--
-- TOC entry 3698 (class 0 OID 0)
-- Dependencies: 234
-- Name: donationBank_memberrequest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."donationBank_memberrequest_id_seq" OWNED BY public."donationBank_memberrequest".id;


--
-- TOC entry 247 (class 1259 OID 16891)
-- Name: donations_donation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.donations_donation (
    id integer NOT NULL,
    title character varying(60) NOT NULL,
    slug character varying(50) NOT NULL,
    category smallint NOT NULL,
    type smallint NOT NULL,
    blood_group character varying(20),
    blood_bag character varying(4),
    organ_name character varying(100),
    tissue_name character varying(100),
    quantity character varying(4),
    donate_type smallint NOT NULL,
    is_verified boolean NOT NULL,
    details text,
    contact character varying(17) NOT NULL,
    contact2 character varying(17),
    contact3 character varying(17),
    contact_privacy smallint NOT NULL,
    location character varying(200) NOT NULL,
    city character varying(100) NOT NULL,
    state character varying(100),
    country character varying(2) NOT NULL,
    hospital character varying(200),
    preferred_date timestamp with time zone,
    preferred_date_from timestamp with time zone,
    preferred_date_to timestamp with time zone,
    priority smallint NOT NULL,
    publication_status smallint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT donations_donation_category_check CHECK ((category >= 0)),
    CONSTRAINT donations_donation_contact_privacy_check CHECK ((contact_privacy >= 0)),
    CONSTRAINT donations_donation_donate_type_check CHECK ((donate_type >= 0)),
    CONSTRAINT donations_donation_priority_check CHECK ((priority >= 0)),
    CONSTRAINT donations_donation_publication_status_check CHECK ((publication_status >= 0)),
    CONSTRAINT donations_donation_type_check CHECK ((type >= 0))
);


ALTER TABLE public.donations_donation OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 16889)
-- Name: donations_donation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.donations_donation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.donations_donation_id_seq OWNER TO postgres;

--
-- TOC entry 3699 (class 0 OID 0)
-- Dependencies: 246
-- Name: donations_donation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.donations_donation_id_seq OWNED BY public.donations_donation.id;


--
-- TOC entry 253 (class 1259 OID 16929)
-- Name: donations_donationprogress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.donations_donationprogress (
    id integer NOT NULL,
    progress_status smallint NOT NULL,
    completion_date date,
    management_status smallint,
    details text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    donation_id integer NOT NULL,
    CONSTRAINT donations_donationprogress_management_status_check CHECK ((management_status >= 0)),
    CONSTRAINT donations_donationprogress_progress_status_check CHECK ((progress_status >= 0))
);


ALTER TABLE public.donations_donationprogress OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 16927)
-- Name: donations_donationprogress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.donations_donationprogress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.donations_donationprogress_id_seq OWNER TO postgres;

--
-- TOC entry 3700 (class 0 OID 0)
-- Dependencies: 252
-- Name: donations_donationprogress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.donations_donationprogress_id_seq OWNED BY public.donations_donationprogress.id;


--
-- TOC entry 274 (class 1259 OID 17175)
-- Name: donations_donationprogress_respondent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.donations_donationprogress_respondent (
    id integer NOT NULL,
    donationprogress_id integer NOT NULL,
    donationrespond_id integer NOT NULL
);


ALTER TABLE public.donations_donationprogress_respondent OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 17173)
-- Name: donations_donationprogress_respondent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.donations_donationprogress_respondent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.donations_donationprogress_respondent_id_seq OWNER TO postgres;

--
-- TOC entry 3701 (class 0 OID 0)
-- Dependencies: 273
-- Name: donations_donationprogress_respondent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.donations_donationprogress_respondent_id_seq OWNED BY public.donations_donationprogress_respondent.id;


--
-- TOC entry 251 (class 1259 OID 16918)
-- Name: donations_donationrespond; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.donations_donationrespond (
    id integer NOT NULL,
    contact character varying(17),
    message text,
    is_selected boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    donation_id integer NOT NULL,
    respondent_id integer NOT NULL,
    is_applied_for_selection boolean NOT NULL
);


ALTER TABLE public.donations_donationrespond OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 16916)
-- Name: donations_donationrespond_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.donations_donationrespond_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.donations_donationrespond_id_seq OWNER TO postgres;

--
-- TOC entry 3702 (class 0 OID 0)
-- Dependencies: 250
-- Name: donations_donationrespond_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.donations_donationrespond_id_seq OWNED BY public.donations_donationrespond.id;


--
-- TOC entry 249 (class 1259 OID 16910)
-- Name: donations_donationutil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.donations_donationutil (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    donation_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.donations_donationutil OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 16908)
-- Name: donations_donationutil_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.donations_donationutil_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.donations_donationutil_id_seq OWNER TO postgres;

--
-- TOC entry 3703 (class 0 OID 0)
-- Dependencies: 248
-- Name: donations_donationutil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.donations_donationutil_id_seq OWNED BY public.donations_donationutil.id;


--
-- TOC entry 227 (class 1259 OID 16662)
-- Name: priceplan_plan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.priceplan_plan (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    amount integer NOT NULL,
    currency character varying(50) NOT NULL,
    expiration_cycle smallint NOT NULL,
    description text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    CONSTRAINT priceplan_plan_amount_check CHECK ((amount >= 0)),
    CONSTRAINT priceplan_plan_expiration_cycle_check CHECK ((expiration_cycle >= 0))
);


ALTER TABLE public.priceplan_plan OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16660)
-- Name: priceplan_plan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.priceplan_plan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.priceplan_plan_id_seq OWNER TO postgres;

--
-- TOC entry 3704 (class 0 OID 0)
-- Dependencies: 226
-- Name: priceplan_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.priceplan_plan_id_seq OWNED BY public.priceplan_plan.id;


--
-- TOC entry 258 (class 1259 OID 17012)
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 17010)
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO postgres;

--
-- TOC entry 3705 (class 0 OID 0)
-- Dependencies: 257
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- TOC entry 260 (class 1259 OID 17023)
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 17021)
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO postgres;

--
-- TOC entry 3706 (class 0 OID 0)
-- Dependencies: 259
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- TOC entry 262 (class 1259 OID 17031)
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 17029)
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO postgres;

--
-- TOC entry 3707 (class 0 OID 0)
-- Dependencies: 261
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- TOC entry 264 (class 1259 OID 17039)
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 17037)
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO postgres;

--
-- TOC entry 3708 (class 0 OID 0)
-- Dependencies: 263
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- TOC entry 266 (class 1259 OID 17089)
-- Name: suspicious_suspicious; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suspicious_suspicious (
    id integer NOT NULL,
    attempt smallint NOT NULL,
    first_attempt timestamp with time zone NOT NULL,
    last_attempt timestamp with time zone NOT NULL,
    ip character varying(150),
    mac character varying(150),
    user_id integer NOT NULL,
    CONSTRAINT suspicious_suspicious_attempt_check CHECK ((attempt >= 0))
);


ALTER TABLE public.suspicious_suspicious OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 17087)
-- Name: suspicious_suspicious_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suspicious_suspicious_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suspicious_suspicious_id_seq OWNER TO postgres;

--
-- TOC entry 3709 (class 0 OID 0)
-- Dependencies: 265
-- Name: suspicious_suspicious_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suspicious_suspicious_id_seq OWNED BY public.suspicious_suspicious.id;


--
-- TOC entry 272 (class 1259 OID 17127)
-- Name: utils_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utils_location (
    id integer NOT NULL,
    location_type smallint NOT NULL,
    location text,
    hit integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    provider_id integer NOT NULL,
    CONSTRAINT utils_location_hit_check CHECK ((hit >= 0)),
    CONSTRAINT utils_location_location_type_check CHECK ((location_type >= 0))
);


ALTER TABLE public.utils_location OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 17125)
-- Name: utils_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utils_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utils_location_id_seq OWNER TO postgres;

--
-- TOC entry 3710 (class 0 OID 0)
-- Dependencies: 271
-- Name: utils_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utils_location_id_seq OWNED BY public.utils_location.id;


--
-- TOC entry 270 (class 1259 OID 17114)
-- Name: utils_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utils_notification (
    id integer NOT NULL,
    category character varying(255),
    identifier character varying(255),
    slug character varying(50) NOT NULL,
    subject character varying(255),
    message text,
    is_seen boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    receiver_id integer,
    sender_id integer
);


ALTER TABLE public.utils_notification OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 17112)
-- Name: utils_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utils_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utils_notification_id_seq OWNER TO postgres;

--
-- TOC entry 3711 (class 0 OID 0)
-- Dependencies: 269
-- Name: utils_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utils_notification_id_seq OWNED BY public.utils_notification.id;


--
-- TOC entry 268 (class 1259 OID 17104)
-- Name: utils_sitepreference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utils_sitepreference (
    id integer NOT NULL,
    logo_header_color character varying(100),
    navbar_header_color character varying(100),
    sidebar_color character varying(50),
    background_color character varying(50),
    sidebar_type character varying(50),
    scroll_to_top boolean NOT NULL,
    chat_with_others boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.utils_sitepreference OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 17102)
-- Name: utils_sitepreference_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utils_sitepreference_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utils_sitepreference_id_seq OWNER TO postgres;

--
-- TOC entry 3712 (class 0 OID 0)
-- Dependencies: 267
-- Name: utils_sitepreference_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utils_sitepreference_id_seq OWNED BY public.utils_sitepreference.id;


--
-- TOC entry 3099 (class 2604 OID 16515)
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- TOC entry 3100 (class 2604 OID 16525)
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- TOC entry 3154 (class 2604 OID 17249)
-- Name: accounts_userpermission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userpermission ALTER COLUMN id SET DEFAULT nextval('public.accounts_userpermission_id_seq'::regclass);


--
-- TOC entry 3102 (class 2604 OID 16562)
-- Name: accounts_userprofile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userprofile ALTER COLUMN id SET DEFAULT nextval('public.accounts_userprofile_id_seq'::regclass);


--
-- TOC entry 3153 (class 2604 OID 17212)
-- Name: accounts_userreport id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userreport ALTER COLUMN id SET DEFAULT nextval('public.accounts_userreport_id_seq'::regclass);


--
-- TOC entry 3101 (class 2604 OID 16552)
-- Name: accounts_userstripe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userstripe ALTER COLUMN id SET DEFAULT nextval('public.accounts_userstripe_id_seq'::regclass);


--
-- TOC entry 3094 (class 2604 OID 16419)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 3095 (class 2604 OID 16429)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 3093 (class 2604 OID 16411)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 3096 (class 2604 OID 16437)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 3097 (class 2604 OID 16447)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 3098 (class 2604 OID 16455)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 3156 (class 2604 OID 17284)
-- Name: blog_attachment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_attachment ALTER COLUMN id SET DEFAULT nextval('public.blog_attachment_id_seq'::regclass);


--
-- TOC entry 3155 (class 2604 OID 17264)
-- Name: blog_blog id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_blog ALTER COLUMN id SET DEFAULT nextval('public.blog_blog_id_seq'::regclass);


--
-- TOC entry 3159 (class 2604 OID 17342)
-- Name: blog_comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_comment ALTER COLUMN id SET DEFAULT nextval('public.blog_comment_id_seq'::regclass);


--
-- TOC entry 3160 (class 2604 OID 17366)
-- Name: blog_commentreply id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_commentreply ALTER COLUMN id SET DEFAULT nextval('public.blog_commentreply_id_seq'::regclass);


--
-- TOC entry 3107 (class 2604 OID 16630)
-- Name: chat_chatmessage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_chatmessage ALTER COLUMN id SET DEFAULT nextval('public.chat_chatmessage_id_seq'::regclass);


--
-- TOC entry 3106 (class 2604 OID 16622)
-- Name: chat_thread id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_thread ALTER COLUMN id SET DEFAULT nextval('public.chat_thread_id_seq'::regclass);


--
-- TOC entry 3111 (class 2604 OID 16681)
-- Name: checkout_checkout id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checkout_checkout ALTER COLUMN id SET DEFAULT nextval('public.checkout_checkout_id_seq'::regclass);


--
-- TOC entry 3104 (class 2604 OID 16589)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 3092 (class 2604 OID 16401)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 3091 (class 2604 OID 16390)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 3140 (class 2604 OID 17004)
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- TOC entry 3122 (class 2604 OID 16766)
-- Name: donationBank_bankmember id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_bankmember" ALTER COLUMN id SET DEFAULT nextval('public."donationBank_bankmember_id_seq"'::regclass);


--
-- TOC entry 3124 (class 2604 OID 16818)
-- Name: donationBank_campaign id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_campaign" ALTER COLUMN id SET DEFAULT nextval('public."donationBank_campaign_id_seq"'::regclass);


--
-- TOC entry 3112 (class 2604 OID 16701)
-- Name: donationBank_donation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_donation" ALTER COLUMN id SET DEFAULT nextval('public."donationBank_donation_id_seq"'::regclass);


--
-- TOC entry 3115 (class 2604 OID 16716)
-- Name: donationBank_donationbank id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_donationbank" ALTER COLUMN id SET DEFAULT nextval('public."donationBank_donationbank_id_seq"'::regclass);


--
-- TOC entry 3119 (class 2604 OID 16755)
-- Name: donationBank_donationbanksetting id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_donationbanksetting" ALTER COLUMN id SET DEFAULT nextval('public."donationBank_donationbanksetting_id_seq"'::regclass);


--
-- TOC entry 3117 (class 2604 OID 16741)
-- Name: donationBank_donationprogress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_donationprogress" ALTER COLUMN id SET DEFAULT nextval('public."donationBank_donationprogress_id_seq"'::regclass);


--
-- TOC entry 3125 (class 2604 OID 16849)
-- Name: donationBank_donationrequest id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_donationrequest" ALTER COLUMN id SET DEFAULT nextval('public."donationBank_donationrequest_id_seq"'::regclass);


--
-- TOC entry 3157 (class 2604 OID 17322)
-- Name: donationBank_donationrequestprogress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_donationrequestprogress" ALTER COLUMN id SET DEFAULT nextval('public."donationBank_donationrequestprogress_id_seq"'::regclass);


--
-- TOC entry 3116 (class 2604 OID 16729)
-- Name: donationBank_memberrequest id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_memberrequest" ALTER COLUMN id SET DEFAULT nextval('public."donationBank_memberrequest_id_seq"'::regclass);


--
-- TOC entry 3128 (class 2604 OID 16894)
-- Name: donations_donation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations_donation ALTER COLUMN id SET DEFAULT nextval('public.donations_donation_id_seq'::regclass);


--
-- TOC entry 3137 (class 2604 OID 16932)
-- Name: donations_donationprogress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations_donationprogress ALTER COLUMN id SET DEFAULT nextval('public.donations_donationprogress_id_seq'::regclass);


--
-- TOC entry 3152 (class 2604 OID 17178)
-- Name: donations_donationprogress_respondent id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations_donationprogress_respondent ALTER COLUMN id SET DEFAULT nextval('public.donations_donationprogress_respondent_id_seq'::regclass);


--
-- TOC entry 3136 (class 2604 OID 16921)
-- Name: donations_donationrespond id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations_donationrespond ALTER COLUMN id SET DEFAULT nextval('public.donations_donationrespond_id_seq'::regclass);


--
-- TOC entry 3135 (class 2604 OID 16913)
-- Name: donations_donationutil id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations_donationutil ALTER COLUMN id SET DEFAULT nextval('public.donations_donationutil_id_seq'::regclass);


--
-- TOC entry 3108 (class 2604 OID 16665)
-- Name: priceplan_plan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priceplan_plan ALTER COLUMN id SET DEFAULT nextval('public.priceplan_plan_id_seq'::regclass);


--
-- TOC entry 3141 (class 2604 OID 17015)
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- TOC entry 3142 (class 2604 OID 17026)
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- TOC entry 3143 (class 2604 OID 17034)
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- TOC entry 3144 (class 2604 OID 17042)
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- TOC entry 3145 (class 2604 OID 17092)
-- Name: suspicious_suspicious id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suspicious_suspicious ALTER COLUMN id SET DEFAULT nextval('public.suspicious_suspicious_id_seq'::regclass);


--
-- TOC entry 3149 (class 2604 OID 17130)
-- Name: utils_location id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utils_location ALTER COLUMN id SET DEFAULT nextval('public.utils_location_id_seq'::regclass);


--
-- TOC entry 3148 (class 2604 OID 17117)
-- Name: utils_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utils_notification ALTER COLUMN id SET DEFAULT nextval('public.utils_notification_id_seq'::regclass);


--
-- TOC entry 3147 (class 2604 OID 17107)
-- Name: utils_sitepreference id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utils_sitepreference ALTER COLUMN id SET DEFAULT nextval('public.utils_sitepreference_id_seq'::regclass);


--
-- TOC entry 3586 (class 0 OID 16512)
-- Dependencies: 213
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
1	nelmannuman@gmail.com	t	t	5
2	abuser@gmail.com	f	t	6
3	sss@gmail.com	f	t	7
4	cycoto@mailinator.com	f	t	8
5	bucevuza@mailinator.com	f	t	9
6	gufeje@mailinator.com	f	t	10
7	cobepeg@mailinator.net	f	t	11
8	bekojes@mailinator.net	f	t	12
9	kehepa@mailinator.com	f	t	13
10	goxuz@mailinator.com	f	t	14
11	ryfo@mailinator.net	f	t	15
12	zobeleti@mailinator.net	f	t	16
13	cvbb@gmail.com	f	t	17
14	kkjjhg@gmail.com	f	t	18
15	vbnn@gmail.com	f	t	19
16	fiquxod@mailinator.net	f	t	20
17	tyfadajeg@mailinator.com	f	t	21
18	muzev@mailinator.com	f	t	22
19	xyvazu@mailinator.com	f	t	23
20	poxyxaxa@mailinator.com	f	t	24
21	vuhusy@mailinator.net	f	t	25
22	bugiv@mailinator.net	f	t	26
23	secivazuqy@mailinator.net	f	t	27
24	leguqe@mailinator.net	f	t	28
25	sabihadishaa@gmail.com	f	t	29
26	gaju@mailinator.com	f	t	30
27	mofyka@mailinator.com	f	t	31
28	tuxofaq@mailinator.com	f	t	32
29	qodepaqo@mailinator.net	f	t	33
30	hytidewax@mailinator.net	f	t	36
31	gufevibigi@mailinator.net	f	t	37
32	tegu@mailinator.com	f	t	38
33	tupiqip@mailinator.net	f	t	39
34	koha@mailinator.net	f	t	40
35	qoryhyqy@mailinator.net	f	t	41
\.


--
-- TOC entry 3588 (class 0 OID 16522)
-- Dependencies: 215
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- TOC entry 3651 (class 0 OID 17246)
-- Dependencies: 278
-- Data for Name: accounts_userpermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_userpermission (id, can_browse, can_donate, can_ask_for_a_donor, can_manage_bank, can_chat, created_at, updated_at, user_id) FROM stdin;
1	t	t	t	t	t	2019-10-07 00:01:51.199707+06	2019-10-07 00:01:51.199736+06	2
2	t	t	t	t	t	2019-10-07 00:01:51.204959+06	2019-10-07 00:01:51.204977+06	4
3	t	t	t	t	t	2019-10-07 00:01:51.20871+06	2019-10-07 00:01:51.208738+06	12
4	t	t	t	t	t	2019-10-07 00:01:51.211933+06	2019-10-07 00:01:51.211956+06	5
5	t	t	t	t	t	2019-10-07 00:01:51.213961+06	2019-10-07 00:01:51.213988+06	6
6	t	t	t	t	t	2019-10-07 00:01:51.215939+06	2019-10-07 00:01:51.215959+06	16
7	t	t	t	t	t	2019-10-07 00:01:51.218226+06	2019-10-07 00:01:51.21825+06	25
8	t	t	t	t	t	2019-10-07 00:01:51.220576+06	2019-10-07 00:01:51.220589+06	7
9	t	t	t	t	t	2019-10-07 00:01:51.222783+06	2019-10-07 00:01:51.222882+06	1
11	t	t	t	t	t	2019-10-07 00:01:51.230574+06	2019-10-07 00:01:51.230592+06	17
12	t	t	t	t	t	2019-10-07 00:01:51.232249+06	2019-10-07 00:01:51.232275+06	18
13	t	t	t	t	t	2019-10-07 00:01:51.234358+06	2019-10-07 00:01:51.234374+06	8
14	t	t	t	t	t	2019-10-07 00:01:51.235862+06	2019-10-07 00:01:51.235886+06	9
15	t	t	t	t	t	2019-10-07 00:01:51.23721+06	2019-10-07 00:01:51.237226+06	10
16	t	t	t	t	t	2019-10-07 00:01:51.238483+06	2019-10-07 00:01:51.238498+06	11
17	t	t	t	t	t	2019-10-07 00:01:51.241885+06	2019-10-07 00:01:51.241904+06	13
18	t	t	t	t	t	2019-10-07 00:01:51.243573+06	2019-10-07 00:01:51.243593+06	14
19	t	t	t	t	t	2019-10-07 00:01:51.246142+06	2019-10-07 00:01:51.246159+06	15
21	t	t	t	t	t	2019-10-07 00:01:51.249953+06	2019-10-07 00:01:51.249966+06	20
22	t	t	t	t	t	2019-10-07 00:01:51.251759+06	2019-10-07 00:01:51.251777+06	21
23	t	t	t	t	t	2019-10-07 00:01:51.253647+06	2019-10-07 00:01:51.253753+06	22
24	t	t	t	t	t	2019-10-07 00:01:51.255268+06	2019-10-07 00:01:51.25528+06	23
25	t	t	t	t	t	2019-10-07 00:01:51.25896+06	2019-10-07 00:01:51.259111+06	24
26	t	f	t	t	t	2019-10-07 00:48:18.50679+06	2019-10-07 06:37:09.665071+06	26
20	t	f	t	t	t	2019-10-07 00:01:51.247825+06	2019-10-07 07:57:05.926933+06	19
27	t	f	t	t	t	2019-10-07 07:12:34.059095+06	2019-10-07 09:30:10.817546+06	27
28	t	t	t	t	t	2019-10-07 09:50:45.327489+06	2019-10-07 09:50:45.327499+06	28
29	t	t	t	t	t	2019-10-12 19:45:25.823263+06	2019-10-12 19:45:25.823276+06	29
30	t	t	t	t	t	2019-10-15 01:43:07.875169+06	2019-10-15 01:43:07.87518+06	30
31	t	t	t	t	t	2019-10-17 06:12:20.457952+06	2019-10-17 06:12:20.45808+06	31
32	t	t	t	t	t	2019-10-20 22:38:42.661886+06	2019-10-20 22:38:42.661904+06	32
33	t	t	t	t	t	2019-10-21 04:38:04.012833+06	2019-10-21 04:38:04.012847+06	33
34	t	t	t	t	t	2019-10-21 05:09:58.595873+06	2019-10-21 05:09:58.595883+06	36
35	t	t	t	t	t	2019-10-21 05:10:48.185532+06	2019-10-21 05:10:48.185542+06	37
36	t	t	t	t	t	2019-10-21 05:11:27.044559+06	2019-10-21 05:11:27.044569+06	38
37	t	t	t	t	t	2019-10-21 05:12:08.785041+06	2019-10-21 05:12:08.785052+06	39
10	t	t	t	t	t	2019-10-07 00:01:51.228912+06	2019-10-21 13:11:14.110295+06	3
38	t	t	t	t	t	2019-10-21 13:34:07.919733+06	2019-10-21 13:34:07.919748+06	40
39	t	t	t	t	t	2019-10-21 13:37:40.279545+06	2019-10-21 13:37:40.279558+06	41
\.


--
-- TOC entry 3592 (class 0 OID 16559)
-- Dependencies: 219
-- Data for Name: accounts_userprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_userprofile (id, slug, account_type, gender, dob, blood_group, contact, address, city, state, country, about, facebook, linkedin, website, image, created_at, updated_at, user_id) FROM stdin;
1	admin-x73g0994980253062494982019	0	\N	1996-02-27	B+	+8801685238317		\N	\N	\N		\N	\N	\N	Accounts/admin/Profile-Picture/admin_20190930-065543.png	2019-09-24 02:53:06.316081+06	2019-10-21 11:13:00.508263+06	1
2	numanworkstation-vnve0972630253302472632019	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N		2019-09-24 02:53:30.759056+06	2019-09-24 02:53:30.760659+06	2
13	jojahazami-hnbq1041181114320341182019	1	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N		2019-10-03 11:14:32.683374+06	2019-10-03 11:14:37.679765+06	13
3	darkstarnmn-48yy0925150253412425152019	1	\N	\N	B+			\N	\N	BD		\N	\N	\N	Accounts/darkstarnmn/Profile-Picture/darkstarnmn_20191004-235454.png	2019-09-24 02:53:41.227146+06	2019-10-21 11:13:10.763216+06	3
24	pavyzacazi-0gjz1031630429500631632019	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N		2019-10-06 04:29:50.017642+06	2019-10-06 04:29:53.666064+06	24
14	nolym-sm1d1038871136190338872019	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N		2019-10-03 11:36:19.535936+06	2019-10-03 11:36:23.362796+06	14
15	dawozahim-d0sw1002191139120302192019	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N		2019-10-03 11:39:12.85513+06	2019-10-03 11:39:16.654789+06	15
33	qanoha-4bok1060510438042160512019	0	\N	\N		\N	\N	\N	\N	BD	\N	\N	\N	\N		2019-10-21 04:38:04.009991+06	2019-10-21 04:38:08.722337+06	33
12	zojuban-qopt1055120355060355122019	0	\N	\N	B+			\N	\N	\N		\N	\N	\N		2019-10-03 03:55:06.178503+06	2019-10-03 11:42:22.001188+06	12
5	nelmannuman-eubz0951730304182451732019	1	Male	\N	B+			\N	\N	\N		\N	\N	\N		2019-09-24 03:04:18.24605+06	2019-09-27 09:58:36.956982+06	5
6	abuser-bggz0919681024482719682019	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N		2019-09-27 10:24:48.945523+06	2019-09-27 10:24:56.438987+06	6
25	xyzyrogex-g18k1009630442030609632019	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N		2019-10-06 04:42:03.196758+06	2019-10-06 04:42:06.894121+06	25
37	badonyda-265q1078030512082178032019	0	\N	\N	O+			\N	\N	BD		\N	\N	\N	Accounts/badonyda/Profile-Picture/badonyda_20191021-122120.png	2019-10-21 05:12:08.783128+06	2019-10-21 12:21:20.533855+06	39
16	jywycajy-pqkd1019021144370319022019	0	\N	\N	B+	+8802123123232		\N	\N	\N		\N	\N	\N		2019-10-03 11:44:37.626083+06	2019-10-04 23:20:51.049704+06	16
7	sss-hupd0990961036432790962019	1	\N	\N	B+			\N	\N	\N		\N	\N	\N		2019-09-27 10:36:43.976049+06	2019-09-27 10:42:42.338769+06	7
4	test-yo850927840253412427842019	0	\N	\N	A+			\N	\N	\N		\N	\N	\N		2019-09-24 02:53:41.32558+06	2019-10-19 09:49:34.870935+06	4
17	cbv-2wjh1068740143210568742019	0	\N	\N	B+			\N	\N	\N		\N	\N	\N		2019-10-05 01:43:21.646358+06	2019-10-05 01:43:42.221228+06	17
32	zarir-jshx1049122238422049122019	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N		2019-10-20 22:38:42.658577+06	2019-10-20 22:38:48.041877+06	32
29	disha-4dnr1092371945251292372019	1	\N	\N	B+			\N	\N	\N		\N	\N	\N		2019-10-12 19:45:25.818899+06	2019-10-12 19:53:42.276126+06	29
18	kkjhyui-53x21094000144300594002019	0	\N	\N	B+			\N	\N	\N		\N	\N	\N		2019-10-05 01:44:30.350423+06	2019-10-05 01:44:49.122818+06	18
26	qalesece-zdvu1098620048180798622019	1	\N	\N	B+			\N	\N	\N		\N	\N	\N		2019-10-07 00:48:18.504685+06	2019-10-07 07:01:24.531055+06	26
8	fyjuwy-zpj30980210150553080212019	1	Male	\N	B+			\N	\N	BD		\N	\N	\N		2019-09-30 01:50:55.03205+06	2019-10-02 21:00:58.571093+06	8
9	jagejot-mtsb1049242101500249242019	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N		2019-10-02 21:01:50.45185+06	2019-10-02 21:01:54.321666+06	9
19	hjhhj-3hf61029020402270529022019	0	\N	\N	B+			\N	\N	\N		\N	\N	\N		2019-10-05 04:02:27.416027+06	2019-10-05 04:02:44.224202+06	19
10	bagemizyj-v51v1041140243240341142019	1	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N		2019-10-03 02:43:24.023531+06	2019-10-03 02:43:29.100752+06	10
11	xicunevixa-wlow1069410246170369412019	1	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N		2019-10-03 02:46:17.60202+06	2019-10-03 02:46:21.309696+06	11
27	qiluhedyw-cj5u1059030712340759032019	1	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N		2019-10-07 07:12:34.057298+06	2019-10-07 07:12:38.977869+06	27
34	giqevek-p9kk1034450509582134452019	0	\N	\N		\N	\N	\N	\N	BD	\N	\N	\N	\N		2019-10-21 05:09:58.594202+06	2019-10-21 05:10:02.748164+06	36
20	sidusi-xe6a1020260421490620262019	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N		2019-10-06 04:21:49.948768+06	2019-10-06 04:21:54.367968+06	20
30	cufytoty-zakz1084140143071584142019	0	\N	\N	AB+			\N	\N	\N		\N	\N	\N	Accounts/cufytoty/Profile-Picture/cufytoty_20191015-040151.png	2019-10-15 01:43:07.872542+06	2019-10-15 04:01:51.778945+06	30
21	lagyd-ezd41021780422210621782019	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N		2019-10-06 04:22:21.169681+06	2019-10-06 04:22:25.04363+06	21
28	zywawejiwe-dqez1062230950450762232019	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N		2019-10-07 09:50:45.325417+06	2019-10-07 09:50:49.339751+06	28
22	qohedu-64ct1089140422490689142019	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N		2019-10-06 04:22:49.868797+06	2019-10-06 04:22:53.626763+06	22
38	zovuw-pss81016321334072116322019	0	\N	\N	O+			\N	\N	BD		\N	\N	\N		2019-10-21 13:34:07.91615+06	2019-10-21 13:34:43.530695+06	40
23	xuzevu-77at1095550428580695552019	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N		2019-10-06 04:28:58.721661+06	2019-10-06 04:29:02.399474+06	23
35	fynucy-ostw1027770510482127772019	0	\N	\N	AB-	\N	\N	\N	\N	BD	\N	\N	\N	\N		2019-10-21 05:10:48.183676+06	2019-10-21 05:10:52.03419+06	37
31	xilubub-mua41033780612201733782019	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N		2019-10-17 06:12:20.452966+06	2019-10-17 06:12:25.16559+06	31
36	qycegyhyf-3dm51011070511272111072019	0	\N	\N	B-	\N	\N	\N	\N	BD	\N	\N	\N	\N		2019-10-21 05:11:27.041994+06	2019-10-21 05:11:30.816254+06	38
39	dazizotady-hpfd1065971337402165972019	0	\N	\N	O+			\N	\N	BD		\N	\N	\N		2019-10-21 13:37:40.277415+06	2019-10-21 13:37:59.413852+06	41
\.


--
-- TOC entry 3649 (class 0 OID 17209)
-- Dependencies: 276
-- Data for Name: accounts_userreport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_userreport (id, slug, category, details, created_at, updated_at, user_id, reported_by_id) FROM stdin;
3	hjhhj_o89e1000220244250600222019	Inappropriate Behavior		2019-10-06 02:44:25.022012+06	2019-10-06 02:44:25.022026+06	19	3
9	hjhhj_5lgt1031430429130631432019	Have Diseases		2019-10-06 04:29:13.933275+06	2019-10-06 04:29:13.933284+06	19	23
12	darkstarnm_zj2a1037710920201937712019	Inappropriate Behavior	he has not behaved well.,.,.,.,.	2019-10-19 09:20:20.224698+06	2019-10-19 09:20:20.224722+06	3	31
45	dazizotady_yki21078961343262178962019	Inappropriate Behavior	hgghg	2019-10-21 13:43:26.195391+06	2019-10-21 13:43:26.195416+06	41	40
\.


--
-- TOC entry 3590 (class 0 OID 16549)
-- Dependencies: 217
-- Data for Name: accounts_userstripe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_userstripe (id, stripe_id, created_at, updated_at, user_id) FROM stdin;
1	cus_FrhyUTXJxbqYu5	2019-09-24 02:54:19.045415+06	2019-09-24 02:54:21.01498+06	3
2	cus_Fri7OWzJRxvITD	2019-09-24 03:04:18.258666+06	2019-09-24 03:04:18.890446+06	5
3	cus_FswuYWJsu4jeLr	2019-09-27 10:24:48.967343+06	2019-09-27 10:24:50.682342+06	6
4	cus_Fsx6hQABkjC8u8	2019-09-27 10:36:43.992689+06	2019-09-27 10:36:45.022435+06	7
5	cus_FtwI3V205Q838F	2019-09-30 01:50:55.046743+06	2019-09-30 01:50:55.950817+06	8
6	cus_FuzJD6zN8S7LAb	2019-10-02 21:01:50.463314+06	2019-10-02 21:01:51.123415+06	9
7	cus_Fv4pBvTFjfpiMa	2019-10-03 02:43:24.036465+06	2019-10-03 02:43:25.03194+06	10
8	cus_Fv4rluZHp4iFbp	2019-10-03 02:46:17.618697+06	2019-10-03 02:46:18.220662+06	11
9	cus_Fv5yEIRISu7BDy	2019-10-03 03:55:06.197909+06	2019-10-03 03:55:06.844072+06	12
10	cus_FvD4AexwHVhW6e	2019-10-03 11:14:32.702509+06	2019-10-03 11:14:33.605195+06	13
11	cus_FvDQgKrAQPW9Hq	2019-10-03 11:36:19.552415+06	2019-10-03 11:36:20.204764+06	14
12	cus_FvDS1ChQePZ2c9	2019-10-03 11:39:12.872154+06	2019-10-03 11:39:13.556891+06	15
13	cus_FvDY8Skh4j7z6F	2019-10-03 11:44:37.651406+06	2019-10-03 11:44:50.484511+06	16
14	cus_FvoJjZSg6qFmQf	2019-10-05 01:43:21.668227+06	2019-10-05 01:43:22.538047+06	17
15	cus_FvoKylewP81IBc	2019-10-05 01:44:30.367495+06	2019-10-05 01:44:31.045753+06	18
16	cus_FvqY5sA3tjUxIs	2019-10-05 04:02:27.432491+06	2019-10-05 04:02:28.112562+06	19
17	cus_FwE556vAdZEXkY	2019-10-06 04:21:49.966045+06	2019-10-06 04:21:50.822461+06	20
18	cus_FwE6hZ7Ap6eWAy	2019-10-06 04:22:21.183798+06	2019-10-06 04:22:21.826721+06	21
19	cus_FwE6uTIwng1H03	2019-10-06 04:22:49.884076+06	2019-10-06 04:22:50.589979+06	22
20	cus_FwECmCJ9baAS5h	2019-10-06 04:28:58.737454+06	2019-10-06 04:28:59.368167+06	23
21	cus_FwEDMB72qdIlYN	2019-10-06 04:29:50.033574+06	2019-10-06 04:29:50.696703+06	24
22	cus_FwEP0YYBDtg4If	2019-10-06 04:42:03.209731+06	2019-10-06 04:42:03.8522+06	25
23	cus_FwXr8BlUWn5q2c	2019-10-07 00:48:18.52211+06	2019-10-07 00:48:19.491756+06	26
24	cus_Fwe4QmCL7872kx	2019-10-07 07:12:34.076175+06	2019-10-07 07:12:34.940571+06	27
25	cus_Fwgc7qn1wjRotN	2019-10-07 09:50:45.345759+06	2019-10-07 09:50:45.990514+06	28
26	cus_FyiLX0TWZxYozY	2019-10-12 19:45:25.839765+06	2019-10-12 19:45:28.202542+06	29
27	cus_FzYYYiHjMwkHCL	2019-10-15 01:43:07.894609+06	2019-10-15 01:43:08.822664+06	30
28	cus_G0NMevhGjnyzLj	2019-10-17 06:12:20.481466+06	2019-10-17 06:12:21.401609+06	31
29	cus_G1BDEKUyQJba7i	2019-10-19 09:43:51.560544+06	2019-10-19 09:43:54.173653+06	4
30	cus_G1kwUjUFHFJa5j	2019-10-20 22:38:42.688415+06	2019-10-20 22:38:44.051556+06	32
31	cus_G1qjFjLZlfVNnL	2019-10-21 04:38:04.031016+06	2019-10-21 04:38:05.001455+06	33
32	cus_G1rFAXf5gWQJIT	2019-10-21 05:09:58.61396+06	2019-10-21 05:09:59.325376+06	36
33	cus_G1rGkPc3VsLQhO	2019-10-21 05:10:48.199432+06	2019-10-21 05:10:48.84403+06	37
34	cus_G1rHlwwdfTrnlZ	2019-10-21 05:11:27.057533+06	2019-10-21 05:11:27.744372+06	38
35	cus_G1rH8GLN1hfdY4	2019-10-21 05:12:08.799016+06	2019-10-21 05:12:09.368983+06	39
36	cus_G1zN6D9ADFFq4A	2019-10-21 13:34:07.941965+06	2019-10-21 13:34:09.533023+06	40
37	cus_G1zRCnufUeKAmG	2019-10-21 13:37:40.299563+06	2019-10-21 13:37:42.109188+06	41
\.


--
-- TOC entry 3576 (class 0 OID 16416)
-- Dependencies: 203
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3578 (class 0 OID 16426)
-- Dependencies: 205
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3574 (class 0 OID 16408)
-- Dependencies: 201
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add site	7	add_site
26	Can change site	7	change_site
27	Can delete site	7	delete_site
28	Can view site	7	view_site
29	Can add email address	8	add_emailaddress
30	Can change email address	8	change_emailaddress
31	Can delete email address	8	delete_emailaddress
32	Can view email address	8	view_emailaddress
33	Can add email confirmation	9	add_emailconfirmation
34	Can change email confirmation	9	change_emailconfirmation
35	Can delete email confirmation	9	delete_emailconfirmation
36	Can view email confirmation	9	view_emailconfirmation
37	Can add social account	10	add_socialaccount
38	Can change social account	10	change_socialaccount
39	Can delete social account	10	delete_socialaccount
40	Can view social account	10	view_socialaccount
41	Can add social application	11	add_socialapp
42	Can change social application	11	change_socialapp
43	Can delete social application	11	delete_socialapp
44	Can view social application	11	view_socialapp
45	Can add social application token	12	add_socialtoken
46	Can change social application token	12	change_socialtoken
47	Can delete social application token	12	delete_socialtoken
48	Can view social application token	12	view_socialtoken
49	Can add User Stripe	13	add_userstripe
50	Can change User Stripe	13	change_userstripe
51	Can delete User Stripe	13	delete_userstripe
52	Can view User Stripe	13	view_userstripe
53	Can add User Profile	14	add_userprofile
54	Can change User Profile	14	change_userprofile
55	Can delete User Profile	14	delete_userprofile
56	Can view User Profile	14	view_userprofile
57	Can add Site Preference	15	add_sitepreference
58	Can change Site Preference	15	change_sitepreference
59	Can delete Site Preference	15	delete_sitepreference
60	Can view Site Preference	15	view_sitepreference
61	Can add Notification	16	add_notification
62	Can change Notification	16	change_notification
63	Can delete Notification	16	delete_notification
64	Can view Notification	16	view_notification
65	Can add Location	17	add_location
66	Can change Location	17	change_location
67	Can delete Location	17	delete_location
68	Can view Location	17	view_location
69	Can add Suspicious User	18	add_suspicious
70	Can change Suspicious User	18	change_suspicious
71	Can delete Suspicious User	18	delete_suspicious
72	Can view Suspicious User	18	view_suspicious
73	Can add thread	19	add_thread
74	Can change thread	19	change_thread
75	Can delete thread	19	delete_thread
76	Can view thread	19	view_thread
77	Can add Chat Message	20	add_chatmessage
78	Can change Chat Message	20	change_chatmessage
79	Can delete Chat Message	20	delete_chatmessage
80	Can view Chat Message	20	view_chatmessage
81	Can add Donation	21	add_donation
82	Can change Donation	21	change_donation
83	Can delete Donation	21	delete_donation
84	Can view Donation	21	view_donation
85	Can add Donation Util	22	add_donationutil
86	Can change Donation Util	22	change_donationutil
87	Can delete Donation Util	22	delete_donationutil
88	Can view Donation Util	22	view_donationutil
89	Can add Donation Respond	23	add_donationrespond
90	Can change Donation Respond	23	change_donationrespond
91	Can delete Donation Respond	23	delete_donationrespond
92	Can view Donation Respond	23	view_donationrespond
93	Can add Donation Progress	24	add_donationprogress
94	Can change Donation Progress	24	change_donationprogress
95	Can delete Donation Progress	24	delete_donationprogress
96	Can view Donation Progress	24	view_donationprogress
97	Can add Plan	25	add_plan
98	Can change Plan	25	change_plan
99	Can delete Plan	25	delete_plan
100	Can view Plan	25	view_plan
101	Can add Checkout	26	add_checkout
102	Can change Checkout	26	change_checkout
103	Can delete Checkout	26	delete_checkout
104	Can view Checkout	26	view_checkout
105	Can add Donation	27	add_donation
106	Can change Donation	27	change_donation
107	Can delete Donation	27	delete_donation
108	Can view Donation	27	view_donation
109	Can add DonationBank	28	add_donationbank
110	Can change DonationBank	28	change_donationbank
111	Can delete DonationBank	28	delete_donationbank
112	Can view DonationBank	28	view_donationbank
113	Can add MemberRequest	29	add_memberrequest
114	Can change MemberRequest	29	change_memberrequest
115	Can delete MemberRequest	29	delete_memberrequest
116	Can view MemberRequest	29	view_memberrequest
117	Can add Donation Progress	30	add_donationprogress
118	Can change Donation Progress	30	change_donationprogress
119	Can delete Donation Progress	30	delete_donationprogress
120	Can view Donation Progress	30	view_donationprogress
121	Can add DonationBankSetting	31	add_donationbanksetting
122	Can change DonationBankSetting	31	change_donationbanksetting
123	Can delete DonationBankSetting	31	delete_donationbanksetting
124	Can view DonationBankSetting	31	view_donationbanksetting
125	Can add BankMember	32	add_bankmember
126	Can change BankMember	32	change_bankmember
127	Can delete BankMember	32	delete_bankmember
128	Can view BankMember	32	view_bankmember
129	Can add Campaign	33	add_campaign
130	Can change Campaign	33	change_campaign
131	Can delete Campaign	33	delete_campaign
132	Can view Campaign	33	view_campaign
133	Can add Donation Request	34	add_donationrequest
134	Can change Donation Request	34	change_donationrequest
135	Can delete Donation Request	34	delete_donationrequest
136	Can view Donation Request	34	view_donationrequest
137	Can add User Report	35	add_userreport
138	Can change User Report	35	change_userreport
139	Can delete User Report	35	delete_userreport
140	Can view User Report	35	view_userreport
141	Can add User Permission	36	add_userpermission
142	Can change User Permission	36	change_userpermission
143	Can delete User Permission	36	delete_userpermission
144	Can view User Permission	36	view_userpermission
145	Can add blog	37	add_blog
146	Can change blog	37	change_blog
147	Can delete blog	37	delete_blog
148	Can view blog	37	view_blog
149	Can add Attachment	38	add_attachment
150	Can change Attachment	38	change_attachment
151	Can delete Attachment	38	delete_attachment
152	Can view Attachment	38	view_attachment
153	Can add Donation Request Progress	39	add_donationrequestprogress
154	Can change Donation Request Progress	39	change_donationrequestprogress
155	Can delete Donation Request Progress	39	delete_donationrequestprogress
156	Can view Donation Request Progress	39	view_donationrequestprogress
157	Can add Comment	40	add_comment
158	Can change Comment	40	change_comment
159	Can delete Comment	40	delete_comment
160	Can view Comment	40	view_comment
161	Can add Comment Reply	41	add_commentreply
162	Can change Comment Reply	41	change_commentreply
163	Can delete Comment Reply	41	delete_commentreply
164	Can view Comment Reply	41	view_commentreply
\.


--
-- TOC entry 3580 (class 0 OID 16434)
-- Dependencies: 207
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$150000$2uqL30uEMALj$I8KQOqkP1CRlTfIMWvCvgDPBnal0IOjoPFp7y1+zmKY=	\N	t	numanworkstation			numanworkstation@gmail.com	t	t	2019-09-24 02:53:30.649487+06
12	pbkdf2_sha256$150000$ZMJdEBuc8ZHE$iwZbmeZdonrYEQCEkTVNA41YqqJfz2kse1ifcoDfdNc=	2019-10-03 03:55:10.493682+06	f	zojuban			bekojes@mailinator.net	f	t	2019-10-03 03:55:06.058412+06
4	pbkdf2_sha256$150000$K2piW0Mx02ni$QJ+LsJF90u4knZUuSH/HQZaa28A4H4C90uUagWD0bI4=	2019-10-19 09:43:51.530883+06	f	test			test@user.com	f	t	2019-09-24 02:53:41.24125+06
5	pbkdf2_sha256$150000$Qea4ecwhdp6s$M6XtifIlhyVG4xZo5diDu2ubRltQOaZ6R1W7yQz1+kM=	2019-09-24 03:04:22.391848+06	f	nelmannuman			nelmannuman@gmail.com	f	t	2019-09-24 03:04:18.133586+06
6	pbkdf2_sha256$150000$CGIs9QSv4AcO$Kh9k3XpK4gIvY0CD6sHVAd3B+4Y65tltRpjoLJJ5Sho=	2019-09-27 10:24:56.430486+06	f	abuser			abuser@gmail.com	f	t	2019-09-27 10:24:48.693911+06
16	pbkdf2_sha256$150000$uLKr6uPjnfXV$dpDO3XljHIEyQiKS9mKDzn4o9lZ427+x5u/bNKowU/U=	2019-10-03 11:45:13.492716+06	f	jywycajy			zobeleti@mailinator.net	f	t	2019-10-03 11:44:37.4362+06
25	pbkdf2_sha256$150000$DDya2sZYWJKI$zaxhO/DyEy+yrT9B9tiPltCuWKktFZNt7K1snxiSd3Q=	2019-10-06 04:42:06.888963+06	f	xyzyrogex			vuhusy@mailinator.net	f	t	2019-10-06 04:42:03.064846+06
7	pbkdf2_sha256$150000$vFHXSezujiyB$n+WiKGXt6kYqvjcVBko2RqzShh5vdDklyKjCS7d38d4=	2019-09-27 10:36:50.791296+06	f	sss			sss@gmail.com	f	t	2019-09-27 10:36:43.812121+06
34	pbkdf2_sha256$150000$JMa9C8lWMI4q$dL2NjCLaawDdVPIwz+aqMqssGHEkjgHF4zDvTkxY3wI=	\N	f	nuhelu			dynykyxec@mailinator.com	f	t	2019-10-21 05:00:11.632642+06
30	pbkdf2_sha256$150000$gTqfIz7xBy7H$EyX2/Ur6eWl8j/seBuh2uwe37oILTs4kaK/2ks5k1dU=	2019-10-15 01:43:12.675222+06	f	cufytoty			gaju@mailinator.com	f	t	2019-10-15 01:43:07.749092+06
17	pbkdf2_sha256$150000$iiktSbmn7xPY$U8RoEBViABx4TT8W/k1crTS7TFdo8HzE08rWvmFSVss=	2019-10-05 01:43:26.186031+06	f	cbv			cvbb@gmail.com	f	t	2019-10-05 01:43:21.509903+06
18	pbkdf2_sha256$150000$u92X2K5zuFCY$NfOAw/7wprbRZNUDSfj730/sCxW1uGiVQNoKIJwCDnM=	2019-10-05 01:44:34.1447+06	f	kkjhyui			kkjjhg@gmail.com	f	t	2019-10-05 01:44:30.238969+06
35	pbkdf2_sha256$150000$vT2xPH8MbRij$Y0ncL8KEfP4qh5oPvBz53z+5pO85WVmU0LahDCZ5qgY=	\N	f	qesunyma			gomakury@mailinator.com	f	t	2019-10-21 05:00:43.797043+06
8	pbkdf2_sha256$150000$gAGF1hzitBJS$iSa/ypZVz24FpS2eEgOZlvUvXvVtlzvIc8PYMssJCtw=	2019-09-30 01:50:59.547123+06	f	fyjuwy			cycoto@mailinator.com	f	t	2019-09-30 01:50:54.927666+06
9	pbkdf2_sha256$150000$9ZwMlbTC3GPA$v0I1iv1PtP6KXsV3o7R/qb6euWfALfAxMQ0taRGS2k0=	2019-10-02 21:01:54.316622+06	f	jagejot			bucevuza@mailinator.com	f	t	2019-10-02 21:01:50.353698+06
10	pbkdf2_sha256$150000$ad7tSkIHzzPQ$fO9JAgaNLp39rNAhSQiKxdfcToA+vJ0zHR44Vp060uc=	2019-10-03 02:43:29.099013+06	f	bagemizyj			gufeje@mailinator.com	f	t	2019-10-03 02:43:23.906823+06
11	pbkdf2_sha256$150000$6tPXlqBvAB1O$CjSKa8FBfa6Y83ozHz6+10ymc6zxpOAee6OvkhQP6dc=	2019-10-03 02:46:21.302644+06	f	xicunevixa			cobepeg@mailinator.net	f	t	2019-10-03 02:46:17.483743+06
31	pbkdf2_sha256$150000$50UxubmF4dQu$5PJuPdKGbt3ky+hrMwgafLH0YYUlJBcYtkK68gHNXAU=	2019-10-17 06:12:25.160532+06	f	xilubub			mofyka@mailinator.com	f	t	2019-10-17 06:12:20.336877+06
13	pbkdf2_sha256$150000$J1BhGOcOvFh5$HgEd/kGESzXRMYHrqxDuDrK4pPGEJmvIHwltcwiEgLo=	2019-10-03 11:14:37.674605+06	f	jojahazami			kehepa@mailinator.com	f	t	2019-10-03 11:14:32.564531+06
14	pbkdf2_sha256$150000$hdjuU6UsxdND$Rk0gVwZuoys0Mv5uXPOQXZhZm/hF7pceYmZ85Bh1IPQ=	2019-10-03 11:36:23.360389+06	f	nolym			goxuz@mailinator.com	f	t	2019-10-03 11:36:19.418157+06
15	pbkdf2_sha256$150000$Py7cra8fkXuh$uZBBKmeBWxQe1BPrpxSwwvVoLGY8e2nkIYf4FH1X2FE=	2019-10-03 11:39:16.652941+06	f	dawozahim			ryfo@mailinator.net	f	t	2019-10-03 11:39:12.724729+06
19	pbkdf2_sha256$150000$xTuMjhsUUuFI$KA4c4wGoviRNmnidiasEpZQV7z27WBtJlLz6Q8z4ErU=	2019-10-05 04:02:32.075127+06	f	hjhhj			vbnn@gmail.com	f	t	2019-10-05 04:02:27.303316+06
20	pbkdf2_sha256$150000$h2n4OOXYpd0K$ZWdKINQjYDHUzIkhEDMsomGimax3yKEcxL6aZadWH2c=	2019-10-06 04:21:54.365011+06	f	sidusi			fiquxod@mailinator.net	f	t	2019-10-06 04:21:49.837626+06
21	pbkdf2_sha256$150000$3fnGrtv4y2Lr$oTVdZ8sE08WfnDgCw9cOG1v+sxyfbbpDhU/ncEyutQY=	2019-10-06 04:22:25.041849+06	f	lagyd			tyfadajeg@mailinator.com	f	t	2019-10-06 04:22:21.053649+06
22	pbkdf2_sha256$150000$mnhpaElcqt6e$EbSSaAUJPQIic7jM/ycuog/6N2I1hDQNM8bDVSw8BqQ=	2019-10-06 04:22:53.623655+06	f	qohedu			muzev@mailinator.com	f	t	2019-10-06 04:22:49.752778+06
23	pbkdf2_sha256$150000$Gv3IR6w7aNsp$q74rCWYJAp6E/s1qvq6Anf+IgSXAOuzqKWX+FfOQoXQ=	2019-10-06 04:29:02.397075+06	f	xuzevu			xyvazu@mailinator.com	f	t	2019-10-06 04:28:58.615523+06
24	pbkdf2_sha256$150000$J7LRGuh5CXEf$quNnm23pxft7gfCkOC7Q1kIgnXsArUaA3J/9n1cfRAE=	2019-10-06 04:29:53.664153+06	f	pavyzacazi			poxyxaxa@mailinator.com	f	t	2019-10-06 04:29:49.905648+06
32	pbkdf2_sha256$150000$rf5c0JzK8A6S$pXVDa9WeQ/Z6OB51FHo1SOVGITTnBJ3EiD5UrlJg1vs=	2019-10-20 22:38:48.039032+06	f	zarir			tuxofaq@mailinator.com	f	t	2019-10-20 22:38:42.444037+06
26	pbkdf2_sha256$150000$ZItjBhtFN65T$NWTyh5+u5lZNzMofthQ/LOT1a7pgyy30EqGABUnrOb4=	2019-10-07 00:48:23+06	f	qalesece			bugiv@mailinator.net	f	t	2019-10-07 00:48:18+06
27	pbkdf2_sha256$150000$bLZBySiBFySV$lZRhtY0nfzJhG4C4bfF003vGLyKTyYM0icw3G4DhqDA=	2019-10-07 07:12:38.97538+06	f	qiluhedyw			secivazuqy@mailinator.net	f	t	2019-10-07 07:12:33.940687+06
36	pbkdf2_sha256$150000$aplMYdG1LS3G$E0sCHGYY/fm9PIEc0MQdRQFZEaXPEzL/2XoEz8H13sE=	2019-10-21 05:10:02.74109+06	f	giqevek			hytidewax@mailinator.net	f	t	2019-10-21 05:09:58.486143+06
28	pbkdf2_sha256$150000$hRSrj4yh2OGo$rd5gTjL975HWNGffRVxXd6EIZg2/uawGdZEaQuIpvf0=	2019-10-07 09:50:49.335344+06	f	zywawejiwe			leguqe@mailinator.net	f	t	2019-10-07 09:50:45.203831+06
37	pbkdf2_sha256$150000$DUz0rdkVYEtH$y72sRMDm7cDche8kkUqF9WQDYc6ppQDOLe0+2tQtkl4=	2019-10-21 05:10:52.032013+06	f	fynucy			gufevibigi@mailinator.net	f	t	2019-10-21 05:10:48.07842+06
29	pbkdf2_sha256$150000$kOOAaJ75ybcd$kScyP9TSGPYuEDuphE5/j8KUna4rwwYg8tI2QXdTej8=	2019-10-12 19:45:34.160944+06	f	Disha			sabihadishaa@gmail.com	f	t	2019-10-12 19:45:25.693258+06
38	pbkdf2_sha256$150000$EIZbJr2BdUNQ$1ok9TugA83BMyBU6bYXd95yY+WEe/NHVdXlsUSTm1Po=	2019-10-21 05:11:30.812522+06	f	qycegyhyf			tegu@mailinator.com	f	t	2019-10-21 05:11:26.932995+06
33	pbkdf2_sha256$150000$QmASYpvQnKHk$tzwA+GkiobrjNrLauB2EcIx/B92Osr4+SivlZbETLlk=	2019-10-21 04:38:08.71853+06	f	qanoha			qodepaqo@mailinator.net	f	t	2019-10-21 04:38:03.864116+06
40	pbkdf2_sha256$150000$Rdx38iMiaoc9$85aaTgWIbsevIAY0bz59LtTMKar6Wf6RzVEssvin3kA=	2019-10-21 13:34:14.857036+06	f	zovuw	Ahmed	Ali	koha@mailinator.net	f	t	2019-10-21 13:34:07.722608+06
1	pbkdf2_sha256$150000$XPELMcKh4gwr$MwYrv5rgB+a1JUZozka5oRWTXQDmOgPsGp/SGp5Isec=	2019-10-21 11:13:00.503521+06	t	admin	Super	Admin	admin@bdonor.com	t	t	2019-09-24 02:53:06.215483+06
3	pbkdf2_sha256$150000$bM6N6OZUrEQL$suPBaK+YLB5x61BhdnWRmPxlwZG6ELupRB4GKexNNjA=	2019-10-21 11:13:10.757506+06	f	darkstarnmn			darkstarnmn@gmail.com	f	t	2019-09-24 02:53:41.142602+06
39	pbkdf2_sha256$150000$kJa3aUJGxGAR$SVVVrEYipHEICNsP6sL1t70ps9eSCpsF2aiNN1SHYLo=	2019-10-21 05:12:12.533135+06	f	badonyda			tupiqip@mailinator.net	f	t	2019-10-21 05:12:08.67533+06
41	pbkdf2_sha256$150000$o8ef1F3VkWwW$hx9dsMCJQDdxuEmKwqjSany94MLe6EcNfD2D7ZMrP6g=	2019-10-21 13:37:47.459066+06	f	dazizotady			qoryhyqy@mailinator.net	f	t	2019-10-21 13:37:40.111725+06
\.


--
-- TOC entry 3582 (class 0 OID 16444)
-- Dependencies: 209
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 3584 (class 0 OID 16452)
-- Dependencies: 211
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3655 (class 0 OID 17281)
-- Dependencies: 282
-- Data for Name: blog_attachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blog_attachment (id, file, blog_id, slug, created_at, updated_at) FROM stdin;
85	Accounts/darkstarnmn/Blog/Voluptatem Est nulla/Voluptatem_Est_nulla_20191015-075533.png	99	voluptatem-611q1092790755331592792019	2019-10-15 07:55:33.784633+06	2019-10-15 07:55:33.784652+06
87	Accounts/darkstarnmn/Blog/Voluptatem Est nulla/Voluptatem_Est_nulla_20191015-075533_3avS3SU.png	99	voluptatem-hx7k1075260755331575262019	2019-10-15 07:55:33.790716+06	2019-10-15 07:55:33.790747+06
88	Accounts/darkstarnmn/Blog/DOC PDF IMAGE/DOC_PDF_IMAGE_20191015-075634.png	100	doc pdf im-7jr71081160756341581162019	2019-10-15 07:56:34.846077+06	2019-10-15 07:56:34.846096+06
89	Accounts/darkstarnmn/Blog/DOC PDF IMAGE/DOC_PDF_IMAGE_20191015-075634.docx	100	doc pdf im-dnpu1099490756341599492019	2019-10-15 07:56:34.848186+06	2019-10-15 07:56:34.848197+06
96	Accounts/darkstarnmn/Blog/Ipsam nemo non quo i/Ipsam_nemo_non_quo_i_20191015-080252.png	102	ipsam nemo-p2fz1071590802521571592019	2019-10-15 08:02:52.335447+06	2019-10-15 08:02:52.335506+06
97	Accounts/darkstarnmn/Blog/Ipsam nemo non quo i/Ipsam_nemo_non_quo_i_20191015-080252.jpg	102	ipsam nemo-62gi1091580802521591582019	2019-10-15 08:02:52.340117+06	2019-10-15 08:02:52.340144+06
98	Accounts/darkstarnmn/Blog/Ipsam nemo non quo i/Ipsam_nemo_non_quo_i_20191015-080252_wuwjtpE.png	102	ipsam nemo-2h4v1019660802521519662019	2019-10-15 08:02:52.343182+06	2019-10-15 08:02:52.34321+06
99	Accounts/darkstarnmn/Blog/DOC PDF IMAGE/DOC_PDF_IMAGE_20191015-084610.pdf	100	doc pdf im-qd521084090846101584092019	2019-10-15 08:46:10.166684+06	2019-10-15 08:46:10.166705+06
100	Accounts/dazizotady/Blog/Ut aspernatur corrup/Ut_aspernatur_corrup_20191023-052610.jpg	112	ut asperna-bljz1070740526102370742019	2019-10-23 05:26:10.349494+06	2019-10-23 05:26:10.349512+06
101	Accounts/dazizotady/Blog/Ut aspernatur corrup/Ut_aspernatur_corrup_20191023-052610_iKyqNZ0.jpg	112	ut asperna-jxm61050970526102350972019	2019-10-23 05:26:10.356377+06	2019-10-23 05:26:10.356396+06
\.


--
-- TOC entry 3653 (class 0 OID 17261)
-- Dependencies: 280
-- Data for Name: blog_blog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blog_blog (id, slug, title, details, created_at, updated_at, user_id, tags, category) FROM stdin;
102	ipsam-nemo-non-quo-ipsum-alias-omnis-labore-ea-ame	Ipsam nemo non quo ipsum alias omnis labore ea amet sint est	<h3>The standard Lorem Ipsum passage, used since the 1500s</h3>\r\n\r\n<p>&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;</p>	2019-10-15 07:59:21.782976+06	2019-10-20 23:42:49.176232+06	3	Vel dolore accusamus cupidatat dolorum nostrum similique sit voluptates id	article
112	ut-aspernatur-corrupti-atque-necessitatibus-in-vol	Ut aspernatur corrupti atque necessitatibus in voluptatem nemo quibusdam veritatis animi nemo sapiente ex aliquip est	<h2>What is Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<div>\r\n<div>&nbsp;</div>\r\n</div>	2019-10-23 05:26:10.337189+06	2019-10-23 05:27:58.340784+06	41	article,elated tag,new post	article
99	voluptatem-est-nulla-duis-voluptate-sint-ex-est-ir-p4ug	Voluptatem Est nulla duis voluptate sint ex est irure ad delectus doloribus	<h2>What is Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	2019-10-15 07:55:33.77814+06	2019-10-20 23:43:00.684828+06	3	Amet quis in assumenda ipsam tempore	article
100	doc-pdf-image	DOC PDF IMAGE	<h2>Why do we use it?</h2>\r\n\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>	2019-10-15 07:56:34.842144+06	2019-10-20 23:42:55.065812+06	3	Labore inventore consequat Aliquip ad officia maxime fugiat necessitatibus ea officia qui dolor	article
\.


--
-- TOC entry 3659 (class 0 OID 17339)
-- Dependencies: 286
-- Data for Name: blog_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blog_comment (id, comment, is_selected, created_at, updated_at, blog_id, commented_by_id) FROM stdin;
1	nice post...	f	2019-10-21 00:12:54.157702+06	2019-10-21 00:12:54.15772+06	102	3
2	Much Appreciated....	f	2019-10-21 00:31:47.593733+06	2019-10-21 00:31:47.593753+06	102	32
3	but can you brief post...........	f	2019-10-21 00:32:14.33109+06	2019-10-21 00:32:14.331109+06	102	32
4		f	2019-10-21 00:45:41.877459+06	2019-10-21 00:45:41.877475+06	102	3
5	asdasdd	f	2019-10-21 00:50:41.19819+06	2019-10-21 00:50:41.198206+06	102	3
6	OK....	f	2019-10-21 01:01:11.360794+06	2019-10-21 01:01:11.360809+06	102	3
7	How about that???\r\nIs it okay??	f	2019-10-21 01:10:05.622444+06	2019-10-21 01:10:05.622458+06	100	3
8	Where does it come from?\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..".\r\n	f	2019-10-21 01:11:02.7739+06	2019-10-21 01:11:02.773929+06	100	3
9	The standard Lorem Ipsum passage, used since the 1500s\r\n"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."	f	2019-10-21 11:35:34.708617+06	2019-10-21 11:35:34.708635+06	102	3
\.


--
-- TOC entry 3661 (class 0 OID 17363)
-- Dependencies: 288
-- Data for Name: blog_commentreply; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blog_commentreply (id, reply, created_at, updated_at, comment_id, replied_by_id) FROM stdin;
1	nice reply....	2019-10-21 11:49:29.077559+06	2019-10-21 11:49:29.077574+06	9	3
2	nice reply....	2019-10-21 11:50:02.12315+06	2019-10-21 11:50:02.123172+06	9	3
3	yes... I will...	2019-10-21 11:52:23.314293+06	2019-10-21 11:52:23.314308+06	3	3
4	ok.................	2019-10-21 12:20:55.812354+06	2019-10-21 12:20:55.812386+06	9	39
5	Another comment added---------	2019-10-21 12:25:17.889268+06	2019-10-21 12:25:17.889298+06	9	3
\.


--
-- TOC entry 3598 (class 0 OID 16627)
-- Dependencies: 225
-- Data for Name: chat_chatmessage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_chatmessage (id, message, is_seen, "timestamp", thread_id, user_id) FROM stdin;
1	<img alt="😋" class="emojioneemoji" src="https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f60b.png"><img alt="😋" class="emojioneemoji" src="https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f60b.png">	t	2019-10-03 12:02:52.009428+06	9	3
2	<img alt="🤪" class="emojioneemoji" src="https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f92a.png"><img alt="🤪" class="emojioneemoji" src="https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f92a.png"><img alt="🤪" class="emojioneemoji" src="https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f92a.png">	t	2019-10-05 05:06:19.56708+06	9	16
3	hi...	f	2019-10-07 07:41:17.604055+06	\N	3
4	hi....	f	2019-10-07 07:41:23.825996+06	\N	3
5	hi...	f	2019-10-07 07:41:33.716956+06	11	3
6	i need blood...	f	2019-10-21 13:38:27.253395+06	12	41
\.


--
-- TOC entry 3596 (class 0 OID 16619)
-- Dependencies: 223
-- Data for Name: chat_thread; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_thread (id, updated, "timestamp", updated_at, first_id, second_id) FROM stdin;
1	2019-09-24 03:49:54.625873+06	2019-09-24 03:49:54.625893+06	2019-09-24 03:49:54.625902+06	5	1
2	2019-09-27 10:40:32.785517+06	2019-09-27 10:40:32.785556+06	2019-09-27 10:40:32.785574+06	7	6
3	2019-09-30 06:30:20.683685+06	2019-09-30 06:30:20.683704+06	2019-09-30 06:30:20.683711+06	8	1
4	2019-09-30 06:31:09.505965+06	2019-09-30 06:31:09.505982+06	2019-09-30 06:31:09.505989+06	8	3
5	2019-09-30 07:23:29.682537+06	2019-09-30 07:23:29.682564+06	2019-09-30 07:23:29.68258+06	1	3
6	2019-10-02 21:04:07.000932+06	2019-10-02 21:04:07.000968+06	2019-10-02 21:04:07.000983+06	9	1
7	2019-10-03 02:21:45.433936+06	2019-10-03 02:21:45.433966+06	2019-10-03 02:21:45.433978+06	3	5
8	2019-10-03 03:01:21.076722+06	2019-10-03 03:01:21.076739+06	2019-10-03 03:01:21.076748+06	10	1
10	2019-10-04 23:45:16.960598+06	2019-10-04 23:45:16.960615+06	2019-10-04 23:45:16.960624+06	16	1
9	2019-10-03 12:02:36.096995+06	2019-10-03 12:02:36.097007+06	2019-10-05 05:06:19.569648+06	3	16
11	2019-10-07 07:40:51.664749+06	2019-10-07 07:40:51.664768+06	2019-10-07 07:41:33.720118+06	3	27
12	2019-10-21 13:38:14.782939+06	2019-10-21 13:38:14.783055+06	2019-10-21 13:38:27.257246+06	41	40
\.


--
-- TOC entry 3602 (class 0 OID 16678)
-- Dependencies: 229
-- Data for Name: checkout_checkout; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.checkout_checkout (id, created_at, updated_at, plan_id, user_id) FROM stdin;
1	2019-09-24 03:27:41.272732+06	2019-09-24 03:27:41.272787+06	1	5
2	2019-09-27 11:06:29.402644+06	2019-09-27 11:06:29.402679+06	1	3
3	2019-10-02 20:57:10.939518+06	2019-10-02 20:57:10.939543+06	1	8
4	2019-10-03 02:43:46.253298+06	2019-10-03 02:43:46.253367+06	1	10
5	2019-10-03 11:15:06.907467+06	2019-10-03 11:15:06.907478+06	1	13
6	2019-10-07 02:02:31.577436+06	2019-10-07 02:02:31.577467+06	1	26
7	2019-10-12 20:07:52.504029+06	2019-10-12 20:07:52.50406+06	2	29
\.


--
-- TOC entry 3594 (class 0 OID 16586)
-- Dependencies: 221
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-09-27 10:54:28.174216+06	6	I want to donate Blood [B+]	2	[{"changed": {"fields": ["progress_status", "respondent", "management_status"]}}]	24	1
2	2019-09-27 10:55:25.712162+06	6	I want to donate Blood [B+]	2	[{"changed": {"fields": ["completion_date"]}}]	24	1
3	2019-09-30 02:23:49.22046+06	2	I need Blood [B+] donor	2	[{"changed": {"fields": ["blood_bag"]}}]	21	1
4	2019-09-30 05:19:26.374855+06	8	I want to donate Tissue [Ligaments]	2	[{"changed": {"fields": ["user"]}}]	21	1
5	2019-09-30 05:19:30.666363+06	8	I want to donate Tissue [Ligaments]	2	[]	21	1
6	2019-09-30 05:19:37.80703+06	7	I want to donate Organ [Pancreas]	2	[{"changed": {"fields": ["user"]}}]	21	1
7	2019-09-30 06:22:35.701163+06	8	I want to donate Tissue [Ligaments]	2	[{"changed": {"fields": ["donate_type"]}}]	21	1
8	2019-09-30 06:22:44.288456+06	7	I want to donate Organ [Pancreas]	2	[{"changed": {"fields": ["donate_type"]}}]	21	1
9	2019-09-30 07:16:06.266526+06	4	fyjuwy	3		23	1
10	2019-10-02 18:45:47.738347+06	1	Facebook	2	[{"changed": {"fields": ["sites"]}}]	11	1
11	2019-10-03 13:24:26.016549+06	4	Conan Lott Save Life People Donation Bank Limited	2	[{"changed": {"fields": ["address"]}}]	28	1
12	2019-10-05 04:04:58.540701+06	12	kkjhyui	3		23	1
13	2019-10-05 04:04:58.546095+06	11	cbv	3		23	1
14	2019-10-05 04:05:40.495957+06	10	jywycajy	3		23	1
15	2019-10-05 04:05:59.367848+06	9	jywycajy	3		23	1
16	2019-10-05 04:05:59.370353+06	8	jywycajy	3		23	1
17	2019-10-06 02:40:02.311986+06	1	hjhhj	3		35	1
18	2019-10-06 02:42:30.614251+06	2	hjhhj	3		35	1
19	2019-10-07 02:01:40.286138+06	26	qalesece	2	[{"changed": {"fields": ["user_permissions"]}}]	4	1
20	2019-10-07 02:04:09.408401+06	26	qalesece	2	[{"changed": {"fields": ["user_permissions"]}}]	4	1
21	2019-10-11 06:15:23.264247+06	7	ddfyyrt	3		37	1
22	2019-10-11 06:15:23.266861+06	6	Study Tool	3		37	1
23	2019-10-11 06:15:23.269232+06	5	adsasdadssd	3		37	1
24	2019-10-11 06:15:23.271323+06	4	adasd	3		37	1
25	2019-10-11 06:15:23.273263+06	3	asdad	3		37	1
26	2019-10-11 06:15:23.274889+06	2	Room-Rent	3		37	1
27	2019-10-11 06:15:23.276213+06	1	Example Post	3		37	1
28	2019-10-11 06:56:52.99605+06	12	asddasd	3		37	1
29	2019-10-11 06:56:52.999524+06	11		3		37	1
30	2019-10-11 06:56:53.001166+06	10		3		37	1
31	2019-10-11 06:56:53.002537+06	9		3		37	1
32	2019-10-11 06:56:53.003919+06	8	asddasd	3		37	1
33	2019-10-11 06:58:35.704866+06	16	Room-Rent	3		37	1
34	2019-10-11 06:58:35.706817+06	15		3		37	1
35	2019-10-11 06:58:35.708245+06	14		3		37	1
36	2019-10-11 06:58:35.709508+06	13		3		37	1
37	2019-10-11 07:42:35.938232+06	21	DDFF	3		37	1
38	2019-10-11 07:42:35.939968+06	20	DDFF	3		37	1
39	2019-10-11 07:42:35.941541+06	19	DDFF	3		37	1
40	2019-10-11 07:42:35.944006+06	18	DDFF	3		37	1
41	2019-10-11 07:42:35.945803+06	17	DDFF	3		37	1
42	2019-10-11 08:21:24.898706+06	25	Time Testing Post	3		37	1
43	2019-10-11 08:21:24.901421+06	24	Example Product	3		37	1
44	2019-10-11 08:21:24.903285+06	23	Time Testing Post	3		37	1
45	2019-10-11 08:21:24.905267+06	22	Room-Rent	3		37	1
46	2019-10-11 09:33:28.803549+06	28	Room-Rent	3		37	1
47	2019-10-11 09:33:28.806969+06	27	asdsd	3		37	1
48	2019-10-11 09:33:28.809029+06	26	Room-Rent	3		37	1
49	2019-10-11 10:51:37.060395+06	30	Room-Rent	3		37	1
50	2019-10-11 10:51:37.062352+06	29	Time Testing Post	3		37	1
51	2019-10-11 11:04:02.192325+06	34	In veniam voluptatem ullam ratione quisquam voluptas accusamus est sed do aut	3		37	1
52	2019-10-11 11:04:02.194368+06	33	In veniam voluptatem ullam ratione quisquam voluptas accusamus est sed do aut	3		37	1
53	2019-10-11 11:04:02.197726+06	32	Optio doloribus quis itaque similique laboris est consequat Deserunt unde sed et dolorem cupiditate molestiae sit itaque temporibus exercitationem	3		37	1
54	2019-10-11 11:04:02.200085+06	31	Eum perferendis enim qui porro placeat dolor magnam quas tempora a tempor deleniti enim	3		37	1
55	2019-10-11 11:05:05.075917+06	35	Dolorem dolore nulla ea at sed voluptatibus non ut aspernatur ea cumque ad non	3		37	1
56	2019-10-11 11:35:55.294218+06	40	adasdasd	3		37	1
57	2019-10-11 11:35:55.297555+06	39	Time Testing Post	3		37	1
58	2019-10-11 11:35:55.298928+06	38	Aperiam ea aut ut enim officia est	3		37	1
59	2019-10-11 11:35:55.300227+06	37	Anim aspernatur ex aut ex porro cupidatat laborum sint fugiat ea	3		37	1
60	2019-10-11 11:35:55.303625+06	36	Anim aspernatur ex aut ex porro cupidatat laborum sint fugiat ea	3		37	1
61	2019-10-11 11:48:07.289364+06	45	asdad	3		37	1
62	2019-10-11 11:48:07.293058+06	44	asdsad	3		37	1
63	2019-10-11 11:48:07.295027+06	43	Study Tool	3		37	1
64	2019-10-11 11:48:07.296332+06	42	Example Product	3		37	1
65	2019-10-11 11:48:07.297637+06	41	Room-Rent	3		37	1
66	2019-10-11 14:26:42.744902+06	62	Time Testing Post	3		37	1
67	2019-10-11 14:26:42.747763+06	61	Time Testing Post	3		37	1
68	2019-10-11 14:26:42.74971+06	60	Aut sed voluptas numquam eius sint dolorem odio mollitia laborum	3		37	1
69	2019-10-11 14:26:42.751061+06	59	Labore velit est reprehenderit dolorem neque consequatur beatae non perspiciatis praesentium nemo amet exercitationem exercitationem quia ipsum a	3		37	1
70	2019-10-11 14:26:42.752478+06	58	Incidunt nostrud repellendus Dolor amet voluptatem quae ea exercitation ea ut est fuga Perspiciatis	3		37	1
71	2019-10-11 14:26:42.755506+06	57	Ullamco aliquip aut aliquid placeat culpa et debitis dolor odio sit voluptates irure	3		37	1
72	2019-10-11 14:26:42.757927+06	56	Molestiae assumenda aliquip velit quia minus dolorem rem officia ut eum praesentium ut ipsum distinctio Voluptatem	3		37	1
73	2019-10-11 14:26:42.760498+06	55	Doloremque sit a nulla dolore soluta ipsum dolore quia deleniti sed adipisicing nisi sit excepturi velit do	3		37	1
74	2019-10-11 14:26:42.762513+06	54	Doloremque sit a nulla dolore soluta ipsum dolore quia deleniti sed adipisicing nisi sit excepturi velit do	3		37	1
75	2019-10-11 14:26:42.764067+06	53	Doloremque sit a nulla dolore soluta ipsum dolore quia deleniti sed adipisicing nisi sit excepturi velit do	3		37	1
76	2019-10-11 14:26:42.765332+06	52	Time Testing Post	3		37	1
77	2019-10-11 14:26:42.766469+06	51	Perferendis consequuntur voluptatibus nostrum et eius id ea veritatis dolorum magnam vel id sed saepe	3		37	1
78	2019-10-11 14:26:42.767695+06	50	Perferendis consequuntur voluptatibus nostrum et eius id ea veritatis dolorum magnam vel id sed saepe	3		37	1
79	2019-10-11 14:26:42.769057+06	49	Illum quo porro eum voluptates	3		37	1
80	2019-10-11 14:26:42.771642+06	48	Electricity	3		37	1
81	2019-10-11 14:26:42.774005+06	47	dssdadsa	3		37	1
82	2019-10-11 14:26:42.775769+06	46	Dolor perferendis corporis omnis temporibus similique architecto at numquam suscipit architecto eos quia elit	3		37	1
83	2019-10-11 14:58:21.095536+06	63	Time Testing Post	3		37	1
84	2019-10-11 15:03:54.459652+06	64	Time Testing Post	3		37	1
85	2019-10-11 17:23:24.04461+06	69	Room-Rent	3		37	1
86	2019-10-11 17:23:24.048541+06	68	Room-Rent	3		37	1
87	2019-10-11 17:23:24.051253+06	67	Time Testing Post	3		37	1
88	2019-10-11 17:23:24.054252+06	66	Room-Rent	3		37	1
89	2019-10-11 17:23:24.056894+06	65	Time Testing Post	3		37	1
90	2019-10-12 12:24:26.313586+06	79	Dignissimos nostrud soluta voluptatem nobis eum corrupti do eum reprehenderit nulla	3		37	1
91	2019-10-12 12:35:06.910222+06	90	Qui autem iusto aut animi eu ad	3		37	1
92	2019-10-12 12:35:06.91334+06	89	Sapiente laudantium exercitation culpa sit accusamus rerum quidem officia ea quis eum eius dolores fugiat	3		37	1
93	2019-10-12 12:35:06.91512+06	88	Rerum dolorem nisi et dolorem explicabo Qui	3		37	1
94	2019-10-12 13:42:22.271506+06	92	Facilis debitis sit sapiente architecto magna delectus eveniet expedita ullam sequi sint	3		37	1
95	2019-10-15 07:50:49.494799+06	97	Time Testing Post	3		37	1
96	2019-10-15 07:50:49.49934+06	96	Nostrum illum obcaecati porro sunt cupiditate rerum et	3		37	1
97	2019-10-15 07:50:49.501445+06	95	DOC PDF IMAGE	3		37	1
98	2019-10-15 07:50:49.503271+06	94	DOC and IMAGE	3		37	1
99	2019-10-15 07:50:49.50463+06	93	Est ex reprehenderit dolorem omnis nisi dicta alias	3		37	1
100	2019-10-15 07:50:49.505835+06	91	Dolor maiores consequat Anim mollit repudiandae perferendis ipsum vitae	3		37	1
101	2019-10-15 07:50:49.507073+06	87	Minim enim reprehenderit quisquam ea qui et nisi autem laborum Sed non dolore	3		37	1
102	2019-10-15 07:50:49.508548+06	86	Eaque vero voluptatum minus dolor autem veritatis fuga Quia consequat Reiciendis vero dignissimos reiciendis debitis	3		37	1
103	2019-10-15 07:50:49.511182+06	85	Accusantium ut ipsa adipisicing sed ab rem voluptatem	3		37	1
104	2019-10-15 07:50:49.513506+06	84	Magni blanditiis ipsum perferendis laudantium eligendi sit temporibus ea quidem distinctio Assumenda in eum ad unde incidunt sed	3		37	1
105	2019-10-15 07:50:49.515215+06	83	Quidem aspernatur aspernatur dolores est sint iusto ut dolore iure aliquam est illo quia animi praesentium quod	3		37	1
106	2019-10-15 07:50:49.517132+06	82	Time Testing Post	3		37	1
107	2019-10-15 07:50:49.519132+06	81	Quas debitis eveniet impedit vel duis nihil	3		37	1
108	2019-10-15 07:50:49.520813+06	80	Provident exercitation lorem dolore quod duis deserunt sapiente	3		37	1
109	2019-10-15 07:50:49.522251+06	78	Qui quia corporis nostrud molestiae minim doloribus voluptate sapiente occaecat expedita	3		37	1
110	2019-10-15 07:50:49.523629+06	77	LAST TEST	3		37	1
111	2019-10-15 07:50:49.525202+06	76	XXXXX	3		37	1
112	2019-10-15 07:50:49.528043+06	75	3 Image Test	3		37	1
113	2019-10-15 07:50:49.530766+06	74	Time Testing Post	3		37	1
114	2019-10-15 07:50:49.532665+06	73	Example Product	3		37	1
115	2019-10-15 07:50:49.534704+06	72	Room-Rent	3		37	1
116	2019-10-15 07:50:49.536286+06	71	Room-Rent	3		37	1
117	2019-10-15 07:50:49.537554+06	70	Time Testing Post	3		37	1
118	2019-10-15 07:55:53.8411+06	98	Voluptatem Est nulla duis voluptate sint ex est irure ad delectus doloribus	3		37	1
119	2019-10-15 08:44:29.855384+06	111	Tempor aut unde aut sint id molestiae non rerum	3		37	1
120	2019-10-15 08:44:29.86052+06	110	Tempor aut unde aut sint id molestiae non rerum	3		37	1
121	2019-10-15 08:44:29.862373+06	109	Tempor aut unde aut sint id molestiae non rerum	3		37	1
122	2019-10-15 08:44:29.865132+06	108	Tempor aut unde aut sint id molestiae non rerum	3		37	1
123	2019-10-15 08:44:29.867208+06	107	Tempor aut unde aut sint id molestiae non rerum	3		37	1
124	2019-10-15 08:44:29.869068+06	106	Tempor aut unde aut sint id molestiae non rerum	3		37	1
125	2019-10-15 08:44:29.870437+06	105	Tempor aut unde aut sint id molestiae non rerum	3		37	1
126	2019-10-15 08:44:29.871752+06	104	Tempor aut unde aut sint id molestiae non rerum	3		37	1
127	2019-10-15 08:44:29.874599+06	103	Tempor aut unde aut sint id molestiae non rerum	3		37	1
128	2019-10-17 05:08:28.749646+06	1	Daffodil	3		34	1
129	2019-10-20 23:42:49.178294+06	102	Ipsam nemo non quo ipsum alias omnis labore ea amet sint est	2	[{"changed": {"fields": ["category"]}}]	37	1
130	2019-10-20 23:42:55.067014+06	100	DOC PDF IMAGE	2	[{"changed": {"fields": ["category"]}}]	37	1
131	2019-10-20 23:43:00.685895+06	99	Voluptatem Est nulla duis voluptate sint ex est irure ad delectus doloribus	2	[{"changed": {"fields": ["category"]}}]	37	1
\.


--
-- TOC entry 3572 (class 0 OID 16398)
-- Dependencies: 199
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	sites	site
8	account	emailaddress
9	account	emailconfirmation
10	socialaccount	socialaccount
11	socialaccount	socialapp
12	socialaccount	socialtoken
13	accounts	userstripe
14	accounts	userprofile
15	utils	sitepreference
16	utils	notification
17	utils	location
18	suspicious	suspicious
19	chat	thread
20	chat	chatmessage
21	donations	donation
22	donations	donationutil
23	donations	donationrespond
24	donations	donationprogress
25	priceplan	plan
26	checkout	checkout
27	donationBank	donation
28	donationBank	donationbank
29	donationBank	memberrequest
30	donationBank	donationprogress
31	donationBank	donationbanksetting
32	donationBank	bankmember
33	donationBank	campaign
34	donationBank	donationrequest
35	accounts	userreport
36	accounts	userpermission
37	blog	blog
38	blog	attachment
39	donationBank	donationrequestprogress
40	blog	comment
41	blog	commentreply
\.


--
-- TOC entry 3570 (class 0 OID 16387)
-- Dependencies: 197
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-09-24 02:52:36.792311+06
2	auth	0001_initial	2019-09-24 02:52:36.836383+06
3	account	0001_initial	2019-09-24 02:52:36.893286+06
4	account	0002_email_max_length	2019-09-24 02:52:36.91213+06
5	accounts	0001_initial	2019-09-24 02:52:36.94925+06
6	accounts	0002_remove_userprofile_is_volunteer	2019-09-24 02:52:36.970128+06
7	accounts	0003_userprofile_name	2019-09-24 02:52:36.982614+06
8	accounts	0004_remove_userprofile_name	2019-09-24 02:52:36.998488+06
9	admin	0001_initial	2019-09-24 02:52:37.023015+06
10	admin	0002_logentry_remove_auto_add	2019-09-24 02:52:37.047704+06
11	admin	0003_logentry_add_action_flag_choices	2019-09-24 02:52:37.06804+06
12	contenttypes	0002_remove_content_type_name	2019-09-24 02:52:37.096601+06
13	auth	0002_alter_permission_name_max_length	2019-09-24 02:52:37.104586+06
14	auth	0003_alter_user_email_max_length	2019-09-24 02:52:37.127063+06
15	auth	0004_alter_user_username_opts	2019-09-24 02:52:37.14639+06
16	auth	0005_alter_user_last_login_null	2019-09-24 02:52:37.163807+06
17	auth	0006_require_contenttypes_0002	2019-09-24 02:52:37.166032+06
18	auth	0007_alter_validators_add_error_messages	2019-09-24 02:52:37.181961+06
19	auth	0008_alter_user_username_max_length	2019-09-24 02:52:37.199322+06
20	auth	0009_alter_user_last_name_max_length	2019-09-24 02:52:37.217417+06
21	auth	0010_alter_group_name_max_length	2019-09-24 02:52:37.225906+06
22	auth	0011_update_proxy_permissions	2019-09-24 02:52:37.243766+06
23	chat	0001_initial	2019-09-24 02:52:37.268936+06
24	priceplan	0001_initial	2019-09-24 02:52:37.293043+06
25	checkout	0001_initial	2019-09-24 02:52:37.312046+06
26	donationBank	0001_initial	2019-09-24 02:52:37.475394+06
27	donationBank	0002_campaign	2019-09-24 02:52:37.527953+06
28	donationBank	0003_auto_20190823_0202	2019-09-24 02:52:37.548366+06
29	donationBank	0004_campaign_image	2019-09-24 02:52:37.563157+06
30	donationBank	0005_auto_20190823_0337	2019-09-24 02:52:37.581366+06
31	donationBank	0006_donation_data_source	2019-09-24 02:52:37.610937+06
32	donationBank	0007_remove_donation_data_source	2019-09-24 02:52:37.650786+06
33	donationBank	0008_remove_campaign_volunteer_request	2019-09-24 02:52:37.66679+06
34	donationBank	0009_donationbanksetting_privacy	2019-09-24 02:52:37.69184+06
35	donationBank	0010_donationbank_is_verified	2019-09-24 02:52:37.709338+06
36	donationBank	0011_auto_20190922_1704	2019-09-24 02:52:37.747223+06
37	donationBank	0012_auto_20190922_1707	2019-09-24 02:52:37.763684+06
38	donationBank	0013_auto_20190922_1725	2019-09-24 02:52:37.792425+06
39	donationBank	0014_auto_20190922_1727	2019-09-24 02:52:37.813027+06
40	donationBank	0015_auto_20190922_1732	2019-09-24 02:52:37.834554+06
41	donationBank	0016_auto_20190922_1749	2019-09-24 02:52:37.856318+06
42	donationBank	0017_donationrequest	2019-09-24 02:52:37.940525+06
43	donationBank	0018_auto_20190922_2004	2019-09-24 02:52:37.996557+06
44	donationBank	0019_remove_donationrequest_blood_bag	2019-09-24 02:52:38.022311+06
45	donationBank	0020_auto_20190922_2127	2019-09-24 02:52:38.044058+06
46	donationBank	0021_auto_20190922_2142	2019-09-24 02:52:38.076037+06
47	donationBank	0022_auto_20190922_2152	2019-09-24 02:52:38.104318+06
48	donationBank	0023_auto_20190922_2200	2019-09-24 02:52:38.141496+06
49	donations	0001_initial	2019-09-24 02:52:38.256659+06
50	donations	0002_auto_20190826_1321	2019-09-24 02:52:38.307669+06
51	donations	0003_auto_20190827_0041	2019-09-24 02:52:38.335381+06
52	donations	0004_auto_20190827_0125	2019-09-24 02:52:38.370697+06
53	donations	0005_auto_20190902_1817	2019-09-24 02:52:38.392198+06
54	sessions	0001_initial	2019-09-24 02:52:38.40275+06
55	sites	0001_initial	2019-09-24 02:52:38.41656+06
56	sites	0002_alter_domain_unique	2019-09-24 02:52:38.428928+06
57	socialaccount	0001_initial	2019-09-24 02:52:38.549969+06
58	socialaccount	0002_token_max_lengths	2019-09-24 02:52:38.609793+06
59	socialaccount	0003_extra_data_default_dict	2019-09-24 02:52:38.625537+06
60	suspicious	0001_initial	2019-09-24 02:52:38.64796+06
61	utils	0001_initial	2019-09-24 02:52:38.76732+06
62	donationBank	0024_auto_20190924_0343	2019-09-24 03:43:14.183708+06
63	donations	0006_auto_20190925_2126	2019-09-27 09:50:55.11808+06
64	donations	0007_auto_20190925_2132	2019-09-27 09:50:55.177078+06
65	donations	0008_auto_20190930_0132	2019-09-30 01:32:36.892594+06
66	donations	0009_auto_20190930_0132	2019-09-30 01:32:36.95432+06
67	donations	0010_donationprogress_is_pending	2019-10-05 01:19:39.11482+06
68	donations	0011_auto_20191005_0329	2019-10-05 03:29:42.060535+06
69	donations	0012_auto_20191005_0330	2019-10-05 03:31:02.839985+06
70	donations	0013_donationrespond_is_applied_for_selection	2019-10-05 03:32:14.365678+06
71	donations	0014_auto_20191005_0419	2019-10-05 04:19:44.520908+06
72	donations	0015_remove_donationprogress_is_pending	2019-10-05 04:28:09.083352+06
73	accounts	0005_userreport	2019-10-06 01:54:37.17852+06
74	accounts	0006_auto_20191006_0242	2019-10-06 02:42:20.366721+06
75	accounts	0007_auto_20191006_0242	2019-10-06 02:42:47.965191+06
76	accounts	0008_userpermission	2019-10-06 23:57:05.390409+06
77	blog	0001_initial	2019-10-11 02:52:15.606877+06
78	blog	0002_auto_20191011_0253	2019-10-11 02:53:51.011512+06
79	blog	0003_auto_20191011_0715	2019-10-11 07:16:03.29534+06
80	blog	0004_auto_20191011_0736	2019-10-11 07:37:02.211847+06
81	blog	0002_auto_20191011_0820	2019-10-11 08:20:05.256273+06
82	blog	0003_auto_20191011_0828	2019-10-11 08:28:52.004324+06
83	blog	0004_auto_20191011_1101	2019-10-11 11:01:29.195279+06
84	blog	0005_blog_tags	2019-10-12 10:15:31.197184+06
85	blog	0006_attachment_slug	2019-10-15 07:51:38.623788+06
86	blog	0007_auto_20191015_0753	2019-10-15 07:53:12.551903+06
87	blog	0008_auto_20191015_1009	2019-10-15 10:09:50.349182+06
88	donationBank	0025_donationrequestprogress	2019-10-17 05:11:20.371518+06
89	blog	0009_auto_20191020_2334	2019-10-20 23:34:35.309507+06
90	blog	0010_auto_20191020_2336	2019-10-20 23:36:58.912897+06
91	blog	0011_auto_20191020_2342	2019-10-20 23:42:20.917144+06
92	blog	0012_commentreply	2019-10-21 11:23:14.180017+06
\.


--
-- TOC entry 3627 (class 0 OID 16989)
-- Dependencies: 254
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ona7lj5dstc2f37vaybw6cjcf12u9093	NDFhOGYxNjk1ZTFhNDE2ZGIzMjNjZWZiZDEwOGVkZDYxNTU3Njc1MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxMzlkeTRHemFBUDd6U283Q0Q5N0RmVWtObTB0VG1kQyIsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmVhODU1MzcwNTcyNWE4NWFmZjZmOGYxODBjNTkxNGMxOTNkYmNkMiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2019-10-08 02:54:21.027468+06
qh5mndnc0yd27shq5twsgw4ekt7do1fn	NmViMjA1NmRmOGRiNDdlMDk4MmFlZjQ5ZGRjNjAyODVlNDQzNDhlYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTYxOTM2MmYzYzhlZTBiYTMwNjdmZmRhM2JjZTg5MDU0YTdjZTc1YiJ9	2019-10-08 03:02:49.632928+06
k8ov21xevunhfqd6n7n1wifvzo9y3rq8	OGU3MWQyMzNmYjkxNTkzOGQwNmVlM2YxOWI3MWQxZTNkZTc2YzBhODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJmcnFjOERydDh1YUFQTEpLWHAzWmMxdnAzOWpRQ2ZLNSIsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmVhODU1MzcwNTcyNWE4NWFmZjZmOGYxODBjNTkxNGMxOTNkYmNkMiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2019-10-11 09:51:17.708719+06
jesj1rxy757ds0x2t0lh91g0v40tf6jm	MmUyNTcxNjdjOGY4NTZkNmIxODNkZTlmM2NiYWY0OTRlNGIzMzYzYTp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsImFjY291bnRfdXNlciI6IjciLCJfYXV0aF91c2VyX2lkIjoiNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImVlNTMyNTkxODNhZjZhNWY4YTg2NTA5MWI2NGFlODc5MWI3NzBlODMifQ==	2019-10-11 10:36:50.816371+06
u9vxt1gf2133fk5ov7v0ccmy3chaqyy3	NmViMjA1NmRmOGRiNDdlMDk4MmFlZjQ5ZGRjNjAyODVlNDQzNDhlYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTYxOTM2MmYzYzhlZTBiYTMwNjdmZmRhM2JjZTg5MDU0YTdjZTc1YiJ9	2019-10-11 10:38:10.930809+06
2g41eqr951fhecoyw6oow4s653bi42qe	OTg5YzMyMzBiNTNlZWU0YTRhZDQwNmJjMzU5MmJiMjIyNjlhOTBmNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHMFBVOWtVdlUxRnYyZDNQQTFqVzVJRFZuWkdENWppbiIsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmVhODU1MzcwNTcyNWE4NWFmZjZmOGYxODBjNTkxNGMxOTNkYmNkMiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2019-10-11 10:44:38.097072+06
vxadx0ogttqw27uo8ingvome12px775t	YTVmZTcxNGY1MGJkNTMwYjNiN2MxZGJmMzJhYzJlNzNiNTQzNTJiMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWVnZWV0U3QVVtTHhwU0RWRnlEUW84ZHFIaDFTdTM4TyIsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmVhODU1MzcwNTcyNWE4NWFmZjZmOGYxODBjNTkxNGMxOTNkYmNkMiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2019-10-14 00:35:24.320023+06
cbpmhu0k18m2kqzujllb6qjf6n9bg0aq	NmViMjA1NmRmOGRiNDdlMDk4MmFlZjQ5ZGRjNjAyODVlNDQzNDhlYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTYxOTM2MmYzYzhlZTBiYTMwNjdmZmRhM2JjZTg5MDU0YTdjZTc1YiJ9	2019-10-14 00:35:54.599903+06
c40xijglnprr9v2svpc03696ls5hffu9	NmViMjA1NmRmOGRiNDdlMDk4MmFlZjQ5ZGRjNjAyODVlNDQzNDhlYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTYxOTM2MmYzYzhlZTBiYTMwNjdmZmRhM2JjZTg5MDU0YTdjZTc1YiJ9	2019-10-15 02:36:32.177736+06
s9amzpez76rmd6ctbhd2zn0tl8998033	NmViMjA1NmRmOGRiNDdlMDk4MmFlZjQ5ZGRjNjAyODVlNDQzNDhlYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTYxOTM2MmYzYzhlZTBiYTMwNjdmZmRhM2JjZTg5MDU0YTdjZTc1YiJ9	2019-10-16 18:27:51.226913+06
lzpxrqsxr7k0h5x196lidtcpci7ir4av	NmViMjA1NmRmOGRiNDdlMDk4MmFlZjQ5ZGRjNjAyODVlNDQzNDhlYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTYxOTM2MmYzYzhlZTBiYTMwNjdmZmRhM2JjZTg5MDU0YTdjZTc1YiJ9	2019-10-17 11:10:47.928079+06
p29sivknczqucdto1yvb4ymiwqftaqr8	ODRhODk0NjdiOGMyMzQ1M2VkNzVkN2U3OTA1MWUyYzcwOTJjODkyYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIyd1V0a3lOOE9pZVl3aEE3b3VGMGdwRVNGSWI4TndidiIsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmVhODU1MzcwNTcyNWE4NWFmZjZmOGYxODBjNTkxNGMxOTNkYmNkMiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2019-10-26 19:53:15.034786+06
6snyl1fffyrdghbb0gs5hi3xdntjz5bb	YTRmYTZjZGQyNmQ2ODY0NDdlYjlmMzA5YTNkZmI1MWNiN2MxZjAxZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnazF1S1d5cUJobFJ1SG9ybVBjNVZtRGFqTnJtUUQzTyIsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmVhODU1MzcwNTcyNWE4NWFmZjZmOGYxODBjNTkxNGMxOTNkYmNkMiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2019-10-17 11:43:19.906618+06
bbokexss5hy1vifw4foorftfvc2nw9ha	MDkyNDdjZDgxNzkzMDAxNGRiYjE1ZDQ0NzExNTM0MTIzODM2ZjZhNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJiZE14Nm5TWDJjMEw4SXBJMnpyZHhmbmNGWUt0OEFicCIsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmVhODU1MzcwNTcyNWE4NWFmZjZmOGYxODBjNTkxNGMxOTNkYmNkMiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2019-10-18 22:51:19.112526+06
g4j6jyps4fg4qjycq6zwrd3d7a9k9lsj	NmViMjA1NmRmOGRiNDdlMDk4MmFlZjQ5ZGRjNjAyODVlNDQzNDhlYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTYxOTM2MmYzYzhlZTBiYTMwNjdmZmRhM2JjZTg5MDU0YTdjZTc1YiJ9	2019-10-19 00:20:29.643963+06
809yvivzd1501272ca145bzsslt9pyks	NzMzZThmODhiZmI2MmI2YTc0MGY4ZThmZTEwNTc3ZjA2MmJiZTY2YTp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsImFjY291bnRfdXNlciI6ImoiLCJfYXV0aF91c2VyX2lkIjoiMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMzNhNzVkNzkxN2JhYWNiOGFkMDk1ZjY3N2UyOGJkOWZmZGQ0YzgyIn0=	2019-10-19 04:02:32.08602+06
mp68icveqx7zpn7t46323ph63birr838	N2I0Y2VlNjdhNzYwZTk3MzM0YjYwOWE2NzI2MDkyY2JjOTE4NWU2Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1a3NYOGx0MGwwT01acm9JYmpnWUdmME5FV0dyYUZleiIsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmVhODU1MzcwNTcyNWE4NWFmZjZmOGYxODBjNTkxNGMxOTNkYmNkMiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2019-10-20 01:19:11.490259+06
2vyrdotsszjmgc4zjct0zrenby0fdea8	NmViMjA1NmRmOGRiNDdlMDk4MmFlZjQ5ZGRjNjAyODVlNDQzNDhlYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTYxOTM2MmYzYzhlZTBiYTMwNjdmZmRhM2JjZTg5MDU0YTdjZTc1YiJ9	2019-10-20 01:19:25.916647+06
e0i7ti9v0phwtkqrnq0u3k5twwtkbbgd	NmViMjA1NmRmOGRiNDdlMDk4MmFlZjQ5ZGRjNjAyODVlNDQzNDhlYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTYxOTM2MmYzYzhlZTBiYTMwNjdmZmRhM2JjZTg5MDU0YTdjZTc1YiJ9	2019-10-20 04:32:25.046626+06
3p0t6fwl90afagl3hegnu5i057733wbs	NmViMjA1NmRmOGRiNDdlMDk4MmFlZjQ5ZGRjNjAyODVlNDQzNDhlYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTYxOTM2MmYzYzhlZTBiYTMwNjdmZmRhM2JjZTg5MDU0YTdjZTc1YiJ9	2019-10-20 23:26:49.659669+06
cxbrk4b8k2mukjt132wd3ufih8izvxcl	NmViMjA1NmRmOGRiNDdlMDk4MmFlZjQ5ZGRjNjAyODVlNDQzNDhlYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTYxOTM2MmYzYzhlZTBiYTMwNjdmZmRhM2JjZTg5MDU0YTdjZTc1YiJ9	2019-11-04 11:13:00.522416+06
aywi36se7pqahlufzt7ksrmjue4u0yu2	MzBiZjZiZjYwMTNiN2M5YzdkYTBkNTRhM2JlZjczYWM3NTNkMmU0YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnRXp6ZXpOUTFuUnRhZG1UTEJ6VmlwdnRTWVBtOWxzcSIsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmVhODU1MzcwNTcyNWE4NWFmZjZmOGYxODBjNTkxNGMxOTNkYmNkMiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2019-10-21 06:48:02.827823+06
8ak9kjdyueynrjwvqn3abqfw7f5dlp1u	NDI2MjlkNDZiMjFiZjQ1YTdhNDU4Mjg2NmNhNzI0ODI4MGY4ZDFkNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJadE41QThrV1RPVUVMUnBWMVJjSWdMNGVmNlhqQXJqSCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTYxOTM2MmYzYzhlZTBiYTMwNjdmZmRhM2JjZTg5MDU0YTdjZTc1YiJ9	2019-10-21 09:45:28.45161+06
mdf4ulqafs5ozio70cncpgxuwspodhwd	YzYzYmJkMjMwZjM3ZGRmZjY0NTU0MWMzZDI5MzJkNmY5YTUzZTkxNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJacXgzcWhVbnN0VnlUT2E3TXdqOVhuNDIxV3BMbERtbiIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsImFjY291bnRfdXNlciI6IjE0IiwiX2F1dGhfdXNlcl9pZCI6IjQwIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjUwNWU3MDA1NzU5MzQxY2VjY2E1OTQ5Y2JjMDU5MmZhN2MwNjNjZiJ9	2019-11-04 13:34:14.880061+06
6xq3l5nuw3425ewez2lzv7x69w7kq9n2	N2ZjYmUwNTcxYTVkZWFkNGM5ODc0YmJlNDgyODYzMjlhNzI0ZWRiMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJaZWtIRGpqMVRKZXJWNTZCd1lmMzRkNVcwUldoU0FjMCIsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmVhODU1MzcwNTcyNWE4NWFmZjZmOGYxODBjNTkxNGMxOTNkYmNkMiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2019-10-24 23:54:29.707523+06
n92zwdnkq88fhhwc35qgdcfa4g8i1nvn	NmViMjA1NmRmOGRiNDdlMDk4MmFlZjQ5ZGRjNjAyODVlNDQzNDhlYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTYxOTM2MmYzYzhlZTBiYTMwNjdmZmRhM2JjZTg5MDU0YTdjZTc1YiJ9	2019-10-24 23:55:01.699875+06
c0g20nck6o51opl489fvzz57pz3ux8yz	MmE2Yjc1ZTg2YTk0MzNjNWVjMzBmMmFmNmRjYjYyOGU3NzZmM2NiYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJhMEZvY0pGYnVWTUhGaWRpV2VtZ1VadENPb3ZRNVVHTyIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsImFjY291bnRfdXNlciI6IjE1IiwiX2F1dGhfdXNlcl9pZCI6IjQxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjBhOGQ2YjI3YjFlY2ViOGRmNzk5MzFmMDA2ZTM5ZWM4YTM0ZjYyNiJ9	2019-11-04 13:37:47.488438+06
r9gs2r1ivk3nc0sd6wh3zwqdljz4s9jd	MzgwYzc5YmZhMzMxOWJmY2FmMDBlM2Y2NjEzZTcxZjlhMWZlNDQwYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSZ1ZwYXJTdjNoY3RYQ3NLckpOa2VyTjNOcUpvRkg5MSIsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmVhODU1MzcwNTcyNWE4NWFmZjZmOGYxODBjNTkxNGMxOTNkYmNkMiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2019-10-25 10:14:17.161667+06
qkrk7dkrohgelqokfgomy1yzfliiky8z	NThkNzJjYjBhNTA3ZWRjOWFjYjlkMGZlYzBiYzk3MDZmMjdkOGYyNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKTEJvN2lJam9rMWxEMGVhVEtkY2JzWFowdUlNbmkybyIsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmVhODU1MzcwNTcyNWE4NWFmZjZmOGYxODBjNTkxNGMxOTNkYmNkMiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2019-10-26 08:35:24.253056+06
p4h2rm8nrgjns7ncedv0mtgpm1iiuyum	NmViMjA1NmRmOGRiNDdlMDk4MmFlZjQ5ZGRjNjAyODVlNDQzNDhlYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTYxOTM2MmYzYzhlZTBiYTMwNjdmZmRhM2JjZTg5MDU0YTdjZTc1YiJ9	2019-10-26 08:35:49.108123+06
sr0evqtaye34l22fct6mjx62kyyme6h8	NmViMjA1NmRmOGRiNDdlMDk4MmFlZjQ5ZGRjNjAyODVlNDQzNDhlYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTYxOTM2MmYzYzhlZTBiYTMwNjdmZmRhM2JjZTg5MDU0YTdjZTc1YiJ9	2019-10-26 19:28:06.768226+06
3wgjyucqeo054dxyu6g18jk2qevnhjmf	NmViMjA1NmRmOGRiNDdlMDk4MmFlZjQ5ZGRjNjAyODVlNDQzNDhlYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTYxOTM2MmYzYzhlZTBiYTMwNjdmZmRhM2JjZTg5MDU0YTdjZTc1YiJ9	2019-10-29 01:42:47.861092+06
ye9muxbfm81b3jrlauk82o8y55g2j0m1	ZDg3Y2RmMjM3ZmMxOTU3ZjZkZWMyZjIzOTBkM2ZkZGU5MDQ0NmVkZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJpRTFIT2Vub1pEY3RaT2xzR0hsbE1hdEFHd3k1cUNRUCIsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmVhODU1MzcwNTcyNWE4NWFmZjZmOGYxODBjNTkxNGMxOTNkYmNkMiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2019-10-29 01:42:54.928274+06
quzrnoq4yj659v7ceuakofy0wl8pvmxh	NmViMjA1NmRmOGRiNDdlMDk4MmFlZjQ5ZGRjNjAyODVlNDQzNDhlYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTYxOTM2MmYzYzhlZTBiYTMwNjdmZmRhM2JjZTg5MDU0YTdjZTc1YiJ9	2019-10-31 04:48:16.451018+06
enoypy9x1p18vrgvm3zpvh0e5akp2yws	ZDc5MDdhNjkyMDQ5MzVlZWI1NGY5M2Q0YzFlZjE5Mzk5MzJmMzU3Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJaSGlBZWRIYWhZcUxySGZSS0FZcHlBTU5XYjYycDJPSSIsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmVhODU1MzcwNTcyNWE4NWFmZjZmOGYxODBjNTkxNGMxOTNkYmNkMiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2019-10-31 04:48:37.155189+06
vb0yez6hp1t5e3qphsaxsp18xacoivq7	NmViMjA1NmRmOGRiNDdlMDk4MmFlZjQ5ZGRjNjAyODVlNDQzNDhlYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTYxOTM2MmYzYzhlZTBiYTMwNjdmZmRhM2JjZTg5MDU0YTdjZTc1YiJ9	2019-11-02 15:16:38.222739+06
yvhvlxd7dmyo3o5f95ezbu0ks3fyddvi	ZTRlN2MxNGYzOTRhMzMxNGRmMTQyMmFlODVhY2JkNjUxNTE2MjU4Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJhMVFTcG94QVlsZ1p4RndudUNRUGpLUENOWFNKeEsxcSIsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmVhODU1MzcwNTcyNWE4NWFmZjZmOGYxODBjNTkxNGMxOTNkYmNkMiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2019-11-02 15:17:01.244236+06
zg0751y1hrcw1ns5i7qwdy1dph35eup4	ZjQzNWNhNzAyZjA4M2M3NWJjZGIwZWY4ZWFmZjAxZWI1OWQ3MDEwOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzTndXUDl2M29lcEFtYWluVWRWNEM4THd6Nkx2Q1cwUyIsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmVhODU1MzcwNTcyNWE4NWFmZjZmOGYxODBjNTkxNGMxOTNkYmNkMiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2019-11-02 09:27:41.247733+06
hpu9b5q4hq58b8lcom1wox69km9jse1n	NDUyOWFmYzFlNzBmZjFiNzYzZmYyN2E1YWY1MDU5MGJhODIxMDdjNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHNThqUXphVXhNcnBtWm9NT0lsZ2cyNmhDUDl2ZUdFMCIsIl9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWMwOWNmYjUxNjJlOGY5YzM0NDljMGE4MTZmZDVjMGEwMTVjYzZmMiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2019-11-02 09:43:54.186914+06
pf3w3gdffta8778fwgtmp9dcz3sx0y15	NTFmYmJiYzNkZDA0ZjU4MmNmYWYyMTMzNmI4YjYyZWU4ZjE4ODYzZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2eURrVFRMT3BmZVJRNmpnbDdiRFQwdFI0MEVQdUwxdyIsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmVhODU1MzcwNTcyNWE4NWFmZjZmOGYxODBjNTkxNGMxOTNkYmNkMiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2019-11-02 14:46:11.626708+06
uafepxglc688skkdtyndgtx6um74t4mb	NmViMjA1NmRmOGRiNDdlMDk4MmFlZjQ5ZGRjNjAyODVlNDQzNDhlYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTYxOTM2MmYzYzhlZTBiYTMwNjdmZmRhM2JjZTg5MDU0YTdjZTc1YiJ9	2019-11-03 22:37:45.922267+06
xr87vmx2hv2jk4zfonu4kxnbhddtxd4i	NjBlNWJjMGViN2MwNGEyNGEwMDU2MjFlZGRiOWQ1ZWUyNTBlNGIyYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJidmtVZ3RoUnJhTEQ0czlHMlZyM2p0aG1VMHQ4WFVYeiIsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmVhODU1MzcwNTcyNWE4NWFmZjZmOGYxODBjNTkxNGMxOTNkYmNkMiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2019-11-04 04:38:50.000459+06
\.


--
-- TOC entry 3629 (class 0 OID 17001)
-- Dependencies: 256
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
1	https://localhost:8000/	bdonor.com
\.


--
-- TOC entry 3614 (class 0 OID 16763)
-- Dependencies: 241
-- Data for Name: donationBank_bankmember; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."donationBank_bankmember" (id, role, created_at, updated_at, bank_id, user_id) FROM stdin;
1	0	2019-09-24 03:28:42.495573+06	2019-09-24 03:28:42.495611+06	1	5
2	0	2019-09-27 11:07:47.73033+06	2019-09-27 11:07:47.730384+06	2	3
4	0	2019-10-02 20:58:03.406289+06	2019-10-02 20:58:03.406306+06	3	8
5	0	2019-10-03 02:44:35.419623+06	2019-10-03 02:44:35.419643+06	4	10
6	1	2019-10-03 02:46:50.146222+06	2019-10-03 02:46:50.146243+06	4	11
7	0	2019-10-03 11:18:16.980786+06	2019-10-03 11:18:16.980796+06	5	13
8	0	2019-10-07 02:02:59.267696+06	2019-10-07 02:02:59.267706+06	6	26
9	1	2019-10-07 07:13:01.10597+06	2019-10-07 07:13:01.106008+06	2	27
\.


--
-- TOC entry 3616 (class 0 OID 16815)
-- Dependencies: 243
-- Data for Name: donationBank_campaign; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."donationBank_campaign" (id, title, slug, held_date, end_date, contact, email, address, city, state, country, details, created_at, updated_at, bank_id, image) FROM stdin;
1	Example Blood Campaign	example-blood-campaign	2019-10-05 08:00:00+06	2019-10-19 08:00:00+06	2342342342	darkstarnmn@gmail.com	98/B Lake Circus, Kalabagan, Dhaka, 2nd Floor	Dhaka	\N	BD		2019-09-30 04:48:35.781464+06	2019-09-30 04:50:09.201414+06	2	Banks/Daffodil/Campaigns/Example Blood Campaign/Example_Blood_Campai_20190930-045009.png
2	Jemima White	jemima-white	2019-10-02 23:00:00+06	2019-10-30 22:00:00+06	+424242342	gycyjaw@mailinator.net	Magni rerum aliquam sed vel vel in aut atque amet labore tempor consequatur odio amet sapiente qu	Minim iusto labore quia e	Voluptatum culpa veritati	TW		2019-10-02 21:00:12.726828+06	2019-10-02 21:00:12.726837+06	3	
3	Harrison Ellis	harrison-ellis	2019-10-05 05:00:00+06	2019-10-31 05:00:00+06	+4645646	titejum@mailinator.com	Eu perspiciatis quia perspiciatis aliquid	Fuga Quisquam ullamco ac	Consectetur dolore itaque	GH		2019-10-03 01:50:43.621001+06	2019-10-03 01:50:43.621009+06	2	
4	Hilel Pratt	hilel-pratt	2019-10-05 06:00:00+06	2019-12-26 05:00:00+06	+45646744	vajejy@mailinator.net	Fugiat itaque officiis minima eaque sint et consequatur quibusdam laboris	Qui ad veniam est except	Suscipit in alias sed dol	MA		2019-10-03 01:51:01.451065+06	2019-10-03 01:51:01.451083+06	2	
5	Samuel Green	samuel-green	2019-10-25 06:00:00+06	2019-12-25 05:00:00+06	+564565464	jopaqis@mailinator.com	Enim in aliquam perspiciatis optio	Laboriosam ducimus cum	Sit ea qui consequatur N	CA		2019-10-03 01:51:23.747847+06	2019-10-03 01:51:23.74788+06	2	
6	Kaitlin Emerson	kaitlin-emerson	2019-10-11 05:00:00+06	2019-10-29 06:00:00+06	+2542424	wajekag@mailinator.net	Id dolore quisquam laudantium exercitationem quam et	Voluptas saepe totam quo	Quasi quam placeat atque	CK		2019-10-03 01:52:14.023688+06	2019-10-03 01:52:14.023704+06	2	
\.


--
-- TOC entry 3604 (class 0 OID 16698)
-- Dependencies: 231
-- Data for Name: donationBank_donation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."donationBank_donation" (id, slug, first_name, last_name, email, gender, dob, blood_group, diseases, contact, address, city, state, country, donation_type, organ_name, tissue_name, quantity, description, collection_date, expiration_date, created_at, updated_at, bank_id) FROM stdin;
1	daffodil-solom_rdoe0988900726353088902019	MacKensie	Solomon	poxes@mailinator.net	Female	1996-03-22	B+	Asperiores tempor similique praesentium dolor voluptatem et tempore velit consequuntur in aut cumque pariatur	+6456456464	Amet voluptatum dolor incidunt soluta quo quo pariatur Accusantium	Voluptatibus voluptas hic	Tempore expedita qui ali	LU	1	Kidney	\N	2		2019-09-30	2019-10-23	2019-09-30 07:26:35.070037+06	2019-09-30 07:26:35.070083+06	2
2	rae-alexan-rober_gbev1022602059340222602019	Leila	Robertson	punarevu@mailinator.com	Others	1994-07-20	B+	Nihil est voluptatem ut tenetur mollitia inventore ea quod quia sunt magna excepteur	+6456546	Consequat Nemo ex doloribus voluptatem distinctio Vitae ut sed duis	Magni et voluptate dolore	Aliqua Ex laborum Odio	DM	1	Pancreas	\N	1		2019-10-02	2019-11-28	2019-10-02 20:59:34.470469+06	2019-10-02 20:59:34.470477+06	3
\.


--
-- TOC entry 3606 (class 0 OID 16713)
-- Dependencies: 233
-- Data for Name: donationBank_donationbank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."donationBank_donationbank" (id, institute, slug, address, city, state, country, contact, email, description, created_at, updated_at, is_verified, services) FROM stdin;
1	Dhaka Donation Bank	dhaka-dona_t44u0967140328422467142019	Dhaka, Bangladesh	Dhaka	\N	BD	1323123	dhaka@bank.com		2019-09-24 03:28:42.490425+06	2019-09-24 03:39:15.676847+06	t	Blood,Organ
2	Daffodil	daffodil_ahmj0916201107472716202019	SSS	SSS	\N	BD	2342342342	\N		2019-09-27 11:07:47.725655+06	2019-09-27 11:09:32.617604+06	t	Blood,Organ,Tissue
3	Rae Alexander	rae-alexan_zt4g1059002058030259002019	Eum et molestiae	Illo ab et velit elit qu	Reprehenderit sed rem ad	IS	43534345	dowoheqo@mailinator.com	Modi id debitis adipisci magna occaecat odio ipsum laborum Occaecat dolor magni ipsam ea quia sit et est labore	2019-10-02 20:58:03.404257+06	2019-10-02 20:58:34.254644+06	t	Organ,Tissue
5	Manikganj Donation Bank	manikganj_l3wx1093021118160393022019	Manikganj, Sadar	Dhaka	\N	BD	565677888	mjdonation_bank@gmail.com		2019-10-03 11:18:16.97876+06	2019-10-03 11:32:12.035084+06	t	Blood,Organ
4	Conan Lott Save Life People Donation Bank Limited	conan-lott_hl5u1020850244350320852019	Ratione reprehenderit	Voluptatibus veniam quo	Sint et libero sed dolor	NF	325345345	xyjez@mailinator.net	Dolor nostrud est sunt sit dolore ipsum ut quaerat qui	2019-10-03 02:44:35.417649+06	2019-10-03 13:24:26.015269+06	t	Blood,Tissue
6	Walker Kelly	walker-kel_aidm1085730202590785732019	Id corporis est	Cupidatat dolorem quaerat	Eiusmod veniam mollitia	TR	5345345353	rujevo@mailinator.com	Qui ipsa doloribus recusandae Veniam voluptatem Quas	2019-10-07 02:02:59.266076+06	2019-10-07 07:07:53.511359+06	t	Organ
\.


--
-- TOC entry 3612 (class 0 OID 16752)
-- Dependencies: 239
-- Data for Name: donationBank_donationbanksetting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."donationBank_donationbanksetting" (id, member_request, created_at, updated_at, bank_id, privacy) FROM stdin;
1	0	2019-09-24 03:28:42.498395+06	2019-09-24 03:43:32.397044+06	1	0
2	0	2019-09-27 11:07:47.735448+06	2019-09-27 11:11:44.308522+06	2	0
3	0	2019-10-02 20:58:03.408635+06	2019-10-02 21:01:35.492016+06	3	0
4	0	2019-10-03 02:44:35.424213+06	2019-10-03 02:45:15.516217+06	4	0
5	1	2019-10-03 11:18:16.984674+06	2019-10-03 11:18:16.984729+06	5	0
6	1	2019-10-07 02:02:59.270455+06	2019-10-07 02:02:59.270482+06	6	0
\.


--
-- TOC entry 3610 (class 0 OID 16738)
-- Dependencies: 237
-- Data for Name: donationBank_donationprogress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."donationBank_donationprogress" (id, progress_status, completion_date, first_name, last_name, gender, blood_group, dob, contact, email, address, city, state, country, details, created_at, updated_at, donation_id) FROM stdin;
1	1	2019-09-30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2019-09-30 07:26:35.080378+06	2019-09-30 07:27:38.721138+06	1
2	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2019-10-02 20:59:34.473117+06	2019-10-02 20:59:34.473129+06	2
\.


--
-- TOC entry 3618 (class 0 OID 16846)
-- Dependencies: 245
-- Data for Name: donationBank_donationrequest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."donationBank_donationrequest" (id, slug, donation_type, blood_group, organ_name, tissue_name, quantity, details, publication_status, created_at, updated_at, bank_id) FROM stdin;
2	daffodil-7yjr1054310511391754312019	0	B+	\N	\N	1		0	2019-10-17 05:11:39.010266+06	2019-10-17 05:11:39.010275+06	2
\.


--
-- TOC entry 3657 (class 0 OID 17319)
-- Dependencies: 284
-- Data for Name: donationBank_donationrequestprogress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."donationBank_donationrequestprogress" (id, progress_status, completion_date, first_name, last_name, gender, blood_group, dob, contact, email, address, city, state, country, details, created_at, updated_at, donation_id) FROM stdin;
1	1	2019-10-17	NUMAN	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2019-10-17 05:11:39.016284+06	2019-10-17 06:06:12.527916+06	2
\.


--
-- TOC entry 3608 (class 0 OID 16726)
-- Dependencies: 235
-- Data for Name: donationBank_memberrequest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."donationBank_memberrequest" (id, slug, created_at, updated_at, bank_id, user_id) FROM stdin;
5	jagejot-0u721006142102230206142019	2019-10-02 21:02:23.78925+06	2019-10-02 21:02:23.78926+06	3	9
8	xilubub-cbl71083330705061783332019	2019-10-17 07:05:06.424757+06	2019-10-17 07:05:06.424766+06	4	31
\.


--
-- TOC entry 3620 (class 0 OID 16891)
-- Dependencies: 247
-- Data for Name: donations_donation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.donations_donation (id, title, slug, category, type, blood_group, blood_bag, organ_name, tissue_name, quantity, donate_type, is_verified, details, contact, contact2, contact3, contact_privacy, location, city, state, country, hospital, preferred_date, preferred_date_from, preferred_date_to, priority, publication_status, created_at, updated_at, user_id) FROM stdin;
1	I want to donate Organ [Kidney]	darkstarnmn_0-1-fc6n0965560951552765562019	0	1	B+	\N	Kidney	\N	1	0	t		+8802334768878	\N	\N	0	Old Airport, Dhaka, Bangladesh	Dhaka	\N	BD	\N	\N	\N	\N	0	0	2019-09-27 09:51:55.394562+06	2019-09-27 09:51:55.394574+06	3
3	I want to donate Blood [O+]	nelmannuman_0-0-ljgp0985580954192785582019	0	0	O+	1	\N	\N	\N	0	t		+8806565676878	\N	\N	0	Outer Circular Rd, Dhaka, Bangladesh	Dhaka	\N	BD	Shamarita Hospital, Dhaka, Bangladesh	\N	\N	\N	0	0	2019-09-27 09:54:19.248523+06	2019-09-27 09:54:19.248533+06	5
4	I need Blood [O+] donor	nelmannuman_1-0-e0pv0997740955222797742019	1	0	O+	2	\N	\N	\N	0	t		+8805656555656	\N	\N	0	Outer Circular Rd, Dhaka, Bangladesh	Dhaka	\N	BD	Square Hospital, Dhaka, Bangladesh	\N	\N	\N	0	0	2019-09-27 09:55:22.377173+06	2019-09-27 09:55:22.377183+06	5
5	I need Organ [Kidney] donor	abuser_1-1-thpa0919361035102719362019	1	1	B+	\N	Kidney	\N	1	0	t	<p>3345345</p>	+8804564564564	\N	\N	0	Dhaka	Dhaka	\N	BD	Square Hospital, Dhaka, Bangladesh	\N	\N	\N	0	0	2019-09-27 10:35:10.491393+06	2019-09-27 10:35:10.49141+06	6
6	I want to donate Blood [B+]	darkstarnmn_0-0-6ceh0990531053282790532019	0	0	B+	1	\N	\N	\N	0	t		+8805465464564	\N	\N	0	DDD	FFF	\N	BD	\N	\N	\N	\N	0	0	2019-09-27 10:53:28.797289+06	2019-09-27 10:53:28.797321+06	3
2	I need Blood [B+] donor	darkstarnmn_1-0-jyr90977160952592777162019	1	0	B+	10	\N	\N	\N	0	t		+8803434345465	\N	\N	0	Old Airport, Dhaka, Bangladesh	Dhaka	\N	BD	Square Hospital, Dhaka, Bangladesh	\N	\N	\N	0	0	2019-09-27 09:52:59.775087+06	2019-09-30 02:23:49.202973+06	3
20	I want to donate Blood [B+]	jywycajy_0-0-bb5f1092990439390592992019	0	0	B+	1	\N	\N	\N	0	t		+8802123123232	\N	\N	0	Phoenix Rd, Dhaka, Bangladesh	Dhaka	\N	BD	\N	\N	\N	\N	0	0	2019-10-05 04:39:39.175432+06	2019-10-05 04:39:39.17544+06	16
8	I want to donate Tissue [Ligaments]	darkstarnmn_0-2-ty6c0956600511243056602019	0	2	B+	\N	\N	Ligaments	\N	1	t		+8802324234234	+8802342353453	\N	0	115 Moghbazar Rd, Dhaka, Bangladesh	Dhaka	\N	BD	\N	\N	\N	\N	0	0	2019-09-30 05:11:24.657681+06	2019-09-30 06:22:35.68529+06	3
7	I want to donate Organ [Pancreas]	darkstarnmn_0-1-opo20928170455263028172019	0	1	B+	\N	Pancreas	\N	1	1	t		+8803453454354	+8803453453453	\N	0	115 Moghbazar Rd, Dhaka, Bangladesh	Dhaka	\N	BD	\N	\N	\N	\N	0	0	2019-09-30 04:55:26.390008+06	2019-09-30 06:22:44.278521+06	3
9	I need Organ [Pancreas] donor	fyjuwy_1-1-jeqj0919470718193019472019	1	1	B+	\N	Pancreas	\N	1	1	t	\N	+8803445435435	+8802523546346	\N	0	11 Banani Bridge, Dhaka 1212, Bangladesh	Dhaka	\N	BD	Munnu Medical, Manikganj, Dhaka, Bangladesh	\N	\N	\N	0	0	2019-09-30 07:18:19.475808+06	2019-09-30 07:18:41.579447+06	8
10	I need Blood [B+] donor	jojahazami_1-0-6am51012591134130312592019	1	0	B+	1	\N	\N	\N	0	t		+8801323343534	\N	\N	0	65 N Dhanmondi Road, Kalabagan, Dhaka 1205, Bangladesh	Dhaka	\N	BD	Munnu Medical, Manikganj, Dhaka, Bangladesh	\N	\N	\N	0	0	2019-10-03 11:34:13.980561+06	2019-10-03 11:34:13.980576+06	13
11	I want to donate Organ [Kidney]	jojahazami_0-1-upno1024331134540324332019	0	1	B+	\N	Kidney	\N	1	0	t		+8802342444545	\N	\N	0	65 N Dhanmondi Road, Kalabagan, Dhaka 1205, Bangladesh	Dhaka	\N	BD	Munnu Medical, Manikganj, Dhaka, Bangladesh	\N	\N	\N	0	0	2019-10-03 11:34:54.05173+06	2019-10-03 11:34:54.051744+06	13
12	I need Blood [B+] donor	nolym_1-0-r16r1072021137190372022019	1	0	B+	3	\N	\N	\N	0	t		+8802433243432	+8802343243564	\N	0	65 N Dhanmondi Road, Kalabagan, Dhaka 1205, Bangladesh	Dhaka	\N	BD	Square Hospital, Dhaka, Bangladesh	\N	\N	\N	0	0	2019-10-03 11:37:19.771495+06	2019-10-03 11:37:19.771509+06	14
13	I want to donate Organ [Kidney]	nolym_0-1-9vx71087961137440387962019	0	1	B+	\N	Kidney	\N	1	0	t		+8804324324325	\N	\N	0	65 N Dhanmondi Road, Kalabagan, Dhaka 1205, Bangladesh	Dhaka	\N	BD	\N	\N	\N	\N	0	0	2019-10-03 11:37:44.159945+06	2019-10-03 11:37:44.159965+06	14
14	I need Organ [Kidney] donor	dawozahim_1-1-pmyd1070221139450370222019	1	1	B+	\N	Kidney	\N	1	0	t		+8804543543534	\N	\N	0	65 N Dhanmondi Road, Kalabagan, Dhaka 1205, Bangladesh	Dhaka	\N	BD	Square Hospital, Dhaka, Bangladesh	\N	\N	\N	0	0	2019-10-03 11:39:45.526239+06	2019-10-03 11:39:45.526281+06	15
15	I need Tissue [Ligaments] donor	darkstarnmn_1-2-7tgp1065711207360365712019	1	2	B+	\N	\N	Ligaments	\N	1	f		+8802323454464	+8802243556576	\N	0	65 N Dhanmondi Road, Kalabagan, Dhaka 1205, Bangladesh	Dhaka	\N	BD	\N	\N	\N	\N	0	0	2019-10-03 12:07:36.883869+06	2019-10-03 12:07:36.883877+06	3
17	I want to donate Organ [Kidney]	darkstarnmn_0-1-r6c91079152306540479152019	0	1	B+	\N	Kidney	\N	1	0	t		+8802342342424	\N	\N	0	Unnamed Road, Dhaka 1212, Bangladesh	Dhaka	\N	BD	\N	\N	\N	\N	0	0	2019-10-04 23:06:54.750042+06	2019-10-04 23:06:54.750057+06	3
16	I want to donate Tissue [Veins]	darkstarnmn_0-2-vo0u1042232300240442232019	0	2	B+	\N	\N	Veins	\N	1	t	\N	+8801232312432	+8804234234324	\N	0	Unnamed Road, Dhaka 1212, Bangladesh	Dhaka	\N	BD	\N	\N	\N	\N	0	0	2019-10-04 23:00:24.787179+06	2019-10-05 00:21:00.509768+06	3
18	I want to donate Tissue [Corneas]	darkstarnmn_0-2-81xf1006720021560506722019	0	2	B+	\N	\N	Corneas	\N	1	t	\N	+8803422343243	+8802343243243	\N	0	Unnamed Road, Dhaka 1212, Bangladesh	Dhaka	\N	BD	\N	\N	\N	\N	0	0	2019-10-05 00:21:56.136149+06	2019-10-05 00:23:56.613809+06	3
19	I want to donate Organ [Lungs]	darkstarnmn_0-1-24241005640024400505642019	0	1	B+	\N	Lungs	\N	1	0	t		+8801232134234	\N	\N	0	Unnamed Road, Dhaka 1212, Bangladesh	Dhaka	\N	BD	\N	\N	\N	\N	0	0	2019-10-05 00:24:40.556541+06	2019-10-05 00:24:40.556552+06	3
22	I need Blood [B+] donor	jywycajy_1-0-3i941013260507310513262019	1	0	B+	2	\N	\N	\N	0	t		+8802123123232	\N	\N	0	Phoenix Rd, Dhaka, Bangladesh	Dhaka	\N	BD	\N	\N	\N	\N	0	0	2019-10-05 05:07:31.84443+06	2019-10-05 05:07:31.844446+06	16
21	I need Organ [Lungs] donor	jywycajy_1-1-a4h61012090506510512092019	1	1	B+	\N	Lungs	\N	2	1	t	\N	+8802123123232	+8801231234233	\N	0	Phoenix Rd, Dhaka, Bangladesh	Dhaka	\N	BD	\N	\N	\N	\N	0	0	2019-10-05 05:06:51.227796+06	2019-10-05 05:08:20.436594+06	16
23	I need Blood [O+] donor	qalesece_1-0-az9e1099560203470799562019	1	0	O+	1	\N	\N	\N	0	t		+8801231212412	\N	\N	0	Phoenix Rd, Dhaka, Bangladesh	Dhaka	\N	BH	\N	\N	\N	\N	0	0	2019-10-07 02:03:47.200105+06	2019-10-07 02:03:47.200112+06	26
24	I need Blood [B+] donor	darkstarnmn_1-0-zwmx1043531940421243532019	1	0	B+	2	\N	\N	\N	0	t		+8801685238317	\N	\N	0	Dhanmondi	dhaka	44/28 North Dhanmondi	BD	\N	\N	\N	\N	1	0	2019-10-12 19:40:42.757432+06	2019-10-12 19:40:42.757476+06	3
25	I need Blood [O+] donor	zovuw_1-0-pyy91055241337072155242019	1	0	O+	4	\N	\N	\N	0	t		+8805445556666	\N	\N	0	Phoenix Rd, Dhaka, Bangladesh	dhaka	\N	BD	\N	\N	\N	\N	0	0	2019-10-21 13:37:07.721332+06	2019-10-21 13:37:07.721345+06	38
\.


--
-- TOC entry 3626 (class 0 OID 16929)
-- Dependencies: 253
-- Data for Name: donations_donationprogress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.donations_donationprogress (id, progress_status, completion_date, management_status, details, created_at, updated_at, donation_id) FROM stdin;
3	0	\N	\N	\N	2019-09-27 09:54:19.251368+06	2019-09-27 09:54:19.251417+06	3
4	0	\N	\N	\N	2019-09-27 09:55:22.379738+06	2019-09-27 09:55:22.379758+06	4
5	0	\N	\N	\N	2019-09-27 10:35:10.49539+06	2019-09-27 10:35:10.495405+06	5
20	1	2019-10-03	0		2019-10-05 04:39:39.177388+06	2019-10-05 05:05:28.134401+06	20
21	0	\N	0	\N	2019-10-05 05:06:51.232031+06	2019-10-05 05:06:51.232052+06	21
22	0	\N	0	\N	2019-10-05 05:07:31.84746+06	2019-10-05 05:07:31.847484+06	22
23	0	\N	0	\N	2019-10-07 02:03:47.202241+06	2019-10-07 02:03:47.202251+06	23
24	0	\N	0	\N	2019-10-12 19:40:42.762789+06	2019-10-12 19:40:42.762809+06	24
17	1	2019-10-11	0		2019-10-04 23:06:54.752423+06	2019-10-12 19:59:13.021511+06	17
25	1	2019-10-21	0		2019-10-21 13:37:07.724963+06	2019-10-21 13:41:19.107072+06	25
1	1	2019-09-30	\N		2019-09-27 09:51:55.397553+06	2019-09-30 03:54:02.413456+06	1
6	1	2019-09-30	\N		2019-09-27 10:53:28.802619+06	2019-09-30 04:53:41.546349+06	6
7	0	\N	\N	\N	2019-09-30 04:55:26.392374+06	2019-09-30 04:55:26.392384+06	7
8	0	\N	\N	\N	2019-09-30 05:11:24.660632+06	2019-09-30 05:11:24.660643+06	8
9	1	\N	\N		2019-09-30 07:18:19.48217+06	2019-09-30 07:22:33.786109+06	9
10	0	\N	\N	\N	2019-10-03 11:34:13.983406+06	2019-10-03 11:34:13.983422+06	10
11	0	\N	\N	\N	2019-10-03 11:34:54.054236+06	2019-10-03 11:34:54.054251+06	11
12	0	\N	\N	\N	2019-10-03 11:37:19.773453+06	2019-10-03 11:37:19.773469+06	12
13	0	\N	\N	\N	2019-10-03 11:37:44.164637+06	2019-10-03 11:37:44.164653+06	13
14	0	\N	\N	\N	2019-10-03 11:39:45.53093+06	2019-10-03 11:39:45.530945+06	14
15	0	\N	\N	\N	2019-10-03 12:07:36.886096+06	2019-10-03 12:07:36.88611+06	15
16	0	\N	\N	\N	2019-10-04 23:00:24.791215+06	2019-10-04 23:00:24.791227+06	16
18	0	\N	\N	\N	2019-10-05 00:21:56.138743+06	2019-10-05 00:21:56.138757+06	18
2	1	2019-10-04	0		2019-09-27 09:52:59.778068+06	2019-10-05 00:39:49.783004+06	2
19	1	2019-10-05	0		2019-10-05 00:24:40.558714+06	2019-10-05 04:34:55.142877+06	19
\.


--
-- TOC entry 3647 (class 0 OID 17175)
-- Dependencies: 274
-- Data for Name: donations_donationprogress_respondent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.donations_donationprogress_respondent (id, donationprogress_id, donationrespond_id) FROM stdin;
3	2	3
6	1	1
7	9	6
13	19	13
14	19	14
19	20	17
20	20	16
21	17	19
22	25	20
\.


--
-- TOC entry 3624 (class 0 OID 16918)
-- Dependencies: 251
-- Data for Name: donations_donationrespond; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.donations_donationrespond (id, contact, message, is_selected, created_at, updated_at, donation_id, respondent_id, is_applied_for_selection) FROM stdin;
1	+8802334353453	Please contact with me ...	f	2019-09-27 09:58:55.636282+06	2019-09-27 09:58:55.63638+06	1	5	f
2	+8803345345435	Please contact with me ...	f	2019-09-27 10:44:04.143447+06	2019-09-27 10:44:04.143589+06	2	7	f
3	+8802424232343	Please contact with me ...	f	2019-09-30 01:51:35.123064+06	2019-09-30 01:51:35.123085+06	2	8	f
5	+8805433345353	Please contact with me ...	f	2019-09-30 07:16:22.681179+06	2019-09-30 07:16:22.681337+06	8	8	f
6	+8802344234234	Please contact with me ...	f	2019-09-30 07:19:33.427948+06	2019-09-30 07:19:33.427976+06	9	3	f
7	+8802334343243	Please contact with me ...	f	2019-10-03 11:43:14.125732+06	2019-10-03 11:43:14.125813+06	14	12	f
15	+8802123123232	Please contact with me ...	f	2019-10-05 04:13:34.562227+06	2019-10-05 04:13:34.56224+06	17	16	f
14	+8802123123232	Please contact with me ...	t	2019-10-05 04:06:29.097118+06	2019-10-05 04:06:29.097143+06	19	16	t
13	+8804645656786	Please contact with me ...	t	2019-10-05 04:02:55.570902+06	2019-10-05 04:02:55.570918+06	19	19	t
17	+8804234234463	Please contact with me ...	t	2019-10-05 05:01:44.485185+06	2019-10-05 05:01:44.485244+06	20	19	t
16	+8802242434252	Please contact with me ...	t	2019-10-05 04:59:25.578554+06	2019-10-05 04:59:25.578566+06	20	3	t
18	+8802423523232	Please contact with me ...	f	2019-10-05 05:10:03.992231+06	2019-10-05 05:10:03.992311+06	21	3	f
19	+8801989789798	Please contact with me ...	t	2019-10-12 19:55:10.669053+06	2019-10-12 19:55:10.669076+06	17	29	t
20	+8805445454334	ct with me ...	t	2019-10-21 13:39:15.12679+06	2019-10-21 13:39:15.12685+06	25	41	f
\.


--
-- TOC entry 3622 (class 0 OID 16910)
-- Dependencies: 249
-- Data for Name: donations_donationutil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.donations_donationutil (id, created_at, updated_at, donation_id, user_id) FROM stdin;
46	2019-10-21 13:32:43.306358+06	2019-10-21 13:32:43.306375+06	20	39
47	2019-10-21 13:33:01.128817+06	2019-10-21 13:33:01.129019+06	18	39
1	2019-09-27 09:58:44.396219+06	2019-09-27 09:59:23.867161+06	1	5
2	2019-09-27 10:40:03.342082+06	2019-09-27 10:40:03.342228+06	5	7
3	2019-09-27 10:43:06.820898+06	2019-09-27 10:44:06.248517+06	2	7
9	2019-09-30 05:20:17.038489+06	2019-09-30 07:16:22.889815+06	8	8
4	2019-09-30 01:51:28.322394+06	2019-09-30 01:51:35.244521+06	2	8
5	2019-09-30 04:44:07.258538+06	2019-09-30 04:44:07.258557+06	5	3
8	2019-09-30 05:11:42.050547+06	2019-09-30 07:17:08.653732+06	8	1
27	2019-10-05 04:40:06.193993+06	2019-10-05 05:01:44.520922+06	20	19
6	2019-09-30 04:56:25.982292+06	2019-09-30 04:56:29.423466+06	7	1
7	2019-09-30 04:57:34.060677+06	2019-09-30 04:57:34.060697+06	7	8
48	2019-10-21 13:38:45.258056+06	2019-10-21 13:39:15.385125+06	25	41
10	2019-09-30 06:43:21.789422+06	2019-09-30 06:53:34.832392+06	6	8
30	2019-10-05 05:08:48.989575+06	2019-10-05 05:08:48.989601+06	15	1
31	2019-10-05 05:08:55.194872+06	2019-10-05 05:08:55.194895+06	22	1
11	2019-09-30 07:18:36.822647+06	2019-09-30 07:22:05.679531+06	9	1
13	2019-10-03 02:21:36.580926+06	2019-10-03 02:21:41.954438+06	3	3
14	2019-10-03 03:58:36.971853+06	2019-10-03 03:58:36.971864+06	4	11
29	2019-10-05 05:08:15.94906+06	2019-10-05 05:10:20.835854+06	21	1
15	2019-10-03 11:42:30.243664+06	2019-10-03 11:43:14.183544+06	14	12
28	2019-10-05 04:59:18.743381+06	2019-10-06 03:58:28.587282+06	20	3
17	2019-10-03 12:29:12.773486+06	2019-10-03 12:29:12.796922+06	12	3
32	2019-10-05 05:09:55.823935+06	2019-10-06 23:29:35.44473+06	21	3
12	2019-09-30 07:19:25.77786+06	2019-10-04 23:59:24.496825+06	9	3
34	2019-10-07 07:02:06.520629+06	2019-10-07 07:02:06.520648+06	12	26
35	2019-10-07 07:04:20.701477+06	2019-10-07 07:04:20.701495+06	21	26
33	2019-10-07 07:01:32.88835+06	2019-10-07 07:04:24.449141+06	22	26
36	2019-10-11 01:52:39.520297+06	2019-10-11 01:52:46.03863+06	22	3
16	2019-10-03 11:57:02.653737+06	2019-10-11 01:52:50.273607+06	14	3
19	2019-10-05 00:20:40.326945+06	2019-10-05 00:21:00.49711+06	16	1
20	2019-10-05 00:23:52.916267+06	2019-10-05 00:23:56.603327+06	18	1
37	2019-10-12 19:49:18.971173+06	2019-10-12 19:51:44.57291+06	3	29
22	2019-10-05 01:05:05.481959+06	2019-10-05 01:05:11.997545+06	14	16
24	2019-10-05 01:43:47.556007+06	2019-10-05 01:43:54.00934+06	19	17
38	2019-10-12 19:54:27.589784+06	2019-10-12 19:57:03.342738+06	17	29
25	2019-10-05 01:44:56.924055+06	2019-10-05 01:45:03.964299+06	19	18
23	2019-10-05 01:42:13.410579+06	2019-10-05 01:52:03.311526+06	19	1
26	2019-10-05 04:02:48.822279+06	2019-10-05 04:02:55.613459+06	19	19
39	2019-10-19 09:49:48.270895+06	2019-10-19 09:50:23.131552+06	24	4
21	2019-10-05 00:41:44.229537+06	2019-10-05 04:07:10.133847+06	19	16
18	2019-10-04 23:20:55.665045+06	2019-10-05 04:13:34.662409+06	17	16
40	2019-10-19 09:50:59.883806+06	2019-10-19 09:55:44.899111+06	18	4
41	2019-10-19 15:21:43.617072+06	2019-10-19 15:21:49.904301+06	13	3
43	2019-10-21 05:12:46.967245+06	2019-10-21 05:12:46.992371+06	24	39
44	2019-10-21 05:12:55.64484+06	2019-10-21 05:12:55.664939+06	21	39
45	2019-10-21 05:13:24.645735+06	2019-10-21 05:13:26.049887+06	22	39
42	2019-10-21 05:12:41.413582+06	2019-10-21 13:31:38.846649+06	4	39
\.


--
-- TOC entry 3600 (class 0 OID 16662)
-- Dependencies: 227
-- Data for Name: priceplan_plan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.priceplan_plan (id, title, slug, amount, currency, expiration_cycle, description, created_at, updated_at) FROM stdin;
1	Monthly	monthly	99	usd	1	BDonor monthly plan	2019-09-24 02:53:41.332873+06	2019-09-24 02:53:41.332884+06
2	Half Annual	half_annual	589	usd	6	BDonor half annual plan	2019-09-24 02:53:41.335603+06	2019-09-24 02:53:41.335613+06
3	Annual	annual	1149	usd	12	BDonor annual plan	2019-09-24 02:53:41.337791+06	2019-09-24 02:53:41.337802+06
\.


--
-- TOC entry 3631 (class 0 OID 17012)
-- Dependencies: 258
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- TOC entry 3633 (class 0 OID 17023)
-- Dependencies: 260
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
1	facebook	Facebook	486442348765238	3d0a8742ae5dba9b37182fe33c6346d5	
\.


--
-- TOC entry 3635 (class 0 OID 17031)
-- Dependencies: 262
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
3	1	1
\.


--
-- TOC entry 3637 (class 0 OID 17039)
-- Dependencies: 264
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- TOC entry 3639 (class 0 OID 17089)
-- Dependencies: 266
-- Data for Name: suspicious_suspicious; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suspicious_suspicious (id, attempt, first_attempt, last_attempt, ip, mac, user_id) FROM stdin;
1	4	2019-09-24 03:29:05.448077+06	2019-09-24 03:30:11.508897+06	127.0.0.1	273317810104695	1
2	2	2019-09-24 03:33:57.024621+06	2019-09-24 03:34:06.011252+06	127.0.0.1	273317810104695	5
4	1	2019-10-03 11:18:29.023286+06	2019-10-03 11:18:29.023314+06	127.0.0.1	273317810104695	13
5	1	2019-10-05 01:44:02.79083+06	2019-10-05 01:44:02.790867+06	127.0.0.1	273317810104695	17
6	1	2019-10-05 01:53:20.742014+06	2019-10-05 01:53:20.742033+06	127.0.0.1	273317810104695	16
3	3	2019-09-24 03:38:38.26902+06	2019-10-06 02:19:00.001678+06	127.0.0.1	273317810104695	3
7	4	2019-10-17 06:12:30.384235+06	2019-10-17 06:40:58.566299+06	127.0.0.1	273317810104695	31
8	1	2019-10-22 23:59:40.680186+06	2019-10-22 23:59:40.680203+06	127.0.0.1	273317810104695	41
\.


--
-- TOC entry 3645 (class 0 OID 17127)
-- Dependencies: 272
-- Data for Name: utils_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utils_location (id, location_type, location, hit, created_at, updated_at, provider_id) FROM stdin;
1	0	Old Airport, Dhaka, Bangladesh	1	2019-09-27 09:51:55.40394+06	2019-09-27 09:51:55.403954+06	3
3	0	Outer Circular Rd, Dhaka, Bangladesh	1	2019-09-27 09:54:19.257768+06	2019-09-27 09:54:19.257797+06	5
4	1	Shamarita Hospital, Dhaka, Bangladesh	1	2019-09-27 09:54:19.261122+06	2019-09-27 09:54:19.261139+06	5
6	0	Dhaka	1	2019-09-27 10:35:10.503152+06	2019-09-27 10:35:10.503261+06	6
7	0	DDD	1	2019-09-27 10:53:28.807644+06	2019-09-27 10:53:28.807671+06	3
8	0	115 Moghbazar Rd, Dhaka, Bangladesh	3	2019-09-30 04:55:26.395275+06	2019-09-30 05:11:45.812656+06	3
9	0	11 Banani Bridge, Dhaka 1212, Bangladesh	1	2019-09-30 07:18:19.488069+06	2019-09-30 07:18:19.488097+06	8
14	0	Dhanmondi	1	2019-10-12 19:40:42.76684+06	2019-10-12 19:40:42.766853+06	3
10	1	Munnu Medical, Manikganj, Dhaka, Bangladesh	3	2019-09-30 07:18:19.493286+06	2019-10-03 11:34:54.071682+06	8
2	1	Square Hospital, Dhaka, Bangladesh	5	2019-09-27 09:52:59.790786+06	2019-10-03 11:39:45.54966+06	3
11	0	65 N Dhanmondi Road, Kalabagan, Dhaka 1205, Bangladesh	5	2019-10-03 11:34:13.987228+06	2019-10-03 12:07:36.896561+06	13
12	0	Unnamed Road, Dhaka 1212, Bangladesh	1	2019-10-04 23:00:24.794041+06	2019-10-04 23:00:24.794054+06	3
13	0	Phoenix Rd, Dhaka, Bangladesh	3	2019-10-05 04:39:39.183286+06	2019-10-21 13:37:07.740734+06	16
5	0		89	2019-09-27 09:58:36.950518+06	2019-10-21 13:37:59.427166+06	5
\.


--
-- TOC entry 3643 (class 0 OID 17114)
-- Dependencies: 270
-- Data for Name: utils_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utils_notification (id, category, identifier, slug, subject, message, is_seen, created_at, updated_at, receiver_id, sender_id) FROM stdin;
1	donationBank_Create	nelma-numan_BankCreate	nelma-numan_4xwt0931280328422431282019	nelmannuman has created a bank.	Hello numanworkstation ! <br> nelmannuman has created a bank named Dhaka Donation Bank and is waiting for verification approval. <br> click <a href='http://127.0.0.1:8000/donation-bank/dhaka-dona_t44u0967140328422467142019/details/' target='_blank'>here</a> to view bank details.	f	2019-09-24 03:28:42.506185+06	2019-09-24 03:28:42.506194+06	2	5
2	donationBank_Create	nelma-admin_BankCreate	nelma-admin_blt30904220328452404222019	nelmannuman has created a bank.	Hello admin ! <br> nelmannuman has created a bank named Dhaka Donation Bank and is waiting for verification approval. <br> click <a href='http://127.0.0.1:8000/donation-bank/dhaka-dona_t44u0967140328422467142019/details/' target='_blank'>here</a> to view bank details.	t	2019-09-24 03:28:45.75307+06	2019-09-24 03:28:45.753104+06	1	5
4	memberRequest_Delete	dhaka-dona_t44u0967140328422467142019	admin-nelma_rsl80916930354132416932019	admin cancels his/her request to join your Donation Bank.	admin cancels his/her request to join your Donation Bank.	f	2019-09-24 03:54:13.405333+06	2019-09-24 03:54:13.405342+06	5	1
7	donationBank_Create	darks-numan_BankCreate	darks-numan_t1ag0963991107472763992019	darkstarnmn has created a bank.	Hello numanworkstation ! <br> darkstarnmn has created a bank named Daffodil and is waiting for verification approval. <br> click <a href='http://bdonor.serveo.net/donation-bank/daffodil_ahmj0916201107472716202019/details/' target='_blank'>here</a> to view bank details.	f	2019-09-27 11:07:47.764888+06	2019-09-27 11:07:47.764933+06	2	3
8	donationBank_Create	darks-admin_BankCreate	darks-admin_itlq0967751107522767752019	darkstarnmn has created a bank.	Hello admin ! <br> darkstarnmn has created a bank named Daffodil and is waiting for verification approval. <br> click <a href='http://bdonor.serveo.net/donation-bank/daffodil_ahmj0916201107472716202019/details/' target='_blank'>here</a> to view bank details.	t	2019-09-27 11:07:52.962184+06	2019-09-27 11:07:52.962213+06	1	3
12	memberRequest_Accept	sss-jpw80958481113312758482019	darks-sss_jdvl0982651114172782652019	darkstarnmn accepted your member request.	darkstarnmn accepted your member request. <br> You are now a member of 'Daffodil'.	f	2019-09-27 11:14:17.040611+06	2019-09-27 11:14:17.040637+06	7	3
13	donationRespond_Create	darkstarnmn_0-2-ty6c0956600511243056602019	fyjuw-darks_givs0943000708483043002019	fyjuwy has responded to your donation post	fyjuwy has responded to your post : '<i>I want to donate Tissue [Ligaments]</i>'. <br> click <a href='http://127.0.0.1:8000/donations/darkstarnmn_0-2-ty6c0956600511243056602019/details/' target='_blank'>here</a> to view. <br> <br> Respondent Contact: <b><a href='#'>+8805433345353</a></b> <br> Respondent Message: Please contact with me ...	t	2019-09-30 07:08:48.629375+06	2019-09-30 07:16:22.670802+06	1	8
14	donationRespond_Create	fyjuwy_1-1-jeqj0919470718193019472019	darks-admin_zawa0962580719333062582019	darkstarnmn has responded to your donation post	darkstarnmn has responded to your post : '<i>I need Organ [Pancreas] donor</i>'. <br> click <a href='http://127.0.0.1:8000/donations/fyjuwy_1-1-jeqj0919470718193019472019/details/' target='_blank'>here</a> to view. <br> <br> Respondent Contact: <b><a href='#'>+8802344234234</a></b> <br> Respondent Message: Please contact with me ...	t	2019-09-30 07:19:33.425385+06	2019-09-30 07:19:33.425413+06	1	3
6	donationRespond_Create	darkstarnmn_1-0-jyr90977160952592777162019	sss-darks_3ce00978021044042778022019	fyjuwy has responded to your donation post	fyjuwy has responded to your post : '<i>I need Blood [B+] donor</i>'. <br> click <a href='http://127.0.0.1:8000/donations/darkstarnmn_1-0-jyr90977160952592777162019/details/' target='_blank'>here</a> to view. <br> <br> Respondent Contact: <b><a href='#'>+8802424232343</a></b> <br> Respondent Message: Please contact with me ...	t	2019-09-27 10:44:04.13261+06	2019-09-30 01:51:35.118057+06	3	8
15	donationBank_Create	fyjuw-numan_BankCreate	fyjuw-numan_a3d91071962058030271962019	fyjuwy has created a bank.	Hello numanworkstation ! <br> fyjuwy has created a bank named Rae Alexander and is waiting for verification approval. <br> click <a href='http://127.0.0.1:8000/donation-bank/rae-alexan_zt4g1059002058030259002019/details/' target='_blank'>here</a> to view bank details.	f	2019-10-02 20:58:03.420809+06	2019-10-02 20:58:03.420818+06	2	8
16	donationBank_Create	fyjuw-admin_BankCreate	fyjuw-admin_nccw1072602058060272602019	fyjuwy has created a bank.	Hello Super Admin ! <br> fyjuwy has created a bank named Rae Alexander and is waiting for verification approval. <br> click <a href='http://127.0.0.1:8000/donation-bank/rae-alexan_zt4g1059002058030259002019/details/' target='_blank'>here</a> to view bank details.	t	2019-10-02 20:58:06.617888+06	2019-10-02 20:58:06.617945+06	1	8
18	memberRequest_Delete	rae-alexan_zt4g1059002058030259002019	jagej-fyjuw_qou11007072102180207072019	jagejot cancels his/her request to join your Donation Bank.	jagejot cancels his/her request to join your Donation Bank.	f	2019-10-02 21:02:18.712502+06	2019-10-02 21:02:18.712511+06	8	9
19	memberRequest_Create	jagejot-0u721006142102230206142019	jagej-fyjuw_46xn1047702102230247702019	jagejot wants to be a member of your Donation bank.	jagejot wants to be a member of your Donation bank. <br> Requested at : 2019-10-02 21:02:23.789250	f	2019-10-02 21:02:23.801078+06	2019-10-02 21:02:23.801096+06	8	9
20	donationBank_Create	bagem-numan_BankCreate	bagem-numan_4nsp1091410244350391412019	bagemizyj has created a bank.	Hello numanworkstation ! <br> bagemizyj has created a bank named Conan Lott Save Life People Donation Bank Limited and is waiting for verification approval. <br> click <a href='http://127.0.0.1:8000/donation-bank/conan-lott_hl5u1020850244350320852019/details/' target='_blank'>here</a> to view bank details.	f	2019-10-03 02:44:35.439562+06	2019-10-03 02:44:35.439619+06	2	10
21	donationBank_Create	bagem-admin_BankCreate	bagem-admin_jfdg1080450244380380452019	bagemizyj has created a bank.	Hello Super Admin ! <br> bagemizyj has created a bank named Conan Lott Save Life People Donation Bank Limited and is waiting for verification approval. <br> click <a href='http://127.0.0.1:8000/donation-bank/conan-lott_hl5u1020850244350320852019/details/' target='_blank'>here</a> to view bank details.	f	2019-10-03 02:44:38.415673+06	2019-10-03 02:44:38.415684+06	1	10
23	memberRequest_Accept	xicunevixa-4lit1035330246400335332019	bagem-xicun_aowj1092910246500392912019	bagemizyj accepted your member request.	bagemizyj accepted your member request. <br> You are now a member of 'Conan Lott Save Life People Donation Bank Limited'.	f	2019-10-03 02:46:50.164239+06	2019-10-03 02:46:50.164258+06	11	10
24	donationBank_Create	jojah-numan_BankCreate	jojah-numan_xaez1064491118160364492019	jojahazami has created a bank.	Hello numanworkstation ! <br> jojahazami has created a bank named Manikganj Donation Bank and is waiting for verification approval. <br> click <a href='http://127.0.0.1:8000/donation-bank/manikganj_l3wx1093021118160393022019/details/' target='_blank'>here</a> to view bank details.	f	2019-10-03 11:18:17.002891+06	2019-10-03 11:18:17.002968+06	2	13
25	donationBank_Create	jojah-admin_BankCreate	jojah-admin_28s11057601118200357602019	jojahazami has created a bank.	Hello Super Admin ! <br> jojahazami has created a bank named Manikganj Donation Bank and is waiting for verification approval. <br> click <a href='http://127.0.0.1:8000/donation-bank/manikganj_l3wx1093021118160393022019/details/' target='_blank'>here</a> to view bank details.	f	2019-10-03 11:18:20.226739+06	2019-10-03 11:18:20.226765+06	1	13
31	donationBank_Create	qales-numan_BankCreate	qales-numan_55b61076290202590776292019	qalesece has created a bank.	Hello numanworkstation ! <br> qalesece has created a bank named Walker Kelly and is waiting for verification approval. <br> click <a href='http://127.0.0.1:8000/donation-bank/walker-kel_aidm1085730202590785732019/details/' target='_blank'>here</a> to view bank details.	f	2019-10-07 02:02:59.317564+06	2019-10-07 02:02:59.317596+06	2	26
26	donationRespond_Create	dawozahim_1-1-pmyd1070221139450370222019	zojub-dawoz_8lsw1076061143140376062019	jywycajy has responded to your donation post	jywycajy has responded to your post : '<i>I need Organ [Kidney] donor</i>'. <br> click <a href='http://127.0.0.1:8000/donations/dawozahim_1-1-pmyd1070221139450370222019/details/' target='_blank'>here</a> to view. <br> <br> Respondent Contact: <b><a href='#'>+8802123123232</a></b> <br> Respondent Message: Please contact with me ...	f	2019-10-03 11:43:14.122051+06	2019-10-05 01:05:11.72052+06	15	16
29	donationRespond_Create	jywycajy_0-0-bb5f1092990439390592992019	darks-jywyc_j08s1044200459250544202019	hjhhj has responded to your donation post	hjhhj has responded to your post : '<i>I want to donate Blood [B+]</i>'. <br> click <a href='http://127.0.0.1:8000/donations/jywycajy_0-0-bb5f1092990439390592992019/details/' target='_blank'>here</a> to view. <br> <br> Respondent Contact: <b><a href='#'>+8804234234463</a></b> <br> Respondent Message: Please contact with me ...	f	2019-10-05 04:59:25.576683+06	2019-10-05 05:01:44.481191+06	16	19
30	donationRespond_Create	jywycajy_1-1-a4h61012090506510512092019	darks-admin_a1ay1091540510030591542019	darkstarnmn has responded to your donation post	darkstarnmn has responded to your post : '<i>I need Organ [Lungs] donor</i>'. <br> click <a href='http://127.0.0.1:8000/donations/jywycajy_1-1-a4h61012090506510512092019/details/' target='_blank'>here</a> to view. <br> <br> Respondent Contact: <b><a href='#'>+8802423523232</a></b> <br> Respondent Message: Please contact with me ...	f	2019-10-05 05:10:03.989865+06	2019-10-05 05:10:03.989876+06	1	3
32	donationBank_Create	qales-admin_BankCreate	qales-admin_gxpy1084260203020784262019	qalesece has created a bank.	Hello Super Admin ! <br> qalesece has created a bank named Walker Kelly and is waiting for verification approval. <br> click <a href='http://127.0.0.1:8000/donation-bank/walker-kel_aidm1085730202590785732019/details/' target='_blank'>here</a> to view bank details.	f	2019-10-07 02:03:02.399781+06	2019-10-07 02:03:02.399799+06	1	26
33	membershipRemove	sss-hupd0990961036432790962019	darks-sss_3rjy1094210711180794212019	darkstarnmn removed your membership.	darkstarnmn has removed your membership from 'Daffodil'.	f	2019-10-07 07:11:18.174296+06	2019-10-07 07:11:18.174307+06	7	3
37	userPermission_Update	5rn11069930923030769932019	admin-qiluh_cd1n1026920923030726922019	Your Permissions in BDonor has been updated!	Your Permissions in BDonor has been updated! <br> <br> Additional Message: -	t	2019-10-07 09:23:03.488202+06	2019-10-07 09:23:03.488234+06	27	1
35	memberRequest_Accept	qiluhedyw-jq251054650712540754652019	darks-qiluh_cjge1030030713010730032019	darkstarnmn accepted your member request.	darkstarnmn accepted your member request. <br> You are now a member of 'Daffodil'.	t	2019-10-07 07:13:01.123038+06	2019-10-07 07:13:01.123055+06	27	3
38	userPermission_Update	z5cu1005430928080705432019	admin-qiluh_ynhs1085260928080785262019	Your Permissions in BDonor has been updated!	Your Permissions in BDonor has been updated! <br> <br> Additional Information: Permission Changed: ['Donate Permission: Blocked'].	t	2019-10-07 09:28:08.467127+06	2019-10-07 09:28:08.467147+06	27	1
39	userPermission_Update	dkl11068460929080768462019	admin-qiluh_fe201002680929080702682019	Your Permissions in BDonor has been updated!	Your Permissions in BDonor has been updated! <br> <br> Additional Information: <br>Permission Changed: ['Donate Permission: Revoked', 'Donor Request Permission: Blocked'].	t	2019-10-07 09:29:08.902001+06	2019-10-07 09:29:08.902016+06	27	1
40	userPermission_Update	penc1045660930100745662019	admin-qiluh_9uea1020590930100720592019	Your Permissions in BDonor has been updated!	Your Permissions in BDonor has been updated! <br> <br> Additional Information: <br>Permission Changed: ['Donate Permission: Blocked', 'Donor Request Permission: Revoked']. <br><br> Message: You are affected in virus.\r\nThat's why you are blocked!	t	2019-10-07 09:30:10.813163+06	2019-10-07 09:30:10.813173+06	27	1
36	userPermission_Update	admin-x73g0994980253062494982019	admin-qiluh_kbwu1097070851390797072019	Your Permissions in BDonor has been updated!	Your Permissions in BDonor has been updated! <br> <br> Additional Message: -	t	2019-10-07 08:51:39.169647+06	2019-10-07 09:20:35.15182+06	27	1
42	userPermission_Update	5iy81078010936110778012019	admin-darks_b9dq1028860936110728862019	Your Permissions in BDonor has been updated!	Your Permissions in BDonor has been updated! <br> <br> Additional Information: <br>Permission Changed: <span style='color:blue;font-size:20px;'>['Donate Permission: Revoked', 'Chat Permission: Blocked']</span>.	t	2019-10-07 09:36:11.433274+06	2019-10-07 09:36:11.433293+06	3	1
41	userPermission_Update	vk701026270932430726272019	admin-darks_axc41072040932430772042019	Your Permissions in BDonor has been updated!	Your Permissions in BDonor has been updated! <br> <br> Additional Information: <br>Permission Changed: ['Donate Permission: Blocked']. <br><br> Message:<br> You are affected in virus.\r\nThat's why you are blocked!	t	2019-10-07 09:32:43.616913+06	2019-10-07 09:32:43.616929+06	3	1
28	donationRespond_Create	darkstarnmn_0-1-24241005640024400505642019	jywyc-darks_91ki1091390042120591392019	jywycajy has responded to your donation post	jywycajy has responded to your post : '<i>I want to donate Organ [Lungs]</i>'. <br> click <a href='http://127.0.0.1:8000/donations/darkstarnmn_0-1-24241005640024400505642019/details/' target='_blank'>here</a> to view. <br> <br> Respondent Contact: <b><a href='#'>+8802123123232</a></b> <br> Respondent Message: Please contact with me ...	t	2019-10-05 00:42:12.269901+06	2019-10-05 04:06:29.092204+06	3	16
27	donationRespond_Create	darkstarnmn_0-1-r6c91079152306540479152019	jywyc-darks_ao1i1086162325350486162019	Disha has responded to your donation post	Disha has responded to your post : '<i>I want to donate Organ [Kidney]</i>'. <br> click <a href='http://127.0.0.1:8000/donations/darkstarnmn_0-1-r6c91079152306540479152019/details/' target='_blank'>here</a> to view. <br> <br> Respondent Contact: <b><a href='#'>+8801989789798</a></b> <br> Respondent Message: Please contact with me ...	t	2019-10-04 23:25:35.400887+06	2019-10-12 19:55:10.662115+06	3	29
43	userPermission_Update	ehw61027330938170727332019	admin-darks_x37c1043800938170743802019	Your Permissions in BDonor has been updated!	Your Permissions in BDonor has been updated! <br> <br> Additional Information: <br>Permission Changed: <span style='color:blue;font-size:15px;margin-left:5px;'>["Donor Request Permission: <span style='color:red;'>Blocked</span>", "Chat Permission: <span style='color:green;'>Revoked</span>"]</span>.	t	2019-10-07 09:38:17.802235+06	2019-10-07 09:38:17.802251+06	3	1
44	userPermission_Update	a1xx1026560952460726562019	admin-darks_mahk1033290952460733292019	Your Permissions in BDonor has been updated!	Your Permissions in BDonor has been updated! <br> <br> Additional Information: <br>Permission Changed: <span style='color:blue;font-size:15px;margin-left:5px;'>["Donate Permission: <span style='color:red;'>Blocked</span>"]</span>. <br><br> Message:<br> <p>You are blocked. You are affected in virus.</p>\r\n\r\n<p style="text-align:center"><span style="font-size:16px"><strong><span style="color:#e74c3c">Do not try to Donate.</span></strong></span></p>	t	2019-10-07 09:52:46.385402+06	2019-10-07 09:52:46.38547+06	3	1
45	userPermission_Update	hq441065270958410765272019	admin-darks_aznj1072990958410772992019	Your Permissions in BDonor has been updated!	Your Permissions in BDonor has been updated! <br> <br> <span style='color:black;font-style:italic;font-size:17px;font-weight:700;'>Additional Information:</span> <br>Permission Changed: <span style='color:blue;font-size:15px;margin-left:5px;'>["Donate Permission: <span style='color:green;'>Revoked</span>", "Bank Manage Permission: <span style='color:red;'>Blocked</span>"]</span>. <br><br> <span style='color:black;font-style:italic;font-size:17px;font-weight:700;'>Message:</span><br> <p style="text-align:center"><span style="color:#e74c3c"><span style="font-size:26px">BLOCKED</span></span></p>	t	2019-10-07 09:58:41.903448+06	2019-10-07 09:58:41.903463+06	3	1
10	memberRequest_Delete	daffodil_ahmj0916201107472716202019	sss-darks_urvs0934821113002734822019	sss cancels his/her request to join your Donation Bank.	sss cancels his/her request to join your Donation Bank.	t	2019-09-27 11:13:00.107426+06	2019-09-27 11:13:00.107452+06	3	7
5	donationRespond_Create	darkstarnmn_0-1-fc6n0965560951552765562019	nelma-darks_0fcy0996470958552796472019	nelmannuman has responded to your donation post	nelmannuman has responded to your post : '<i>I want to donate Organ [Kidney]</i>'. <br> click <a href='http://127.0.0.1:8000/donations/darkstarnmn_0-1-fc6n0965560951552765562019/details/' target='_blank'>here</a> to view. <br> <br> Respondent Contact: <b><a href='#'>+8802334353453</a></b> <br> Respondent Message: Please contact with me ...	t	2019-09-27 09:58:55.626999+06	2019-09-27 09:58:55.627067+06	3	5
48	userPermission_Update	9wnf1007290156051107292019	admin-darks_7q3q1058040156051158042019	Your Permissions in BDonor has been changed!	Your Permissions in BDonor has been changed! <br> <br> <span style='color:black;font-style:italic;font-size:17px;font-weight:700;'>Additional Information:</span> <br>Permission Changed: <span style='color:blue;font-size:15px;margin-left:5px;'>["Browse Permission: <span style='color:green;'>Allowed</span>", "Donor Request Permission: <span style='color:green;'>Allowed</span>", "Bank Manage Permission: <span style='color:green;'>Allowed</span>"]<br><br><p>If you have any query, please feel free to contact with us.</p></span>	t	2019-10-11 01:56:05.376975+06	2019-10-11 01:56:05.376985+06	3	1
47	userPermission_Update	cbw21075730154561175732019	admin-darks_5qf31077300154561177302019	Your Permissions in BDonor has been changed!	Your Permissions in BDonor has been changed! <br> <br> <span style='color:black;font-style:italic;font-size:17px;font-weight:700;'>Additional Information:</span> <br>Permission Changed: <span style='color:blue;font-size:15px;margin-left:5px;'>["Browse Permission: <span style='color:red;'>Blocked</span>"]<br><br><p>If you have any query, please feel free to contact with us.</p></span>	t	2019-10-11 01:54:56.16653+06	2019-10-11 01:54:56.166558+06	3	1
46	userPermission_Update	2qpb1097850020521197852019	admin-darks_7mua1049300020521149302019	Your Permissions in BDonor has been changed!	Your Permissions in BDonor has been changed! <br> <br> <span style='color:black;font-style:italic;font-size:17px;font-weight:700;'>Additional Information:</span> <br>Permission Changed: <span style='color:blue;font-size:15px;margin-left:5px;'>["Donate Permission: <span style='color:red;'>Blocked</span>"]<br><br><p>If you have any query, please feel free to contact with us.</p></span>	t	2019-10-11 00:20:52.287144+06	2019-10-11 00:20:52.287154+06	3	1
49	userPermission_Update	z1m61088202001341288202019	admin-darks_p9o31033692001341233692019	Your Permissions in BDonor has been changed!	Your Permissions in BDonor has been changed! <br> <br> <span style='color:black;font-style:italic;font-size:17px;font-weight:700;'>Additional Information:</span> <br>Permission Changed: <span style='color:blue;font-size:15px;margin-left:5px;'>["Donate Permission: <span style='color:green;'>Allowed</span>"]<br><br><p>If you have any query, please feel free to contact with us.</p></span>	t	2019-10-12 20:01:34.45622+06	2019-10-12 20:01:34.456251+06	3	1
50	memberRequest_Create	xilubub-cbl71083330705061783332019	xilub-bagem_rnzg1056430705061756432019	xilubub wants to be a member of your Donation bank.	xilubub wants to be a member of your Donation bank. <br> Requested at : 2019-10-17 07:05:06.424757	f	2019-10-17 07:05:06.440262+06	2019-10-17 07:05:06.440271+06	10	31
51	userPermission_Update	ed3r1008360930111908362019	admin-darks_74nl1093670930111993672019	Your Permissions in BDonor has been changed!	Your Permissions in BDonor has been changed! <br> <br> <span style='color:black;font-style:italic;font-size:17px;font-weight:700;'>Additional Information:</span> <br>Permission Changed: <span style='color:blue;font-size:15px;margin-left:5px;'>["Donate Permission: <span style='color:red;'>Blocked</span>"]<br><br><p>If you have any query, please feel free to contact with us.</p></span>	f	2019-10-19 09:30:11.769388+06	2019-10-19 09:30:11.76943+06	3	1
52	userPermission_Update	ta3s1029200933061929202019	admin-darks_o84b1046090933061946092019	Your Permissions in BDonor has been changed!	Your Permissions in BDonor has been changed! <br> <br> <span style='color:black;font-style:italic;font-size:17px;font-weight:700;'>Additional Information:</span> <br>Permission Changed: <span style='color:blue;font-size:15px;margin-left:5px;'>[]<br><br><p>If you have any query, please feel free to contact with us.</p></span>	f	2019-10-19 09:33:06.482629+06	2019-10-19 09:33:06.482727+06	3	1
53	userPermission_Update	iw021016160939521916162019	admin-darks_8r0k1095650939521995652019	Your Permissions in BDonor has been changed!	Your Permissions in BDonor has been changed! <br> <br> <span style='color:black;font-style:italic;font-size:17px;font-weight:700;'>Additional Information:</span> <br>Permission Changed: <span style='color:blue;font-size:15px;margin-left:5px;'>["Donate Permission: <span style='color:green;'>Allowed</span>"]<br><br><p>If you have any query, please feel free to contact with us.</p></span>	f	2019-10-19 09:39:52.11107+06	2019-10-19 09:39:52.111141+06	3	1
54	userPermission_Update	u6uf1075571453311975572019	admin-darks_mee31028491453311928492019	Your Permissions in BDonor has been changed!	Your Permissions in BDonor has been changed! <br> <br> <span style='color:black;font-style:italic;font-size:17px;font-weight:700;'>Additional Information:</span> <br>Permission Changed: <span style='color:blue;font-size:15px;margin-left:5px;'>["Donate Permission: <span style='color:red;'>Blocked</span>"]<br><br><p>If you have any query, please feel free to contact with us.</p></span>	f	2019-10-19 14:53:31.31069+06	2019-10-19 14:53:31.310748+06	3	1
55	userPermission_Update	epdj1014721311142114722019	admin-darks_3td21024191311142124192019	Your Permissions in BDonor has been changed!	Your Permissions in BDonor has been changed! <br> <br> <span style='color:black;font-style:italic;font-size:17px;font-weight:700;'>Additional Information:</span> <br>Permission Changed: <span style='color:blue;font-size:15px;margin-left:5px;'>["Donate Permission: <span style='color:green;'>Allowed</span>"]<br><br><p>If you have any query, please feel free to contact with us.</p></span>	f	2019-10-21 13:11:14.102885+06	2019-10-21 13:11:14.10294+06	3	1
56	donationRespond_Create	zovuw_1-0-pyy91055241337072155242019	daziz-zovuw_bea31051721339152151722019	dazizotady has responded to your donation post	dazizotady has responded to your post : '<i>I need Blood [O+] donor</i>'. <br> click <a href='http://127.0.0.1:8000/donations/zovuw_1-0-pyy91055241337072155242019/details/' target='_blank'>here</a> to view. <br> <br> Respondent Contact: <b><a href='#'>+8805445454334</a></b> <br> Respondent Message: ct with me ...	f	2019-10-21 13:39:15.117712+06	2019-10-21 13:39:15.117769+06	40	41
\.


--
-- TOC entry 3641 (class 0 OID 17104)
-- Dependencies: 268
-- Data for Name: utils_sitepreference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utils_sitepreference (id, logo_header_color, navbar_header_color, sidebar_color, background_color, sidebar_type, scroll_to_top, chat_with_others, created_at, updated_at, user_id) FROM stdin;
1	\N	\N	\N	\N	Default	t	t	2019-09-24 02:53:06.331648+06	2019-09-24 02:53:06.331658+06	1
2	\N	\N	\N	\N	Default	t	t	2019-09-24 02:53:30.764836+06	2019-09-24 02:53:30.764845+06	2
4	\N	\N	\N	\N	Default	t	t	2019-09-24 02:53:41.330073+06	2019-09-24 02:53:41.330084+06	4
5	\N	\N	\N	\N	Default	t	t	2019-09-24 03:04:18.252756+06	2019-09-24 03:04:18.252767+06	5
6	\N	\N	\N	\N	Default	t	t	2019-09-27 10:24:48.955862+06	2019-09-27 10:24:48.955904+06	6
7	\N	\N	\N	\N	Default	t	t	2019-09-27 10:36:43.981084+06	2019-09-27 10:36:43.981096+06	7
9	\N	\N	\N	\N	Default	t	t	2019-09-30 01:50:55.041019+06	2019-09-30 01:50:55.04103+06	8
11	\N	\N	\N	\N	Default	t	t	2019-10-02 21:01:50.456795+06	2019-10-02 21:01:50.456806+06	9
12	\N	\N	\N	\N	Default	t	t	2019-10-03 02:43:24.029487+06	2019-10-03 02:43:24.029499+06	10
13	dark	dark2	dark	dark	default	t	t	2019-10-03 02:46:17.610087+06	2019-10-03 02:49:23.342854+06	11
14	\N	\N	\N	\N	Default	t	t	2019-10-03 03:55:06.188525+06	2019-10-03 03:55:06.188539+06	12
15	\N	\N	\N	\N	Default	t	t	2019-10-03 11:14:32.691153+06	2019-10-03 11:14:32.691164+06	13
16	\N	\N	\N	\N	Default	t	t	2019-10-03 11:36:19.541731+06	2019-10-03 11:36:19.541743+06	14
17	\N	\N	\N	\N	Default	t	t	2019-10-03 11:39:12.863798+06	2019-10-03 11:39:12.863816+06	15
18	\N	\N	\N	\N	Default	t	t	2019-10-03 11:44:37.638849+06	2019-10-03 11:44:37.638874+06	16
19	\N	\N	\N	\N	Default	t	t	2019-10-03 12:42:49.00353+06	2019-10-03 12:42:49.003558+06	3
20	\N	\N	\N	\N	Default	t	t	2019-10-05 01:43:21.656288+06	2019-10-05 01:43:21.656317+06	17
21	\N	\N	\N	\N	Default	t	t	2019-10-05 01:44:30.359278+06	2019-10-05 01:44:30.359299+06	18
22	\N	\N	\N	\N	Default	t	t	2019-10-05 04:02:27.421277+06	2019-10-05 04:02:27.421288+06	19
23	\N	\N	\N	\N	Default	t	t	2019-10-06 04:21:49.956924+06	2019-10-06 04:21:49.956936+06	20
24	\N	\N	\N	\N	Default	t	t	2019-10-06 04:22:21.175563+06	2019-10-06 04:22:21.175574+06	21
25	\N	\N	\N	\N	Default	t	t	2019-10-06 04:22:49.875193+06	2019-10-06 04:22:49.875209+06	22
26	\N	\N	\N	\N	Default	t	t	2019-10-06 04:28:58.730884+06	2019-10-06 04:28:58.730897+06	23
27	\N	\N	\N	\N	Default	t	t	2019-10-06 04:29:50.025758+06	2019-10-06 04:29:50.025811+06	24
28	\N	\N	\N	\N	Default	t	t	2019-10-06 04:42:03.201764+06	2019-10-06 04:42:03.201776+06	25
29	\N	\N	\N	\N	Default	t	t	2019-10-07 00:48:18.511515+06	2019-10-07 00:48:18.511534+06	26
30	\N	\N	\N	\N	Default	t	t	2019-10-07 07:12:34.067087+06	2019-10-07 07:12:34.067104+06	27
31	\N	\N	\N	\N	Default	t	t	2019-10-07 09:50:45.333246+06	2019-10-07 09:50:45.33327+06	28
32	\N	\N	\N	\N	Default	t	t	2019-10-12 19:45:25.829097+06	2019-10-12 19:45:25.829109+06	29
33	\N	\N	\N	\N	Default	t	t	2019-10-15 01:43:07.884657+06	2019-10-15 01:43:07.884692+06	30
34	\N	\N	\N	\N	Default	t	t	2019-10-17 06:12:20.465688+06	2019-10-17 06:12:20.465699+06	31
35	\N	\N	\N	\N	Default	t	t	2019-10-20 22:38:42.669737+06	2019-10-20 22:38:42.669762+06	32
36	\N	\N	\N	\N	Default	t	t	2019-10-21 04:38:04.018289+06	2019-10-21 04:38:04.0183+06	33
37	\N	\N	\N	\N	Default	t	t	2019-10-21 05:09:58.602033+06	2019-10-21 05:09:58.602044+06	34
38	\N	\N	\N	\N	Default	t	t	2019-10-21 05:10:48.193379+06	2019-10-21 05:10:48.193391+06	35
39	\N	\N	\N	\N	Default	t	t	2019-10-21 05:11:27.049076+06	2019-10-21 05:11:27.049087+06	36
40	\N	\N	\N	\N	Default	t	t	2019-10-21 05:12:08.793289+06	2019-10-21 05:12:08.793308+06	37
41	\N	\N	\N	\N	Default	t	t	2019-10-21 13:34:07.929288+06	2019-10-21 13:34:07.929319+06	38
42	\N	\N	\N	\N	Default	t	t	2019-10-21 13:37:40.290265+06	2019-10-21 13:37:40.290293+06	39
\.


--
-- TOC entry 3713 (class 0 OID 0)
-- Dependencies: 212
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 35, true);


--
-- TOC entry 3714 (class 0 OID 0)
-- Dependencies: 214
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- TOC entry 3715 (class 0 OID 0)
-- Dependencies: 277
-- Name: accounts_userpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_userpermission_id_seq', 39, true);


--
-- TOC entry 3716 (class 0 OID 0)
-- Dependencies: 218
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_userprofile_id_seq', 39, true);


--
-- TOC entry 3717 (class 0 OID 0)
-- Dependencies: 275
-- Name: accounts_userreport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_userreport_id_seq', 45, true);


--
-- TOC entry 3718 (class 0 OID 0)
-- Dependencies: 216
-- Name: accounts_userstripe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_userstripe_id_seq', 37, true);


--
-- TOC entry 3719 (class 0 OID 0)
-- Dependencies: 202
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3720 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3721 (class 0 OID 0)
-- Dependencies: 200
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 164, true);


--
-- TOC entry 3722 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3723 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 41, true);


--
-- TOC entry 3724 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, true);


--
-- TOC entry 3725 (class 0 OID 0)
-- Dependencies: 281
-- Name: blog_attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blog_attachment_id_seq', 101, true);


--
-- TOC entry 3726 (class 0 OID 0)
-- Dependencies: 279
-- Name: blog_blog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blog_blog_id_seq', 112, true);


--
-- TOC entry 3727 (class 0 OID 0)
-- Dependencies: 285
-- Name: blog_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blog_comment_id_seq', 9, true);


--
-- TOC entry 3728 (class 0 OID 0)
-- Dependencies: 287
-- Name: blog_commentreply_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blog_commentreply_id_seq', 5, true);


--
-- TOC entry 3729 (class 0 OID 0)
-- Dependencies: 224
-- Name: chat_chatmessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_chatmessage_id_seq', 6, true);


--
-- TOC entry 3730 (class 0 OID 0)
-- Dependencies: 222
-- Name: chat_thread_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_thread_id_seq', 12, true);


--
-- TOC entry 3731 (class 0 OID 0)
-- Dependencies: 228
-- Name: checkout_checkout_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.checkout_checkout_id_seq', 7, true);


--
-- TOC entry 3732 (class 0 OID 0)
-- Dependencies: 220
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 131, true);


--
-- TOC entry 3733 (class 0 OID 0)
-- Dependencies: 198
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 41, true);


--
-- TOC entry 3734 (class 0 OID 0)
-- Dependencies: 196
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 92, true);


--
-- TOC entry 3735 (class 0 OID 0)
-- Dependencies: 255
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 3, true);


--
-- TOC entry 3736 (class 0 OID 0)
-- Dependencies: 240
-- Name: donationBank_bankmember_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."donationBank_bankmember_id_seq"', 9, true);


--
-- TOC entry 3737 (class 0 OID 0)
-- Dependencies: 242
-- Name: donationBank_campaign_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."donationBank_campaign_id_seq"', 6, true);


--
-- TOC entry 3738 (class 0 OID 0)
-- Dependencies: 230
-- Name: donationBank_donation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."donationBank_donation_id_seq"', 2, true);


--
-- TOC entry 3739 (class 0 OID 0)
-- Dependencies: 232
-- Name: donationBank_donationbank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."donationBank_donationbank_id_seq"', 6, true);


--
-- TOC entry 3740 (class 0 OID 0)
-- Dependencies: 238
-- Name: donationBank_donationbanksetting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."donationBank_donationbanksetting_id_seq"', 6, true);


--
-- TOC entry 3741 (class 0 OID 0)
-- Dependencies: 236
-- Name: donationBank_donationprogress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."donationBank_donationprogress_id_seq"', 2, true);


--
-- TOC entry 3742 (class 0 OID 0)
-- Dependencies: 244
-- Name: donationBank_donationrequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."donationBank_donationrequest_id_seq"', 3, true);


--
-- TOC entry 3743 (class 0 OID 0)
-- Dependencies: 283
-- Name: donationBank_donationrequestprogress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."donationBank_donationrequestprogress_id_seq"', 2, true);


--
-- TOC entry 3744 (class 0 OID 0)
-- Dependencies: 234
-- Name: donationBank_memberrequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."donationBank_memberrequest_id_seq"', 8, true);


--
-- TOC entry 3745 (class 0 OID 0)
-- Dependencies: 246
-- Name: donations_donation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.donations_donation_id_seq', 25, true);


--
-- TOC entry 3746 (class 0 OID 0)
-- Dependencies: 252
-- Name: donations_donationprogress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.donations_donationprogress_id_seq', 25, true);


--
-- TOC entry 3747 (class 0 OID 0)
-- Dependencies: 273
-- Name: donations_donationprogress_respondent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.donations_donationprogress_respondent_id_seq', 22, true);


--
-- TOC entry 3748 (class 0 OID 0)
-- Dependencies: 250
-- Name: donations_donationrespond_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.donations_donationrespond_id_seq', 20, true);


--
-- TOC entry 3749 (class 0 OID 0)
-- Dependencies: 248
-- Name: donations_donationutil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.donations_donationutil_id_seq', 48, true);


--
-- TOC entry 3750 (class 0 OID 0)
-- Dependencies: 226
-- Name: priceplan_plan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.priceplan_plan_id_seq', 3, true);


--
-- TOC entry 3751 (class 0 OID 0)
-- Dependencies: 257
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- TOC entry 3752 (class 0 OID 0)
-- Dependencies: 259
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, true);


--
-- TOC entry 3753 (class 0 OID 0)
-- Dependencies: 261
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 3, true);


--
-- TOC entry 3754 (class 0 OID 0)
-- Dependencies: 263
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- TOC entry 3755 (class 0 OID 0)
-- Dependencies: 265
-- Name: suspicious_suspicious_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suspicious_suspicious_id_seq', 8, true);


--
-- TOC entry 3756 (class 0 OID 0)
-- Dependencies: 271
-- Name: utils_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utils_location_id_seq', 14, true);


--
-- TOC entry 3757 (class 0 OID 0)
-- Dependencies: 269
-- Name: utils_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utils_notification_id_seq', 56, true);


--
-- TOC entry 3758 (class 0 OID 0)
-- Dependencies: 267
-- Name: utils_sitepreference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utils_sitepreference_id_seq', 42, true);


--
-- TOC entry 3202 (class 2606 OID 16545)
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- TOC entry 3204 (class 2606 OID 16517)
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- TOC entry 3209 (class 2606 OID 16529)
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- TOC entry 3211 (class 2606 OID 16527)
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- TOC entry 3365 (class 2606 OID 17251)
-- Name: accounts_userpermission accounts_userpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userpermission
    ADD CONSTRAINT accounts_userpermission_pkey PRIMARY KEY (id);


--
-- TOC entry 3367 (class 2606 OID 17253)
-- Name: accounts_userpermission accounts_userpermission_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userpermission
    ADD CONSTRAINT accounts_userpermission_user_id_key UNIQUE (user_id);


--
-- TOC entry 3217 (class 2606 OID 16568)
-- Name: accounts_userprofile accounts_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_pkey PRIMARY KEY (id);


--
-- TOC entry 3220 (class 2606 OID 16570)
-- Name: accounts_userprofile accounts_userprofile_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_slug_key UNIQUE (slug);


--
-- TOC entry 3222 (class 2606 OID 16572)
-- Name: accounts_userprofile accounts_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_user_id_key UNIQUE (user_id);


--
-- TOC entry 3358 (class 2606 OID 17217)
-- Name: accounts_userreport accounts_userreport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userreport
    ADD CONSTRAINT accounts_userreport_pkey PRIMARY KEY (id);


--
-- TOC entry 3362 (class 2606 OID 17219)
-- Name: accounts_userreport accounts_userreport_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userreport
    ADD CONSTRAINT accounts_userreport_slug_key UNIQUE (slug);


--
-- TOC entry 3213 (class 2606 OID 16554)
-- Name: accounts_userstripe accounts_userstripe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userstripe
    ADD CONSTRAINT accounts_userstripe_pkey PRIMARY KEY (id);


--
-- TOC entry 3215 (class 2606 OID 16556)
-- Name: accounts_userstripe accounts_userstripe_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userstripe
    ADD CONSTRAINT accounts_userstripe_user_id_key UNIQUE (user_id);


--
-- TOC entry 3174 (class 2606 OID 16615)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 3179 (class 2606 OID 16478)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 3182 (class 2606 OID 16431)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3176 (class 2606 OID 16421)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3169 (class 2606 OID 16464)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 3171 (class 2606 OID 16413)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3190 (class 2606 OID 16449)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 2606 OID 16493)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 3184 (class 2606 OID 16439)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3196 (class 2606 OID 16457)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3199 (class 2606 OID 16507)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 3187 (class 2606 OID 16609)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 3376 (class 2606 OID 17286)
-- Name: blog_attachment blog_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_attachment
    ADD CONSTRAINT blog_attachment_pkey PRIMARY KEY (id);


--
-- TOC entry 3379 (class 2606 OID 17311)
-- Name: blog_attachment blog_attachment_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_attachment
    ADD CONSTRAINT blog_attachment_slug_key UNIQUE (slug);


--
-- TOC entry 3369 (class 2606 OID 17269)
-- Name: blog_blog blog_blog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_blog
    ADD CONSTRAINT blog_blog_pkey PRIMARY KEY (id);


--
-- TOC entry 3372 (class 2606 OID 17304)
-- Name: blog_blog blog_blog_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_blog
    ADD CONSTRAINT blog_blog_slug_key UNIQUE (slug);


--
-- TOC entry 3387 (class 2606 OID 17347)
-- Name: blog_comment blog_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_comment
    ADD CONSTRAINT blog_comment_pkey PRIMARY KEY (id);


--
-- TOC entry 3390 (class 2606 OID 17371)
-- Name: blog_commentreply blog_commentreply_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_commentreply
    ADD CONSTRAINT blog_commentreply_pkey PRIMARY KEY (id);


--
-- TOC entry 3232 (class 2606 OID 16635)
-- Name: chat_chatmessage chat_chatmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_chatmessage
    ADD CONSTRAINT chat_chatmessage_pkey PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 16624)
-- Name: chat_thread chat_thread_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_thread
    ADD CONSTRAINT chat_thread_pkey PRIMARY KEY (id);


--
-- TOC entry 3241 (class 2606 OID 16683)
-- Name: checkout_checkout checkout_checkout_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checkout_checkout
    ADD CONSTRAINT checkout_checkout_pkey PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 16595)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3164 (class 2606 OID 16405)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 3166 (class 2606 OID 16403)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3162 (class 2606 OID 16395)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3308 (class 2606 OID 16996)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 3312 (class 2606 OID 17008)
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- TOC entry 3314 (class 2606 OID 17006)
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- TOC entry 3273 (class 2606 OID 16769)
-- Name: donationBank_bankmember donationBank_bankmember_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_bankmember"
    ADD CONSTRAINT "donationBank_bankmember_pkey" PRIMARY KEY (id);


--
-- TOC entry 3275 (class 2606 OID 16771)
-- Name: donationBank_bankmember donationBank_bankmember_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_bankmember"
    ADD CONSTRAINT "donationBank_bankmember_user_id_key" UNIQUE (user_id);


--
-- TOC entry 3278 (class 2606 OID 16824)
-- Name: donationBank_campaign donationBank_campaign_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_campaign"
    ADD CONSTRAINT "donationBank_campaign_pkey" PRIMARY KEY (id);


--
-- TOC entry 3281 (class 2606 OID 16826)
-- Name: donationBank_campaign donationBank_campaign_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_campaign"
    ADD CONSTRAINT "donationBank_campaign_slug_key" UNIQUE (slug);


--
-- TOC entry 3246 (class 2606 OID 16708)
-- Name: donationBank_donation donationBank_donation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_donation"
    ADD CONSTRAINT "donationBank_donation_pkey" PRIMARY KEY (id);


--
-- TOC entry 3249 (class 2606 OID 16710)
-- Name: donationBank_donation donationBank_donation_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_donation"
    ADD CONSTRAINT "donationBank_donation_slug_key" UNIQUE (slug);


--
-- TOC entry 3251 (class 2606 OID 16721)
-- Name: donationBank_donationbank donationBank_donationbank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_donationbank"
    ADD CONSTRAINT "donationBank_donationbank_pkey" PRIMARY KEY (id);


--
-- TOC entry 3254 (class 2606 OID 16723)
-- Name: donationBank_donationbank donationBank_donationbank_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_donationbank"
    ADD CONSTRAINT "donationBank_donationbank_slug_key" UNIQUE (slug);


--
-- TOC entry 3268 (class 2606 OID 16760)
-- Name: donationBank_donationbanksetting donationBank_donationbanksetting_bank_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_donationbanksetting"
    ADD CONSTRAINT "donationBank_donationbanksetting_bank_id_key" UNIQUE (bank_id);


--
-- TOC entry 3270 (class 2606 OID 16758)
-- Name: donationBank_donationbanksetting donationBank_donationbanksetting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_donationbanksetting"
    ADD CONSTRAINT "donationBank_donationbanksetting_pkey" PRIMARY KEY (id);


--
-- TOC entry 3264 (class 2606 OID 16749)
-- Name: donationBank_donationprogress donationBank_donationprogress_donation_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_donationprogress"
    ADD CONSTRAINT "donationBank_donationprogress_donation_id_key" UNIQUE (donation_id);


--
-- TOC entry 3266 (class 2606 OID 16747)
-- Name: donationBank_donationprogress donationBank_donationprogress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_donationprogress"
    ADD CONSTRAINT "donationBank_donationprogress_pkey" PRIMARY KEY (id);


--
-- TOC entry 3284 (class 2606 OID 16856)
-- Name: donationBank_donationrequest donationBank_donationrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_donationrequest"
    ADD CONSTRAINT "donationBank_donationrequest_pkey" PRIMARY KEY (id);


--
-- TOC entry 3287 (class 2606 OID 16858)
-- Name: donationBank_donationrequest donationBank_donationrequest_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_donationrequest"
    ADD CONSTRAINT "donationBank_donationrequest_slug_key" UNIQUE (slug);


--
-- TOC entry 3381 (class 2606 OID 17330)
-- Name: donationBank_donationrequestprogress donationBank_donationrequestprogress_donation_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_donationrequestprogress"
    ADD CONSTRAINT "donationBank_donationrequestprogress_donation_id_key" UNIQUE (donation_id);


--
-- TOC entry 3383 (class 2606 OID 17328)
-- Name: donationBank_donationrequestprogress donationBank_donationrequestprogress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_donationrequestprogress"
    ADD CONSTRAINT "donationBank_donationrequestprogress_pkey" PRIMARY KEY (id);


--
-- TOC entry 3257 (class 2606 OID 16731)
-- Name: donationBank_memberrequest donationBank_memberrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_memberrequest"
    ADD CONSTRAINT "donationBank_memberrequest_pkey" PRIMARY KEY (id);


--
-- TOC entry 3260 (class 2606 OID 16733)
-- Name: donationBank_memberrequest donationBank_memberrequest_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_memberrequest"
    ADD CONSTRAINT "donationBank_memberrequest_slug_key" UNIQUE (slug);


--
-- TOC entry 3262 (class 2606 OID 16735)
-- Name: donationBank_memberrequest donationBank_memberrequest_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_memberrequest"
    ADD CONSTRAINT "donationBank_memberrequest_user_id_key" UNIQUE (user_id);


--
-- TOC entry 3289 (class 2606 OID 16905)
-- Name: donations_donation donations_donation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations_donation
    ADD CONSTRAINT donations_donation_pkey PRIMARY KEY (id);


--
-- TOC entry 3292 (class 2606 OID 16907)
-- Name: donations_donation donations_donation_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations_donation
    ADD CONSTRAINT donations_donation_slug_key UNIQUE (slug);


--
-- TOC entry 3352 (class 2606 OID 17192)
-- Name: donations_donationprogress_respondent donations_donationprogre_donationprogress_id_dona_7e44ef4e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations_donationprogress_respondent
    ADD CONSTRAINT donations_donationprogre_donationprogress_id_dona_7e44ef4e_uniq UNIQUE (donationprogress_id, donationrespond_id);


--
-- TOC entry 3303 (class 2606 OID 16941)
-- Name: donations_donationprogress donations_donationprogress_donation_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations_donationprogress
    ADD CONSTRAINT donations_donationprogress_donation_id_key UNIQUE (donation_id);


--
-- TOC entry 3305 (class 2606 OID 16939)
-- Name: donations_donationprogress donations_donationprogress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations_donationprogress
    ADD CONSTRAINT donations_donationprogress_pkey PRIMARY KEY (id);


--
-- TOC entry 3356 (class 2606 OID 17180)
-- Name: donations_donationprogress_respondent donations_donationprogress_respondent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations_donationprogress_respondent
    ADD CONSTRAINT donations_donationprogress_respondent_pkey PRIMARY KEY (id);


--
-- TOC entry 3300 (class 2606 OID 16926)
-- Name: donations_donationrespond donations_donationrespond_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations_donationrespond
    ADD CONSTRAINT donations_donationrespond_pkey PRIMARY KEY (id);


--
-- TOC entry 3296 (class 2606 OID 16915)
-- Name: donations_donationutil donations_donationutil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations_donationutil
    ADD CONSTRAINT donations_donationutil_pkey PRIMARY KEY (id);


--
-- TOC entry 3236 (class 2606 OID 16672)
-- Name: priceplan_plan priceplan_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priceplan_plan
    ADD CONSTRAINT priceplan_plan_pkey PRIMARY KEY (id);


--
-- TOC entry 3239 (class 2606 OID 16674)
-- Name: priceplan_plan priceplan_plan_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priceplan_plan
    ADD CONSTRAINT priceplan_plan_slug_key UNIQUE (slug);


--
-- TOC entry 3316 (class 2606 OID 17020)
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- TOC entry 3318 (class 2606 OID 17051)
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- TOC entry 3323 (class 2606 OID 17069)
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- TOC entry 3321 (class 2606 OID 17028)
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- TOC entry 3325 (class 2606 OID 17036)
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- TOC entry 3331 (class 2606 OID 17049)
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- TOC entry 3333 (class 2606 OID 17047)
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- TOC entry 3335 (class 2606 OID 17095)
-- Name: suspicious_suspicious suspicious_suspicious_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suspicious_suspicious
    ADD CONSTRAINT suspicious_suspicious_pkey PRIMARY KEY (id);


--
-- TOC entry 3349 (class 2606 OID 17137)
-- Name: utils_location utils_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utils_location
    ADD CONSTRAINT utils_location_pkey PRIMARY KEY (id);


--
-- TOC entry 3342 (class 2606 OID 17122)
-- Name: utils_notification utils_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utils_notification
    ADD CONSTRAINT utils_notification_pkey PRIMARY KEY (id);


--
-- TOC entry 3347 (class 2606 OID 17124)
-- Name: utils_notification utils_notification_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utils_notification
    ADD CONSTRAINT utils_notification_slug_key UNIQUE (slug);


--
-- TOC entry 3338 (class 2606 OID 17109)
-- Name: utils_sitepreference utils_sitepreference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utils_sitepreference
    ADD CONSTRAINT utils_sitepreference_pkey PRIMARY KEY (id);


--
-- TOC entry 3340 (class 2606 OID 17111)
-- Name: utils_sitepreference utils_sitepreference_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utils_sitepreference
    ADD CONSTRAINT utils_sitepreference_user_id_key UNIQUE (user_id);


--
-- TOC entry 3200 (class 1259 OID 16546)
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- TOC entry 3205 (class 1259 OID 16536)
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- TOC entry 3206 (class 1259 OID 16543)
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- TOC entry 3207 (class 1259 OID 16542)
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- TOC entry 3218 (class 1259 OID 16583)
-- Name: accounts_userprofile_slug_98d71aba_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_userprofile_slug_98d71aba_like ON public.accounts_userprofile USING btree (slug varchar_pattern_ops);


--
-- TOC entry 3359 (class 1259 OID 17232)
-- Name: accounts_userreport_reported_by_id_54e5f272; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_userreport_reported_by_id_54e5f272 ON public.accounts_userreport USING btree (reported_by_id);


--
-- TOC entry 3360 (class 1259 OID 17225)
-- Name: accounts_userreport_slug_e6da4933_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_userreport_slug_e6da4933_like ON public.accounts_userreport USING btree (slug varchar_pattern_ops);


--
-- TOC entry 3363 (class 1259 OID 17226)
-- Name: accounts_userreport_user_id_50b9e803; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_userreport_user_id_50b9e803 ON public.accounts_userreport USING btree (user_id);


--
-- TOC entry 3172 (class 1259 OID 16616)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 3177 (class 1259 OID 16479)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 3180 (class 1259 OID 16480)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 3167 (class 1259 OID 16465)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 3188 (class 1259 OID 16495)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 3191 (class 1259 OID 16494)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 3194 (class 1259 OID 16509)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 3197 (class 1259 OID 16508)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 3185 (class 1259 OID 16610)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 3374 (class 1259 OID 17292)
-- Name: blog_attachment_blog_id_546c562f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_attachment_blog_id_546c562f ON public.blog_attachment USING btree (blog_id);


--
-- TOC entry 3377 (class 1259 OID 17312)
-- Name: blog_attachment_slug_16224186_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_attachment_slug_16224186_like ON public.blog_attachment USING btree (slug varchar_pattern_ops);


--
-- TOC entry 3370 (class 1259 OID 17305)
-- Name: blog_blog_slug_4812aa2c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_blog_slug_4812aa2c_like ON public.blog_blog USING btree (slug varchar_pattern_ops);


--
-- TOC entry 3373 (class 1259 OID 17278)
-- Name: blog_blog_user_id_0e1a17e5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_blog_user_id_0e1a17e5 ON public.blog_blog USING btree (user_id);


--
-- TOC entry 3384 (class 1259 OID 17358)
-- Name: blog_comment_blog_id_c664fb0d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_comment_blog_id_c664fb0d ON public.blog_comment USING btree (blog_id);


--
-- TOC entry 3385 (class 1259 OID 17359)
-- Name: blog_comment_commented_by_id_de266e09; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_comment_commented_by_id_de266e09 ON public.blog_comment USING btree (commented_by_id);


--
-- TOC entry 3388 (class 1259 OID 17382)
-- Name: blog_commentreply_comment_id_8077b4d1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_commentreply_comment_id_8077b4d1 ON public.blog_commentreply USING btree (comment_id);


--
-- TOC entry 3391 (class 1259 OID 17383)
-- Name: blog_commentreply_replied_by_id_ed682192; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_commentreply_replied_by_id_ed682192 ON public.blog_commentreply USING btree (replied_by_id);


--
-- TOC entry 3233 (class 1259 OID 16658)
-- Name: chat_chatmessage_thread_id_0986d8f2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chat_chatmessage_thread_id_0986d8f2 ON public.chat_chatmessage USING btree (thread_id);


--
-- TOC entry 3234 (class 1259 OID 16659)
-- Name: chat_chatmessage_user_id_fa615e65; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chat_chatmessage_user_id_fa615e65 ON public.chat_chatmessage USING btree (user_id);


--
-- TOC entry 3227 (class 1259 OID 16646)
-- Name: chat_thread_first_id_f059d541; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chat_thread_first_id_f059d541 ON public.chat_thread USING btree (first_id);


--
-- TOC entry 3230 (class 1259 OID 16647)
-- Name: chat_thread_second_id_fb0dac48; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chat_thread_second_id_fb0dac48 ON public.chat_thread USING btree (second_id);


--
-- TOC entry 3242 (class 1259 OID 16694)
-- Name: checkout_checkout_plan_id_bdbd282f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX checkout_checkout_plan_id_bdbd282f ON public.checkout_checkout USING btree (plan_id);


--
-- TOC entry 3243 (class 1259 OID 16695)
-- Name: checkout_checkout_user_id_8b2fe298; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX checkout_checkout_user_id_8b2fe298 ON public.checkout_checkout USING btree (user_id);


--
-- TOC entry 3223 (class 1259 OID 16606)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 3226 (class 1259 OID 16607)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 3306 (class 1259 OID 16998)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 3309 (class 1259 OID 16997)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 3310 (class 1259 OID 17009)
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- TOC entry 3271 (class 1259 OID 16812)
-- Name: donationBank_bankmember_bank_id_2bcdc1f8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "donationBank_bankmember_bank_id_2bcdc1f8" ON public."donationBank_bankmember" USING btree (bank_id);


--
-- TOC entry 3276 (class 1259 OID 16833)
-- Name: donationBank_campaign_bank_id_34821d75; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "donationBank_campaign_bank_id_34821d75" ON public."donationBank_campaign" USING btree (bank_id);


--
-- TOC entry 3279 (class 1259 OID 16832)
-- Name: donationBank_campaign_slug_67932e7a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "donationBank_campaign_slug_67932e7a_like" ON public."donationBank_campaign" USING btree (slug varchar_pattern_ops);


--
-- TOC entry 3244 (class 1259 OID 16796)
-- Name: donationBank_donation_bank_id_d405cf8f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "donationBank_donation_bank_id_d405cf8f" ON public."donationBank_donation" USING btree (bank_id);


--
-- TOC entry 3247 (class 1259 OID 16772)
-- Name: donationBank_donation_slug_281a8591_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "donationBank_donation_slug_281a8591_like" ON public."donationBank_donation" USING btree (slug varchar_pattern_ops);


--
-- TOC entry 3252 (class 1259 OID 16773)
-- Name: donationBank_donationbank_slug_ab6800c8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "donationBank_donationbank_slug_ab6800c8_like" ON public."donationBank_donationbank" USING btree (slug varchar_pattern_ops);


--
-- TOC entry 3282 (class 1259 OID 16865)
-- Name: donationBank_donationrequest_bank_id_427dc2a1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "donationBank_donationrequest_bank_id_427dc2a1" ON public."donationBank_donationrequest" USING btree (bank_id);


--
-- TOC entry 3285 (class 1259 OID 16864)
-- Name: donationBank_donationrequest_slug_d34929ab_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "donationBank_donationrequest_slug_d34929ab_like" ON public."donationBank_donationrequest" USING btree (slug varchar_pattern_ops);


--
-- TOC entry 3255 (class 1259 OID 16785)
-- Name: donationBank_memberrequest_bank_id_0e1e58b7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "donationBank_memberrequest_bank_id_0e1e58b7" ON public."donationBank_memberrequest" USING btree (bank_id);


--
-- TOC entry 3258 (class 1259 OID 16784)
-- Name: donationBank_memberrequest_slug_ab6a9c3f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "donationBank_memberrequest_slug_ab6a9c3f_like" ON public."donationBank_memberrequest" USING btree (slug varchar_pattern_ops);


--
-- TOC entry 3290 (class 1259 OID 16947)
-- Name: donations_donation_slug_e7ffc3c2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX donations_donation_slug_e7ffc3c2_like ON public.donations_donation USING btree (slug varchar_pattern_ops);


--
-- TOC entry 3293 (class 1259 OID 16948)
-- Name: donations_donation_user_id_04dd09bd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX donations_donation_user_id_04dd09bd ON public.donations_donation USING btree (user_id);


--
-- TOC entry 3353 (class 1259 OID 17193)
-- Name: donations_donationprogress_donationprogress_id_8f3f78a3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX donations_donationprogress_donationprogress_id_8f3f78a3 ON public.donations_donationprogress_respondent USING btree (donationprogress_id);


--
-- TOC entry 3354 (class 1259 OID 17194)
-- Name: donations_donationprogress_donationrespond_id_ea98e9d4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX donations_donationprogress_donationrespond_id_ea98e9d4 ON public.donations_donationprogress_respondent USING btree (donationrespond_id);


--
-- TOC entry 3298 (class 1259 OID 16971)
-- Name: donations_donationrespond_donation_id_24e3ab44; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX donations_donationrespond_donation_id_24e3ab44 ON public.donations_donationrespond USING btree (donation_id);


--
-- TOC entry 3301 (class 1259 OID 16972)
-- Name: donations_donationrespond_respondent_id_a796e763; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX donations_donationrespond_respondent_id_a796e763 ON public.donations_donationrespond USING btree (respondent_id);


--
-- TOC entry 3294 (class 1259 OID 16959)
-- Name: donations_donationutil_donation_id_1516705f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX donations_donationutil_donation_id_1516705f ON public.donations_donationutil USING btree (donation_id);


--
-- TOC entry 3297 (class 1259 OID 16960)
-- Name: donations_donationutil_user_id_c1978228; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX donations_donationutil_user_id_c1978228 ON public.donations_donationutil USING btree (user_id);


--
-- TOC entry 3237 (class 1259 OID 16675)
-- Name: priceplan_plan_slug_046f421d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX priceplan_plan_slug_046f421d_like ON public.priceplan_plan USING btree (slug varchar_pattern_ops);


--
-- TOC entry 3319 (class 1259 OID 17057)
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- TOC entry 3326 (class 1259 OID 17071)
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- TOC entry 3327 (class 1259 OID 17070)
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- TOC entry 3328 (class 1259 OID 17082)
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- TOC entry 3329 (class 1259 OID 17083)
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- TOC entry 3336 (class 1259 OID 17101)
-- Name: suspicious_suspicious_user_id_ae1559a7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX suspicious_suspicious_user_id_ae1559a7 ON public.suspicious_suspicious USING btree (user_id);


--
-- TOC entry 3350 (class 1259 OID 17161)
-- Name: utils_location_provider_id_c483f884; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX utils_location_provider_id_c483f884 ON public.utils_location USING btree (provider_id);


--
-- TOC entry 3343 (class 1259 OID 17154)
-- Name: utils_notification_receiver_id_b9fc3e83; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX utils_notification_receiver_id_b9fc3e83 ON public.utils_notification USING btree (receiver_id);


--
-- TOC entry 3344 (class 1259 OID 17155)
-- Name: utils_notification_sender_id_843b75aa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX utils_notification_sender_id_843b75aa ON public.utils_notification USING btree (sender_id);


--
-- TOC entry 3345 (class 1259 OID 17153)
-- Name: utils_notification_slug_83af9de4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX utils_notification_slug_83af9de4_like ON public.utils_notification USING btree (slug varchar_pattern_ops);


--
-- TOC entry 3399 (class 2606 OID 16530)
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3400 (class 2606 OID 16537)
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3440 (class 2606 OID 17254)
-- Name: accounts_userpermission accounts_userpermission_user_id_43f5fc10_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userpermission
    ADD CONSTRAINT accounts_userpermission_user_id_43f5fc10_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3402 (class 2606 OID 16578)
-- Name: accounts_userprofile accounts_userprofile_user_id_92240672_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_user_id_92240672_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3438 (class 2606 OID 17238)
-- Name: accounts_userreport accounts_userreport_reported_by_id_54e5f272_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userreport
    ADD CONSTRAINT accounts_userreport_reported_by_id_54e5f272_fk_auth_user_id FOREIGN KEY (reported_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3439 (class 2606 OID 17227)
-- Name: accounts_userreport accounts_userreport_user_id_50b9e803_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userreport
    ADD CONSTRAINT accounts_userreport_user_id_50b9e803_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3401 (class 2606 OID 16573)
-- Name: accounts_userstripe accounts_userstripe_user_id_764f65f5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userstripe
    ADD CONSTRAINT accounts_userstripe_user_id_764f65f5_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3394 (class 2606 OID 16472)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3393 (class 2606 OID 16467)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3392 (class 2606 OID 16458)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3396 (class 2606 OID 16487)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3395 (class 2606 OID 16482)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3398 (class 2606 OID 16501)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3397 (class 2606 OID 16496)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3442 (class 2606 OID 17298)
-- Name: blog_attachment blog_attachment_blog_id_546c562f_fk_blog_blog_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_attachment
    ADD CONSTRAINT blog_attachment_blog_id_546c562f_fk_blog_blog_id FOREIGN KEY (blog_id) REFERENCES public.blog_blog(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3441 (class 2606 OID 17272)
-- Name: blog_blog blog_blog_user_id_0e1a17e5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_blog
    ADD CONSTRAINT blog_blog_user_id_0e1a17e5_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3444 (class 2606 OID 17348)
-- Name: blog_comment blog_comment_blog_id_c664fb0d_fk_blog_blog_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_comment
    ADD CONSTRAINT blog_comment_blog_id_c664fb0d_fk_blog_blog_id FOREIGN KEY (blog_id) REFERENCES public.blog_blog(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3445 (class 2606 OID 17353)
-- Name: blog_comment blog_comment_commented_by_id_de266e09_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_comment
    ADD CONSTRAINT blog_comment_commented_by_id_de266e09_fk_auth_user_id FOREIGN KEY (commented_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3446 (class 2606 OID 17372)
-- Name: blog_commentreply blog_commentreply_comment_id_8077b4d1_fk_blog_comment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_commentreply
    ADD CONSTRAINT blog_commentreply_comment_id_8077b4d1_fk_blog_comment_id FOREIGN KEY (comment_id) REFERENCES public.blog_comment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3447 (class 2606 OID 17377)
-- Name: blog_commentreply blog_commentreply_replied_by_id_ed682192_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_commentreply
    ADD CONSTRAINT blog_commentreply_replied_by_id_ed682192_fk_auth_user_id FOREIGN KEY (replied_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3407 (class 2606 OID 16648)
-- Name: chat_chatmessage chat_chatmessage_thread_id_0986d8f2_fk_chat_thread_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_chatmessage
    ADD CONSTRAINT chat_chatmessage_thread_id_0986d8f2_fk_chat_thread_id FOREIGN KEY (thread_id) REFERENCES public.chat_thread(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3408 (class 2606 OID 16653)
-- Name: chat_chatmessage chat_chatmessage_user_id_fa615e65_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_chatmessage
    ADD CONSTRAINT chat_chatmessage_user_id_fa615e65_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3405 (class 2606 OID 16636)
-- Name: chat_thread chat_thread_first_id_f059d541_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_thread
    ADD CONSTRAINT chat_thread_first_id_f059d541_fk_auth_user_id FOREIGN KEY (first_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3406 (class 2606 OID 16641)
-- Name: chat_thread chat_thread_second_id_fb0dac48_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_thread
    ADD CONSTRAINT chat_thread_second_id_fb0dac48_fk_auth_user_id FOREIGN KEY (second_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3409 (class 2606 OID 16684)
-- Name: checkout_checkout checkout_checkout_plan_id_bdbd282f_fk_priceplan_plan_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checkout_checkout
    ADD CONSTRAINT checkout_checkout_plan_id_bdbd282f_fk_priceplan_plan_id FOREIGN KEY (plan_id) REFERENCES public.priceplan_plan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3410 (class 2606 OID 16689)
-- Name: checkout_checkout checkout_checkout_user_id_8b2fe298_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checkout_checkout
    ADD CONSTRAINT checkout_checkout_user_id_8b2fe298_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3403 (class 2606 OID 16596)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3404 (class 2606 OID 16601)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3416 (class 2606 OID 16802)
-- Name: donationBank_bankmember donationBank_bankmem_bank_id_2bcdc1f8_fk_donationB; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_bankmember"
    ADD CONSTRAINT "donationBank_bankmem_bank_id_2bcdc1f8_fk_donationB" FOREIGN KEY (bank_id) REFERENCES public."donationBank_donationbank"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3417 (class 2606 OID 16807)
-- Name: donationBank_bankmember donationBank_bankmember_user_id_0995e2b4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_bankmember"
    ADD CONSTRAINT "donationBank_bankmember_user_id_0995e2b4_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3418 (class 2606 OID 16827)
-- Name: donationBank_campaign donationBank_campaig_bank_id_34821d75_fk_donationB; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_campaign"
    ADD CONSTRAINT "donationBank_campaig_bank_id_34821d75_fk_donationB" FOREIGN KEY (bank_id) REFERENCES public."donationBank_donationbank"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3419 (class 2606 OID 16859)
-- Name: donationBank_donationrequest donationBank_donatio_bank_id_427dc2a1_fk_donationB; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_donationrequest"
    ADD CONSTRAINT "donationBank_donatio_bank_id_427dc2a1_fk_donationB" FOREIGN KEY (bank_id) REFERENCES public."donationBank_donationbank"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3411 (class 2606 OID 16797)
-- Name: donationBank_donation donationBank_donatio_bank_id_d405cf8f_fk_donationB; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_donation"
    ADD CONSTRAINT "donationBank_donatio_bank_id_d405cf8f_fk_donationB" FOREIGN KEY (bank_id) REFERENCES public."donationBank_donationbank"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3415 (class 2606 OID 16791)
-- Name: donationBank_donationbanksetting donationBank_donatio_bank_id_fb85aa69_fk_donationB; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_donationbanksetting"
    ADD CONSTRAINT "donationBank_donatio_bank_id_fb85aa69_fk_donationB" FOREIGN KEY (bank_id) REFERENCES public."donationBank_donationbank"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3443 (class 2606 OID 17331)
-- Name: donationBank_donationrequestprogress donationBank_donatio_donation_id_912893de_fk_donationB; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_donationrequestprogress"
    ADD CONSTRAINT "donationBank_donatio_donation_id_912893de_fk_donationB" FOREIGN KEY (donation_id) REFERENCES public."donationBank_donationrequest"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3414 (class 2606 OID 16786)
-- Name: donationBank_donationprogress donationBank_donatio_donation_id_9712fa16_fk_donationB; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_donationprogress"
    ADD CONSTRAINT "donationBank_donatio_donation_id_9712fa16_fk_donationB" FOREIGN KEY (donation_id) REFERENCES public."donationBank_donation"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3412 (class 2606 OID 16774)
-- Name: donationBank_memberrequest donationBank_memberr_bank_id_0e1e58b7_fk_donationB; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_memberrequest"
    ADD CONSTRAINT "donationBank_memberr_bank_id_0e1e58b7_fk_donationB" FOREIGN KEY (bank_id) REFERENCES public."donationBank_donationbank"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3413 (class 2606 OID 16779)
-- Name: donationBank_memberrequest donationBank_memberrequest_user_id_bbb405ec_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."donationBank_memberrequest"
    ADD CONSTRAINT "donationBank_memberrequest_user_id_bbb405ec_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3420 (class 2606 OID 16942)
-- Name: donations_donation donations_donation_user_id_04dd09bd_fk_accounts_userprofile_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations_donation
    ADD CONSTRAINT donations_donation_user_id_04dd09bd_fk_accounts_userprofile_id FOREIGN KEY (user_id) REFERENCES public.accounts_userprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3425 (class 2606 OID 16973)
-- Name: donations_donationprogress donations_donationpr_donation_id_3db192c4_fk_donations; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations_donationprogress
    ADD CONSTRAINT donations_donationpr_donation_id_3db192c4_fk_donations FOREIGN KEY (donation_id) REFERENCES public.donations_donation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3436 (class 2606 OID 17200)
-- Name: donations_donationprogress_respondent donations_donationpr_donationprogress_id_8f3f78a3_fk_donations; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations_donationprogress_respondent
    ADD CONSTRAINT donations_donationpr_donationprogress_id_8f3f78a3_fk_donations FOREIGN KEY (donationprogress_id) REFERENCES public.donations_donationprogress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3437 (class 2606 OID 17195)
-- Name: donations_donationprogress_respondent donations_donationpr_donationrespond_id_ea98e9d4_fk_donations; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations_donationprogress_respondent
    ADD CONSTRAINT donations_donationpr_donationrespond_id_ea98e9d4_fk_donations FOREIGN KEY (donationrespond_id) REFERENCES public.donations_donationrespond(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3423 (class 2606 OID 16961)
-- Name: donations_donationrespond donations_donationre_donation_id_24e3ab44_fk_donations; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations_donationrespond
    ADD CONSTRAINT donations_donationre_donation_id_24e3ab44_fk_donations FOREIGN KEY (donation_id) REFERENCES public.donations_donation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3424 (class 2606 OID 16966)
-- Name: donations_donationrespond donations_donationre_respondent_id_a796e763_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations_donationrespond
    ADD CONSTRAINT donations_donationre_respondent_id_a796e763_fk_auth_user FOREIGN KEY (respondent_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3421 (class 2606 OID 16949)
-- Name: donations_donationutil donations_donationut_donation_id_1516705f_fk_donations; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations_donationutil
    ADD CONSTRAINT donations_donationut_donation_id_1516705f_fk_donations FOREIGN KEY (donation_id) REFERENCES public.donations_donation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3422 (class 2606 OID 16954)
-- Name: donations_donationutil donations_donationutil_user_id_c1978228_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations_donationutil
    ADD CONSTRAINT donations_donationutil_user_id_c1978228_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3429 (class 2606 OID 17072)
-- Name: socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3430 (class 2606 OID 17077)
-- Name: socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3428 (class 2606 OID 17063)
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3427 (class 2606 OID 17058)
-- Name: socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3426 (class 2606 OID 17052)
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3431 (class 2606 OID 17096)
-- Name: suspicious_suspicious suspicious_suspicious_user_id_ae1559a7_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suspicious_suspicious
    ADD CONSTRAINT suspicious_suspicious_user_id_ae1559a7_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3435 (class 2606 OID 17156)
-- Name: utils_location utils_location_provider_id_c483f884_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utils_location
    ADD CONSTRAINT utils_location_provider_id_c483f884_fk_auth_user_id FOREIGN KEY (provider_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3433 (class 2606 OID 17143)
-- Name: utils_notification utils_notification_receiver_id_b9fc3e83_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utils_notification
    ADD CONSTRAINT utils_notification_receiver_id_b9fc3e83_fk_auth_user_id FOREIGN KEY (receiver_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3434 (class 2606 OID 17148)
-- Name: utils_notification utils_notification_sender_id_843b75aa_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utils_notification
    ADD CONSTRAINT utils_notification_sender_id_843b75aa_fk_auth_user_id FOREIGN KEY (sender_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3432 (class 2606 OID 17138)
-- Name: utils_sitepreference utils_sitepreference_user_id_9dbd959a_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utils_sitepreference
    ADD CONSTRAINT utils_sitepreference_user_id_9dbd959a_fk_accounts_ FOREIGN KEY (user_id) REFERENCES public.accounts_userprofile(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2019-10-23 04:59:05 +06

--
-- PostgreSQL database dump complete
--

