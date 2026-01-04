--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Debian 17.5-1.pgdg130+1)
-- Dumped by pg_dump version 17.5 (Homebrew)

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
-- Name: blog; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.blog (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    slug character varying(255) NOT NULL,
    headline_image uuid NOT NULL,
    title character varying(255) DEFAULT NULL::character varying NOT NULL,
    blog_content text NOT NULL,
    excerpt text NOT NULL,
    seo_title character varying(255) DEFAULT NULL::character varying NOT NULL,
    seo_description text NOT NULL,
    keywords json NOT NULL
);


ALTER TABLE public.blog OWNER TO elianrichard;

--
-- Name: blog_id_seq; Type: SEQUENCE; Schema: public; Owner: elianrichard
--

CREATE SEQUENCE public.blog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blog_id_seq OWNER TO elianrichard;

--
-- Name: blog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elianrichard
--

ALTER SEQUENCE public.blog_id_seq OWNED BY public.blog.id;


--
-- Name: directus_access; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_access (
    id uuid NOT NULL,
    role uuid,
    "user" uuid,
    policy uuid NOT NULL,
    sort integer
);


ALTER TABLE public.directus_access OWNER TO elianrichard;

--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent text,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    origin character varying(255)
);


ALTER TABLE public.directus_activity OWNER TO elianrichard;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: elianrichard
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_activity_id_seq OWNER TO elianrichard;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elianrichard
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(64),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL,
    preview_url character varying(255),
    versioning boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_collections OWNER TO elianrichard;

--
-- Name: directus_comments; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_comments (
    id uuid NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid
);


ALTER TABLE public.directus_comments OWNER TO elianrichard;

--
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


ALTER TABLE public.directus_dashboards OWNER TO elianrichard;

--
-- Name: directus_extensions; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_extensions (
    enabled boolean DEFAULT true NOT NULL,
    id uuid NOT NULL,
    folder character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    bundle uuid
);


ALTER TABLE public.directus_extensions OWNER TO elianrichard;

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text,
    searchable boolean DEFAULT true NOT NULL
);


ALTER TABLE public.directus_fields OWNER TO elianrichard;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: elianrichard
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_fields_id_seq OWNER TO elianrichard;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elianrichard
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    created_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json,
    focal_point_x integer,
    focal_point_y integer,
    tus_id character varying(64),
    tus_data json,
    uploaded_on timestamp with time zone
);


ALTER TABLE public.directus_files OWNER TO elianrichard;

--
-- Name: directus_flows; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_flows OWNER TO elianrichard;

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO elianrichard;

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO elianrichard;

--
-- Name: directus_notifications; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);


ALTER TABLE public.directus_notifications OWNER TO elianrichard;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: elianrichard
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_notifications_id_seq OWNER TO elianrichard;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elianrichard
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- Name: directus_operations; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_operations OWNER TO elianrichard;

--
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(64) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_panels OWNER TO elianrichard;

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text,
    policy uuid NOT NULL
);


ALTER TABLE public.directus_permissions OWNER TO elianrichard;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: elianrichard
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_permissions_id_seq OWNER TO elianrichard;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elianrichard
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_policies; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_policies (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'badge'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_policies OWNER TO elianrichard;

--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(64) DEFAULT 'bookmark'::character varying,
    color character varying(255)
);


ALTER TABLE public.directus_presets OWNER TO elianrichard;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: elianrichard
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_presets_id_seq OWNER TO elianrichard;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elianrichard
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO elianrichard;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: elianrichard
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_relations_id_seq OWNER TO elianrichard;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elianrichard
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer,
    version uuid
);


ALTER TABLE public.directus_revisions OWNER TO elianrichard;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: elianrichard
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_revisions_id_seq OWNER TO elianrichard;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elianrichard
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    parent uuid
);


ALTER TABLE public.directus_roles OWNER TO elianrichard;

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent text,
    share uuid,
    origin character varying(255),
    next_token character varying(64)
);


ALTER TABLE public.directus_sessions OWNER TO elianrichard;

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(255) DEFAULT '#6644FF'::character varying NOT NULL,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json,
    public_favicon uuid,
    default_appearance character varying(255) DEFAULT 'auto'::character varying NOT NULL,
    default_theme_light character varying(255),
    theme_light_overrides json,
    default_theme_dark character varying(255),
    theme_dark_overrides json,
    report_error_url character varying(255),
    report_bug_url character varying(255),
    report_feature_url character varying(255),
    public_registration boolean DEFAULT false NOT NULL,
    public_registration_verify_email boolean DEFAULT true NOT NULL,
    public_registration_role uuid,
    public_registration_email_filter json,
    visual_editor_urls json,
    project_id uuid,
    mcp_enabled boolean DEFAULT false NOT NULL,
    mcp_allow_deletes boolean DEFAULT false NOT NULL,
    mcp_prompts_collection character varying(255) DEFAULT NULL::character varying,
    mcp_system_prompt_enabled boolean DEFAULT true NOT NULL,
    mcp_system_prompt text,
    project_owner character varying(255),
    project_usage character varying(255),
    org_name character varying(255),
    product_updates boolean,
    project_status character varying(255),
    ai_openai_api_key text,
    ai_anthropic_api_key text,
    ai_system_prompt text
);


ALTER TABLE public.directus_settings OWNER TO elianrichard;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: elianrichard
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_settings_id_seq OWNER TO elianrichard;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elianrichard
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);


ALTER TABLE public.directus_shares OWNER TO elianrichard;

--
-- Name: directus_translations; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.directus_translations OWNER TO elianrichard;

--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true,
    appearance character varying(255),
    theme_dark character varying(255),
    theme_light character varying(255),
    theme_light_overrides json,
    theme_dark_overrides json,
    text_direction character varying(255) DEFAULT 'auto'::character varying NOT NULL
);


ALTER TABLE public.directus_users OWNER TO elianrichard;

--
-- Name: directus_versions; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_versions (
    id uuid NOT NULL,
    key character varying(64) NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    hash character varying(255),
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid,
    delta json
);


ALTER TABLE public.directus_versions OWNER TO elianrichard;

--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json,
    was_active_before_deprecation boolean DEFAULT false NOT NULL,
    migrated_flow uuid
);


ALTER TABLE public.directus_webhooks OWNER TO elianrichard;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: elianrichard
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_webhooks_id_seq OWNER TO elianrichard;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elianrichard
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- Name: general_info; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.general_info (
    id integer NOT NULL,
    brand_name character varying(255) DEFAULT NULL::character varying NOT NULL,
    brand_legal_name character varying(255) DEFAULT NULL::character varying NOT NULL,
    brand_tagline character varying(255) DEFAULT NULL::character varying NOT NULL,
    address text NOT NULL,
    phone character varying(255) DEFAULT NULL::character varying NOT NULL,
    google_map_link character varying(255) DEFAULT NULL::character varying NOT NULL,
    instagram_link character varying(255) DEFAULT NULL::character varying NOT NULL
);


ALTER TABLE public.general_info OWNER TO elianrichard;

--
-- Name: general_info_id_seq; Type: SEQUENCE; Schema: public; Owner: elianrichard
--

CREATE SEQUENCE public.general_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.general_info_id_seq OWNER TO elianrichard;

--
-- Name: general_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elianrichard
--

ALTER SEQUENCE public.general_info_id_seq OWNED BY public.general_info.id;


--
-- Name: seo_settings; Type: TABLE; Schema: public; Owner: elianrichard
--

CREATE TABLE public.seo_settings (
    id integer NOT NULL,
    domain_url character varying(255) DEFAULT NULL::character varying NOT NULL,
    theme_color character varying(255) DEFAULT NULL::character varying NOT NULL,
    opengraph_image uuid NOT NULL,
    company_name character varying(255) DEFAULT NULL::character varying NOT NULL,
    category character varying(255) DEFAULT NULL::character varying NOT NULL,
    company_description text NOT NULL,
    emails json NOT NULL,
    phone_numbers json NOT NULL,
    keywords json NOT NULL,
    country_name character varying(255) DEFAULT NULL::character varying NOT NULL,
    region character varying(255) DEFAULT NULL::character varying NOT NULL,
    locality character varying(255) DEFAULT NULL::character varying NOT NULL,
    postal_code character varying(255) DEFAULT NULL::character varying NOT NULL,
    street_address text NOT NULL,
    latitude character varying(255) DEFAULT NULL::character varying NOT NULL,
    longitude character varying(255) DEFAULT NULL::character varying NOT NULL,
    founding_year character varying(255) DEFAULT NULL::character varying NOT NULL
);


ALTER TABLE public.seo_settings OWNER TO elianrichard;

--
-- Name: seo_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: elianrichard
--

CREATE SEQUENCE public.seo_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seo_settings_id_seq OWNER TO elianrichard;

--
-- Name: seo_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elianrichard
--

ALTER SEQUENCE public.seo_settings_id_seq OWNED BY public.seo_settings.id;


--
-- Name: blog id; Type: DEFAULT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.blog ALTER COLUMN id SET DEFAULT nextval('public.blog_id_seq'::regclass);


--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- Name: general_info id; Type: DEFAULT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.general_info ALTER COLUMN id SET DEFAULT nextval('public.general_info_id_seq'::regclass);


--
-- Name: seo_settings id; Type: DEFAULT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.seo_settings ALTER COLUMN id SET DEFAULT nextval('public.seo_settings_id_seq'::regclass);


--
-- Data for Name: blog; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.blog (id, status, sort, user_created, date_created, user_updated, date_updated, slug, headline_image, title, blog_content, excerpt, seo_title, seo_description, keywords) FROM stdin;
\.


--
-- Data for Name: directus_access; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_access (id, role, "user", policy, sort) FROM stdin;
b7bafd23-be7e-4119-b537-8e6af864b893	\N	\N	abf8a154-5b1c-4a46-ac9c-7300570f4f17	1
ac4d0727-b0e8-4af8-bce6-e26641458ab2	a3c8657d-5341-438b-9fa0-da0507beedc3	\N	870d02b4-af1d-40c3-b53b-3aaed0941488	\N
5965e256-a0da-4394-bdb1-9a7b0c737595	\N	5de817fb-2049-46bc-ba9b-ebe47a4169ea	657e0b5b-070a-466c-83bc-e42ad99e7d67	\N
bd0d36dc-6225-4c5f-8297-9b2971ed86b2	\N	7563849d-3a3e-40db-a52f-e251dcf225db	7f2bdb09-8641-45bc-92c0-d6e1d8915798	\N
\.


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, origin) FROM stdin;
1	login	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:21:36.596+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	51c0588a-b702-47e8-8501-f6654693b318	http://localhost:8055
2	update	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:22:02.804+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_settings	1	http://localhost:8055
3	update	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:24:50.453+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_settings	1	http://localhost:8055
4	create	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:27:36.928+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	7fefdfb3-9418-4d56-bb46-c0b1af26de71	http://localhost:8055
5	delete	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:27:37.476+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	7fefdfb3-9418-4d56-bb46-c0b1af26de71	http://localhost:8055
6	create	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:36:38.542+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	ac32b55d-b927-455f-a9bd-313e9fa04193	http://localhost:8055
7	delete	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:36:39.137+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	ac32b55d-b927-455f-a9bd-313e9fa04193	http://localhost:8055
8	create	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:40:02.253+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	07585f01-2463-4a07-bc98-f50e24f83604	http://localhost:8055
9	delete	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:40:02.307+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	07585f01-2463-4a07-bc98-f50e24f83604	http://localhost:8055
10	create	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:47:12.332+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	f7974e88-8835-42ee-a263-09d25d5fc689	http://localhost:8055
11	create	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:47:44.433+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	b23526f3-2723-4b36-825d-fe406f19af41	http://localhost:8055
12	update	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:47:53.628+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_settings	1	http://localhost:8055
13	update	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:48:32.964+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_settings	1	http://localhost:8055
14	create	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:50:17.722+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	1	http://localhost:8055
15	create	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:50:17.732+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	general_info	http://localhost:8055
16	create	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:50:52.266+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	2	http://localhost:8055
17	create	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:51:04.538+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	3	http://localhost:8055
18	update	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:51:14.243+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	2	http://localhost:8055
19	update	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:51:16.659+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	3	http://localhost:8055
20	create	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:51:41.024+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	4	http://localhost:8055
21	create	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:51:53.633+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	5	http://localhost:8055
22	create	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:55:45.212+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	6	http://localhost:8055
23	update	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:56:53.403+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	general_info	http://localhost:8055
24	create	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:58:36.47+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	7	http://localhost:8055
25	create	51c0588a-b702-47e8-8501-f6654693b318	2025-12-29 18:58:36.475+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	seo_settings	http://localhost:8055
26	login	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:25:54.845+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	51c0588a-b702-47e8-8501-f6654693b318	http://localhost:8055
27	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:26:30.386+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_settings	1	http://localhost:8055
28	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:26:43.348+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_settings	1	http://localhost:8055
29	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:26:48.228+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_settings	1	http://localhost:8055
30	delete	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:26:59.711+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	b23526f3-2723-4b36-825d-fe406f19af41	http://localhost:8055
31	delete	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:26:59.714+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	f7974e88-8835-42ee-a263-09d25d5fc689	http://localhost:8055
32	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:33:48.973+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	8	http://localhost:8055
33	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:35:02.875+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	9	http://localhost:8055
34	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:36:17.391+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	10	http://localhost:8055
35	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:37:38.078+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	11	http://localhost:8055
36	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:38:25.694+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	12	http://localhost:8055
37	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:38:40.782+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	10	http://localhost:8055
38	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:38:42.836+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	11	http://localhost:8055
39	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:38:54.982+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	13	http://localhost:8055
40	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:39:05.478+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	14	http://localhost:8055
41	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:39:18.964+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	15	http://localhost:8055
42	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:40:15.473+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	13	http://localhost:8055
43	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:40:17.102+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	14	http://localhost:8055
44	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:41:54.307+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	16	http://localhost:8055
45	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:41:58.083+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	16	http://localhost:8055
46	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:43:09.002+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	17	http://localhost:8055
47	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:43:12.134+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	17	http://localhost:8055
48	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:43:51.192+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	18	http://localhost:8055
49	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:43:53.68+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	18	http://localhost:8055
50	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:44:02.944+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	18	http://localhost:8055
51	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:44:18.993+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	19	http://localhost:8055
52	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:44:26.829+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	20	http://localhost:8055
53	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:44:38.191+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	21	http://localhost:8055
54	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:44:57.692+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	22	http://localhost:8055
55	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:45:08.929+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	23	http://localhost:8055
56	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:45:20.407+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	24	http://localhost:8055
57	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:45:27.36+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	25	http://localhost:8055
58	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:45:45.879+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	26	http://localhost:8055
59	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:45:48.267+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	26	http://localhost:8055
60	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:46:08.768+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	seo_settings	http://localhost:8055
61	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:47:51.026+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	27	http://localhost:8055
62	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:47:51.031+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	28	http://localhost:8055
63	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:47:51.033+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	29	http://localhost:8055
64	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:47:51.035+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	30	http://localhost:8055
65	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:47:51.037+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	31	http://localhost:8055
66	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:47:51.038+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	32	http://localhost:8055
67	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:47:51.04+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	33	http://localhost:8055
68	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:47:51.041+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	blog	http://localhost:8055
69	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:47:59.118+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	28	http://localhost:8055
70	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:53:23.946+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	34	http://localhost:8055
71	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:53:47.269+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	35	http://localhost:8055
72	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:53:59.594+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	36	http://localhost:8055
73	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:54:39.259+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	37	http://localhost:8055
74	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:54:43.154+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	37	http://localhost:8055
75	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:54:43.161+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	27	http://localhost:8055
76	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:54:43.172+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	28	http://localhost:8055
77	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:54:43.186+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	29	http://localhost:8055
78	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:54:43.205+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	30	http://localhost:8055
79	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:54:43.213+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	31	http://localhost:8055
80	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:54:43.217+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	32	http://localhost:8055
81	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:54:43.222+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	33	http://localhost:8055
82	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:54:43.226+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	34	http://localhost:8055
83	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:54:43.231+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	35	http://localhost:8055
84	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:54:43.234+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	36	http://localhost:8055
85	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:01.532+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	38	http://localhost:8055
86	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:03.637+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	38	http://localhost:8055
87	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:03.644+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	27	http://localhost:8055
88	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:03.663+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	28	http://localhost:8055
89	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:03.679+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	29	http://localhost:8055
90	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:03.686+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	30	http://localhost:8055
91	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:03.703+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	31	http://localhost:8055
92	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:03.715+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	32	http://localhost:8055
93	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:03.722+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	33	http://localhost:8055
94	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:03.725+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	34	http://localhost:8055
95	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:03.729+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	35	http://localhost:8055
96	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:03.733+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	36	http://localhost:8055
97	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:41.021+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	39	http://localhost:8055
98	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:43.814+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	39	http://localhost:8055
112	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:56:10.106+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	37	http://localhost:8055
114	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:56:10.123+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	28	http://localhost:8055
99	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:43.814+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	27	http://localhost:8055
100	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:43.827+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	28	http://localhost:8055
101	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:43.841+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	29	http://localhost:8055
102	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:43.853+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	30	http://localhost:8055
103	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:43.865+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	31	http://localhost:8055
104	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:43.871+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	32	http://localhost:8055
105	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:43.877+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	33	http://localhost:8055
106	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:43.882+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	34	http://localhost:8055
107	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:43.887+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	35	http://localhost:8055
108	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:43.9+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	36	http://localhost:8055
109	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:56.834+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	28	http://localhost:8055
110	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:55:58.997+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	28	http://localhost:8055
111	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:56:10.101+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	27	http://localhost:8055
113	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:56:10.118+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	29	http://localhost:8055
115	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:56:10.127+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	30	http://localhost:8055
116	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:56:10.142+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	31	http://localhost:8055
117	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:56:10.15+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	32	http://localhost:8055
118	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:56:10.162+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	33	http://localhost:8055
119	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:56:10.17+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	34	http://localhost:8055
120	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:56:10.175+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	35	http://localhost:8055
121	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:56:10.178+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	36	http://localhost:8055
122	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:58:18.149+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	40	http://localhost:8055
123	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:58:23.21+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	40	http://localhost:8055
124	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:58:24.964+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	37	http://localhost:8055
125	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:58:24.967+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	27	http://localhost:8055
126	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:58:24.978+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	28	http://localhost:8055
127	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:58:24.984+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	29	http://localhost:8055
128	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:58:24.988+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	40	http://localhost:8055
129	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:58:24.992+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	30	http://localhost:8055
130	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:58:25.005+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	31	http://localhost:8055
131	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:58:25.012+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	32	http://localhost:8055
132	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:58:25.024+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	33	http://localhost:8055
133	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:58:25.042+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	34	http://localhost:8055
134	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:58:25.047+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	35	http://localhost:8055
135	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:58:25.052+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	36	http://localhost:8055
136	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:59:11.08+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	41	http://localhost:8055
138	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:59:16.417+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	27	http://localhost:8055
140	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:59:16.434+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	29	http://localhost:8055
141	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:59:16.448+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	30	http://localhost:8055
142	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:59:16.458+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	31	http://localhost:8055
143	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:59:16.468+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	32	http://localhost:8055
144	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:59:16.481+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	33	http://localhost:8055
145	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:59:16.49+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	34	http://localhost:8055
146	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:59:16.494+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	35	http://localhost:8055
147	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:59:16.497+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	36	http://localhost:8055
150	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:02:04.874+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	27	http://localhost:8055
152	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:02:04.89+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	29	http://localhost:8055
154	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:02:04.898+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	30	http://localhost:8055
155	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:02:04.909+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	31	http://localhost:8055
156	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:02:04.925+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	32	http://localhost:8055
157	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:02:04.936+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	33	http://localhost:8055
158	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:02:04.952+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	34	http://localhost:8055
159	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:02:04.965+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	35	http://localhost:8055
160	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:02:04.97+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	36	http://localhost:8055
162	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:02.605+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	43	http://localhost:8055
163	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:06.748+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	38	http://localhost:8055
165	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:06.765+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	41	http://localhost:8055
167	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:06.781+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	42	http://localhost:8055
170	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:06.798+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	43	http://localhost:8055
137	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:59:16.411+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	38	http://localhost:8055
139	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:59:16.428+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	41	http://localhost:8055
148	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:01:57.352+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	42	http://localhost:8055
149	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:02:04.87+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	38	http://localhost:8055
151	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:02:04.883+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	41	http://localhost:8055
153	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:02:04.895+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	42	http://localhost:8055
161	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:02:05.792+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	blog	http://localhost:8055
164	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:06.753+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	27	http://localhost:8055
166	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:06.77+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	29	http://localhost:8055
168	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:06.785+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	30	http://localhost:8055
169	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:06.794+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	31	http://localhost:8055
171	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:06.803+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	32	http://localhost:8055
172	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:06.811+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	33	http://localhost:8055
173	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:06.818+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	34	http://localhost:8055
174	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:06.837+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	35	http://localhost:8055
175	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:06.845+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	36	http://localhost:8055
176	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:38.379+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	44	http://localhost:8055
177	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:41.312+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	38	http://localhost:8055
178	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:41.313+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	27	http://localhost:8055
179	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:41.326+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	41	http://localhost:8055
180	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:41.33+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	29	http://localhost:8055
181	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:41.333+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	42	http://localhost:8055
182	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:41.335+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	30	http://localhost:8055
183	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:41.338+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	43	http://localhost:8055
184	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:41.342+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	31	http://localhost:8055
185	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:41.344+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	44	http://localhost:8055
186	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:41.348+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	32	http://localhost:8055
187	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:41.357+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	33	http://localhost:8055
188	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:41.364+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	34	http://localhost:8055
189	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:41.37+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	35	http://localhost:8055
190	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:05:41.376+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	36	http://localhost:8055
191	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:13.195+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	45	http://localhost:8055
192	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:15.899+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	45	http://localhost:8055
194	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:15.912+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	39	http://localhost:8055
193	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:15.904+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	27	http://localhost:8055
195	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:15.917+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	29	http://localhost:8055
196	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:15.927+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	30	http://localhost:8055
197	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:15.939+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	31	http://localhost:8055
198	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:15.951+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	32	http://localhost:8055
199	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:15.976+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	33	http://localhost:8055
200	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:15.981+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	34	http://localhost:8055
201	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:15.985+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	35	http://localhost:8055
202	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:15.99+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	36	http://localhost:8055
203	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:17.862+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	39	http://localhost:8055
204	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:17.873+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	45	http://localhost:8055
205	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:29.519+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	46	http://localhost:8055
206	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:32.528+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	39	http://localhost:8055
207	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:32.528+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	27	http://localhost:8055
208	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:32.539+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	45	http://localhost:8055
209	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:32.542+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	29	http://localhost:8055
210	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:32.545+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	46	http://localhost:8055
211	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:32.548+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	30	http://localhost:8055
212	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:32.556+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	31	http://localhost:8055
213	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:32.561+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	32	http://localhost:8055
214	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:32.567+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	33	http://localhost:8055
215	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:32.572+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	34	http://localhost:8055
216	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:32.58+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	35	http://localhost:8055
217	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:08:32.586+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	36	http://localhost:8055
218	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:09:29.946+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	47	http://localhost:8055
219	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:09:49.292+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	39	http://localhost:8055
220	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:09:49.296+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	27	http://localhost:8055
221	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:09:49.308+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	45	http://localhost:8055
222	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:09:49.313+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	29	http://localhost:8055
223	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:09:49.318+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	46	http://localhost:8055
224	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:09:49.323+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	30	http://localhost:8055
225	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:09:49.327+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	47	http://localhost:8055
226	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:09:49.332+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	31	http://localhost:8055
227	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:09:49.34+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	32	http://localhost:8055
228	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:09:49.352+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	33	http://localhost:8055
229	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:09:49.36+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	34	http://localhost:8055
230	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:09:49.37+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	35	http://localhost:8055
231	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:09:49.378+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	36	http://localhost:8055
232	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:10:36.983+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	blog	http://localhost:8055
233	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:15:31.35+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	5de817fb-2049-46bc-ba9b-ebe47a4169ea	http://localhost:8055
234	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:16:01.294+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	657e0b5b-070a-466c-83bc-e42ad99e7d67	http://localhost:8055
235	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:17:30.659+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	1	http://localhost:8055
236	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:17:30.67+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	2	http://localhost:8055
237	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:17:30.673+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	3	http://localhost:8055
238	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:17:30.677+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	4	http://localhost:8055
239	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:17:30.679+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	5	http://localhost:8055
240	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:17:30.685+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	6	http://localhost:8055
241	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:17:30.688+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	7	http://localhost:8055
242	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:17:30.69+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	8	http://localhost:8055
243	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:17:30.691+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	9	http://localhost:8055
244	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:17:30.693+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	10	http://localhost:8055
245	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:17:30.697+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	5965e256-a0da-4394-bdb1-9a7b0c737595	http://localhost:8055
246	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:17:30.699+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	657e0b5b-070a-466c-83bc-e42ad99e7d67	http://localhost:8055
247	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:18:11.239+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	7f2bdb09-8641-45bc-92c0-d6e1d8915798	http://localhost:8055
248	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:18:11.274+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	11	http://localhost:8055
249	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:18:11.276+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	12	http://localhost:8055
250	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:18:11.278+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	13	http://localhost:8055
251	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:18:11.28+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	14	http://localhost:8055
252	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:18:11.284+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	15	http://localhost:8055
253	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:18:11.286+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	16	http://localhost:8055
254	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:18:11.288+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	17	http://localhost:8055
255	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:18:11.29+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	18	http://localhost:8055
256	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:18:11.291+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	19	http://localhost:8055
257	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:18:11.294+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	20	http://localhost:8055
258	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:18:11.296+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	21	http://localhost:8055
259	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:18:11.297+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	22	http://localhost:8055
260	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:18:11.3+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	23	http://localhost:8055
261	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:18:11.301+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	24	http://localhost:8055
262	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:18:11.302+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	25	http://localhost:8055
263	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:18:11.304+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	26	http://localhost:8055
264	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:18:11.306+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	27	http://localhost:8055
265	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:18:11.307+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	28	http://localhost:8055
266	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:18:11.309+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	29	http://localhost:8055
267	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:18:11.31+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	30	http://localhost:8055
268	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:22.973+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	31	http://localhost:8055
269	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:22.98+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	32	http://localhost:8055
270	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:22.981+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	33	http://localhost:8055
271	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:22.983+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	34	http://localhost:8055
272	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:22.985+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	35	http://localhost:8055
273	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:22.986+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	36	http://localhost:8055
274	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:23.004+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	37	http://localhost:8055
275	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:23.008+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	38	http://localhost:8055
276	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:23.01+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	39	http://localhost:8055
277	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:23.014+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	40	http://localhost:8055
278	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:23.016+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	41	http://localhost:8055
279	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:23.017+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	42	http://localhost:8055
280	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:23.018+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	43	http://localhost:8055
281	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:23.019+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	44	http://localhost:8055
282	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:23.02+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	45	http://localhost:8055
283	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:23.021+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	46	http://localhost:8055
284	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:23.023+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	47	http://localhost:8055
285	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:23.024+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	48	http://localhost:8055
286	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:23.025+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	49	http://localhost:8055
287	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:23.027+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	50	http://localhost:8055
288	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:23.028+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	51	http://localhost:8055
289	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:23.029+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	52	http://localhost:8055
290	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:23.03+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	53	http://localhost:8055
291	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:23.031+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	54	http://localhost:8055
292	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:23.032+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	55	http://localhost:8055
293	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:23.033+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	56	http://localhost:8055
294	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:23.1+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	7563849d-3a3e-40db-a52f-e251dcf225db	http://localhost:8055
295	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:23.101+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	bd0d36dc-6225-4c5f-8297-9b2971ed86b2	http://localhost:8055
296	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:21:23.104+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	7f2bdb09-8641-45bc-92c0-d6e1d8915798	http://localhost:8055
297	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:25:19.557+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_flows	555952b0-06ff-4cb7-8cad-eafa09d1c2fd	http://localhost:8055
298	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:27:08.989+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_operations	2c9b7652-f46a-4c42-b415-930973903f95	http://localhost:8055
299	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:27:08.996+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_operations	eb5cd256-8322-4cf3-9707-d0605210d5d0	http://localhost:8055
300	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:27:09.005+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_operations	cbc4f4e1-a9f0-4e83-aaac-7e71b6a53de5	http://localhost:8055
301	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:27:09.02+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_flows	555952b0-06ff-4cb7-8cad-eafa09d1c2fd	http://localhost:8055
302	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:28:12.564+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_flows	c6848590-837a-4cf7-aa38-bcb8e119cfc2	http://localhost:8055
303	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:28:19.13+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_flows	c6848590-837a-4cf7-aa38-bcb8e119cfc2	http://localhost:8055
304	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:29:24.129+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_operations	427e3a18-3695-4e2d-96a0-70d969b7e3d6	http://localhost:8055
305	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:29:24.134+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_operations	cdb98368-fe5c-46c8-934b-f404f5cd7f08	http://localhost:8055
306	create	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:29:24.143+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_operations	a17459d1-070e-4fb6-b968-74bbecec4886	http://localhost:8055
307	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:29:24.154+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_flows	c6848590-837a-4cf7-aa38-bcb8e119cfc2	http://localhost:8055
308	update	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 11:29:45.482+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_flows	555952b0-06ff-4cb7-8cad-eafa09d1c2fd	http://localhost:8055
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url, versioning) FROM stdin;
general_info	settings_suggest	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
seo_settings	saved_search	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
blog	article	\N	\N	f	f	\N	status	f	archived	draft	sort	all	\N	\N	\N	\N	open	https://appname.com/blog/{{slug}}	f
\.


--
-- Data for Name: directus_comments; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_comments (id, collection, item, comment, date_created, date_updated, user_created, user_updated) FROM stdin;
\.


--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
\.


--
-- Data for Name: directus_extensions; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_extensions (enabled, id, folder, source, bundle) FROM stdin;
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message, searchable) FROM stdin;
1	general_info	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
2	general_info	brand_name	\N	input	\N	\N	\N	f	f	2	half	\N	\N	\N	t	\N	\N	\N	t
3	general_info	brand_legal_name	\N	input	\N	\N	\N	f	f	3	half	\N	\N	\N	t	\N	\N	\N	t
4	general_info	brand_tagline	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	t	\N	\N	\N	t
5	general_info	address	\N	input-multiline	\N	\N	\N	f	f	5	full	\N	\N	\N	t	\N	\N	\N	t
6	general_info	phone	\N	input	\N	\N	\N	f	f	6	full	\N	\N	\N	t	\N	\N	\N	t
7	seo_settings	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
8	general_info	google_map_link	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	t	\N	\N	\N	t
9	general_info	instagram_link	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	t	\N	\N	\N	t
12	seo_settings	opengraph_image	file	file-image	{"crop":false}	\N	\N	f	f	4	full	\N	\N	\N	t	\N	\N	\N	t
10	seo_settings	domain_url	\N	input	\N	\N	\N	f	f	2	half	\N	\N	\N	t	\N	\N	\N	t
11	seo_settings	theme_color	\N	select-color	\N	\N	\N	f	f	3	half	\N	\N	\N	t	\N	\N	\N	t
15	seo_settings	company_description	\N	input-multiline	\N	\N	\N	f	f	7	full	\N	\N	\N	t	\N	\N	\N	t
13	seo_settings	company_name	\N	input	\N	\N	\N	f	f	5	half	\N	\N	\N	t	\N	\N	\N	t
14	seo_settings	category	\N	input	\N	\N	\N	f	f	6	half	\N	\N	\N	t	\N	\N	\N	t
16	seo_settings	emails	cast-json	list	{"fields":[{"field":"email","name":"email","type":"string","meta":{"field":"email","width":"full","type":"string","required":true,"interface":"input","options":{"trim":true}}}]}	\N	\N	f	f	8	half	\N	\N	\N	t	\N	\N	\N	t
17	seo_settings	phone_numbers	cast-json	list	{"fields":[{"field":"phone","name":"phone","type":"string","meta":{"field":"phone","width":"full","type":"string","required":true,"interface":"input","options":{"trim":true}}}]}	\N	\N	f	f	9	half	\N	\N	\N	t	\N	\N	\N	t
18	seo_settings	keywords	cast-json	list	{"fields":[{"field":"keyword","name":"keyword","type":"string","meta":{"field":"keyword","width":"full","type":"string","required":true,"interface":"input","options":{"trim":true}}}]}	\N	\N	f	f	10	full	\N	\N	\N	t	\N	\N	\N	t
19	seo_settings	country_name	\N	input	\N	\N	\N	f	f	11	half	\N	\N	\N	t	\N	\N	\N	t
20	seo_settings	region	\N	input	\N	\N	\N	f	f	12	half	\N	\N	\N	t	\N	\N	\N	t
21	seo_settings	locality	\N	input	\N	\N	\N	f	f	13	half	\N	\N	\N	t	\N	\N	\N	t
22	seo_settings	postal_code	\N	input	\N	\N	\N	f	f	14	half	\N	\N	\N	t	\N	\N	\N	t
23	seo_settings	street_address	\N	input-multiline	\N	\N	\N	f	f	15	full	\N	\N	\N	t	\N	\N	\N	t
24	seo_settings	latitude	\N	input	\N	\N	\N	f	f	16	half	\N	\N	\N	t	\N	\N	\N	t
25	seo_settings	longitude	\N	input	\N	\N	\N	f	f	17	half	\N	\N	\N	t	\N	\N	\N	t
26	seo_settings	founding_year	\N	input	\N	\N	\N	f	f	18	full	\N	\N	\N	t	\N	\N	\N	t
34	blog	settings	alias,no-data,group	group-raw	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N	t
35	blog	content	alias,no-data,group	group-raw	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N	t
44	blog	excerpt	\N	input-multiline	\N	\N	\N	f	f	5	full	\N	\N	\N	t	content	\N	\N	t
37	blog	divider-5wlnc8	alias,no-data	presentation-divider	{"title":"Blog Settings Section","inlineTitle":true}	\N	\N	f	f	1	full	\N	\N	\N	f	settings	\N	\N	t
28	blog	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	2	half	\N	\N	\N	f	settings	\N	\N	t
40	blog	slug	\N	input	\N	\N	\N	f	f	3	half	\N	\N	\N	f	settings	\N	\N	t
39	blog	divider-dwuknd	alias,no-data	presentation-divider	{"title":"SEO Settings Section","inlineTitle":true}	\N	\N	f	f	1	full	\N	\N	\N	f	seo_settings	\N	\N	t
27	blog	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
47	blog	keywords	cast-json	list	{"fields":[{"field":"keyword","name":"keyword","type":"string","meta":{"field":"keyword","width":"full","type":"string","required":true,"interface":"input","options":{"trim":true}}}]}	\N	\N	f	f	4	full	\N	\N	\N	t	seo_settings	\N	\N	t
31	blog	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N	t
45	blog	seo_title	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	t	seo_settings	\N	\N	t
29	blog	sort	\N	input	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N	t
38	blog	divider-jsk4rr	alias,no-data	presentation-divider	{"title":"Blog Content Section","inlineTitle":true}	\N	\N	f	f	1	full	\N	\N	\N	f	content	\N	\N	t
46	blog	seo_description	\N	input-multiline	\N	\N	\N	f	f	3	full	\N	\N	\N	t	seo_settings	\N	\N	t
41	blog	headline_image	file	file-image	{"crop":false}	\N	\N	f	f	2	full	\N	\N	\N	t	content	\N	\N	t
32	blog	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N	t
42	blog	title	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	t	content	\N	\N	t
33	blog	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N	t
43	blog	blog_content	\N	input-rich-text-html	{"toolbar":["undo","redo","bold","italic","underline","strikethrough","h1","h2","h3","alignleft","aligncenter","alignright","alignjustify","alignnone","numlist","bullist","removeformat","blockquote","customLink","unlink","customImage","table","hr","fullscreen","code"]}	\N	\N	f	f	4	full	\N	\N	\N	t	content	\N	\N	t
36	blog	seo_settings	alias,no-data,group	group-raw	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N	t
30	blog	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar}} {{first_name}} {{last_name}}"}	user	\N	t	t	3	half	\N	\N	\N	f	\N	\N	\N	t
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, created_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata, focal_point_x, focal_point_y, tus_id, tus_data, uploaded_on) FROM stdin;
\.


--
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
c6848590-837a-4cf7-aa38-bcb8e119cfc2	Revalidate Blog	bolt	\N	Revalidate every Fetch that has "blog" tag	inactive	event	all	{"type":"action","scope":["items.create","items.update","items.delete","items.promote","items.sort"],"collections":["blog"]}	a17459d1-070e-4fb6-b968-74bbecec4886	2026-01-01 11:28:12.562+00	51c0588a-b702-47e8-8501-f6654693b318
555952b0-06ff-4cb7-8cad-eafa09d1c2fd	Revalidate All Page	bolt	\N	Revalidate every page	inactive	event	all	{"type":"action","scope":["items.create","items.update","items.delete","items.promote","items.sort"],"collections":["seo_settings","general_info"]}	cbc4f4e1-a9f0-4e83-aaac-7e71b6a53de5	2026-01-01 11:25:19.554+00	51c0588a-b702-47e8-8501-f6654693b318
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_folders (id, name, parent) FROM stdin;
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2025-12-29 18:21:06.842006+00
20201029A	Remove System Relations	2025-12-29 18:21:06.846374+00
20201029B	Remove System Collections	2025-12-29 18:21:06.849929+00
20201029C	Remove System Fields	2025-12-29 18:21:06.857085+00
20201105A	Add Cascade System Relations	2025-12-29 18:21:06.916838+00
20201105B	Change Webhook URL Type	2025-12-29 18:21:06.926034+00
20210225A	Add Relations Sort Field	2025-12-29 18:21:06.935808+00
20210304A	Remove Locked Fields	2025-12-29 18:21:06.939657+00
20210312A	Webhooks Collections Text	2025-12-29 18:21:06.948325+00
20210331A	Add Refresh Interval	2025-12-29 18:21:06.952071+00
20210415A	Make Filesize Nullable	2025-12-29 18:21:06.96043+00
20210416A	Add Collections Accountability	2025-12-29 18:21:06.963994+00
20210422A	Remove Files Interface	2025-12-29 18:21:06.966302+00
20210506A	Rename Interfaces	2025-12-29 18:21:06.972951+00
20210510A	Restructure Relations	2025-12-29 18:21:06.993704+00
20210518A	Add Foreign Key Constraints	2025-12-29 18:21:06.99841+00
20210519A	Add System Fk Triggers	2025-12-29 18:21:07.030677+00
20210521A	Add Collections Icon Color	2025-12-29 18:21:07.035453+00
20210525A	Add Insights	2025-12-29 18:21:07.051294+00
20210608A	Add Deep Clone Config	2025-12-29 18:21:07.056399+00
20210626A	Change Filesize Bigint	2025-12-29 18:21:07.068675+00
20210716A	Add Conditions to Fields	2025-12-29 18:21:07.074264+00
20210721A	Add Default Folder	2025-12-29 18:21:07.082251+00
20210802A	Replace Groups	2025-12-29 18:21:07.085544+00
20210803A	Add Required to Fields	2025-12-29 18:21:07.090526+00
20210805A	Update Groups	2025-12-29 18:21:07.094299+00
20210805B	Change Image Metadata Structure	2025-12-29 18:21:07.097703+00
20210811A	Add Geometry Config	2025-12-29 18:21:07.103324+00
20210831A	Remove Limit Column	2025-12-29 18:21:07.108213+00
20210903A	Add Auth Provider	2025-12-29 18:21:07.131449+00
20210907A	Webhooks Collections Not Null	2025-12-29 18:21:07.143591+00
20210910A	Move Module Setup	2025-12-29 18:21:07.149843+00
20210920A	Webhooks URL Not Null	2025-12-29 18:21:07.158639+00
20210924A	Add Collection Organization	2025-12-29 18:21:07.166112+00
20210927A	Replace Fields Group	2025-12-29 18:21:07.175138+00
20210927B	Replace M2M Interface	2025-12-29 18:21:07.177368+00
20210929A	Rename Login Action	2025-12-29 18:21:07.179864+00
20211007A	Update Presets	2025-12-29 18:21:07.185644+00
20211009A	Add Auth Data	2025-12-29 18:21:07.188723+00
20211016A	Add Webhook Headers	2025-12-29 18:21:07.192653+00
20211103A	Set Unique to User Token	2025-12-29 18:21:07.196594+00
20211103B	Update Special Geometry	2025-12-29 18:21:07.199127+00
20211104A	Remove Collections Listing	2025-12-29 18:21:07.20312+00
20211118A	Add Notifications	2025-12-29 18:21:07.216214+00
20211211A	Add Shares	2025-12-29 18:21:07.233058+00
20211230A	Add Project Descriptor	2025-12-29 18:21:07.236196+00
20220303A	Remove Default Project Color	2025-12-29 18:21:07.244414+00
20220308A	Add Bookmark Icon and Color	2025-12-29 18:21:07.251898+00
20220314A	Add Translation Strings	2025-12-29 18:21:07.255461+00
20220322A	Rename Field Typecast Flags	2025-12-29 18:21:07.258895+00
20220323A	Add Field Validation	2025-12-29 18:21:07.262454+00
20220325A	Fix Typecast Flags	2025-12-29 18:21:07.265894+00
20220325B	Add Default Language	2025-12-29 18:21:07.275384+00
20220402A	Remove Default Value Panel Icon	2025-12-29 18:21:07.28316+00
20220429A	Add Flows	2025-12-29 18:21:07.306246+00
20220429B	Add Color to Insights Icon	2025-12-29 18:21:07.3103+00
20220429C	Drop Non Null From IP of Activity	2025-12-29 18:21:07.313987+00
20220429D	Drop Non Null From Sender of Notifications	2025-12-29 18:21:07.31741+00
20220614A	Rename Hook Trigger to Event	2025-12-29 18:21:07.319547+00
20220801A	Update Notifications Timestamp Column	2025-12-29 18:21:07.328273+00
20220802A	Add Custom Aspect Ratios	2025-12-29 18:21:07.331621+00
20220826A	Add Origin to Accountability	2025-12-29 18:21:07.340098+00
20230401A	Update Material Icons	2025-12-29 18:21:07.349668+00
20230525A	Add Preview Settings	2025-12-29 18:21:07.353198+00
20230526A	Migrate Translation Strings	2025-12-29 18:21:07.360742+00
20230721A	Require Shares Fields	2025-12-29 18:21:07.367634+00
20230823A	Add Content Versioning	2025-12-29 18:21:07.383427+00
20230927A	Themes	2025-12-29 18:21:07.399185+00
20231009A	Update CSV Fields to Text	2025-12-29 18:21:07.401868+00
20231009B	Update Panel Options	2025-12-29 18:21:07.403613+00
20231010A	Add Extensions	2025-12-29 18:21:07.40641+00
20231215A	Add Focalpoints	2025-12-29 18:21:07.408591+00
20240122A	Add Report URL Fields	2025-12-29 18:21:07.42462+00
20240204A	Marketplace	2025-12-29 18:21:07.44821+00
20240305A	Change Useragent Type	2025-12-29 18:21:07.457649+00
20240311A	Deprecate Webhooks	2025-12-29 18:21:07.464152+00
20240422A	Public Registration	2025-12-29 18:21:07.468894+00
20240515A	Add Session Window	2025-12-29 18:21:07.471759+00
20240701A	Add Tus Data	2025-12-29 18:21:07.476301+00
20240716A	Update Files Date Fields	2025-12-29 18:21:07.482262+00
20240806A	Permissions Policies	2025-12-29 18:21:07.519406+00
20240817A	Update Icon Fields Length	2025-12-29 18:21:07.560103+00
20240909A	Separate Comments	2025-12-29 18:21:07.568605+00
20240909B	Consolidate Content Versioning	2025-12-29 18:21:07.572369+00
20240924A	Migrate Legacy Comments	2025-12-29 18:21:07.576815+00
20240924B	Populate Versioning Deltas	2025-12-29 18:21:07.58009+00
20250224A	Visual Editor	2025-12-29 18:21:07.583976+00
20250609A	License Banner	2025-12-29 18:21:07.58841+00
20250613A	Add Project ID	2025-12-29 18:21:07.599548+00
20250718A	Add Direction	2025-12-29 18:21:07.603912+00
20250813A	Add MCP	2025-12-29 18:21:07.608244+00
20251012A	Add Field Searchable	2025-12-29 18:21:07.612655+00
20251014A	Add Project Owner	2025-12-29 18:21:07.640111+00
20251028A	Add Retention Indexes	2025-12-29 18:21:07.675857+00
20251103A	Add AI Settings	2025-12-29 18:21:07.681008+00
\.


--
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
\.


--
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
2c9b7652-f46a-4c42-b415-930973903f95	Success Revalidating All Page	success_revalidating_all_page	log	37	1	{"message":"Success Revalidating All Page"}	\N	\N	555952b0-06ff-4cb7-8cad-eafa09d1c2fd	2026-01-01 11:27:08.986+00	51c0588a-b702-47e8-8501-f6654693b318
eb5cd256-8322-4cf3-9707-d0605210d5d0	Error Revalidating All Page	error_revalidating_all_page	log	37	17	{"message":"Error Revalidating All Page"}	\N	\N	555952b0-06ff-4cb7-8cad-eafa09d1c2fd	2026-01-01 11:27:08.992+00	51c0588a-b702-47e8-8501-f6654693b318
cbc4f4e1-a9f0-4e83-aaac-7e71b6a53de5	Webhook / Request URL	webhook_request_url	request	19	1	{"method":"GET","url":"https://appname.com/api/revalidate?path=all","headers":[{"header":"Authorization","value":"nextjs_revalidation_token"}]}	2c9b7652-f46a-4c42-b415-930973903f95	eb5cd256-8322-4cf3-9707-d0605210d5d0	555952b0-06ff-4cb7-8cad-eafa09d1c2fd	2026-01-01 11:27:09.004+00	51c0588a-b702-47e8-8501-f6654693b318
427e3a18-3695-4e2d-96a0-70d969b7e3d6	Success Revalidating Blog Tag	success_revalidating_blog_tag	log	37	1	{"message":"Success Revalidating Blog Tag"}	\N	\N	c6848590-837a-4cf7-aa38-bcb8e119cfc2	2026-01-01 11:29:24.126+00	51c0588a-b702-47e8-8501-f6654693b318
cdb98368-fe5c-46c8-934b-f404f5cd7f08	Error Revalidating Blog Tag	error_revalidating_blog_tag	log	37	17	{"message":"Error Revalidating Blog Tag"}	\N	\N	c6848590-837a-4cf7-aa38-bcb8e119cfc2	2026-01-01 11:29:24.132+00	51c0588a-b702-47e8-8501-f6654693b318
a17459d1-070e-4fb6-b968-74bbecec4886	Webhook / Request URL	webhook_request_url	request	19	1	{"method":"GET","url":"https://appname.com/api/revalidate?path=blog","headers":[{"header":"Authorization","value":"nextjs_revalidation_token"}]}	427e3a18-3695-4e2d-96a0-70d969b7e3d6	cdb98368-fe5c-46c8-934b-f404f5cd7f08	c6848590-837a-4cf7-aa38-bcb8e119cfc2	2026-01-01 11:29:24.142+00	51c0588a-b702-47e8-8501-f6654693b318
\.


--
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_permissions (id, collection, action, permissions, validation, presets, fields, policy) FROM stdin;
1	blog	read	\N	\N	\N	*	657e0b5b-070a-466c-83bc-e42ad99e7d67
2	general_info	read	\N	\N	\N	*	657e0b5b-070a-466c-83bc-e42ad99e7d67
3	seo_settings	read	\N	\N	\N	*	657e0b5b-070a-466c-83bc-e42ad99e7d67
4	directus_collections	read	\N	\N	\N	*	657e0b5b-070a-466c-83bc-e42ad99e7d67
5	directus_comments	read	\N	\N	\N	*	657e0b5b-070a-466c-83bc-e42ad99e7d67
6	directus_fields	read	\N	\N	\N	*	657e0b5b-070a-466c-83bc-e42ad99e7d67
7	directus_files	read	\N	\N	\N	*	657e0b5b-070a-466c-83bc-e42ad99e7d67
8	directus_relations	read	\N	\N	\N	*	657e0b5b-070a-466c-83bc-e42ad99e7d67
9	directus_settings	read	\N	\N	\N	*	657e0b5b-070a-466c-83bc-e42ad99e7d67
10	directus_translations	read	\N	\N	\N	*	657e0b5b-070a-466c-83bc-e42ad99e7d67
11	directus_collections	read	{}	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
12	directus_fields	read	{}	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
13	directus_relations	read	{}	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
14	directus_translations	read	{}	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
15	directus_activity	read	{"user":{"_eq":"$CURRENT_USER"}}	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
16	directus_comments	read	{"user_created":{"_eq":"$CURRENT_USER"}}	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
17	directus_comments	create	{}	{"comment":{"_nnull":true}}	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
18	directus_comments	update	{"user_created":{"_eq":"$CURRENT_USER"}}	\N	\N	comment	7f2bdb09-8641-45bc-92c0-d6e1d8915798
19	directus_comments	delete	{"user_created":{"_eq":"$CURRENT_USER"}}	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
20	directus_presets	read	{"_or":[{"user":{"_eq":"$CURRENT_USER"}},{"_and":[{"user":{"_null":true}},{"role":{"_eq":"$CURRENT_ROLE"}}]},{"_and":[{"user":{"_null":true}},{"role":{"_null":true}}]}]}	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
21	directus_presets	create	{}	{"user":{"_eq":"$CURRENT_USER"}}	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
22	directus_presets	update	{"user":{"_eq":"$CURRENT_USER"}}	{"user":{"_eq":"$CURRENT_USER"}}	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
23	directus_presets	delete	{"user":{"_eq":"$CURRENT_USER"}}	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
24	directus_roles	read	{"id":{"_in":"$CURRENT_ROLES"}}	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
25	directus_settings	read	{}	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
26	directus_translations	read	{}	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
27	directus_notifications	read	{"recipient":{"_eq":"$CURRENT_USER"}}	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
28	directus_notifications	update	{"recipient":{"_eq":"$CURRENT_USER"}}	\N	\N	status	7f2bdb09-8641-45bc-92c0-d6e1d8915798
29	directus_shares	read	{"user_created":{"_eq":"$CURRENT_USER"}}	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
30	directus_users	read	{"id":{"_eq":"$CURRENT_USER"}}	\N	\N	id,first_name,last_name,last_page,email,password,location,title,description,tags,provider,preferences_divider,avatar,language,appearance,theme_light,theme_dark,tfa_secret,status,role	7f2bdb09-8641-45bc-92c0-d6e1d8915798
31	blog	create	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
32	blog	read	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
33	blog	update	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
34	blog	delete	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
35	blog	share	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
36	general_info	create	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
37	general_info	read	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
38	general_info	update	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
39	general_info	delete	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
40	general_info	share	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
41	seo_settings	create	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
42	seo_settings	read	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
43	seo_settings	update	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
44	seo_settings	delete	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
45	seo_settings	share	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
46	directus_files	create	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
47	directus_files	read	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
48	directus_files	update	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
49	directus_files	delete	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
50	directus_files	share	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
51	directus_flows	read	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
52	directus_folders	create	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
53	directus_folders	read	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
54	directus_folders	update	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
55	directus_folders	delete	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
56	directus_folders	share	\N	\N	\N	*	7f2bdb09-8641-45bc-92c0-d6e1d8915798
\.


--
-- Data for Name: directus_policies; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_policies (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
abf8a154-5b1c-4a46-ac9c-7300570f4f17	$t:public_label	public	$t:public_description	\N	f	f	f
870d02b4-af1d-40c3-b53b-3aaed0941488	Administrator	verified	$t:admin_description	\N	f	t	t
657e0b5b-070a-466c-83bc-e42ad99e7d67	Website Read Access	badge	\N	\N	f	f	f
7f2bdb09-8641-45bc-92c0-d6e1d8915798	Editor	edit	Content Editor	\N	f	f	t
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
2	blog	user_created	directus_users	\N	\N	\N	\N	\N	nullify
3	blog	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
4	blog	headline_image	directus_files	\N	\N	\N	\N	\N	nullify
1	seo_settings	opengraph_image	directus_files	\N	\N	\N	\N	\N	nullify
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent, version) FROM stdin;
1	2	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#6644FF","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_role":null,"public_registration_email_filter":null,"visual_editor_urls":null,"project_id":"019b6b57-b08d-76ab-8923-8eeb1abae958","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null,"project_owner":"elianrichards@gmail.com","project_usage":"commercial","org_name":"APR","product_updates":false,"project_status":null,"ai_openai_api_key":null,"ai_anthropic_api_key":null,"ai_system_prompt":null}	{"project_owner":"elianrichards@gmail.com","project_usage":"commercial","org_name":"APR","product_updates":false,"project_status":null}	\N	\N
2	3	directus_settings	1	{"id":1,"project_name":"APR Dashboard","project_url":"https://apr.com","project_color":"#6644FF","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"visual","enabled":false},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}],"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_role":null,"public_registration_email_filter":null,"visual_editor_urls":null,"project_id":"019b6b57-b08d-76ab-8923-8eeb1abae958","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null,"project_owner":"elianrichards@gmail.com","project_usage":"commercial","org_name":"APR","product_updates":false,"project_status":null,"ai_openai_api_key":null,"ai_anthropic_api_key":null,"ai_system_prompt":null}	{"project_name":"APR Dashboard","project_url":"https://apr.com","module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"visual","enabled":false},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}]}	\N	\N
3	4	directus_files	7fefdfb3-9418-4d56-bb46-c0b1af26de71	{"title":"Logo White","filename_download":"LOGO WHITE.png","type":"image/png","storage":"s3"}	{"title":"Logo White","filename_download":"LOGO WHITE.png","type":"image/png","storage":"s3"}	\N	\N
4	6	directus_files	ac32b55d-b927-455f-a9bd-313e9fa04193	{"title":"Logo White","filename_download":"LOGO WHITE.png","type":"image/png","storage":"s3"}	{"title":"Logo White","filename_download":"LOGO WHITE.png","type":"image/png","storage":"s3"}	\N	\N
5	8	directus_files	07585f01-2463-4a07-bc98-f50e24f83604	{"title":"Logo White","filename_download":"LOGO WHITE.png","type":"image/png","storage":"s3"}	{"title":"Logo White","filename_download":"LOGO WHITE.png","type":"image/png","storage":"s3"}	\N	\N
6	10	directus_files	f7974e88-8835-42ee-a263-09d25d5fc689	{"title":"Logo White","filename_download":"LOGO WHITE.png","type":"image/png","storage":"s3"}	{"title":"Logo White","filename_download":"LOGO WHITE.png","type":"image/png","storage":"s3"}	\N	\N
7	11	directus_files	b23526f3-2723-4b36-825d-fe406f19af41	{"title":"Favicon 32x32","filename_download":"favicon-32x32.png","type":"image/png","storage":"s3"}	{"title":"Favicon 32x32","filename_download":"favicon-32x32.png","type":"image/png","storage":"s3"}	\N	\N
8	12	directus_settings	1	{"id":1,"project_name":"APR Dashboard","project_url":"https://apr.com","project_color":"#6644FF","project_logo":"f7974e88-8835-42ee-a263-09d25d5fc689","public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"visual","enabled":false},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}],"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":"b23526f3-2723-4b36-825d-fe406f19af41","default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_role":null,"public_registration_email_filter":null,"visual_editor_urls":null,"project_id":"019b6b57-b08d-76ab-8923-8eeb1abae958","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null,"project_owner":"elianrichards@gmail.com","project_usage":"commercial","org_name":"APR","product_updates":false,"project_status":null,"ai_openai_api_key":null,"ai_anthropic_api_key":null,"ai_system_prompt":null}	{"project_logo":"f7974e88-8835-42ee-a263-09d25d5fc689","public_favicon":"b23526f3-2723-4b36-825d-fe406f19af41"}	\N	\N
14	18	directus_fields	2	{"id":2,"collection":"general_info","field":"brand_name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"general_info","field":"brand_name","width":"half"}	\N	\N
17	21	directus_fields	5	{"sort":5,"interface":"input-multiline","special":null,"required":true,"collection":"general_info","field":"address"}	{"sort":5,"interface":"input-multiline","special":null,"required":true,"collection":"general_info","field":"address"}	\N	\N
37	44	directus_fields	16	{"sort":8,"interface":"list","special":["cast-json"],"required":true,"options":{"fields":[{"field":"email","name":"email","type":"string","meta":{"field":"email","width":"full","type":"string","required":true,"interface":"input","options":{"trim":true}}}]},"collection":"seo_settings","field":"emails"}	{"sort":8,"interface":"list","special":["cast-json"],"required":true,"options":{"fields":[{"field":"email","name":"email","type":"string","meta":{"field":"email","width":"full","type":"string","required":true,"interface":"input","options":{"trim":true}}}]},"collection":"seo_settings","field":"emails"}	\N	\N
9	13	directus_settings	1	{"id":1,"project_name":"APR Dashboard","project_url":"https://apr.com","project_color":"#BA2D0B","project_logo":"f7974e88-8835-42ee-a263-09d25d5fc689","public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"visual","enabled":false},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}],"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":"b23526f3-2723-4b36-825d-fe406f19af41","default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_role":null,"public_registration_email_filter":null,"visual_editor_urls":null,"project_id":"019b6b57-b08d-76ab-8923-8eeb1abae958","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null,"project_owner":"elianrichards@gmail.com","project_usage":"commercial","org_name":"APR","product_updates":false,"project_status":null,"ai_openai_api_key":null,"ai_anthropic_api_key":null,"ai_system_prompt":null}	{"project_color":"#BA2D0B"}	\N	\N
10	14	directus_fields	1	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"general_info"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"general_info"}	\N	\N
11	15	directus_collections	general_info	{"singleton":true,"collection":"general_info"}	{"singleton":true,"collection":"general_info"}	\N	\N
12	16	directus_fields	2	{"sort":2,"interface":"input","special":null,"required":true,"collection":"general_info","field":"brand_name"}	{"sort":2,"interface":"input","special":null,"required":true,"collection":"general_info","field":"brand_name"}	\N	\N
13	17	directus_fields	3	{"sort":3,"collection":"general_info","field":"brand_legal_name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"sort":3,"collection":"general_info","field":"brand_legal_name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	\N	\N
15	19	directus_fields	3	{"id":3,"collection":"general_info","field":"brand_legal_name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"general_info","field":"brand_legal_name","width":"half"}	\N	\N
16	20	directus_fields	4	{"sort":4,"interface":"input","special":null,"required":true,"collection":"general_info","field":"brand_tagline"}	{"sort":4,"interface":"input","special":null,"required":true,"collection":"general_info","field":"brand_tagline"}	\N	\N
18	22	directus_fields	6	{"sort":6,"interface":"input","special":null,"required":true,"collection":"general_info","field":"phone"}	{"sort":6,"interface":"input","special":null,"required":true,"collection":"general_info","field":"phone"}	\N	\N
19	23	directus_collections	general_info	{"collection":"general_info","icon":"settings_suggest","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"icon":"settings_suggest"}	\N	\N
20	24	directus_fields	7	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"seo_settings"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"seo_settings"}	\N	\N
21	25	directus_collections	seo_settings	{"singleton":true,"collection":"seo_settings"}	{"singleton":true,"collection":"seo_settings"}	\N	\N
22	27	directus_settings	1	{"id":1,"project_name":"Brand Dashboard","project_url":"https://appname.com","project_color":"#BA2D0B","project_logo":"f7974e88-8835-42ee-a263-09d25d5fc689","public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"visual","enabled":false},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}],"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":"b23526f3-2723-4b36-825d-fe406f19af41","default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_role":null,"public_registration_email_filter":null,"visual_editor_urls":null,"project_id":"019b6b57-b08d-76ab-8923-8eeb1abae958","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null,"project_owner":"elianrichards@gmail.com","project_usage":"commercial","org_name":"APR","product_updates":false,"project_status":null,"ai_openai_api_key":null,"ai_anthropic_api_key":null,"ai_system_prompt":null}	{"project_name":"Brand Dashboard","project_url":"https://appname.com"}	\N	\N
38	45	directus_fields	16	{"id":16,"collection":"seo_settings","field":"emails","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"email","name":"email","type":"string","meta":{"field":"email","width":"full","type":"string","required":true,"interface":"input","options":{"trim":true}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"seo_settings","field":"emails","width":"half"}	\N	\N
70	77	directus_fields	29	{"id":29,"collection":"blog","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"sort","sort":3,"group":null}	\N	\N
23	28	directus_settings	1	{"id":1,"project_name":"Brand Dashboard","project_url":"https://appname.com","project_color":"#6644FF","project_logo":"f7974e88-8835-42ee-a263-09d25d5fc689","public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"visual","enabled":false},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}],"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":"b23526f3-2723-4b36-825d-fe406f19af41","default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_role":null,"public_registration_email_filter":null,"visual_editor_urls":null,"project_id":"019b6b57-b08d-76ab-8923-8eeb1abae958","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null,"project_owner":"elianrichards@gmail.com","project_usage":"commercial","org_name":"APR","product_updates":false,"project_status":null,"ai_openai_api_key":null,"ai_anthropic_api_key":null,"ai_system_prompt":null}	{"project_color":"#6644FF"}	\N	\N
24	29	directus_settings	1	{"id":1,"project_name":"Brand Dashboard","project_url":"https://appname.com","project_color":"#6644FF","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"visual","enabled":false},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}],"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_role":null,"public_registration_email_filter":null,"visual_editor_urls":null,"project_id":"019b6b57-b08d-76ab-8923-8eeb1abae958","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null,"project_owner":"elianrichards@gmail.com","project_usage":"commercial","org_name":"APR","product_updates":false,"project_status":null,"ai_openai_api_key":null,"ai_anthropic_api_key":null,"ai_system_prompt":null}	{"project_logo":null,"public_favicon":null}	\N	\N
25	32	directus_fields	8	{"sort":7,"interface":"input","special":null,"required":true,"collection":"general_info","field":"google_map_link"}	{"sort":7,"interface":"input","special":null,"required":true,"collection":"general_info","field":"google_map_link"}	\N	\N
26	33	directus_fields	9	{"sort":8,"interface":"input","special":null,"required":true,"collection":"general_info","field":"instagram_link"}	{"sort":8,"interface":"input","special":null,"required":true,"collection":"general_info","field":"instagram_link"}	\N	\N
27	34	directus_fields	10	{"sort":2,"interface":"input","special":null,"required":true,"collection":"seo_settings","field":"domain_url"}	{"sort":2,"interface":"input","special":null,"required":true,"collection":"seo_settings","field":"domain_url"}	\N	\N
28	35	directus_fields	11	{"sort":3,"interface":"select-color","special":null,"required":true,"collection":"seo_settings","field":"theme_color"}	{"sort":3,"interface":"select-color","special":null,"required":true,"collection":"seo_settings","field":"theme_color"}	\N	\N
29	36	directus_fields	12	{"sort":4,"interface":"file-image","special":["file"],"required":true,"options":{"crop":false},"collection":"seo_settings","field":"opengraph_image"}	{"sort":4,"interface":"file-image","special":["file"],"required":true,"options":{"crop":false},"collection":"seo_settings","field":"opengraph_image"}	\N	\N
30	37	directus_fields	10	{"id":10,"collection":"seo_settings","field":"domain_url","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"seo_settings","field":"domain_url","width":"half"}	\N	\N
31	38	directus_fields	11	{"id":11,"collection":"seo_settings","field":"theme_color","special":null,"interface":"select-color","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"seo_settings","field":"theme_color","width":"half"}	\N	\N
32	39	directus_fields	13	{"sort":5,"interface":"input","special":null,"required":true,"collection":"seo_settings","field":"company_name"}	{"sort":5,"interface":"input","special":null,"required":true,"collection":"seo_settings","field":"company_name"}	\N	\N
33	40	directus_fields	14	{"sort":6,"interface":"input","special":null,"required":true,"collection":"seo_settings","field":"category"}	{"sort":6,"interface":"input","special":null,"required":true,"collection":"seo_settings","field":"category"}	\N	\N
34	41	directus_fields	15	{"sort":7,"interface":"input-multiline","special":null,"required":true,"collection":"seo_settings","field":"company_description"}	{"sort":7,"interface":"input-multiline","special":null,"required":true,"collection":"seo_settings","field":"company_description"}	\N	\N
35	42	directus_fields	13	{"id":13,"collection":"seo_settings","field":"company_name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"seo_settings","field":"company_name","width":"half"}	\N	\N
36	43	directus_fields	14	{"id":14,"collection":"seo_settings","field":"category","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"seo_settings","field":"category","width":"half"}	\N	\N
262	270	directus_permissions	33	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"blog","action":"update"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"blog","action":"update"}	288	\N
39	46	directus_fields	17	{"sort":9,"interface":"list","special":["cast-json"],"required":true,"options":{"fields":[{"field":"phone","name":"phone","type":"string","meta":{"field":"phone","width":"full","type":"string","required":true,"interface":"input","options":{"trim":true}}}]},"collection":"seo_settings","field":"phone_numbers"}	{"sort":9,"interface":"list","special":["cast-json"],"required":true,"options":{"fields":[{"field":"phone","name":"phone","type":"string","meta":{"field":"phone","width":"full","type":"string","required":true,"interface":"input","options":{"trim":true}}}]},"collection":"seo_settings","field":"phone_numbers"}	\N	\N
40	47	directus_fields	17	{"id":17,"collection":"seo_settings","field":"phone_numbers","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"phone","name":"phone","type":"string","meta":{"field":"phone","width":"full","type":"string","required":true,"interface":"input","options":{"trim":true}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"seo_settings","field":"phone_numbers","width":"half"}	\N	\N
42	49	directus_fields	18	{"id":18,"collection":"seo_settings","field":"keywords","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"email","name":"email","type":"string","meta":{"field":"email","width":"full","type":"string","required":true,"interface":"input","options":{"trim":true}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"seo_settings","field":"keywords","width":"full"}	\N	\N
43	50	directus_fields	18	{"id":18,"collection":"seo_settings","field":"keywords","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"keyword","name":"keyword","type":"string","meta":{"field":"keyword","width":"full","type":"string","required":true,"interface":"input","options":{"trim":true}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"seo_settings","field":"keywords","options":{"fields":[{"field":"keyword","name":"keyword","type":"string","meta":{"field":"keyword","width":"full","type":"string","required":true,"interface":"input","options":{"trim":true}}}]}}	\N	\N
44	51	directus_fields	19	{"sort":11,"collection":"seo_settings","field":"country_name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"sort":11,"collection":"seo_settings","field":"country_name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	\N	\N
52	59	directus_fields	26	{"id":26,"collection":"seo_settings","field":"founding_year","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":18,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"seo_settings","field":"founding_year","width":"full"}	\N	\N
41	48	directus_fields	18	{"sort":10,"collection":"seo_settings","field":"keywords","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"email","name":"email","type":"string","meta":{"field":"email","width":"full","type":"string","required":true,"interface":"input","options":{"trim":true}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"sort":10,"collection":"seo_settings","field":"keywords","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"email","name":"email","type":"string","meta":{"field":"email","width":"full","type":"string","required":true,"interface":"input","options":{"trim":true}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	\N	\N
45	52	directus_fields	20	{"sort":12,"collection":"seo_settings","field":"region","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"sort":12,"collection":"seo_settings","field":"region","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	\N	\N
46	53	directus_fields	21	{"sort":13,"collection":"seo_settings","field":"locality","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"sort":13,"collection":"seo_settings","field":"locality","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	\N	\N
47	54	directus_fields	22	{"sort":14,"collection":"seo_settings","field":"postal_code","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"sort":14,"collection":"seo_settings","field":"postal_code","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	\N	\N
48	55	directus_fields	23	{"sort":15,"collection":"seo_settings","field":"street_address","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"sort":15,"collection":"seo_settings","field":"street_address","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	\N	\N
49	56	directus_fields	24	{"sort":16,"collection":"seo_settings","field":"latitude","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"sort":16,"collection":"seo_settings","field":"latitude","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	\N	\N
50	57	directus_fields	25	{"sort":17,"collection":"seo_settings","field":"longitude","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"sort":17,"collection":"seo_settings","field":"longitude","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	\N	\N
51	58	directus_fields	26	{"sort":18,"collection":"seo_settings","field":"founding_year","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"sort":18,"collection":"seo_settings","field":"founding_year","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	\N	\N
53	60	directus_collections	seo_settings	{"collection":"seo_settings","icon":"saved_search","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"icon":"saved_search"}	\N	\N
54	61	directus_fields	27	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"blog"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"blog"}	\N	\N
69	76	directus_fields	28	{"id":28,"collection":"blog","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"status","sort":2,"group":null}	\N	\N
55	62	directus_fields	28	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"blog"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"blog"}	\N	\N
56	63	directus_fields	29	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"blog"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"blog"}	\N	\N
57	64	directus_fields	30	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"blog"}	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"blog"}	\N	\N
58	65	directus_fields	31	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"blog"}	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"blog"}	\N	\N
59	66	directus_fields	32	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"blog"}	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"blog"}	\N	\N
60	67	directus_fields	33	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"blog"}	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"blog"}	\N	\N
61	68	directus_collections	blog	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"blog"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"blog"}	\N	\N
62	69	directus_fields	28	{"id":28,"collection":"blog","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"status","hidden":true}	\N	\N
63	70	directus_fields	34	{"sort":8,"interface":"group-raw","special":["alias","no-data","group"],"collection":"blog","field":"settings"}	{"sort":8,"interface":"group-raw","special":["alias","no-data","group"],"collection":"blog","field":"settings"}	\N	\N
64	71	directus_fields	35	{"sort":9,"interface":"group-raw","special":["alias","no-data","group"],"collection":"blog","field":"content"}	{"sort":9,"interface":"group-raw","special":["alias","no-data","group"],"collection":"blog","field":"content"}	\N	\N
65	72	directus_fields	36	{"sort":10,"interface":"group-raw","special":["alias","no-data","group"],"collection":"blog","field":"seo_settings"}	{"sort":10,"interface":"group-raw","special":["alias","no-data","group"],"collection":"blog","field":"seo_settings"}	\N	\N
66	73	directus_fields	37	{"sort":11,"interface":"presentation-divider","special":["alias","no-data"],"options":{"title":"Blog Settings Section","inlineTitle":true},"collection":"blog","field":"divider-5wlnc8"}	{"sort":11,"interface":"presentation-divider","special":["alias","no-data"],"options":{"title":"Blog Settings Section","inlineTitle":true},"collection":"blog","field":"divider-5wlnc8"}	\N	\N
67	74	directus_fields	37	{"id":37,"collection":"blog","field":"divider-5wlnc8","special":["alias","no-data"],"interface":"presentation-divider","options":{"title":"Blog Settings Section","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":"settings","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"divider-5wlnc8","sort":1,"group":"settings"}	\N	\N
68	75	directus_fields	27	{"id":27,"collection":"blog","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"id","sort":1,"group":null}	\N	\N
71	78	directus_fields	30	{"id":30,"collection":"blog","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_created","sort":4,"group":null}	\N	\N
72	79	directus_fields	31	{"id":31,"collection":"blog","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_created","sort":5,"group":null}	\N	\N
73	80	directus_fields	32	{"id":32,"collection":"blog","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_updated","sort":6,"group":null}	\N	\N
74	81	directus_fields	33	{"id":33,"collection":"blog","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_updated","sort":7,"group":null}	\N	\N
75	82	directus_fields	34	{"id":34,"collection":"blog","field":"settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"settings","sort":8,"group":null}	\N	\N
76	83	directus_fields	35	{"id":35,"collection":"blog","field":"content","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"content","sort":9,"group":null}	\N	\N
77	84	directus_fields	36	{"id":36,"collection":"blog","field":"seo_settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"seo_settings","sort":10,"group":null}	\N	\N
78	85	directus_fields	38	{"sort":11,"interface":"presentation-divider","special":["alias","no-data"],"options":{"title":"Blog Content Section","inlineTitle":true},"collection":"blog","field":"divider-jsk4rr"}	{"sort":11,"interface":"presentation-divider","special":["alias","no-data"],"options":{"title":"Blog Content Section","inlineTitle":true},"collection":"blog","field":"divider-jsk4rr"}	\N	\N
79	86	directus_fields	38	{"id":38,"collection":"blog","field":"divider-jsk4rr","special":["alias","no-data"],"interface":"presentation-divider","options":{"title":"Blog Content Section","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":"content","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"divider-jsk4rr","sort":1,"group":"content"}	\N	\N
92	99	directus_fields	27	{"id":27,"collection":"blog","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"id","sort":1,"group":null}	\N	\N
93	100	directus_fields	28	{"id":28,"collection":"blog","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"status","sort":2,"group":null}	\N	\N
94	101	directus_fields	29	{"id":29,"collection":"blog","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"sort","sort":3,"group":null}	\N	\N
95	102	directus_fields	30	{"id":30,"collection":"blog","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_created","sort":4,"group":null}	\N	\N
96	103	directus_fields	31	{"id":31,"collection":"blog","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_created","sort":5,"group":null}	\N	\N
215	222	directus_fields	29	{"id":29,"collection":"blog","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"sort","sort":2,"group":null}	\N	\N
80	87	directus_fields	27	{"id":27,"collection":"blog","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"id","sort":1,"group":null}	\N	\N
81	88	directus_fields	28	{"id":28,"collection":"blog","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"status","sort":2,"group":null}	\N	\N
82	89	directus_fields	29	{"id":29,"collection":"blog","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"sort","sort":3,"group":null}	\N	\N
83	90	directus_fields	30	{"id":30,"collection":"blog","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_created","sort":4,"group":null}	\N	\N
84	91	directus_fields	31	{"id":31,"collection":"blog","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_created","sort":5,"group":null}	\N	\N
85	92	directus_fields	32	{"id":32,"collection":"blog","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_updated","sort":6,"group":null}	\N	\N
86	93	directus_fields	33	{"id":33,"collection":"blog","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_updated","sort":7,"group":null}	\N	\N
87	94	directus_fields	34	{"id":34,"collection":"blog","field":"settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"settings","sort":8,"group":null}	\N	\N
88	95	directus_fields	35	{"id":35,"collection":"blog","field":"content","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"content","sort":9,"group":null}	\N	\N
89	96	directus_fields	36	{"id":36,"collection":"blog","field":"seo_settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"seo_settings","sort":10,"group":null}	\N	\N
90	97	directus_fields	39	{"sort":11,"interface":"presentation-divider","special":["alias","no-data"],"options":{"title":"SEO Settings Section","inlineTitle":true},"collection":"blog","field":"divider-dwuknd"}	{"sort":11,"interface":"presentation-divider","special":["alias","no-data"],"options":{"title":"SEO Settings Section","inlineTitle":true},"collection":"blog","field":"divider-dwuknd"}	\N	\N
91	98	directus_fields	39	{"id":39,"collection":"blog","field":"divider-dwuknd","special":["alias","no-data"],"interface":"presentation-divider","options":{"title":"SEO Settings Section","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":"seo_settings","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"divider-dwuknd","sort":1,"group":"seo_settings"}	\N	\N
105	112	directus_fields	37	{"id":37,"collection":"blog","field":"divider-5wlnc8","special":["alias","no-data"],"interface":"presentation-divider","options":{"title":"Blog Settings Section","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":"settings","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"divider-5wlnc8","sort":1,"group":"settings"}	\N	\N
112	119	directus_fields	34	{"id":34,"collection":"blog","field":"settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"settings","sort":7,"group":null}	\N	\N
236	243	directus_permissions	9	{"policy":"657e0b5b-070a-466c-83bc-e42ad99e7d67","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_settings","action":"read"}	{"policy":"657e0b5b-070a-466c-83bc-e42ad99e7d67","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_settings","action":"read"}	\N	\N
97	104	directus_fields	32	{"id":32,"collection":"blog","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_updated","sort":6,"group":null}	\N	\N
98	105	directus_fields	33	{"id":33,"collection":"blog","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_updated","sort":7,"group":null}	\N	\N
99	106	directus_fields	34	{"id":34,"collection":"blog","field":"settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"settings","sort":8,"group":null}	\N	\N
100	107	directus_fields	35	{"id":35,"collection":"blog","field":"content","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"content","sort":9,"group":null}	\N	\N
101	108	directus_fields	36	{"id":36,"collection":"blog","field":"seo_settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"seo_settings","sort":10,"group":null}	\N	\N
102	109	directus_fields	28	{"id":28,"collection":"blog","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"status","hidden":false}	\N	\N
103	110	directus_fields	28	{"id":28,"collection":"blog","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"status","width":"half"}	\N	\N
104	111	directus_fields	27	{"id":27,"collection":"blog","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"id","sort":1,"group":null}	\N	\N
106	113	directus_fields	29	{"id":29,"collection":"blog","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"sort","sort":2,"group":null}	\N	\N
108	115	directus_fields	30	{"id":30,"collection":"blog","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_created","sort":3,"group":null}	\N	\N
109	116	directus_fields	31	{"id":31,"collection":"blog","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_created","sort":4,"group":null}	\N	\N
110	117	directus_fields	32	{"id":32,"collection":"blog","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_updated","sort":5,"group":null}	\N	\N
111	118	directus_fields	33	{"id":33,"collection":"blog","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_updated","sort":6,"group":null}	\N	\N
107	114	directus_fields	28	{"id":28,"collection":"blog","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":"settings","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"status","sort":2,"group":"settings"}	\N	\N
113	120	directus_fields	35	{"id":35,"collection":"blog","field":"content","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"content","sort":8,"group":null}	\N	\N
114	121	directus_fields	36	{"id":36,"collection":"blog","field":"seo_settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"seo_settings","sort":9,"group":null}	\N	\N
115	122	directus_fields	40	{"sort":10,"interface":"input","special":null,"collection":"blog","field":"slug"}	{"sort":10,"interface":"input","special":null,"collection":"blog","field":"slug"}	\N	\N
116	123	directus_fields	40	{"id":40,"collection":"blog","field":"slug","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"slug","width":"half"}	\N	\N
117	124	directus_fields	37	{"id":37,"collection":"blog","field":"divider-5wlnc8","special":["alias","no-data"],"interface":"presentation-divider","options":{"title":"Blog Settings Section","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":"settings","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"divider-5wlnc8","sort":1,"group":"settings"}	\N	\N
118	125	directus_fields	27	{"id":27,"collection":"blog","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"id","sort":1,"group":null}	\N	\N
119	126	directus_fields	28	{"id":28,"collection":"blog","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":"settings","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"status","sort":2,"group":"settings"}	\N	\N
120	127	directus_fields	29	{"id":29,"collection":"blog","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"sort","sort":2,"group":null}	\N	\N
121	128	directus_fields	40	{"id":40,"collection":"blog","field":"slug","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":"settings","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"slug","sort":3,"group":"settings"}	\N	\N
122	129	directus_fields	30	{"id":30,"collection":"blog","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_created","sort":3,"group":null}	\N	\N
123	130	directus_fields	31	{"id":31,"collection":"blog","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_created","sort":4,"group":null}	\N	\N
124	131	directus_fields	32	{"id":32,"collection":"blog","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_updated","sort":5,"group":null}	\N	\N
125	132	directus_fields	33	{"id":33,"collection":"blog","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_updated","sort":6,"group":null}	\N	\N
126	133	directus_fields	34	{"id":34,"collection":"blog","field":"settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"settings","sort":7,"group":null}	\N	\N
127	134	directus_fields	35	{"id":35,"collection":"blog","field":"content","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"content","sort":8,"group":null}	\N	\N
128	135	directus_fields	36	{"id":36,"collection":"blog","field":"seo_settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"seo_settings","sort":9,"group":null}	\N	\N
129	136	directus_fields	41	{"sort":10,"interface":"file-image","special":["file"],"required":true,"options":{"crop":false},"collection":"blog","field":"headline_image"}	{"sort":10,"interface":"file-image","special":["file"],"required":true,"options":{"crop":false},"collection":"blog","field":"headline_image"}	\N	\N
131	138	directus_fields	27	{"id":27,"collection":"blog","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"id","sort":1,"group":null}	\N	\N
133	140	directus_fields	29	{"id":29,"collection":"blog","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"sort","sort":2,"group":null}	\N	\N
134	141	directus_fields	30	{"id":30,"collection":"blog","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_created","sort":3,"group":null}	\N	\N
135	142	directus_fields	31	{"id":31,"collection":"blog","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_created","sort":4,"group":null}	\N	\N
136	143	directus_fields	32	{"id":32,"collection":"blog","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_updated","sort":5,"group":null}	\N	\N
137	144	directus_fields	33	{"id":33,"collection":"blog","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_updated","sort":6,"group":null}	\N	\N
138	145	directus_fields	34	{"id":34,"collection":"blog","field":"settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"settings","sort":7,"group":null}	\N	\N
139	146	directus_fields	35	{"id":35,"collection":"blog","field":"content","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"content","sort":8,"group":null}	\N	\N
140	147	directus_fields	36	{"id":36,"collection":"blog","field":"seo_settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"seo_settings","sort":9,"group":null}	\N	\N
143	150	directus_fields	27	{"id":27,"collection":"blog","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"id","sort":1,"group":null}	\N	\N
145	152	directus_fields	29	{"id":29,"collection":"blog","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"sort","sort":2,"group":null}	\N	\N
147	154	directus_fields	30	{"id":30,"collection":"blog","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_created","sort":3,"group":null}	\N	\N
148	155	directus_fields	31	{"id":31,"collection":"blog","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_created","sort":4,"group":null}	\N	\N
149	156	directus_fields	32	{"id":32,"collection":"blog","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_updated","sort":5,"group":null}	\N	\N
130	137	directus_fields	38	{"id":38,"collection":"blog","field":"divider-jsk4rr","special":["alias","no-data"],"interface":"presentation-divider","options":{"title":"Blog Content Section","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":"content","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"divider-jsk4rr","sort":1,"group":"content"}	\N	\N
132	139	directus_fields	41	{"id":41,"collection":"blog","field":"headline_image","special":["file"],"interface":"file-image","options":{"crop":false},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":"content","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"headline_image","sort":2,"group":"content"}	\N	\N
141	148	directus_fields	42	{"sort":10,"interface":"input","special":null,"required":true,"collection":"blog","field":"title"}	{"sort":10,"interface":"input","special":null,"required":true,"collection":"blog","field":"title"}	\N	\N
142	149	directus_fields	38	{"id":38,"collection":"blog","field":"divider-jsk4rr","special":["alias","no-data"],"interface":"presentation-divider","options":{"title":"Blog Content Section","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":"content","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"divider-jsk4rr","sort":1,"group":"content"}	\N	\N
144	151	directus_fields	41	{"id":41,"collection":"blog","field":"headline_image","special":["file"],"interface":"file-image","options":{"crop":false},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":"content","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"headline_image","sort":2,"group":"content"}	\N	\N
146	153	directus_fields	42	{"id":42,"collection":"blog","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":"content","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"title","sort":3,"group":"content"}	\N	\N
150	157	directus_fields	33	{"id":33,"collection":"blog","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_updated","sort":6,"group":null}	\N	\N
151	158	directus_fields	34	{"id":34,"collection":"blog","field":"settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"settings","sort":7,"group":null}	\N	\N
152	159	directus_fields	35	{"id":35,"collection":"blog","field":"content","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"content","sort":8,"group":null}	\N	\N
153	160	directus_fields	36	{"id":36,"collection":"blog","field":"seo_settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"seo_settings","sort":9,"group":null}	\N	\N
154	161	directus_collections	blog	{"collection":"blog","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":false,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"icon":"article","archive_app_filter":false}	\N	\N
155	162	directus_fields	43	{"sort":10,"interface":"input-rich-text-html","special":null,"required":true,"options":{"toolbar":["undo","redo","bold","italic","underline","strikethrough","h1","h2","h3","alignleft","aligncenter","alignright","alignjustify","alignnone","numlist","bullist","removeformat","blockquote","customLink","unlink","customImage","table","hr","fullscreen","code"]},"collection":"blog","field":"blog_content"}	{"sort":10,"interface":"input-rich-text-html","special":null,"required":true,"options":{"toolbar":["undo","redo","bold","italic","underline","strikethrough","h1","h2","h3","alignleft","aligncenter","alignright","alignjustify","alignnone","numlist","bullist","removeformat","blockquote","customLink","unlink","customImage","table","hr","fullscreen","code"]},"collection":"blog","field":"blog_content"}	\N	\N
156	163	directus_fields	38	{"id":38,"collection":"blog","field":"divider-jsk4rr","special":["alias","no-data"],"interface":"presentation-divider","options":{"title":"Blog Content Section","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":"content","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"divider-jsk4rr","sort":1,"group":"content"}	\N	\N
157	164	directus_fields	27	{"id":27,"collection":"blog","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"id","sort":1,"group":null}	\N	\N
158	165	directus_fields	41	{"id":41,"collection":"blog","field":"headline_image","special":["file"],"interface":"file-image","options":{"crop":false},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":"content","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"headline_image","sort":2,"group":"content"}	\N	\N
159	166	directus_fields	29	{"id":29,"collection":"blog","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"sort","sort":2,"group":null}	\N	\N
160	168	directus_fields	30	{"id":30,"collection":"blog","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_created","sort":3,"group":null}	\N	\N
161	167	directus_fields	42	{"id":42,"collection":"blog","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":"content","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"title","sort":3,"group":"content"}	\N	\N
162	169	directus_fields	31	{"id":31,"collection":"blog","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_created","sort":4,"group":null}	\N	\N
163	170	directus_fields	43	{"id":43,"collection":"blog","field":"blog_content","special":null,"interface":"input-rich-text-html","options":{"toolbar":["undo","redo","bold","italic","underline","strikethrough","h1","h2","h3","alignleft","aligncenter","alignright","alignjustify","alignnone","numlist","bullist","removeformat","blockquote","customLink","unlink","customImage","table","hr","fullscreen","code"]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":"content","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"blog_content","sort":4,"group":"content"}	\N	\N
164	171	directus_fields	32	{"id":32,"collection":"blog","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_updated","sort":5,"group":null}	\N	\N
165	172	directus_fields	33	{"id":33,"collection":"blog","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_updated","sort":6,"group":null}	\N	\N
166	173	directus_fields	34	{"id":34,"collection":"blog","field":"settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"settings","sort":7,"group":null}	\N	\N
167	174	directus_fields	35	{"id":35,"collection":"blog","field":"content","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"content","sort":8,"group":null}	\N	\N
168	175	directus_fields	36	{"id":36,"collection":"blog","field":"seo_settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"seo_settings","sort":9,"group":null}	\N	\N
169	176	directus_fields	44	{"sort":10,"interface":"input-multiline","special":null,"required":true,"collection":"blog","field":"excerpt"}	{"sort":10,"interface":"input-multiline","special":null,"required":true,"collection":"blog","field":"excerpt"}	\N	\N
170	177	directus_fields	38	{"id":38,"collection":"blog","field":"divider-jsk4rr","special":["alias","no-data"],"interface":"presentation-divider","options":{"title":"Blog Content Section","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":"content","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"divider-jsk4rr","sort":1,"group":"content"}	\N	\N
171	178	directus_fields	27	{"id":27,"collection":"blog","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"id","sort":1,"group":null}	\N	\N
172	179	directus_fields	41	{"id":41,"collection":"blog","field":"headline_image","special":["file"],"interface":"file-image","options":{"crop":false},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":"content","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"headline_image","sort":2,"group":"content"}	\N	\N
173	180	directus_fields	29	{"id":29,"collection":"blog","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"sort","sort":2,"group":null}	\N	\N
174	181	directus_fields	42	{"id":42,"collection":"blog","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":"content","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"title","sort":3,"group":"content"}	\N	\N
175	182	directus_fields	30	{"id":30,"collection":"blog","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_created","sort":3,"group":null}	\N	\N
176	183	directus_fields	43	{"id":43,"collection":"blog","field":"blog_content","special":null,"interface":"input-rich-text-html","options":{"toolbar":["undo","redo","bold","italic","underline","strikethrough","h1","h2","h3","alignleft","aligncenter","alignright","alignjustify","alignnone","numlist","bullist","removeformat","blockquote","customLink","unlink","customImage","table","hr","fullscreen","code"]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":"content","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"blog_content","sort":4,"group":"content"}	\N	\N
177	184	directus_fields	31	{"id":31,"collection":"blog","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_created","sort":4,"group":null}	\N	\N
178	185	directus_fields	44	{"id":44,"collection":"blog","field":"excerpt","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":"content","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"excerpt","sort":5,"group":"content"}	\N	\N
179	186	directus_fields	32	{"id":32,"collection":"blog","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_updated","sort":5,"group":null}	\N	\N
180	187	directus_fields	33	{"id":33,"collection":"blog","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_updated","sort":6,"group":null}	\N	\N
181	188	directus_fields	34	{"id":34,"collection":"blog","field":"settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"settings","sort":7,"group":null}	\N	\N
182	189	directus_fields	35	{"id":35,"collection":"blog","field":"content","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"content","sort":8,"group":null}	\N	\N
183	190	directus_fields	36	{"id":36,"collection":"blog","field":"seo_settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"seo_settings","sort":9,"group":null}	\N	\N
184	191	directus_fields	45	{"sort":10,"collection":"blog","field":"seo_title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"sort":10,"collection":"blog","field":"seo_title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	\N	\N
185	192	directus_fields	45	{"id":45,"collection":"blog","field":"seo_title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":"seo_settings","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"seo_title","sort":1,"group":"seo_settings"}	\N	\N
186	193	directus_fields	27	{"id":27,"collection":"blog","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"id","sort":1,"group":null}	\N	\N
187	194	directus_fields	39	{"id":39,"collection":"blog","field":"divider-dwuknd","special":["alias","no-data"],"interface":"presentation-divider","options":{"title":"SEO Settings Section","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":"seo_settings","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"divider-dwuknd","sort":2,"group":"seo_settings"}	\N	\N
188	195	directus_fields	29	{"id":29,"collection":"blog","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"sort","sort":2,"group":null}	\N	\N
189	196	directus_fields	30	{"id":30,"collection":"blog","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_created","sort":3,"group":null}	\N	\N
190	197	directus_fields	31	{"id":31,"collection":"blog","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_created","sort":4,"group":null}	\N	\N
191	198	directus_fields	32	{"id":32,"collection":"blog","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_updated","sort":5,"group":null}	\N	\N
192	199	directus_fields	33	{"id":33,"collection":"blog","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_updated","sort":6,"group":null}	\N	\N
193	200	directus_fields	34	{"id":34,"collection":"blog","field":"settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"settings","sort":7,"group":null}	\N	\N
194	201	directus_fields	35	{"id":35,"collection":"blog","field":"content","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"content","sort":8,"group":null}	\N	\N
195	202	directus_fields	36	{"id":36,"collection":"blog","field":"seo_settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"seo_settings","sort":9,"group":null}	\N	\N
213	220	directus_fields	27	{"id":27,"collection":"blog","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"id","sort":1,"group":null}	\N	\N
196	203	directus_fields	39	{"id":39,"collection":"blog","field":"divider-dwuknd","special":["alias","no-data"],"interface":"presentation-divider","options":{"title":"SEO Settings Section","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":"seo_settings","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"divider-dwuknd","sort":1,"group":"seo_settings"}	\N	\N
197	204	directus_fields	45	{"id":45,"collection":"blog","field":"seo_title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":"seo_settings","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"seo_title","sort":2,"group":"seo_settings"}	\N	\N
198	205	directus_fields	46	{"sort":10,"collection":"blog","field":"seo_description","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	{"sort":10,"collection":"blog","field":"seo_description","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null,"searchable":true}	\N	\N
199	206	directus_fields	39	{"id":39,"collection":"blog","field":"divider-dwuknd","special":["alias","no-data"],"interface":"presentation-divider","options":{"title":"SEO Settings Section","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":"seo_settings","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"divider-dwuknd","sort":1,"group":"seo_settings"}	\N	\N
200	207	directus_fields	27	{"id":27,"collection":"blog","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"id","sort":1,"group":null}	\N	\N
201	208	directus_fields	45	{"id":45,"collection":"blog","field":"seo_title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":"seo_settings","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"seo_title","sort":2,"group":"seo_settings"}	\N	\N
202	209	directus_fields	29	{"id":29,"collection":"blog","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"sort","sort":2,"group":null}	\N	\N
203	210	directus_fields	46	{"id":46,"collection":"blog","field":"seo_description","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":"seo_settings","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"seo_description","sort":3,"group":"seo_settings"}	\N	\N
204	211	directus_fields	30	{"id":30,"collection":"blog","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_created","sort":3,"group":null}	\N	\N
205	212	directus_fields	31	{"id":31,"collection":"blog","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_created","sort":4,"group":null}	\N	\N
206	213	directus_fields	32	{"id":32,"collection":"blog","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_updated","sort":5,"group":null}	\N	\N
207	214	directus_fields	33	{"id":33,"collection":"blog","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_updated","sort":6,"group":null}	\N	\N
208	215	directus_fields	34	{"id":34,"collection":"blog","field":"settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"settings","sort":7,"group":null}	\N	\N
209	216	directus_fields	35	{"id":35,"collection":"blog","field":"content","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"content","sort":8,"group":null}	\N	\N
210	217	directus_fields	36	{"id":36,"collection":"blog","field":"seo_settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"seo_settings","sort":9,"group":null}	\N	\N
211	218	directus_fields	47	{"sort":10,"interface":"list","special":["cast-json"],"required":true,"options":{"fields":[{"field":"keyword","name":"keyword","type":"string","meta":{"field":"keyword","width":"full","type":"string","required":true,"interface":"input","options":{"trim":true}}}]},"collection":"blog","field":"keywords"}	{"sort":10,"interface":"list","special":["cast-json"],"required":true,"options":{"fields":[{"field":"keyword","name":"keyword","type":"string","meta":{"field":"keyword","width":"full","type":"string","required":true,"interface":"input","options":{"trim":true}}}]},"collection":"blog","field":"keywords"}	\N	\N
212	219	directus_fields	39	{"id":39,"collection":"blog","field":"divider-dwuknd","special":["alias","no-data"],"interface":"presentation-divider","options":{"title":"SEO Settings Section","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":"seo_settings","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"divider-dwuknd","sort":1,"group":"seo_settings"}	\N	\N
214	221	directus_fields	45	{"id":45,"collection":"blog","field":"seo_title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":"seo_settings","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"seo_title","sort":2,"group":"seo_settings"}	\N	\N
216	223	directus_fields	46	{"id":46,"collection":"blog","field":"seo_description","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":"seo_settings","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"seo_description","sort":3,"group":"seo_settings"}	\N	\N
218	225	directus_fields	47	{"id":47,"collection":"blog","field":"keywords","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"keyword","name":"keyword","type":"string","meta":{"field":"keyword","width":"full","type":"string","required":true,"interface":"input","options":{"trim":true}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":"seo_settings","validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"keywords","sort":4,"group":"seo_settings"}	\N	\N
217	224	directus_fields	30	{"id":30,"collection":"blog","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_created","sort":3,"group":null}	\N	\N
219	226	directus_fields	31	{"id":31,"collection":"blog","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_created","sort":4,"group":null}	\N	\N
220	227	directus_fields	32	{"id":32,"collection":"blog","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"user_updated","sort":5,"group":null}	\N	\N
221	228	directus_fields	33	{"id":33,"collection":"blog","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"date_updated","sort":6,"group":null}	\N	\N
222	229	directus_fields	34	{"id":34,"collection":"blog","field":"settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"settings","sort":7,"group":null}	\N	\N
223	230	directus_fields	35	{"id":35,"collection":"blog","field":"content","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"content","sort":8,"group":null}	\N	\N
224	231	directus_fields	36	{"id":36,"collection":"blog","field":"seo_settings","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"blog","field":"seo_settings","sort":9,"group":null}	\N	\N
225	232	directus_collections	blog	{"collection":"blog","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":false,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":"https://appname.com/blog/{{slug}}","versioning":false}	{"preview_url":"https://appname.com/blog/{{slug}}"}	\N	\N
226	233	directus_users	5de817fb-2049-46bc-ba9b-ebe47a4169ea	{"first_name":"Website","last_name":"Token","email":"website@email.com","password":"**********","description":"This account is only for read token for website","email_notifications":false,"token":"**********"}	{"first_name":"Website","last_name":"Token","email":"website@email.com","password":"**********","description":"This account is only for read token for website","email_notifications":false,"token":"**********"}	\N	\N
227	234	directus_policies	657e0b5b-070a-466c-83bc-e42ad99e7d67	{"name":"Website Read Access","admin_access":false,"app_access":false}	{"name":"Website Read Access","admin_access":false,"app_access":false}	\N	\N
228	235	directus_permissions	1	{"policy":"657e0b5b-070a-466c-83bc-e42ad99e7d67","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"blog","action":"read"}	{"policy":"657e0b5b-070a-466c-83bc-e42ad99e7d67","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"blog","action":"read"}	\N	\N
229	236	directus_permissions	2	{"policy":"657e0b5b-070a-466c-83bc-e42ad99e7d67","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"general_info","action":"read"}	{"policy":"657e0b5b-070a-466c-83bc-e42ad99e7d67","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"general_info","action":"read"}	\N	\N
230	237	directus_permissions	3	{"policy":"657e0b5b-070a-466c-83bc-e42ad99e7d67","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"seo_settings","action":"read"}	{"policy":"657e0b5b-070a-466c-83bc-e42ad99e7d67","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"seo_settings","action":"read"}	\N	\N
231	238	directus_permissions	4	{"policy":"657e0b5b-070a-466c-83bc-e42ad99e7d67","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_collections","action":"read"}	{"policy":"657e0b5b-070a-466c-83bc-e42ad99e7d67","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_collections","action":"read"}	\N	\N
232	239	directus_permissions	5	{"policy":"657e0b5b-070a-466c-83bc-e42ad99e7d67","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_comments","action":"read"}	{"policy":"657e0b5b-070a-466c-83bc-e42ad99e7d67","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_comments","action":"read"}	\N	\N
233	240	directus_permissions	6	{"policy":"657e0b5b-070a-466c-83bc-e42ad99e7d67","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_fields","action":"read"}	{"policy":"657e0b5b-070a-466c-83bc-e42ad99e7d67","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_fields","action":"read"}	\N	\N
234	241	directus_permissions	7	{"policy":"657e0b5b-070a-466c-83bc-e42ad99e7d67","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"read"}	{"policy":"657e0b5b-070a-466c-83bc-e42ad99e7d67","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"read"}	\N	\N
235	242	directus_permissions	8	{"policy":"657e0b5b-070a-466c-83bc-e42ad99e7d67","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_relations","action":"read"}	{"policy":"657e0b5b-070a-466c-83bc-e42ad99e7d67","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_relations","action":"read"}	\N	\N
237	244	directus_permissions	10	{"policy":"657e0b5b-070a-466c-83bc-e42ad99e7d67","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_translations","action":"read"}	{"policy":"657e0b5b-070a-466c-83bc-e42ad99e7d67","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_translations","action":"read"}	\N	\N
238	245	directus_access	5965e256-a0da-4394-bdb1-9a7b0c737595	{"policy":"657e0b5b-070a-466c-83bc-e42ad99e7d67","user":{"id":"5de817fb-2049-46bc-ba9b-ebe47a4169ea"}}	{"policy":"657e0b5b-070a-466c-83bc-e42ad99e7d67","user":{"id":"5de817fb-2049-46bc-ba9b-ebe47a4169ea"}}	\N	\N
239	247	directus_policies	7f2bdb09-8641-45bc-92c0-d6e1d8915798	{"name":"Editor","admin_access":false,"app_access":true}	{"name":"Editor","admin_access":false,"app_access":true}	\N	\N
240	248	directus_permissions	11	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_collections","action":"read"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_collections","action":"read"}	\N	\N
241	249	directus_permissions	12	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_fields","action":"read"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_fields","action":"read"}	\N	\N
242	250	directus_permissions	13	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_relations","action":"read"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_relations","action":"read"}	\N	\N
243	251	directus_permissions	14	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_translations","action":"read"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_translations","action":"read"}	\N	\N
244	252	directus_permissions	15	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"user":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_activity","action":"read"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"user":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_activity","action":"read"}	\N	\N
245	253	directus_permissions	16	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_comments","action":"read"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_comments","action":"read"}	\N	\N
246	254	directus_permissions	17	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{},"validation":{"comment":{"_nnull":true}},"presets":null,"fields":["*"],"system":true,"collection":"directus_comments","action":"create"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{},"validation":{"comment":{"_nnull":true}},"presets":null,"fields":["*"],"system":true,"collection":"directus_comments","action":"create"}	\N	\N
247	255	directus_permissions	18	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["comment"],"system":true,"collection":"directus_comments","action":"update"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["comment"],"system":true,"collection":"directus_comments","action":"update"}	\N	\N
248	256	directus_permissions	19	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_comments","action":"delete"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_comments","action":"delete"}	\N	\N
249	257	directus_permissions	20	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"_or":[{"user":{"_eq":"$CURRENT_USER"}},{"_and":[{"user":{"_null":true}},{"role":{"_eq":"$CURRENT_ROLE"}}]},{"_and":[{"user":{"_null":true}},{"role":{"_null":true}}]}]},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_presets","action":"read"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"_or":[{"user":{"_eq":"$CURRENT_USER"}},{"_and":[{"user":{"_null":true}},{"role":{"_eq":"$CURRENT_ROLE"}}]},{"_and":[{"user":{"_null":true}},{"role":{"_null":true}}]}]},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_presets","action":"read"}	\N	\N
250	258	directus_permissions	21	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{},"validation":{"user":{"_eq":"$CURRENT_USER"}},"presets":null,"fields":["*"],"system":true,"collection":"directus_presets","action":"create"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{},"validation":{"user":{"_eq":"$CURRENT_USER"}},"presets":null,"fields":["*"],"system":true,"collection":"directus_presets","action":"create"}	\N	\N
251	259	directus_permissions	22	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"user":{"_eq":"$CURRENT_USER"}},"validation":{"user":{"_eq":"$CURRENT_USER"}},"presets":null,"fields":["*"],"system":true,"collection":"directus_presets","action":"update"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"user":{"_eq":"$CURRENT_USER"}},"validation":{"user":{"_eq":"$CURRENT_USER"}},"presets":null,"fields":["*"],"system":true,"collection":"directus_presets","action":"update"}	\N	\N
252	260	directus_permissions	23	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"user":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_presets","action":"delete"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"user":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_presets","action":"delete"}	\N	\N
253	261	directus_permissions	24	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"id":{"_in":"$CURRENT_ROLES"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_roles","action":"read"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"id":{"_in":"$CURRENT_ROLES"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_roles","action":"read"}	\N	\N
254	262	directus_permissions	25	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_settings","action":"read"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_settings","action":"read"}	\N	\N
255	263	directus_permissions	26	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_translations","action":"read"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_translations","action":"read"}	\N	\N
256	264	directus_permissions	27	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"recipient":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_notifications","action":"read"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"recipient":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_notifications","action":"read"}	\N	\N
257	265	directus_permissions	28	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"recipient":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["status"],"system":true,"collection":"directus_notifications","action":"update"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"recipient":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["status"],"system":true,"collection":"directus_notifications","action":"update"}	\N	\N
258	266	directus_permissions	29	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_shares","action":"read"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_shares","action":"read"}	\N	\N
259	267	directus_permissions	30	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"id":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["id","first_name","last_name","last_page","email","password","location","title","description","tags","provider","preferences_divider","avatar","language","appearance","theme_light","theme_dark","tfa_secret","status","role"],"system":true,"collection":"directus_users","action":"read"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":{"id":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["id","first_name","last_name","last_page","email","password","location","title","description","tags","provider","preferences_divider","avatar","language","appearance","theme_light","theme_dark","tfa_secret","status","role"],"system":true,"collection":"directus_users","action":"read"}	\N	\N
286	294	directus_users	7563849d-3a3e-40db-a52f-e251dcf225db	{"first_name":"App","last_name":"Editor","email":"user@appname.com","password":"**********"}	{"first_name":"App","last_name":"Editor","email":"user@appname.com","password":"**********"}	287	\N
288	296	directus_policies	7f2bdb09-8641-45bc-92c0-d6e1d8915798	{"id":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","name":"Editor","icon":"edit","description":"Content Editor","ip_access":null,"enforce_tfa":false,"admin_access":false,"app_access":true,"permissions":[11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56],"users":["bd0d36dc-6225-4c5f-8297-9b2971ed86b2"],"roles":["bd0d36dc-6225-4c5f-8297-9b2971ed86b2"]}	{"icon":"edit","description":"Content Editor"}	\N	\N
260	268	directus_permissions	31	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"blog","action":"create"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"blog","action":"create"}	288	\N
261	269	directus_permissions	32	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"blog","action":"read"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"blog","action":"read"}	288	\N
263	271	directus_permissions	34	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"blog","action":"delete"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"blog","action":"delete"}	288	\N
264	272	directus_permissions	35	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"blog","action":"share"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"blog","action":"share"}	288	\N
265	273	directus_permissions	36	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"general_info","action":"create"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"general_info","action":"create"}	288	\N
266	274	directus_permissions	37	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"general_info","action":"read"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"general_info","action":"read"}	288	\N
267	275	directus_permissions	38	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"general_info","action":"update"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"general_info","action":"update"}	288	\N
268	276	directus_permissions	39	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"general_info","action":"delete"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"general_info","action":"delete"}	288	\N
269	277	directus_permissions	40	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"general_info","action":"share"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"general_info","action":"share"}	288	\N
270	278	directus_permissions	41	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"seo_settings","action":"create"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"seo_settings","action":"create"}	288	\N
271	279	directus_permissions	42	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"seo_settings","action":"read"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"seo_settings","action":"read"}	288	\N
272	280	directus_permissions	43	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"seo_settings","action":"update"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"seo_settings","action":"update"}	288	\N
273	281	directus_permissions	44	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"seo_settings","action":"delete"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"seo_settings","action":"delete"}	288	\N
274	282	directus_permissions	45	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"seo_settings","action":"share"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"seo_settings","action":"share"}	288	\N
275	283	directus_permissions	46	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"create"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"create"}	288	\N
276	284	directus_permissions	47	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"read"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"read"}	288	\N
277	285	directus_permissions	48	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"update"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"update"}	288	\N
278	286	directus_permissions	49	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"delete"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"delete"}	288	\N
279	287	directus_permissions	50	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"share"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"share"}	288	\N
280	288	directus_permissions	51	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_flows","action":"read"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_flows","action":"read"}	288	\N
281	289	directus_permissions	52	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_folders","action":"create"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_folders","action":"create"}	288	\N
282	290	directus_permissions	53	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_folders","action":"read"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_folders","action":"read"}	288	\N
283	291	directus_permissions	54	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_folders","action":"update"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_folders","action":"update"}	288	\N
284	292	directus_permissions	55	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_folders","action":"delete"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_folders","action":"delete"}	288	\N
285	293	directus_permissions	56	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_folders","action":"share"}	{"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_folders","action":"share"}	288	\N
287	295	directus_access	bd0d36dc-6225-4c5f-8297-9b2971ed86b2	{"user":{"first_name":"App","last_name":"Editor","email":"user@appname.com","password":"nowqeg-fubmy3-fyBniz"},"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798"}	{"user":{"first_name":"App","last_name":"Editor","email":"user@appname.com","password":"nowqeg-fubmy3-fyBniz"},"policy":"7f2bdb09-8641-45bc-92c0-d6e1d8915798"}	288	\N
289	297	directus_flows	555952b0-06ff-4cb7-8cad-eafa09d1c2fd	{"name":"Revalidate All Page","icon":"bolt","color":null,"description":null,"status":"inactive","accountability":"all","trigger":"event","options":{"type":"action","scope":["items.create","items.update","items.delete","items.promote","items.sort"],"collections":["seo_settings","general_info"]}}	{"name":"Revalidate All Page","icon":"bolt","color":null,"description":null,"status":"inactive","accountability":"all","trigger":"event","options":{"type":"action","scope":["items.create","items.update","items.delete","items.promote","items.sort"],"collections":["seo_settings","general_info"]}}	\N	\N
290	298	directus_operations	2c9b7652-f46a-4c42-b415-930973903f95	{"flow":"555952b0-06ff-4cb7-8cad-eafa09d1c2fd","position_x":37,"position_y":1,"name":"Success Revalidating All Page","key":"success_revalidating_all_page","type":"log","options":{"message":"Success Revalidating All Page"}}	{"flow":"555952b0-06ff-4cb7-8cad-eafa09d1c2fd","position_x":37,"position_y":1,"name":"Success Revalidating All Page","key":"success_revalidating_all_page","type":"log","options":{"message":"Success Revalidating All Page"}}	292	\N
291	299	directus_operations	eb5cd256-8322-4cf3-9707-d0605210d5d0	{"flow":"555952b0-06ff-4cb7-8cad-eafa09d1c2fd","position_x":37,"position_y":17,"name":"Error Revalidating All Page","key":"error_revalidating_all_page","type":"log","options":{"message":"Error Revalidating All Page"}}	{"flow":"555952b0-06ff-4cb7-8cad-eafa09d1c2fd","position_x":37,"position_y":17,"name":"Error Revalidating All Page","key":"error_revalidating_all_page","type":"log","options":{"message":"Error Revalidating All Page"}}	292	\N
293	301	directus_flows	555952b0-06ff-4cb7-8cad-eafa09d1c2fd	{"id":"555952b0-06ff-4cb7-8cad-eafa09d1c2fd","name":"Revalidate All Page","icon":"bolt","color":null,"description":null,"status":"inactive","trigger":"event","accountability":"all","options":{"type":"action","scope":["items.create","items.update","items.delete","items.promote","items.sort"],"collections":["seo_settings","general_info"]},"operation":"cbc4f4e1-a9f0-4e83-aaac-7e71b6a53de5","date_created":"2026-01-01T11:25:19.554Z","user_created":"51c0588a-b702-47e8-8501-f6654693b318","operations":["2c9b7652-f46a-4c42-b415-930973903f95","cbc4f4e1-a9f0-4e83-aaac-7e71b6a53de5","eb5cd256-8322-4cf3-9707-d0605210d5d0"]}	{"operation":"cbc4f4e1-a9f0-4e83-aaac-7e71b6a53de5"}	\N	\N
292	300	directus_operations	cbc4f4e1-a9f0-4e83-aaac-7e71b6a53de5	{"flow":"555952b0-06ff-4cb7-8cad-eafa09d1c2fd","position_x":19,"position_y":1,"name":"Webhook / Request URL","key":"webhook_request_url","type":"request","options":{"method":"GET","url":"https://appname.com/api/revalidate?path=all","headers":[{"header":"Authorization","value":"nextjs_revalidation_token"}]},"resolve":{"flow":"555952b0-06ff-4cb7-8cad-eafa09d1c2fd","position_x":37,"position_y":1,"name":"Success Revalidating All Page","key":"success_revalidating_all_page","type":"log","options":{"message":"Success Revalidating All Page"}},"reject":{"flow":"555952b0-06ff-4cb7-8cad-eafa09d1c2fd","position_x":37,"position_y":17,"name":"Error Revalidating All Page","key":"error_revalidating_all_page","type":"log","options":{"message":"Error Revalidating All Page"}}}	{"flow":"555952b0-06ff-4cb7-8cad-eafa09d1c2fd","position_x":19,"position_y":1,"name":"Webhook / Request URL","key":"webhook_request_url","type":"request","options":{"method":"GET","url":"https://appname.com/api/revalidate?path=all","headers":[{"header":"Authorization","value":"nextjs_revalidation_token"}]},"resolve":{"flow":"555952b0-06ff-4cb7-8cad-eafa09d1c2fd","position_x":37,"position_y":1,"name":"Success Revalidating All Page","key":"success_revalidating_all_page","type":"log","options":{"message":"Success Revalidating All Page"}},"reject":{"flow":"555952b0-06ff-4cb7-8cad-eafa09d1c2fd","position_x":37,"position_y":17,"name":"Error Revalidating All Page","key":"error_revalidating_all_page","type":"log","options":{"message":"Error Revalidating All Page"}}}	293	\N
294	302	directus_flows	c6848590-837a-4cf7-aa38-bcb8e119cfc2	{"name":"Revalidate Blog","icon":"bolt","color":null,"description":"Revalidate every Fetch that has \\"blog\\" tag","status":"active","accountability":"all","trigger":"event","options":{"type":"action","scope":["items.create","items.update","items.delete","items.promote","items.sort"],"collections":["blog"]}}	{"name":"Revalidate Blog","icon":"bolt","color":null,"description":"Revalidate every Fetch that has \\"blog\\" tag","status":"active","accountability":"all","trigger":"event","options":{"type":"action","scope":["items.create","items.update","items.delete","items.promote","items.sort"],"collections":["blog"]}}	\N	\N
295	303	directus_flows	c6848590-837a-4cf7-aa38-bcb8e119cfc2	{"id":"c6848590-837a-4cf7-aa38-bcb8e119cfc2","name":"Revalidate Blog","icon":"bolt","color":null,"description":"Revalidate every Fetch that has \\"blog\\" tag","status":"inactive","trigger":"event","accountability":"all","options":{"type":"action","scope":["items.create","items.update","items.delete","items.promote","items.sort"],"collections":["blog"]},"operation":null,"date_created":"2026-01-01T11:28:12.562Z","user_created":"51c0588a-b702-47e8-8501-f6654693b318","operations":[]}	{"name":"Revalidate Blog","icon":"bolt","color":null,"description":"Revalidate every Fetch that has \\"blog\\" tag","status":"inactive","trigger":"event","accountability":"all","options":{"type":"action","scope":["items.create","items.update","items.delete","items.promote","items.sort"],"collections":["blog"]}}	\N	\N
296	304	directus_operations	427e3a18-3695-4e2d-96a0-70d969b7e3d6	{"flow":"c6848590-837a-4cf7-aa38-bcb8e119cfc2","position_x":37,"position_y":1,"name":"Success Revalidating Blog Tag","key":"success_revalidating_blog_tag","type":"log","options":{"message":"Success Revalidating Blog Tag"}}	{"flow":"c6848590-837a-4cf7-aa38-bcb8e119cfc2","position_x":37,"position_y":1,"name":"Success Revalidating Blog Tag","key":"success_revalidating_blog_tag","type":"log","options":{"message":"Success Revalidating Blog Tag"}}	298	\N
297	305	directus_operations	cdb98368-fe5c-46c8-934b-f404f5cd7f08	{"flow":"c6848590-837a-4cf7-aa38-bcb8e119cfc2","position_x":37,"position_y":17,"name":"Error Revalidating Blog Tag","key":"error_revalidating_blog_tag","type":"log","options":{"message":"Error Revalidating Blog Tag"}}	{"flow":"c6848590-837a-4cf7-aa38-bcb8e119cfc2","position_x":37,"position_y":17,"name":"Error Revalidating Blog Tag","key":"error_revalidating_blog_tag","type":"log","options":{"message":"Error Revalidating Blog Tag"}}	298	\N
299	307	directus_flows	c6848590-837a-4cf7-aa38-bcb8e119cfc2	{"id":"c6848590-837a-4cf7-aa38-bcb8e119cfc2","name":"Revalidate Blog","icon":"bolt","color":null,"description":"Revalidate every Fetch that has \\"blog\\" tag","status":"inactive","trigger":"event","accountability":"all","options":{"type":"action","scope":["items.create","items.update","items.delete","items.promote","items.sort"],"collections":["blog"]},"operation":"a17459d1-070e-4fb6-b968-74bbecec4886","date_created":"2026-01-01T11:28:12.562Z","user_created":"51c0588a-b702-47e8-8501-f6654693b318","operations":["427e3a18-3695-4e2d-96a0-70d969b7e3d6","a17459d1-070e-4fb6-b968-74bbecec4886","cdb98368-fe5c-46c8-934b-f404f5cd7f08"]}	{"name":"Revalidate Blog","icon":"bolt","color":null,"description":"Revalidate every Fetch that has \\"blog\\" tag","status":"inactive","trigger":"event","accountability":"all","options":{"type":"action","scope":["items.create","items.update","items.delete","items.promote","items.sort"],"collections":["blog"]},"operation":"a17459d1-070e-4fb6-b968-74bbecec4886","date_created":"2026-01-01T11:28:12.562Z","user_created":"51c0588a-b702-47e8-8501-f6654693b318"}	\N	\N
298	306	directus_operations	a17459d1-070e-4fb6-b968-74bbecec4886	{"flow":"c6848590-837a-4cf7-aa38-bcb8e119cfc2","position_x":19,"position_y":1,"name":"Webhook / Request URL","key":"webhook_request_url","type":"request","options":{"method":"GET","url":"https://appname.com/api/revalidate?path=blog","headers":[{"header":"Authorization","value":"nextjs_revalidation_token"}]},"resolve":{"flow":"c6848590-837a-4cf7-aa38-bcb8e119cfc2","position_x":37,"position_y":1,"name":"Success Revalidating Blog Tag","key":"success_revalidating_blog_tag","type":"log","options":{"message":"Success Revalidating Blog Tag"}},"reject":{"flow":"c6848590-837a-4cf7-aa38-bcb8e119cfc2","position_x":37,"position_y":17,"name":"Error Revalidating Blog Tag","key":"error_revalidating_blog_tag","type":"log","options":{"message":"Error Revalidating Blog Tag"}}}	{"flow":"c6848590-837a-4cf7-aa38-bcb8e119cfc2","position_x":19,"position_y":1,"name":"Webhook / Request URL","key":"webhook_request_url","type":"request","options":{"method":"GET","url":"https://appname.com/api/revalidate?path=blog","headers":[{"header":"Authorization","value":"nextjs_revalidation_token"}]},"resolve":{"flow":"c6848590-837a-4cf7-aa38-bcb8e119cfc2","position_x":37,"position_y":1,"name":"Success Revalidating Blog Tag","key":"success_revalidating_blog_tag","type":"log","options":{"message":"Success Revalidating Blog Tag"}},"reject":{"flow":"c6848590-837a-4cf7-aa38-bcb8e119cfc2","position_x":37,"position_y":17,"name":"Error Revalidating Blog Tag","key":"error_revalidating_blog_tag","type":"log","options":{"message":"Error Revalidating Blog Tag"}}}	299	\N
300	308	directus_flows	555952b0-06ff-4cb7-8cad-eafa09d1c2fd	{"id":"555952b0-06ff-4cb7-8cad-eafa09d1c2fd","name":"Revalidate All Page","icon":"bolt","color":null,"description":"Revalidate every page","status":"inactive","trigger":"event","accountability":"all","options":{"type":"action","scope":["items.create","items.update","items.delete","items.promote","items.sort"],"collections":["seo_settings","general_info"]},"operation":"cbc4f4e1-a9f0-4e83-aaac-7e71b6a53de5","date_created":"2026-01-01T11:25:19.554Z","user_created":"51c0588a-b702-47e8-8501-f6654693b318","operations":["2c9b7652-f46a-4c42-b415-930973903f95","cbc4f4e1-a9f0-4e83-aaac-7e71b6a53de5","eb5cd256-8322-4cf3-9707-d0605210d5d0"]}	{"name":"Revalidate All Page","icon":"bolt","color":null,"description":"Revalidate every page","status":"inactive","trigger":"event","accountability":"all","options":{"type":"action","scope":["items.create","items.update","items.delete","items.promote","items.sort"],"collections":["seo_settings","general_info"]}}	\N	\N
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_roles (id, name, icon, description, parent) FROM stdin;
a3c8657d-5341-438b-9fa0-da0507beedc3	Administrator	verified	$t:admin_description	\N
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin, next_token) FROM stdin;
ltax_-rBPucyY6mCVkZ7MvBJZyP-hTlNZiNN8j3AoGNcEKVClcdJ7M5fmmZz-Nzy	51c0588a-b702-47e8-8501-f6654693b318	2026-01-01 10:29:25.101+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	\N	http://localhost:8055	Kv9q7ATXc0aBQmM3ZOpbi_X5gpWrxeEFbrdgHPv33ImJyHYbYGajagkqTwoWyB2o
Kv9q7ATXc0aBQmM3ZOpbi_X5gpWrxeEFbrdgHPv33ImJyHYbYGajagkqTwoWyB2o	51c0588a-b702-47e8-8501-f6654693b318	2026-01-02 10:29:15.101+00	192.168.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	\N	http://localhost:8055	\N
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios, public_favicon, default_appearance, default_theme_light, theme_light_overrides, default_theme_dark, theme_dark_overrides, report_error_url, report_bug_url, report_feature_url, public_registration, public_registration_verify_email, public_registration_role, public_registration_email_filter, visual_editor_urls, project_id, mcp_enabled, mcp_allow_deletes, mcp_prompts_collection, mcp_system_prompt_enabled, mcp_system_prompt, project_owner, project_usage, org_name, product_updates, project_status, ai_openai_api_key, ai_anthropic_api_key, ai_system_prompt) FROM stdin;
1	Brand Dashboard	https://appname.com	#6644FF	\N	\N	\N	\N	25	\N	all	\N	\N	\N	\N	\N	[{"type":"module","id":"content","enabled":true},{"type":"module","id":"visual","enabled":false},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}]	\N	en-US	\N	\N	auto	\N	\N	\N	\N	\N	\N	\N	f	t	\N	\N	\N	019b6b57-b08d-76ab-8923-8eeb1abae958	f	f	\N	t	\N	elianrichards@gmail.com	commercial	APR	f	\N	\N	\N	\N
\.


--
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.


--
-- Data for Name: directus_translations; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_translations (id, language, key, value) FROM stdin;
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications, appearance, theme_dark, theme_light, theme_light_overrides, theme_dark_overrides, text_direction) FROM stdin;
51c0588a-b702-47e8-8501-f6654693b318	Admin	User	elianrichards@gmail.com	$argon2id$v=19$m=65536,t=3,p=4$/Jhv3YQIZgDTEXrLay+aqg$c/97PeGCjVJrXITpCRlD7xXQZTmMz9V7+GytHw796QQ	\N	\N	\N	\N	\N	\N	\N	active	a3c8657d-5341-438b-9fa0-da0507beedc3	\N	2026-01-01 10:29:15.119+00	/settings/data-model	default	\N	\N	t	\N	\N	\N	\N	\N	auto
5de817fb-2049-46bc-ba9b-ebe47a4169ea	Website	Token	website@email.com	$argon2id$v=19$m=65536,t=3,p=4$8XlkF4R9JccRPhvWymTNtw$pprwBPXNnZCO5YZZllVKnuIpyd3g0rVDI1kTkRtHFSA	\N	\N	This account is only for read token for website	\N	\N	\N	\N	active	\N	yZUwKv0ypniM5YjJ1COSZA6LYcrXMXSP	\N	\N	default	\N	\N	f	\N	\N	\N	\N	\N	auto
7563849d-3a3e-40db-a52f-e251dcf225db	App	Editor	user@appname.com	$argon2id$v=19$m=65536,t=3,p=4$uvolSwxbed0NrTQ+RSR4Vw$uN/7niaIJaVqqywDNcIbD+9Seii37ShlJ+GBUAxe/7w	\N	\N	\N	\N	\N	\N	\N	active	\N	\N	\N	\N	default	\N	\N	t	\N	\N	\N	\N	\N	auto
\.


--
-- Data for Name: directus_versions; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_versions (id, key, name, collection, item, hash, date_created, date_updated, user_created, user_updated, delta) FROM stdin;
\.


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers, was_active_before_deprecation, migrated_flow) FROM stdin;
\.


--
-- Data for Name: general_info; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.general_info (id, brand_name, brand_legal_name, brand_tagline, address, phone, google_map_link, instagram_link) FROM stdin;
\.


--
-- Data for Name: seo_settings; Type: TABLE DATA; Schema: public; Owner: elianrichard
--

COPY public.seo_settings (id, domain_url, theme_color, opengraph_image, company_name, category, company_description, emails, phone_numbers, keywords, country_name, region, locality, postal_code, street_address, latitude, longitude, founding_year) FROM stdin;
\.


--
-- Name: blog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elianrichard
--

SELECT pg_catalog.setval('public.blog_id_seq', 1, false);


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elianrichard
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 308, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elianrichard
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 47, true);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elianrichard
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elianrichard
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 56, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elianrichard
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 1, false);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elianrichard
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 4, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elianrichard
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 300, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elianrichard
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elianrichard
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: general_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elianrichard
--

SELECT pg_catalog.setval('public.general_info_id_seq', 1, false);


--
-- Name: seo_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elianrichard
--

SELECT pg_catalog.setval('public.seo_settings_id_seq', 1, false);


--
-- Name: blog blog_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.blog
    ADD CONSTRAINT blog_pkey PRIMARY KEY (id);


--
-- Name: blog blog_slug_unique; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.blog
    ADD CONSTRAINT blog_slug_unique UNIQUE (slug);


--
-- Name: directus_access directus_access_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_pkey PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_comments directus_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_pkey PRIMARY KEY (id);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_extensions directus_extensions_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_extensions
    ADD CONSTRAINT directus_extensions_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_policies directus_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_policies
    ADD CONSTRAINT directus_policies_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- Name: directus_translations directus_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- Name: directus_versions directus_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_pkey PRIMARY KEY (id);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: general_info general_info_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.general_info
    ADD CONSTRAINT general_info_pkey PRIMARY KEY (id);


--
-- Name: seo_settings seo_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.seo_settings
    ADD CONSTRAINT seo_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_activity_timestamp_index; Type: INDEX; Schema: public; Owner: elianrichard
--

CREATE INDEX directus_activity_timestamp_index ON public.directus_activity USING btree ("timestamp");


--
-- Name: directus_revisions_parent_index; Type: INDEX; Schema: public; Owner: elianrichard
--

CREATE INDEX directus_revisions_parent_index ON public.directus_revisions USING btree (parent);


--
-- Name: blog blog_headline_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.blog
    ADD CONSTRAINT blog_headline_image_foreign FOREIGN KEY (headline_image) REFERENCES public.directus_files(id);


--
-- Name: blog blog_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.blog
    ADD CONSTRAINT blog_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: blog blog_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.blog
    ADD CONSTRAINT blog_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_access directus_access_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- Name: directus_comments directus_comments_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_comments directus_comments_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_revisions directus_revisions_version_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_version_foreign FOREIGN KEY (version) REFERENCES public.directus_versions(id) ON DELETE CASCADE;


--
-- Name: directus_roles directus_roles_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_roles(id);


--
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_favicon_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_favicon_foreign FOREIGN KEY (public_favicon) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_registration_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_registration_role_foreign FOREIGN KEY (public_registration_role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_versions directus_versions_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_webhooks directus_webhooks_migrated_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_migrated_flow_foreign FOREIGN KEY (migrated_flow) REFERENCES public.directus_flows(id) ON DELETE SET NULL;


--
-- Name: seo_settings seo_settings_opengraph_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: elianrichard
--

ALTER TABLE ONLY public.seo_settings
    ADD CONSTRAINT seo_settings_opengraph_image_foreign FOREIGN KEY (opengraph_image) REFERENCES public.directus_files(id);


--
-- PostgreSQL database dump complete
--

