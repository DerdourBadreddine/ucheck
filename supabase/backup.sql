--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE anon;
ALTER ROLE anon WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE authenticated;
ALTER ROLE authenticated WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE authenticator;
ALTER ROLE authenticator WITH NOSUPERUSER NOINHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE dashboard_user;
ALTER ROLE dashboard_user WITH NOSUPERUSER INHERIT CREATEROLE CREATEDB NOLOGIN REPLICATION NOBYPASSRLS;
CREATE ROLE pgbouncer;
ALTER ROLE pgbouncer WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE pgsodium_keyholder;
ALTER ROLE pgsodium_keyholder WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE pgsodium_keyiduser;
ALTER ROLE pgsodium_keyiduser WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE pgsodium_keymaker;
ALTER ROLE pgsodium_keymaker WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE postgres;
ALTER ROLE postgres WITH NOSUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
CREATE ROLE service_role;
ALTER ROLE service_role WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION BYPASSRLS;
CREATE ROLE supabase_admin;
ALTER ROLE supabase_admin WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
CREATE ROLE supabase_auth_admin;
ALTER ROLE supabase_auth_admin WITH NOSUPERUSER NOINHERIT CREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE supabase_read_only_user;
ALTER ROLE supabase_read_only_user WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION BYPASSRLS;
CREATE ROLE supabase_realtime_admin;
ALTER ROLE supabase_realtime_admin WITH NOSUPERUSER NOINHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE supabase_replication_admin;
ALTER ROLE supabase_replication_admin WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN REPLICATION NOBYPASSRLS;
CREATE ROLE supabase_storage_admin;
ALTER ROLE supabase_storage_admin WITH NOSUPERUSER NOINHERIT CREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;

--
-- User Configurations
--

--
-- User Config "anon"
--

ALTER ROLE anon SET statement_timeout TO '3s';

--
-- User Config "authenticated"
--

ALTER ROLE authenticated SET statement_timeout TO '8s';

--
-- User Config "authenticator"
--

ALTER ROLE authenticator SET session_preload_libraries TO 'safeupdate';
ALTER ROLE authenticator SET statement_timeout TO '8s';
ALTER ROLE authenticator SET lock_timeout TO '8s';

--
-- User Config "postgres"
--

ALTER ROLE postgres SET search_path TO E'\\$user', 'public', 'extensions';

--
-- User Config "supabase_admin"
--

ALTER ROLE supabase_admin SET search_path TO '$user', 'public', 'auth', 'extensions';

--
-- User Config "supabase_auth_admin"
--

ALTER ROLE supabase_auth_admin SET search_path TO 'auth';
ALTER ROLE supabase_auth_admin SET idle_in_transaction_session_timeout TO '60000';

--
-- User Config "supabase_storage_admin"
--

ALTER ROLE supabase_storage_admin SET search_path TO 'storage';


--
-- Role memberships
--

GRANT anon TO authenticator GRANTED BY postgres;
GRANT anon TO postgres GRANTED BY supabase_admin;
GRANT authenticated TO authenticator GRANTED BY postgres;
GRANT authenticated TO postgres GRANTED BY supabase_admin;
GRANT authenticator TO supabase_storage_admin GRANTED BY supabase_admin;
GRANT pg_monitor TO postgres GRANTED BY supabase_admin;
GRANT pg_read_all_data TO supabase_read_only_user GRANTED BY postgres;
GRANT pgsodium_keyholder TO pgsodium_keymaker GRANTED BY supabase_admin;
GRANT pgsodium_keyholder TO postgres WITH ADMIN OPTION GRANTED BY supabase_admin;
GRANT pgsodium_keyholder TO service_role GRANTED BY supabase_admin;
GRANT pgsodium_keyiduser TO pgsodium_keyholder GRANTED BY supabase_admin;
GRANT pgsodium_keyiduser TO pgsodium_keymaker GRANTED BY supabase_admin;
GRANT pgsodium_keyiduser TO postgres WITH ADMIN OPTION GRANTED BY supabase_admin;
GRANT pgsodium_keymaker TO postgres WITH ADMIN OPTION GRANTED BY supabase_admin;
GRANT service_role TO authenticator GRANTED BY postgres;
GRANT service_role TO postgres GRANTED BY supabase_admin;
GRANT supabase_auth_admin TO postgres GRANTED BY supabase_admin;
GRANT supabase_realtime_admin TO postgres GRANTED BY supabase_admin;
GRANT supabase_storage_admin TO postgres GRANTED BY supabase_admin;






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.7 (Debian 15.7-1.pgdg110+1)

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
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.7 (Debian 15.7-1.pgdg110+1)

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
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: pgsodium; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA pgsodium;


ALTER SCHEMA pgsodium OWNER TO supabase_admin;

--
-- Name: pgsodium; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgsodium WITH SCHEMA pgsodium;


--
-- Name: EXTENSION pgsodium; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgsodium IS 'Pgsodium is a modern cryptography library for Postgres.';


--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgjwt; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;


--
-- Name: EXTENSION pgjwt; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

    REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
    REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

    GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: postgres
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    RAISE WARNING 'PgBouncer auth request: %', p_usename;

    RETURN QUERY
    SELECT usename::TEXT, passwd::TEXT FROM pg_catalog.pg_shadow
    WHERE usename = p_usename;
END;
$$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or action = 'DELETE'
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
	select string_to_array(name, '/') into _parts;
	select _parts[array_length(_parts,1)] into _filename;
	-- @todo return the last part instead of 2
	return reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[1:array_length(_parts,1)-1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
  v_order_by text;
  v_sort_order text;
begin
  case
    when sortcolumn = 'name' then
      v_order_by = 'name';
    when sortcolumn = 'updated_at' then
      v_order_by = 'updated_at';
    when sortcolumn = 'created_at' then
      v_order_by = 'created_at';
    when sortcolumn = 'last_accessed_at' then
      v_order_by = 'last_accessed_at';
    else
      v_order_by = 'name';
  end case;

  case
    when sortorder = 'asc' then
      v_sort_order = 'asc';
    when sortorder = 'desc' then
      v_sort_order = 'desc';
    else
      v_sort_order = 'asc';
  end case;

  v_order_by = v_order_by || ' ' || v_sort_order;

  return query execute
    'with folders as (
       select path_tokens[$1] as folder
       from storage.objects
         where objects.name ilike $2 || $3 || ''%''
           and bucket_id = $4
           and array_length(objects.path_tokens, 1) <> $1
       group by folder
       order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

--
-- Name: secrets_encrypt_secret_secret(); Type: FUNCTION; Schema: vault; Owner: supabase_admin
--

CREATE FUNCTION vault.secrets_encrypt_secret_secret() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
		BEGIN
		        new.secret = CASE WHEN new.secret IS NULL THEN NULL ELSE
			CASE WHEN new.key_id IS NULL THEN NULL ELSE pg_catalog.encode(
			  pgsodium.crypto_aead_det_encrypt(
				pg_catalog.convert_to(new.secret, 'utf8'),
				pg_catalog.convert_to((new.id::text || new.description::text || new.created_at::text || new.updated_at::text)::text, 'utf8'),
				new.key_id::uuid,
				new.nonce
			  ),
				'base64') END END;
		RETURN new;
		END;
		$$;


ALTER FUNCTION vault.secrets_encrypt_secret_secret() OWNER TO supabase_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: announcement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.announcement (
    id bigint NOT NULL,
    uuid uuid DEFAULT auth.uid(),
    last_name text,
    name text,
    content text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.announcement OWNER TO postgres;

--
-- Name: announcement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.announcement ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.announcement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: calendarAppointment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."calendarAppointment" (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    start_at text,
    end_at text,
    subject text DEFAULT ''::text,
    color text,
    date date,
    faculty text,
    department text,
    principal_teacher text,
    exam_level text
);


ALTER TABLE public."calendarAppointment" OWNER TO postgres;

--
-- Name: calendarAppointment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."calendarAppointment" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."calendarAppointment_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: student_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_list (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    name text,
    last_name text,
    id_number text,
    uuid uuid DEFAULT auth.uid(),
    avatar_url text
);


ALTER TABLE public.student_list OWNER TO postgres;

--
-- Name: student_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.student_list ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.student_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid DEFAULT auth.uid() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    name text,
    last_name text,
    id_number text,
    user_role text,
    email text,
    user_categorie text,
    profile_url text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: TABLE users; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.users IS 'users information';


--
-- Name: COLUMN users.user_categorie; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.user_categorie IS 'it will give you the student speciality or the role of the teacher normal or principal';


--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    id bigint NOT NULL,
    topic text NOT NULL,
    extension text NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE SEQUENCE realtime.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE realtime.messages_id_seq OWNER TO supabase_realtime_admin;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER SEQUENCE realtime.messages_id_seq OWNED BY realtime.messages.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: decrypted_secrets; Type: VIEW; Schema: vault; Owner: supabase_admin
--

CREATE VIEW vault.decrypted_secrets AS
 SELECT secrets.id,
    secrets.name,
    secrets.description,
    secrets.secret,
        CASE
            WHEN (secrets.secret IS NULL) THEN NULL::text
            ELSE
            CASE
                WHEN (secrets.key_id IS NULL) THEN NULL::text
                ELSE convert_from(pgsodium.crypto_aead_det_decrypt(decode(secrets.secret, 'base64'::text), convert_to(((((secrets.id)::text || secrets.description) || (secrets.created_at)::text) || (secrets.updated_at)::text), 'utf8'::name), secrets.key_id, secrets.nonce), 'utf8'::name)
            END
        END AS decrypted_secret,
    secrets.key_id,
    secrets.nonce,
    secrets.created_at,
    secrets.updated_at
   FROM vault.secrets;


ALTER TABLE vault.decrypted_secrets OWNER TO supabase_admin;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages ALTER COLUMN id SET DEFAULT nextval('realtime.messages_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
00000000-0000-0000-0000-000000000000	b7ec871a-f1e5-49f7-9282-776252e439e6	{"action":"user_signedup","actor_id":"3ebc18af-6b0f-4c81-a138-3f9e64713f20","actor_username":"test@test.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2024-04-13 16:39:53.022105+00	
00000000-0000-0000-0000-000000000000	edb48291-2514-44a0-babf-8ef1db5f6ab7	{"action":"login","actor_id":"3ebc18af-6b0f-4c81-a138-3f9e64713f20","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-04-13 16:39:53.02934+00	
00000000-0000-0000-0000-000000000000	7492ea3f-eb7b-41e9-8328-3b2cefdc8c14	{"action":"token_refreshed","actor_id":"3ebc18af-6b0f-4c81-a138-3f9e64713f20","actor_username":"test@test.com","actor_via_sso":false,"log_type":"token"}	2024-04-13 17:39:15.752847+00	
00000000-0000-0000-0000-000000000000	06994947-fb08-4425-9e72-ceed28830514	{"action":"token_revoked","actor_id":"3ebc18af-6b0f-4c81-a138-3f9e64713f20","actor_username":"test@test.com","actor_via_sso":false,"log_type":"token"}	2024-04-13 17:39:15.759948+00	
00000000-0000-0000-0000-000000000000	7e46d616-eebd-4924-9ff7-37b0a699325c	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"test@test.com","user_id":"3ebc18af-6b0f-4c81-a138-3f9e64713f20","user_phone":""}}	2024-04-13 17:43:06.806008+00	
00000000-0000-0000-0000-000000000000	17fa916d-ba6a-4f01-96b4-246847790e3a	{"action":"user_signedup","actor_id":"9015ce76-bd06-4e90-8b2f-b5e1938f872f","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2024-04-13 17:44:00.450959+00	
00000000-0000-0000-0000-000000000000	f57749c5-ca27-4c99-b2d7-9a00ac8a9fa9	{"action":"login","actor_id":"9015ce76-bd06-4e90-8b2f-b5e1938f872f","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-04-13 17:44:00.454771+00	
00000000-0000-0000-0000-000000000000	a8911cc0-29ad-4cc3-bc37-89bfb7c7b363	{"action":"user_repeated_signup","actor_id":"9015ce76-bd06-4e90-8b2f-b5e1938f872f","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-04-13 17:44:51.760269+00	
00000000-0000-0000-0000-000000000000	c5cc9c9d-c5ec-4a28-ba1f-1a30dbb72373	{"action":"login","actor_id":"9015ce76-bd06-4e90-8b2f-b5e1938f872f","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-04-13 17:50:05.508898+00	
00000000-0000-0000-0000-000000000000	11fad715-c4a6-4020-b674-a1ffc0ac68c1	{"action":"login","actor_id":"9015ce76-bd06-4e90-8b2f-b5e1938f872f","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-04-13 17:55:36.875904+00	
00000000-0000-0000-0000-000000000000	13362781-9647-4a39-9f66-060b07fb63b9	{"action":"login","actor_id":"9015ce76-bd06-4e90-8b2f-b5e1938f872f","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-04-13 17:56:14.802402+00	
00000000-0000-0000-0000-000000000000	d572da29-20a9-430e-a05b-9413b993ae4a	{"action":"login","actor_id":"9015ce76-bd06-4e90-8b2f-b5e1938f872f","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-04-13 18:11:58.445445+00	
00000000-0000-0000-0000-000000000000	36708f2b-5d8d-40d0-871b-b843437d6243	{"action":"login","actor_id":"9015ce76-bd06-4e90-8b2f-b5e1938f872f","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-04-13 18:15:04.783629+00	
00000000-0000-0000-0000-000000000000	98b5d392-bca0-4312-ae84-0c52bef338f8	{"action":"token_refreshed","actor_id":"9015ce76-bd06-4e90-8b2f-b5e1938f872f","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-04-13 19:50:06.595036+00	
00000000-0000-0000-0000-000000000000	28cc6f8f-10ee-4f8a-a101-0f5cf647143b	{"action":"token_revoked","actor_id":"9015ce76-bd06-4e90-8b2f-b5e1938f872f","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-04-13 19:50:06.595765+00	
00000000-0000-0000-0000-000000000000	e8582e09-49a5-45bf-bcbf-e97b279daa6f	{"action":"login","actor_id":"9015ce76-bd06-4e90-8b2f-b5e1938f872f","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-04-13 19:50:21.438321+00	
00000000-0000-0000-0000-000000000000	7b561b25-f06f-48f5-836f-de6381179e9c	{"action":"token_refreshed","actor_id":"9015ce76-bd06-4e90-8b2f-b5e1938f872f","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-04-13 20:49:45.918327+00	
00000000-0000-0000-0000-000000000000	a63ed03e-e1e8-4700-8fe0-81be08acc51c	{"action":"token_revoked","actor_id":"9015ce76-bd06-4e90-8b2f-b5e1938f872f","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-04-13 20:49:45.919609+00	
00000000-0000-0000-0000-000000000000	1bb16556-db20-4521-a7ab-21ade04c5378	{"action":"login","actor_id":"9015ce76-bd06-4e90-8b2f-b5e1938f872f","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-04-13 21:00:39.937359+00	
00000000-0000-0000-0000-000000000000	b1258220-f81f-4d04-bfad-e01684a9059e	{"action":"token_refreshed","actor_id":"9015ce76-bd06-4e90-8b2f-b5e1938f872f","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-04-13 22:00:01.251531+00	
00000000-0000-0000-0000-000000000000	db324c89-0532-4a7c-9e88-4f9d771dc7e2	{"action":"token_revoked","actor_id":"9015ce76-bd06-4e90-8b2f-b5e1938f872f","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-04-13 22:00:01.258098+00	
00000000-0000-0000-0000-000000000000	bef04e02-0ac4-4b58-baa3-a0aeeafd7003	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"stt.khaled@gmail.com","user_id":"9015ce76-bd06-4e90-8b2f-b5e1938f872f","user_phone":""}}	2024-04-13 22:01:50.043159+00	
00000000-0000-0000-0000-000000000000	019cb446-aa1a-4fec-bee9-90d0eebb28e2	{"action":"user_signedup","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2024-04-13 22:02:39.309681+00	
00000000-0000-0000-0000-000000000000	6df9f735-3d07-4890-8c21-33cbd95d2252	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-04-13 22:02:39.321603+00	
00000000-0000-0000-0000-000000000000	21a4121f-57b3-4c5f-9642-e9cd5c16449f	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-04-13 22:03:07.130026+00	
00000000-0000-0000-0000-000000000000	585552e3-af5f-416e-8ce6-a0c6e922e566	{"action":"token_refreshed","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-04-13 23:02:34.576399+00	
00000000-0000-0000-0000-000000000000	ba01555b-f4a7-4e38-b254-79706ed462ae	{"action":"token_revoked","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-04-13 23:02:34.579034+00	
00000000-0000-0000-0000-000000000000	6a463eb7-76db-42c9-814b-e0eb30ff04e7	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-04-13 23:20:47.340561+00	
00000000-0000-0000-0000-000000000000	10b08468-1fa0-4857-a1f4-8faf80e0fca4	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-04-13 23:21:27.568498+00	
00000000-0000-0000-0000-000000000000	1c4b9bb2-f432-4fd2-b98d-3299768c0098	{"action":"token_refreshed","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-04-14 17:06:05.11105+00	
00000000-0000-0000-0000-000000000000	d40fdf61-53d5-4005-acc8-57aae8a46b1b	{"action":"token_revoked","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-04-14 17:06:05.132669+00	
00000000-0000-0000-0000-000000000000	89a34626-df61-40bd-ab12-68f95825306e	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-04-14 17:06:35.773563+00	
00000000-0000-0000-0000-000000000000	fefc35d1-1f2a-48fb-90b9-c9d12fd7ee79	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-04-14 17:08:25.288328+00	
00000000-0000-0000-0000-000000000000	3c08921b-c7ee-403d-898b-cad9a76b484f	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-04-14 17:36:15.518823+00	
00000000-0000-0000-0000-000000000000	63a86470-12cc-4e05-81f7-af329ce56851	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-04-14 17:36:18.579471+00	
00000000-0000-0000-0000-000000000000	2f00df3a-d8f6-498b-8630-f5503a3bd26e	{"action":"token_refreshed","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-04-14 21:06:47.196444+00	
00000000-0000-0000-0000-000000000000	35a2e825-a2ec-4ecd-b37b-ae47ae7c6ce8	{"action":"token_revoked","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-04-14 21:06:47.198599+00	
00000000-0000-0000-0000-000000000000	18a673bb-8bd4-4b7f-9bca-155779be7d5f	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-04-14 21:08:59.528326+00	
00000000-0000-0000-0000-000000000000	d66ed7dc-d0e3-4941-9a28-304ca425beb1	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-04-14 21:35:52.747328+00	
00000000-0000-0000-0000-000000000000	2f560b0a-6314-449c-ada1-e816e98c7695	{"action":"token_refreshed","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-04-14 22:35:17.451323+00	
00000000-0000-0000-0000-000000000000	71c10624-8067-4bc6-a961-b1e006588c87	{"action":"token_revoked","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-04-14 22:35:17.451938+00	
00000000-0000-0000-0000-000000000000	fa649a20-8000-4b5a-b179-6ce3e45dd4c0	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-04-28 20:10:47.975674+00	
00000000-0000-0000-0000-000000000000	134e3725-aa23-448b-911f-425f6a151bd4	{"action":"token_refreshed","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-04-29 13:05:56.312162+00	
00000000-0000-0000-0000-000000000000	83dc54ee-fac0-4b69-8588-c468ff73eb07	{"action":"token_revoked","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-04-29 13:05:56.329545+00	
00000000-0000-0000-0000-000000000000	12f1ab58-9652-4516-b79c-53e9ac950354	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 16:43:38.341781+00	
00000000-0000-0000-0000-000000000000	e248df1e-058b-4280-85d1-0b7127a10e1a	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 17:01:08.17956+00	
00000000-0000-0000-0000-000000000000	1b414013-7733-4c3e-8759-b2138620359d	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 17:08:29.35144+00	
00000000-0000-0000-0000-000000000000	112dea7d-c565-4f06-8244-043f50efe918	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 17:20:07.973067+00	
00000000-0000-0000-0000-000000000000	14d80f84-36b5-480d-8f52-b9b78721db50	{"action":"token_refreshed","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-05-03 18:19:36.070042+00	
00000000-0000-0000-0000-000000000000	3136a95a-d404-4a22-b436-94ddd4b49748	{"action":"token_revoked","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-05-03 18:19:36.074831+00	
00000000-0000-0000-0000-000000000000	b2567ecf-33a3-465a-bbb5-51a9bb518de5	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 18:52:55.804953+00	
00000000-0000-0000-0000-000000000000	5efb59cf-125d-49a7-8632-3866bccf0a19	{"action":"logout","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-05-03 18:53:28.044508+00	
00000000-0000-0000-0000-000000000000	0616698e-21c8-4c60-bb82-6a4eaadd75fc	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 18:53:58.618108+00	
00000000-0000-0000-0000-000000000000	27668bee-daa9-4c72-a417-71a0bd31bac3	{"action":"logout","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-05-03 18:55:32.130878+00	
00000000-0000-0000-0000-000000000000	7674c9ff-9e34-43a9-9529-ec47898a384d	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 18:57:04.414687+00	
00000000-0000-0000-0000-000000000000	e5222fe6-0a23-4681-954c-44240ae1c549	{"action":"logout","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-05-03 18:57:07.973315+00	
00000000-0000-0000-0000-000000000000	93e1e64b-b475-4bef-b7ff-69133dc3def6	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 19:02:01.375506+00	
00000000-0000-0000-0000-000000000000	b8d491a1-53ca-4fa5-ab51-b5ab82096141	{"action":"logout","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-05-03 19:02:05.798834+00	
00000000-0000-0000-0000-000000000000	a0592ecd-cdff-44d5-a988-7db03e57820c	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 19:02:17.022349+00	
00000000-0000-0000-0000-000000000000	5251372a-4486-4ec2-bc39-c802b6078ff4	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 19:33:02.439325+00	
00000000-0000-0000-0000-000000000000	509ad073-2e70-4852-ba97-b7b32549ead2	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 19:33:35.459059+00	
00000000-0000-0000-0000-000000000000	a96c169e-61c2-4767-9ea3-152ce3b2b2d9	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 19:33:50.471122+00	
00000000-0000-0000-0000-000000000000	68819762-24ab-4579-bd6f-39bd89942ba3	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 19:34:10.983365+00	
00000000-0000-0000-0000-000000000000	d50a4a6c-0810-40d0-ae98-1e1706839a40	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 19:34:32.049424+00	
00000000-0000-0000-0000-000000000000	ad6ed3f3-8ce9-413f-aad1-77c6e578d8f6	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 19:34:49.815722+00	
00000000-0000-0000-0000-000000000000	a493ab0a-e021-4fdc-906e-b602731d8cc1	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 19:45:49.974241+00	
00000000-0000-0000-0000-000000000000	3e7d8a3b-dd21-4508-8538-4f32773d51c8	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 19:47:41.132373+00	
00000000-0000-0000-0000-000000000000	35e619f7-d55a-412f-8c4e-66a659d7a90c	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 19:48:45.122826+00	
00000000-0000-0000-0000-000000000000	7ebd875d-2404-4212-bc93-aad3496d5ec4	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 19:49:02.846666+00	
00000000-0000-0000-0000-000000000000	08800d47-dd1f-48ff-882b-4269fbfb27aa	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 19:52:37.153444+00	
00000000-0000-0000-0000-000000000000	8ae290cc-1d7a-4f00-ad9f-b1242881955c	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 19:54:12.752065+00	
00000000-0000-0000-0000-000000000000	62999aac-1274-4652-8a0d-2800072b7a77	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 19:55:27.914312+00	
00000000-0000-0000-0000-000000000000	f1b37947-be64-4c80-89c6-7a46b6ed504a	{"action":"logout","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-05-03 19:55:42.249752+00	
00000000-0000-0000-0000-000000000000	2d4f6e5b-6dd3-4ad2-9860-9b518dfd961b	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 19:55:58.666942+00	
00000000-0000-0000-0000-000000000000	7d22de14-ffa8-47f8-8717-a564ce4d5a73	{"action":"logout","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-05-03 19:56:08.202232+00	
00000000-0000-0000-0000-000000000000	851779ab-672f-4b6b-aaac-a0a481fd2fd5	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 19:57:10.831764+00	
00000000-0000-0000-0000-000000000000	01782e2b-aa6d-4e6a-85f0-8ca3db052065	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 19:58:02.600743+00	
00000000-0000-0000-0000-000000000000	46341781-544c-412e-8911-2d0363615a64	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 20:00:32.489249+00	
00000000-0000-0000-0000-000000000000	729913b7-52c3-4f70-8da5-0ae49ce49ffd	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 20:01:14.669991+00	
00000000-0000-0000-0000-000000000000	19855902-1cd5-4743-9e5b-c61c20b89690	{"action":"logout","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-05-03 20:01:56.591927+00	
00000000-0000-0000-0000-000000000000	c109f040-92ad-4e38-ac5c-c04f131a17dd	{"action":"user_signedup","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2024-05-03 20:02:45.89192+00	
00000000-0000-0000-0000-000000000000	415f0626-ec71-44f9-b665-3b7a41793872	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 20:02:45.89602+00	
00000000-0000-0000-0000-000000000000	89f5aeed-d3f5-4de8-81bf-c22a30ecdd11	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 20:03:19.935338+00	
00000000-0000-0000-0000-000000000000	eb4f6041-c6a6-47f4-8364-92ae07abb189	{"action":"logout","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account"}	2024-05-03 20:03:27.417476+00	
00000000-0000-0000-0000-000000000000	03f617f3-ffcf-405c-be66-18a1560f3d0e	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 20:11:38.574477+00	
00000000-0000-0000-0000-000000000000	f048a02e-92bb-406f-a675-46fa89642f13	{"action":"token_refreshed","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-03 21:19:19.638019+00	
00000000-0000-0000-0000-000000000000	e92da9b0-d594-44d0-9cb9-cf9b0784390d	{"action":"token_revoked","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-03 21:19:19.642567+00	
00000000-0000-0000-0000-000000000000	474c9304-9fa2-4256-928e-ca90973d8eea	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 21:21:48.103449+00	
00000000-0000-0000-0000-000000000000	59572096-fb93-4020-b1d1-199ad30c9b7a	{"action":"logout","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-05-03 21:21:55.506696+00	
00000000-0000-0000-0000-000000000000	da69b847-1ebd-443c-baf7-1daf9e61ab2c	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 21:22:09.312065+00	
00000000-0000-0000-0000-000000000000	a8dc2057-401f-4445-bcf5-ab62d201b880	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 22:06:46.579176+00	
00000000-0000-0000-0000-000000000000	8382dd4c-98ac-45dd-9006-37d628d9dcbd	{"action":"logout","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-05-03 22:07:21.348487+00	
00000000-0000-0000-0000-000000000000	06e21775-b5d6-47fd-98aa-e2a6b02e9994	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 22:07:32.49725+00	
00000000-0000-0000-0000-000000000000	2da54a4b-1021-48ea-a059-e5505ca3a481	{"action":"logout","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account"}	2024-05-03 22:08:13.319885+00	
00000000-0000-0000-0000-000000000000	839f8320-4391-44da-9b81-de32dcd306b5	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 22:08:26.503234+00	
00000000-0000-0000-0000-000000000000	08a9b82e-8687-4c33-ba35-581931dfbedf	{"action":"logout","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-05-03 22:09:22.460895+00	
00000000-0000-0000-0000-000000000000	a8e2fd0b-3ca3-4e86-a104-d6335aeaff4c	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 22:09:33.093351+00	
00000000-0000-0000-0000-000000000000	713c6764-afdf-45b8-9000-5f4d081cce0a	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 22:18:45.407868+00	
00000000-0000-0000-0000-000000000000	52c676ad-032a-4f10-bee8-ff8e6798b8cd	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 22:51:59.342809+00	
00000000-0000-0000-0000-000000000000	d9780764-4780-441d-b73d-a3cac11e1049	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 22:53:06.07561+00	
00000000-0000-0000-0000-000000000000	bb69e355-7c6a-424d-b9d9-a037209742f6	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 22:55:09.563498+00	
00000000-0000-0000-0000-000000000000	40917783-f89c-4fe6-b0f3-d49d8ab7eade	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-03 23:01:19.431594+00	
00000000-0000-0000-0000-000000000000	fc73fdb4-9db7-44fa-9e6b-96049f63b6be	{"action":"token_refreshed","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-04 00:00:45.272935+00	
00000000-0000-0000-0000-000000000000	a275b0c8-ade5-40ab-9945-28f616909709	{"action":"token_revoked","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-04 00:00:45.283433+00	
00000000-0000-0000-0000-000000000000	30191cdb-2023-49f2-9d19-e8a298f1fff0	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-04 00:27:35.774669+00	
00000000-0000-0000-0000-000000000000	14e591aa-2059-425a-aa79-5b2fa679ff17	{"action":"token_refreshed","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-04 01:32:03.976824+00	
00000000-0000-0000-0000-000000000000	c9f93976-69c1-45be-9374-38f2b00549ef	{"action":"token_revoked","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-04 01:32:03.9897+00	
00000000-0000-0000-0000-000000000000	5923ebd6-a2c2-4028-9ee7-b70f3f830412	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-04 01:33:03.172247+00	
00000000-0000-0000-0000-000000000000	5f05be74-2a88-4add-b63e-39934d43a5ff	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-04 01:34:20.035471+00	
00000000-0000-0000-0000-000000000000	60dbec77-d5d1-406b-b0e6-7b9a0661c7f9	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-04 02:11:02.535598+00	
00000000-0000-0000-0000-000000000000	f69c57bc-082b-468a-81e3-a84a95981515	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-04 02:23:30.801746+00	
00000000-0000-0000-0000-000000000000	a6ece18e-e2c5-46cb-ac86-40ac08595c52	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-04 02:26:28.244994+00	
00000000-0000-0000-0000-000000000000	2f5ec30f-4f51-4807-9d08-5c120aba233f	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-04 02:28:12.453915+00	
00000000-0000-0000-0000-000000000000	d96d1da1-d07a-427d-a6f3-40c25fa0d2a7	{"action":"token_refreshed","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-05-04 03:27:35.216841+00	
00000000-0000-0000-0000-000000000000	1a8802b0-e880-4e79-a7c9-3a06746a23d9	{"action":"token_revoked","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-05-04 03:27:35.219058+00	
00000000-0000-0000-0000-000000000000	2017ab9c-ddd9-42e6-840c-b657124f8165	{"action":"token_refreshed","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-05-04 04:27:10.403616+00	
00000000-0000-0000-0000-000000000000	c50be117-20e2-4ca3-af3a-95ac0ac34a8c	{"action":"token_revoked","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-05-04 04:27:10.405355+00	
00000000-0000-0000-0000-000000000000	237975b7-1cba-4200-8eae-e1292ca9d6af	{"action":"token_refreshed","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-05-07 21:28:59.420143+00	
00000000-0000-0000-0000-000000000000	60676b74-9e44-41ff-bed7-5d4033903aa1	{"action":"token_revoked","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-05-07 21:28:59.434813+00	
00000000-0000-0000-0000-000000000000	6de93bcc-9f33-4b77-a868-f7a14021f71e	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-07 21:29:11.163601+00	
00000000-0000-0000-0000-000000000000	c0c262af-a15d-40c7-a543-084cc30b0ab2	{"action":"logout","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account"}	2024-05-07 21:29:51.21981+00	
00000000-0000-0000-0000-000000000000	ee81b7ba-4d3e-4163-bdc4-7f7f22404938	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-07 21:30:04.128485+00	
00000000-0000-0000-0000-000000000000	2887fbad-b77f-46b4-8c4b-412bb61dfe35	{"action":"token_refreshed","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-05-07 23:50:41.132793+00	
00000000-0000-0000-0000-000000000000	e2796694-9862-4298-8560-a76248047a39	{"action":"token_revoked","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-05-07 23:50:41.151776+00	
00000000-0000-0000-0000-000000000000	bd2c1a6c-fee9-4dbf-8349-052a48ad4506	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-07 23:50:52.297605+00	
00000000-0000-0000-0000-000000000000	aba7bbac-59dd-4f84-b0c4-3ceec1318da4	{"action":"logout","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-05-08 00:46:43.433653+00	
00000000-0000-0000-0000-000000000000	6b541015-eeef-4e76-8944-e55b81917c0c	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-08 00:46:57.644043+00	
00000000-0000-0000-0000-000000000000	7a5b0a2f-a48d-480d-985a-2e5364a5c51e	{"action":"logout","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account"}	2024-05-08 00:47:09.204368+00	
00000000-0000-0000-0000-000000000000	d2f1730e-3876-4f14-8fdd-cabeb93d8138	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-08 00:47:22.179175+00	
00000000-0000-0000-0000-000000000000	5c680875-5377-441c-b1d0-2509f213e0cb	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-08 01:03:53.097084+00	
00000000-0000-0000-0000-000000000000	7af2c86e-6514-4746-82ed-8c658aaf1623	{"action":"token_refreshed","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-05-08 02:03:18.24397+00	
00000000-0000-0000-0000-000000000000	55b31cf1-a88c-4525-9a99-83b872e09a0a	{"action":"token_revoked","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-05-08 02:03:18.259828+00	
00000000-0000-0000-0000-000000000000	4692bdb9-9500-4f23-b4fd-7e34a8594d34	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-08 21:32:14.965997+00	
00000000-0000-0000-0000-000000000000	1b31633e-8f5c-4536-8cee-fadce84bbf53	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-08 21:34:40.852342+00	
00000000-0000-0000-0000-000000000000	6c93632e-56ea-4a9b-a8c7-c0851f2b3d29	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-08 21:58:45.534276+00	
00000000-0000-0000-0000-000000000000	40dd2fba-b3d5-48ee-80f4-2c801aee1c0d	{"action":"token_refreshed","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-08 22:58:09.70392+00	
00000000-0000-0000-0000-000000000000	e2ea1c72-956c-4f0c-babf-225f72379655	{"action":"token_revoked","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-08 22:58:09.729932+00	
00000000-0000-0000-0000-000000000000	b281052e-2b07-45a0-8118-dd57dac341cf	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-08 23:12:45.920179+00	
00000000-0000-0000-0000-000000000000	0da659ef-28da-4e2a-9a07-51c3cb5d0245	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-08 23:15:03.282354+00	
00000000-0000-0000-0000-000000000000	fc54ae72-5351-4fbb-8a98-4aea7bc27b9b	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-08 23:30:23.733818+00	
00000000-0000-0000-0000-000000000000	dee2287b-fa25-4622-b1fd-cf77372ba158	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-08 23:47:40.708507+00	
00000000-0000-0000-0000-000000000000	714d6071-6da3-49b6-b2ef-d3763779e62b	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-09 00:26:04.618247+00	
00000000-0000-0000-0000-000000000000	1823d136-45de-40e6-a61d-828db8a960bc	{"action":"token_refreshed","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-05-09 01:16:02.859156+00	
00000000-0000-0000-0000-000000000000	fb77ccd1-7e5c-40c1-9dcb-16b8698ca8a3	{"action":"token_revoked","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-05-09 01:16:02.87459+00	
00000000-0000-0000-0000-000000000000	d920de14-b2ed-4a67-8afa-b8e0114d6755	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-09 01:17:11.409927+00	
00000000-0000-0000-0000-000000000000	56f351b9-9247-4ad3-808c-55be6f525abe	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-09 01:27:13.386745+00	
00000000-0000-0000-0000-000000000000	81f10994-aa2b-43c4-a8ef-9e36d9143993	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-09 01:30:15.350155+00	
00000000-0000-0000-0000-000000000000	0296ffcf-94dc-4cca-9adf-fc4baa34bab5	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-09 01:31:03.452179+00	
00000000-0000-0000-0000-000000000000	8608c5fd-6773-4834-bffe-3560bb8f8294	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-09 01:50:53.668331+00	
00000000-0000-0000-0000-000000000000	d9a120e3-1df1-40eb-bf5d-d511b4c78e3e	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-09 01:59:07.180204+00	
00000000-0000-0000-0000-000000000000	9f411d9b-b6e6-4e67-85f9-b78f78986094	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-09 02:47:03.945447+00	
00000000-0000-0000-0000-000000000000	8c68b405-f00c-4179-9473-bcd302dd9143	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-09 02:57:43.829332+00	
00000000-0000-0000-0000-000000000000	7ee1ee27-98f0-4895-a2e6-f8ddf0c1b221	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-09 02:58:45.074913+00	
00000000-0000-0000-0000-000000000000	e995bd41-3d6f-42ff-b445-e45dd29a590e	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-09 03:00:40.683039+00	
00000000-0000-0000-0000-000000000000	d1f756dc-fc57-41bd-914d-7b61cff44e4f	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-09 03:02:05.998947+00	
00000000-0000-0000-0000-000000000000	cd1483f7-b7d6-4936-8d84-cafc23c44b5c	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-09 03:11:06.756538+00	
00000000-0000-0000-0000-000000000000	543da33c-6a35-4d96-83c3-9032ac2220af	{"action":"token_refreshed","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-09 21:37:21.515373+00	
00000000-0000-0000-0000-000000000000	df2143ea-4d0e-4a57-b25d-046dbf0de871	{"action":"token_revoked","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-09 21:37:21.537055+00	
00000000-0000-0000-0000-000000000000	4089fbea-51ec-4474-b591-73358df45b2e	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-09 21:37:51.139353+00	
00000000-0000-0000-0000-000000000000	be014589-6ac9-44ce-9684-efea4a032095	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-09 22:03:41.441555+00	
00000000-0000-0000-0000-000000000000	5c4a271e-e5d8-4add-8937-f5f8b91c6635	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-09 22:05:44.706467+00	
00000000-0000-0000-0000-000000000000	1834b108-10ce-4a56-ada9-5a1522a07c88	{"action":"token_refreshed","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-09 23:05:12.182799+00	
00000000-0000-0000-0000-000000000000	72b2af99-7b0b-4755-829b-cb9f5fe462be	{"action":"token_revoked","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-09 23:05:12.203027+00	
00000000-0000-0000-0000-000000000000	733c907a-b3f2-4ddd-9e9a-c2f79e3ff360	{"action":"token_refreshed","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-10 00:04:41.912548+00	
00000000-0000-0000-0000-000000000000	b864ed75-af52-4c79-a48d-ee570f199d9a	{"action":"token_revoked","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-10 00:04:41.920333+00	
00000000-0000-0000-0000-000000000000	5fe8644b-6ffe-49f0-a1d7-723dc832cf6f	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-10 00:13:18.04995+00	
00000000-0000-0000-0000-000000000000	4c1e38d4-9a1d-4762-bbbd-8bd30a994a15	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-10 00:19:39.522848+00	
00000000-0000-0000-0000-000000000000	4edfa37a-8eac-4e29-a07b-8c76cfc21133	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-10 00:23:35.098285+00	
00000000-0000-0000-0000-000000000000	307caa00-8deb-4685-a484-50765b9ecd52	{"action":"token_refreshed","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-10 01:31:12.507962+00	
00000000-0000-0000-0000-000000000000	525b23c9-4dbc-4eef-9f68-4ecf4421d3c4	{"action":"token_revoked","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-10 01:31:12.513904+00	
00000000-0000-0000-0000-000000000000	5a3fdfe9-95fd-4f85-9a63-b2cf70c6abf3	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-10 01:46:57.380174+00	
00000000-0000-0000-0000-000000000000	75143f7f-fc89-4ab0-a56c-bc0f50960eab	{"action":"token_refreshed","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-10 02:46:27.855762+00	
00000000-0000-0000-0000-000000000000	379a2dff-8356-43cb-bc2d-834ede75940b	{"action":"token_revoked","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-10 02:46:27.859902+00	
00000000-0000-0000-0000-000000000000	b23ea621-45ce-4547-bf11-9b6a96964512	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-10 02:46:27.927355+00	
00000000-0000-0000-0000-000000000000	e9e9d9d1-a436-4f2b-92f9-964d3cf22903	{"action":"token_refreshed","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-17 15:06:48.80847+00	
00000000-0000-0000-0000-000000000000	9c9389da-9115-428d-bdbb-fe3bb2563762	{"action":"token_revoked","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-17 15:06:48.83057+00	
00000000-0000-0000-0000-000000000000	69e8cc7b-c876-438a-8440-f325c5e9bd35	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 15:07:14.798164+00	
00000000-0000-0000-0000-000000000000	798978bc-775e-4758-97e9-dd9368e81cc2	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 15:19:30.931178+00	
00000000-0000-0000-0000-000000000000	5953cb48-66ae-43ee-9e88-006b4876db30	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 15:39:33.901645+00	
00000000-0000-0000-0000-000000000000	d21d5b96-3b1c-41a7-9802-4e5e0227ebd4	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 15:45:00.709139+00	
00000000-0000-0000-0000-000000000000	4795a168-7f3d-4b03-98b7-157af4be8e0a	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 15:46:53.414128+00	
00000000-0000-0000-0000-000000000000	d4b91eb0-6b77-4093-99ed-3acfe8d6edd6	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 15:49:16.893986+00	
00000000-0000-0000-0000-000000000000	d5a0cd4d-a3ca-4f4f-8cea-d7ef68b68fcc	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 15:50:55.398234+00	
00000000-0000-0000-0000-000000000000	90f175db-635b-4760-94f2-b6fdce0f2568	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 15:53:21.698494+00	
00000000-0000-0000-0000-000000000000	e17ee004-46c6-4e10-a0a4-87dc1617210c	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 16:00:08.261613+00	
00000000-0000-0000-0000-000000000000	c3224ec1-4f8b-4ffe-bde4-f3793458661e	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 16:02:18.04035+00	
00000000-0000-0000-0000-000000000000	678bd798-d8f6-472e-a8e9-5b747de14ac4	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 16:04:39.850391+00	
00000000-0000-0000-0000-000000000000	44e8f0eb-f233-4897-9b81-7aeb071df40d	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 16:20:18.877806+00	
00000000-0000-0000-0000-000000000000	dd36398c-3425-4de7-9c97-25a4422ec9ad	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 16:28:14.816209+00	
00000000-0000-0000-0000-000000000000	b212e09f-47fc-4d2d-96ff-f8609f4dd744	{"action":"token_refreshed","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-17 17:27:44.584693+00	
00000000-0000-0000-0000-000000000000	b809c0f4-cf99-4834-9d63-84f4848b8854	{"action":"token_revoked","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-17 17:27:44.60278+00	
00000000-0000-0000-0000-000000000000	aacca9df-417e-4e5f-9506-f8e7d3d77f9c	{"action":"token_refreshed","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-17 18:27:12.396078+00	
00000000-0000-0000-0000-000000000000	b1463425-53d1-483b-a28b-eea5169826ba	{"action":"token_revoked","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"token"}	2024-05-17 18:27:12.417531+00	
00000000-0000-0000-0000-000000000000	89fa2dc2-9294-4d9c-ac98-03efc5fa6288	{"action":"logout","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account"}	2024-05-17 18:41:51.480799+00	
00000000-0000-0000-0000-000000000000	03b6e8e3-0dc2-4a13-830f-7028cb426e42	{"action":"user_signedup","actor_id":"6f60f9a0-b528-4727-ac58-1e5473fed6b8","actor_username":"dfj@dj.c","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2024-05-17 18:57:56.024184+00	
00000000-0000-0000-0000-000000000000	78c80385-20b6-4240-8589-a6de83d2b7d4	{"action":"login","actor_id":"6f60f9a0-b528-4727-ac58-1e5473fed6b8","actor_username":"dfj@dj.c","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 18:57:56.051465+00	
00000000-0000-0000-0000-000000000000	b5744cd1-ea1e-4dcf-ab94-a586b4398f4f	{"action":"user_signedup","actor_id":"5de7a4b5-a050-412b-9406-13c05ac5deb3","actor_username":"karoui@karoui.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2024-05-17 19:01:21.737049+00	
00000000-0000-0000-0000-000000000000	b9d006f6-536c-4632-b91c-617c7fddbc3c	{"action":"login","actor_id":"5de7a4b5-a050-412b-9406-13c05ac5deb3","actor_username":"karoui@karoui.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 19:01:21.750458+00	
00000000-0000-0000-0000-000000000000	aa575fdd-79ca-42bf-9ce4-0cd7c7e53ea0	{"action":"logout","actor_id":"5de7a4b5-a050-412b-9406-13c05ac5deb3","actor_username":"karoui@karoui.com","actor_via_sso":false,"log_type":"account"}	2024-05-17 19:45:35.692833+00	
00000000-0000-0000-0000-000000000000	bf035aec-1a22-4c9f-af1c-58f1e7103301	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 19:45:46.285517+00	
00000000-0000-0000-0000-000000000000	b31f565c-62b4-4e6e-8a71-5183faaea0f3	{"action":"logout","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account"}	2024-05-17 19:46:45.634209+00	
00000000-0000-0000-0000-000000000000	e47edb58-f617-43ef-9b17-aa19e472448f	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 19:46:57.424156+00	
00000000-0000-0000-0000-000000000000	92007450-d557-43b4-9296-46ffeb743751	{"action":"logout","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-05-17 20:01:36.014198+00	
00000000-0000-0000-0000-000000000000	92c01ad3-1f29-4e03-88b0-5bc670d1a5a6	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 20:01:47.252741+00	
00000000-0000-0000-0000-000000000000	cb321d54-99a5-4bde-96cf-cb8ee5fd0287	{"action":"logout","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account"}	2024-05-17 20:04:59.552567+00	
00000000-0000-0000-0000-000000000000	34470399-0820-4b6b-a23b-bfd62b8a2094	{"action":"login","actor_id":"5de7a4b5-a050-412b-9406-13c05ac5deb3","actor_username":"karoui@karoui.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 20:05:09.80509+00	
00000000-0000-0000-0000-000000000000	49ce2f66-3564-43bf-b3a8-2d653cc5fd8e	{"action":"logout","actor_id":"5de7a4b5-a050-412b-9406-13c05ac5deb3","actor_username":"karoui@karoui.com","actor_via_sso":false,"log_type":"account"}	2024-05-17 20:55:43.197728+00	
00000000-0000-0000-0000-000000000000	d1bb2ea6-873c-4460-beb5-6595a2068f33	{"action":"user_signedup","actor_id":"1aec828b-701f-48c6-a21d-a968cff794b7","actor_username":"test@test.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2024-05-17 21:07:43.265484+00	
00000000-0000-0000-0000-000000000000	ff07ed63-7a61-40f6-ad26-528b0412ffa2	{"action":"login","actor_id":"1aec828b-701f-48c6-a21d-a968cff794b7","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 21:07:43.298939+00	
00000000-0000-0000-0000-000000000000	ad61d939-50e9-414d-82ee-4842ae9e142b	{"action":"logout","actor_id":"1aec828b-701f-48c6-a21d-a968cff794b7","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account"}	2024-05-17 21:08:29.666622+00	
00000000-0000-0000-0000-000000000000	a520d03a-e9ff-4f9d-854e-783b5b52e5c8	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 21:08:37.574536+00	
00000000-0000-0000-0000-000000000000	a375c3e1-a820-464d-9677-b4319c61eea0	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 21:37:32.27708+00	
00000000-0000-0000-0000-000000000000	9aabda38-e745-49c5-bff1-08f54f874254	{"action":"logout","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account"}	2024-05-17 21:45:47.59418+00	
00000000-0000-0000-0000-000000000000	056df0f0-d847-4534-8d0a-64e062252826	{"action":"user_signedup","actor_id":"d88ada64-2299-4b96-91af-f7e689518875","actor_username":"how@how.how","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2024-05-17 21:53:18.400711+00	
00000000-0000-0000-0000-000000000000	1d08de0e-29ee-4d24-9361-729a1746e9ea	{"action":"login","actor_id":"d88ada64-2299-4b96-91af-f7e689518875","actor_username":"how@how.how","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 21:53:18.41774+00	
00000000-0000-0000-0000-000000000000	a8d62acb-f63d-489e-9ee0-da2899878ca4	{"action":"logout","actor_id":"d88ada64-2299-4b96-91af-f7e689518875","actor_username":"how@how.how","actor_via_sso":false,"log_type":"account"}	2024-05-17 21:53:27.31524+00	
00000000-0000-0000-0000-000000000000	b384446e-ef59-49bc-a04b-4cdbfeb1f855	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 21:53:39.380269+00	
00000000-0000-0000-0000-000000000000	9949eb64-575d-4007-9d0d-1d74acaa9c01	{"action":"logout","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account"}	2024-05-17 21:58:27.821811+00	
00000000-0000-0000-0000-000000000000	e48420fa-c79d-4fa7-b697-483b07912285	{"action":"login","actor_id":"1aec828b-701f-48c6-a21d-a968cff794b7","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 21:58:40.381178+00	
00000000-0000-0000-0000-000000000000	c2f48430-3784-4b72-ada3-b113d7ed09e6	{"action":"logout","actor_id":"1aec828b-701f-48c6-a21d-a968cff794b7","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account"}	2024-05-17 22:04:36.156755+00	
00000000-0000-0000-0000-000000000000	49ac4cec-a430-4b56-a463-472b63b11dde	{"action":"login","actor_id":"d88ada64-2299-4b96-91af-f7e689518875","actor_username":"how@how.how","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 22:04:58.672043+00	
00000000-0000-0000-0000-000000000000	e3799373-d768-445a-959b-132ddd656d75	{"action":"token_refreshed","actor_id":"d88ada64-2299-4b96-91af-f7e689518875","actor_username":"how@how.how","actor_via_sso":false,"log_type":"token"}	2024-05-17 23:04:26.771348+00	
00000000-0000-0000-0000-000000000000	ecc7c8cc-16ad-4bb1-8774-27e0c6ce35b6	{"action":"token_revoked","actor_id":"d88ada64-2299-4b96-91af-f7e689518875","actor_username":"how@how.how","actor_via_sso":false,"log_type":"token"}	2024-05-17 23:04:26.798128+00	
00000000-0000-0000-0000-000000000000	ccd9c2e7-e159-448e-9646-a161301dc4ac	{"action":"login","actor_id":"d88ada64-2299-4b96-91af-f7e689518875","actor_username":"how@how.how","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 23:11:20.642559+00	
00000000-0000-0000-0000-000000000000	c6881da7-fbba-40a3-87fc-02b9ac6f6720	{"action":"login","actor_id":"d88ada64-2299-4b96-91af-f7e689518875","actor_username":"how@how.how","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-17 23:18:28.29371+00	
00000000-0000-0000-0000-000000000000	a006de61-dbaf-4c8c-a463-17b5903862cb	{"action":"token_refreshed","actor_id":"d88ada64-2299-4b96-91af-f7e689518875","actor_username":"how@how.how","actor_via_sso":false,"log_type":"token"}	2024-05-18 00:17:52.174838+00	
00000000-0000-0000-0000-000000000000	44b39ae3-946c-43d4-8e76-408f9340151c	{"action":"token_revoked","actor_id":"d88ada64-2299-4b96-91af-f7e689518875","actor_username":"how@how.how","actor_via_sso":false,"log_type":"token"}	2024-05-18 00:17:52.190724+00	
00000000-0000-0000-0000-000000000000	1f00975a-7064-490b-9570-937f89a2585d	{"action":"logout","actor_id":"d88ada64-2299-4b96-91af-f7e689518875","actor_username":"how@how.how","actor_via_sso":false,"log_type":"account"}	2024-05-18 00:46:17.791008+00	
00000000-0000-0000-0000-000000000000	5bab77c6-15da-461e-b323-7b0cda217f31	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-18 00:46:27.824979+00	
00000000-0000-0000-0000-000000000000	d7fd0617-fe50-4878-8b75-eb180f9ff793	{"action":"logout","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account"}	2024-05-18 01:15:59.743363+00	
00000000-0000-0000-0000-000000000000	3a0608a1-8f49-4595-a687-89200c8afa48	{"action":"login","actor_id":"5de7a4b5-a050-412b-9406-13c05ac5deb3","actor_username":"karoui@karoui.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-18 01:16:08.736506+00	
00000000-0000-0000-0000-000000000000	4dcf4fee-ad76-4185-9319-a3b756fcb753	{"action":"logout","actor_id":"5de7a4b5-a050-412b-9406-13c05ac5deb3","actor_username":"karoui@karoui.com","actor_via_sso":false,"log_type":"account"}	2024-05-18 01:17:11.197478+00	
00000000-0000-0000-0000-000000000000	a33ad0c3-cb12-4cdd-93b9-8c814cd6d14b	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-18 01:22:32.368971+00	
00000000-0000-0000-0000-000000000000	73225afa-ecc5-4078-93dd-5664867d0b8f	{"action":"logout","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-05-18 01:22:35.69442+00	
00000000-0000-0000-0000-000000000000	75a0171d-f068-46d4-8f2f-407803240561	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-18 01:23:28.176028+00	
00000000-0000-0000-0000-000000000000	f8ac4de2-f667-47fb-9fdc-4dda52367acc	{"action":"logout","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account"}	2024-05-18 01:23:33.761798+00	
00000000-0000-0000-0000-000000000000	830e7e5e-5720-47b3-97a0-cb8abccbf31a	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-18 01:30:43.849059+00	
00000000-0000-0000-0000-000000000000	5d0de276-a6f3-40da-9083-27c82f1c305e	{"action":"logout","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-05-18 01:30:52.433647+00	
00000000-0000-0000-0000-000000000000	691f9ab1-c043-44d9-9b67-9c65ea9409fe	{"action":"user_signedup","actor_id":"44f73b43-19e0-41e7-be05-b92bfde54684","actor_username":"lkj@klj.cj","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2024-05-18 01:42:39.792837+00	
00000000-0000-0000-0000-000000000000	76e89c7c-a336-4290-afb4-9ff5f5394ea7	{"action":"login","actor_id":"44f73b43-19e0-41e7-be05-b92bfde54684","actor_username":"lkj@klj.cj","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-18 01:42:39.824996+00	
00000000-0000-0000-0000-000000000000	9a5ebde1-bc0f-4da3-9e1f-503e87857c64	{"action":"logout","actor_id":"44f73b43-19e0-41e7-be05-b92bfde54684","actor_username":"lkj@klj.cj","actor_via_sso":false,"log_type":"account"}	2024-05-18 01:43:08.718153+00	
00000000-0000-0000-0000-000000000000	2c10a44f-5f50-40f5-8cd3-173ef2bbf025	{"action":"user_signedup","actor_id":"6fbabc92-a706-43f9-88de-c4bd774ccd56","actor_username":"badrou@badrou.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2024-05-18 01:52:51.489464+00	
00000000-0000-0000-0000-000000000000	4caa4424-ca5b-4756-8b46-da560330c89b	{"action":"login","actor_id":"6fbabc92-a706-43f9-88de-c4bd774ccd56","actor_username":"badrou@badrou.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-18 01:52:51.519214+00	
00000000-0000-0000-0000-000000000000	6e02ad24-d71b-4728-b45a-f062b0b63ee1	{"action":"logout","actor_id":"6fbabc92-a706-43f9-88de-c4bd774ccd56","actor_username":"badrou@badrou.com","actor_via_sso":false,"log_type":"account"}	2024-05-18 01:53:58.68666+00	
00000000-0000-0000-0000-000000000000	49aeff85-5766-44a2-954b-a4c09285e8b4	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-18 01:54:07.183289+00	
00000000-0000-0000-0000-000000000000	b38d6b0c-8ec5-4763-b876-19e3c75a69a4	{"action":"logout","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account"}	2024-05-18 01:56:19.062744+00	
00000000-0000-0000-0000-000000000000	6bccb7da-4d4f-4691-9592-b91aa45056c8	{"action":"login","actor_id":"5de7a4b5-a050-412b-9406-13c05ac5deb3","actor_username":"karoui@karoui.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-18 01:56:32.472622+00	
00000000-0000-0000-0000-000000000000	108cca55-6333-4184-94f2-ad19653e4291	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-18 02:36:57.246938+00	
00000000-0000-0000-0000-000000000000	13752b70-6e60-43d2-984d-d9ef1644d887	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-18 02:40:09.694982+00	
00000000-0000-0000-0000-000000000000	c537f5c5-fb51-457b-b71b-c7ffbdee6614	{"action":"logout","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account"}	2024-05-18 02:42:43.390973+00	
00000000-0000-0000-0000-000000000000	16944993-5e38-4a82-826b-224554794a32	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-18 02:44:37.927671+00	
00000000-0000-0000-0000-000000000000	08ee96b9-51d8-4907-ba61-96a2468abf04	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-18 03:10:53.824498+00	
00000000-0000-0000-0000-000000000000	8f029738-1dcb-4410-9ead-4ab48e1eae23	{"action":"login","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-18 03:12:56.432052+00	
00000000-0000-0000-0000-000000000000	5dd061a3-a114-4a7c-8c31-34358a49773e	{"action":"logout","actor_id":"60e44e8c-a3fb-43ab-92a2-97806af7b62c","actor_username":"nabet@nabet.com","actor_via_sso":false,"log_type":"account"}	2024-05-18 03:13:39.541389+00	
00000000-0000-0000-0000-000000000000	a0195c5b-c3f2-46eb-a8e3-bb638716bde1	{"action":"logout","actor_id":"0b87fed4-2707-45be-8c13-cd26d1012650","actor_username":"end@end.end","actor_via_sso":false,"log_type":"account"}	2024-05-18 03:36:29.922901+00	
00000000-0000-0000-0000-000000000000	300e766e-0a72-4131-b53b-75c1df4fbbd1	{"action":"login","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-18 03:19:14.182687+00	
00000000-0000-0000-0000-000000000000	dd90ebdc-6341-4ff5-b921-d60220bc04e3	{"action":"user_repeated_signup","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-05-18 03:20:12.781369+00	
00000000-0000-0000-0000-000000000000	296f1cc2-bdc4-43dd-9488-042ee3cce0d0	{"action":"user_repeated_signup","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-05-18 03:20:18.080113+00	
00000000-0000-0000-0000-000000000000	1aa0d6fd-8084-414d-8f6a-d904f7c1753e	{"action":"user_repeated_signup","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-05-18 03:20:25.318198+00	
00000000-0000-0000-0000-000000000000	094a38d7-e0a8-4306-a502-b16b3945ba41	{"action":"user_repeated_signup","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-05-18 03:20:30.819678+00	
00000000-0000-0000-0000-000000000000	e9e537a2-b1f1-44e9-bfb6-5307c135b908	{"action":"user_repeated_signup","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-05-18 03:20:49.74023+00	
00000000-0000-0000-0000-000000000000	4c5a2f11-f21d-4144-9477-6ab70ee61578	{"action":"user_repeated_signup","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-05-18 03:20:59.264379+00	
00000000-0000-0000-0000-000000000000	cb510035-41c6-42a9-9c38-2046fdf7b781	{"action":"user_repeated_signup","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-05-18 03:21:27.757618+00	
00000000-0000-0000-0000-000000000000	c5325184-4fde-467f-9f69-4f9a71258a3a	{"action":"user_signedup","actor_id":"bac48432-f3eb-4950-9ae0-6158e7d4f91c","actor_username":"khaled.21.02.2000@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2024-05-18 03:21:58.550431+00	
00000000-0000-0000-0000-000000000000	db11de60-5f8b-4f10-bfbe-4337ba6054d2	{"action":"login","actor_id":"bac48432-f3eb-4950-9ae0-6158e7d4f91c","actor_username":"khaled.21.02.2000@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-18 03:21:58.577376+00	
00000000-0000-0000-0000-000000000000	fcfcf3d4-6adb-425d-9b37-5594c67dbc51	{"action":"logout","actor_id":"bac48432-f3eb-4950-9ae0-6158e7d4f91c","actor_username":"khaled.21.02.2000@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-05-18 03:22:07.141776+00	
00000000-0000-0000-0000-000000000000	36b8ca40-d96d-408a-b108-19d48d582a65	{"action":"user_repeated_signup","actor_id":"1aec828b-701f-48c6-a21d-a968cff794b7","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-05-18 03:22:39.737358+00	
00000000-0000-0000-0000-000000000000	7e8b24ad-b54f-4956-80eb-8b6b46e6a3ab	{"action":"user_repeated_signup","actor_id":"1aec828b-701f-48c6-a21d-a968cff794b7","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-05-18 03:22:52.368103+00	
00000000-0000-0000-0000-000000000000	46de20ea-8211-4869-a692-b149f54f5f10	{"action":"user_repeated_signup","actor_id":"1aec828b-701f-48c6-a21d-a968cff794b7","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-05-18 03:23:23.983684+00	
00000000-0000-0000-0000-000000000000	cf85059b-6691-4d62-a05f-73e02b911747	{"action":"user_repeated_signup","actor_id":"1aec828b-701f-48c6-a21d-a968cff794b7","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-05-18 03:23:42.695985+00	
00000000-0000-0000-0000-000000000000	73f9e190-b4c9-4b69-b9c5-6d464938cf62	{"action":"user_repeated_signup","actor_id":"1aec828b-701f-48c6-a21d-a968cff794b7","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-05-18 03:24:15.345976+00	
00000000-0000-0000-0000-000000000000	621e0edb-ad0e-499a-be4d-48519f9cf92e	{"action":"user_repeated_signup","actor_id":"1aec828b-701f-48c6-a21d-a968cff794b7","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-05-18 03:24:53.149448+00	
00000000-0000-0000-0000-000000000000	8d00e98c-24d6-40f0-ab0d-883578a116dc	{"action":"user_repeated_signup","actor_id":"1aec828b-701f-48c6-a21d-a968cff794b7","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-05-18 03:25:05.720348+00	
00000000-0000-0000-0000-000000000000	7be1ada3-cc05-48a3-bfec-fba62f36896e	{"action":"user_repeated_signup","actor_id":"1aec828b-701f-48c6-a21d-a968cff794b7","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-05-18 03:26:14.641233+00	
00000000-0000-0000-0000-000000000000	c8f7c659-39b4-4b94-ba7f-219d69d122bc	{"action":"user_signedup","actor_id":"58e3b4b2-1a6e-4d34-becf-cf1217ac948d","actor_username":"test@tesst.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2024-05-18 03:26:58.531218+00	
00000000-0000-0000-0000-000000000000	9b52f53b-6919-4669-bfc8-d43d2f3665c2	{"action":"login","actor_id":"58e3b4b2-1a6e-4d34-becf-cf1217ac948d","actor_username":"test@tesst.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-18 03:26:58.540331+00	
00000000-0000-0000-0000-000000000000	5cb9d8ea-082f-4c8b-b721-e0d56e08bc6f	{"action":"logout","actor_id":"58e3b4b2-1a6e-4d34-becf-cf1217ac948d","actor_username":"test@tesst.com","actor_via_sso":false,"log_type":"account"}	2024-05-18 03:27:08.372929+00	
00000000-0000-0000-0000-000000000000	1601ff2d-c7f6-4487-93a4-1936c85a8a38	{"action":"user_signedup","actor_id":"8bfb70a6-1f3e-4316-a580-7c486a40c679","actor_username":"end@end.co","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2024-05-18 03:27:48.257487+00	
00000000-0000-0000-0000-000000000000	b6ae49cf-8df2-425a-adcf-cee8725fe408	{"action":"login","actor_id":"8bfb70a6-1f3e-4316-a580-7c486a40c679","actor_username":"end@end.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-18 03:27:48.264701+00	
00000000-0000-0000-0000-000000000000	f76d991a-ff2b-44cb-95dd-4817a716c851	{"action":"logout","actor_id":"8bfb70a6-1f3e-4316-a580-7c486a40c679","actor_username":"end@end.co","actor_via_sso":false,"log_type":"account"}	2024-05-18 03:27:52.091298+00	
00000000-0000-0000-0000-000000000000	111d4e28-4097-48b5-8e65-25993a4543db	{"action":"user_signedup","actor_id":"0b87fed4-2707-45be-8c13-cd26d1012650","actor_username":"end@end.end","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2024-05-18 03:28:54.677983+00	
00000000-0000-0000-0000-000000000000	5333e66e-35e6-4443-bb49-bbabfbbc5558	{"action":"login","actor_id":"0b87fed4-2707-45be-8c13-cd26d1012650","actor_username":"end@end.end","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-18 03:28:54.691978+00	
00000000-0000-0000-0000-000000000000	f565bf99-199e-4a8a-a257-f5dcc6a75cae	{"action":"logout","actor_id":"0b87fed4-2707-45be-8c13-cd26d1012650","actor_username":"end@end.end","actor_via_sso":false,"log_type":"account"}	2024-05-18 03:29:08.375402+00	
00000000-0000-0000-0000-000000000000	a33f46ea-a821-4f77-a5b3-80996ded57db	{"action":"login","actor_id":"bac48432-f3eb-4950-9ae0-6158e7d4f91c","actor_username":"khaled.21.02.2000@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-18 03:29:15.778499+00	
00000000-0000-0000-0000-000000000000	cdb0dc0d-d1c5-4956-9392-0d383f7d3622	{"action":"logout","actor_id":"bac48432-f3eb-4950-9ae0-6158e7d4f91c","actor_username":"khaled.21.02.2000@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-05-18 03:35:13.049955+00	
00000000-0000-0000-0000-000000000000	927a9683-a870-435d-8c1f-74dc665fb73a	{"action":"login","actor_id":"0b87fed4-2707-45be-8c13-cd26d1012650","actor_username":"end@end.end","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-18 03:35:34.791422+00	
00000000-0000-0000-0000-000000000000	d11afca9-0f75-4f4a-880a-ddded81c0ee3	{"action":"login","actor_id":"bac48432-f3eb-4950-9ae0-6158e7d4f91c","actor_username":"khaled.21.02.2000@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-18 03:40:45.001538+00	
00000000-0000-0000-0000-000000000000	3035c8ab-bfe0-4b5b-9117-60e238d2e1bb	{"action":"logout","actor_id":"bac48432-f3eb-4950-9ae0-6158e7d4f91c","actor_username":"khaled.21.02.2000@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-05-18 03:43:09.810476+00	
00000000-0000-0000-0000-000000000000	813f3be4-3c53-4037-a397-833a7b4c2440	{"action":"token_refreshed","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-05-18 19:08:25.461611+00	
00000000-0000-0000-0000-000000000000	fb37048e-459a-43b2-9eb8-681dc75b5ca6	{"action":"token_revoked","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-05-18 19:08:25.485818+00	
00000000-0000-0000-0000-000000000000	0647c72b-bf68-4fa5-851c-628e833f44ab	{"action":"login","actor_id":"bac48432-f3eb-4950-9ae0-6158e7d4f91c","actor_username":"khaled.21.02.2000@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-20 18:35:37.361453+00	
00000000-0000-0000-0000-000000000000	669027ba-1c11-40c7-8516-d9576a31f71a	{"action":"token_refreshed","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-05-23 20:00:26.652148+00	
00000000-0000-0000-0000-000000000000	61c91d07-b398-43a2-b31f-7c9caa2a5c4e	{"action":"token_revoked","actor_id":"fd43e516-7cde-41bc-b6d5-f10c54458bc2","actor_username":"stt.khaled@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-05-23 20:00:26.668831+00	
00000000-0000-0000-0000-000000000000	ab0e6891-3198-4978-b1fa-b83c75f63f3d	{"action":"user_signedup","actor_id":"f934f44e-7c01-4891-9865-710573c3b2c8","actor_username":"karim@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2024-05-23 20:01:39.092754+00	
00000000-0000-0000-0000-000000000000	19f22d22-3a2b-486d-b55b-0f58fe18ef65	{"action":"login","actor_id":"f934f44e-7c01-4891-9865-710573c3b2c8","actor_username":"karim@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-23 20:01:39.110888+00	
00000000-0000-0000-0000-000000000000	93606337-3ee8-4a01-b0e3-bf693376ed1e	{"action":"login","actor_id":"f934f44e-7c01-4891-9865-710573c3b2c8","actor_username":"karim@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-23 20:10:58.54006+00	
00000000-0000-0000-0000-000000000000	f8584a45-a486-4f62-8c08-0ecd6bf873c6	{"action":"logout","actor_id":"f934f44e-7c01-4891-9865-710573c3b2c8","actor_username":"karim@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-05-23 20:16:31.815428+00	
00000000-0000-0000-0000-000000000000	baa7a4c1-2103-4560-8222-929985cfa1fa	{"action":"login","actor_id":"0b87fed4-2707-45be-8c13-cd26d1012650","actor_username":"end@end.end","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-23 20:17:16.507184+00	
00000000-0000-0000-0000-000000000000	a47471e4-e557-4c93-ae0a-fb126ecdcb50	{"action":"logout","actor_id":"0b87fed4-2707-45be-8c13-cd26d1012650","actor_username":"end@end.end","actor_via_sso":false,"log_type":"account"}	2024-05-23 20:19:48.275969+00	
00000000-0000-0000-0000-000000000000	1ae19a97-c0a6-4347-8ca1-a562cafcecee	{"action":"login","actor_id":"f934f44e-7c01-4891-9865-710573c3b2c8","actor_username":"karim@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-23 20:20:14.387653+00	
00000000-0000-0000-0000-000000000000	8bded74b-4023-4ab1-ba8c-d0ce67813006	{"action":"logout","actor_id":"f934f44e-7c01-4891-9865-710573c3b2c8","actor_username":"karim@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-05-23 20:26:51.642566+00	
00000000-0000-0000-0000-000000000000	4654e35f-025d-4d73-8f04-5d0c7054b915	{"action":"user_signedup","actor_id":"4bf92899-c5a6-45c5-b75e-166ca779e5f8","actor_username":"ali@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2024-05-23 20:30:22.90349+00	
00000000-0000-0000-0000-000000000000	7eb496a1-d933-4183-b5d1-afc968694026	{"action":"login","actor_id":"4bf92899-c5a6-45c5-b75e-166ca779e5f8","actor_username":"ali@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-05-23 20:30:22.933343+00	
00000000-0000-0000-0000-000000000000	092326ba-f559-4b30-be87-c064c74cada7	{"action":"logout","actor_id":"4bf92899-c5a6-45c5-b75e-166ca779e5f8","actor_username":"ali@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-05-23 20:34:25.577068+00	
00000000-0000-0000-0000-000000000000	46f909c6-3724-4b44-9d34-a8d9208daee2	{"action":"login","actor_id":"f934f44e-7c01-4891-9865-710573c3b2c8","actor_username":"karim@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-06-09 11:56:16.061973+00	
00000000-0000-0000-0000-000000000000	77bef368-4172-42ba-8500-2ec73ab67a0e	{"action":"logout","actor_id":"f934f44e-7c01-4891-9865-710573c3b2c8","actor_username":"karim@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-06-09 12:00:47.22881+00	
00000000-0000-0000-0000-000000000000	3f55ba0c-197d-4986-b906-96ab780d041a	{"action":"user_signedup","actor_id":"87c41a23-24ea-4a88-bbb8-fe3e7973b2ae","actor_username":"ali.derdour@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2024-06-21 21:51:02.382759+00	
00000000-0000-0000-0000-000000000000	5d4c5ee3-2717-4508-b8a8-db4007e8f38d	{"action":"login","actor_id":"87c41a23-24ea-4a88-bbb8-fe3e7973b2ae","actor_username":"ali.derdour@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-06-21 21:51:02.390246+00	
00000000-0000-0000-0000-000000000000	61f307ee-93a6-44df-a6b9-59d65450b064	{"action":"logout","actor_id":"87c41a23-24ea-4a88-bbb8-fe3e7973b2ae","actor_username":"ali.derdour@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-06-21 21:54:33.13648+00	
00000000-0000-0000-0000-000000000000	41966ba6-5da0-460a-b84e-3f35eb4267ab	{"action":"login","actor_id":"58e3b4b2-1a6e-4d34-becf-cf1217ac948d","actor_username":"test@tesst.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-06-21 21:56:09.267516+00	
00000000-0000-0000-0000-000000000000	2377d5af-63b1-410a-9248-6db922d6c8eb	{"action":"logout","actor_id":"58e3b4b2-1a6e-4d34-becf-cf1217ac948d","actor_username":"test@tesst.com","actor_via_sso":false,"log_type":"account"}	2024-06-21 21:57:02.190798+00	
00000000-0000-0000-0000-000000000000	4877e7c3-e04d-46f1-9019-319351b49803	{"action":"login","actor_id":"87c41a23-24ea-4a88-bbb8-fe3e7973b2ae","actor_username":"ali.derdour@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-06-21 21:57:26.698073+00	
00000000-0000-0000-0000-000000000000	b76ece40-3ef2-445e-bd78-8d58ad86c90c	{"action":"login","actor_id":"87c41a23-24ea-4a88-bbb8-fe3e7973b2ae","actor_username":"ali.derdour@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-06-21 21:59:47.976844+00	
00000000-0000-0000-0000-000000000000	845cf7c2-da86-4a3b-9e18-8e2051f5f117	{"action":"logout","actor_id":"87c41a23-24ea-4a88-bbb8-fe3e7973b2ae","actor_username":"ali.derdour@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-06-21 22:00:22.540464+00	
00000000-0000-0000-0000-000000000000	39f7724d-d1cb-410d-aa4a-be3ded6ad7ff	{"action":"login","actor_id":"87c41a23-24ea-4a88-bbb8-fe3e7973b2ae","actor_username":"ali.derdour@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-06-21 22:00:35.831403+00	
00000000-0000-0000-0000-000000000000	fd743b54-f76b-4d20-ad20-a6f0194f8b1f	{"action":"logout","actor_id":"87c41a23-24ea-4a88-bbb8-fe3e7973b2ae","actor_username":"ali.derdour@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-06-21 22:02:37.209623+00	
00000000-0000-0000-0000-000000000000	1179b322-dd9e-4e9f-a4c1-a98010c26675	{"action":"login","actor_id":"87c41a23-24ea-4a88-bbb8-fe3e7973b2ae","actor_username":"ali.derdour@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-06-21 22:03:04.846855+00	
00000000-0000-0000-0000-000000000000	4e3b9b88-31fd-4d58-abee-7e6abd1b4a1d	{"action":"logout","actor_id":"87c41a23-24ea-4a88-bbb8-fe3e7973b2ae","actor_username":"ali.derdour@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-06-21 22:06:27.971699+00	
00000000-0000-0000-0000-000000000000	8589ddb8-4e3e-4f43-979e-ced136b40699	{"action":"login","actor_id":"87c41a23-24ea-4a88-bbb8-fe3e7973b2ae","actor_username":"ali.derdour@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-06-21 22:06:42.36459+00	
00000000-0000-0000-0000-000000000000	51bc2a60-1ebd-407d-a1d7-02fd3fedd81e	{"action":"login","actor_id":"58e3b4b2-1a6e-4d34-becf-cf1217ac948d","actor_username":"test@tesst.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-06-21 22:07:10.579861+00	
00000000-0000-0000-0000-000000000000	03db3f3a-d60a-404a-b45c-24327bbf5a29	{"action":"token_refreshed","actor_id":"58e3b4b2-1a6e-4d34-becf-cf1217ac948d","actor_username":"test@tesst.com","actor_via_sso":false,"log_type":"token"}	2024-06-24 22:42:31.558162+00	
00000000-0000-0000-0000-000000000000	3328f0a0-75f4-47eb-8185-faacbef93005	{"action":"token_revoked","actor_id":"58e3b4b2-1a6e-4d34-becf-cf1217ac948d","actor_username":"test@tesst.com","actor_via_sso":false,"log_type":"token"}	2024-06-24 22:42:31.564553+00	
00000000-0000-0000-0000-000000000000	fd871841-1869-489b-b1e7-8e52a9d52e7e	{"action":"token_refreshed","actor_id":"58e3b4b2-1a6e-4d34-becf-cf1217ac948d","actor_username":"test@tesst.com","actor_via_sso":false,"log_type":"token"}	2024-06-24 23:46:50.74557+00	
00000000-0000-0000-0000-000000000000	7adc797a-8a61-439b-af07-54df9cc7b90c	{"action":"token_revoked","actor_id":"58e3b4b2-1a6e-4d34-becf-cf1217ac948d","actor_username":"test@tesst.com","actor_via_sso":false,"log_type":"token"}	2024-06-24 23:46:50.749149+00	
00000000-0000-0000-0000-000000000000	688a8d7e-6e61-4182-ae7c-a69c48f86a09	{"action":"user_signedup","actor_id":"01f0935a-60bc-4cb3-b240-3d3b987ce0b3","actor_username":"touiker21@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2024-06-24 23:53:40.909768+00	
00000000-0000-0000-0000-000000000000	28a1c4db-46ee-4fa0-918b-e952386942ae	{"action":"login","actor_id":"01f0935a-60bc-4cb3-b240-3d3b987ce0b3","actor_username":"touiker21@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-06-24 23:53:40.919243+00	
00000000-0000-0000-0000-000000000000	b87b9a88-c8a1-48fd-afa7-9fba5c447363	{"action":"login","actor_id":"01f0935a-60bc-4cb3-b240-3d3b987ce0b3","actor_username":"touiker21@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-06-24 23:55:04.097509+00	
00000000-0000-0000-0000-000000000000	d741d998-bf23-451c-a21b-e398aa50342c	{"action":"logout","actor_id":"01f0935a-60bc-4cb3-b240-3d3b987ce0b3","actor_username":"touiker21@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-06-24 23:56:17.677083+00	
00000000-0000-0000-0000-000000000000	b281b97a-1a0c-4d33-b926-9c1c0b999b65	{"action":"token_refreshed","actor_id":"87c41a23-24ea-4a88-bbb8-fe3e7973b2ae","actor_username":"ali.derdour@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-06-25 10:10:42.4261+00	
00000000-0000-0000-0000-000000000000	fb5a45f4-a7dd-4df8-82cf-2f626aebdadc	{"action":"token_revoked","actor_id":"87c41a23-24ea-4a88-bbb8-fe3e7973b2ae","actor_username":"ali.derdour@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-06-25 10:10:42.441277+00	
00000000-0000-0000-0000-000000000000	9839c564-74a4-4433-95d4-e5a493365058	{"action":"user_signedup","actor_id":"68769cb2-86a4-46e7-96fe-ce3efaba8b8e","actor_username":"dahou21@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2024-06-25 10:12:48.065655+00	
00000000-0000-0000-0000-000000000000	24e7bf2f-0b11-4063-82c8-1bea7d659641	{"action":"login","actor_id":"68769cb2-86a4-46e7-96fe-ce3efaba8b8e","actor_username":"dahou21@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-06-25 10:12:48.075014+00	
00000000-0000-0000-0000-000000000000	c52e5e52-71a7-4a05-88a9-0eac000b234e	{"action":"token_refreshed","actor_id":"68769cb2-86a4-46e7-96fe-ce3efaba8b8e","actor_username":"dahou21@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-06-25 12:08:05.998873+00	
00000000-0000-0000-0000-000000000000	ffe1678e-95af-480b-97da-411f9d5b4570	{"action":"token_revoked","actor_id":"68769cb2-86a4-46e7-96fe-ce3efaba8b8e","actor_username":"dahou21@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-06-25 12:08:06.012196+00	
00000000-0000-0000-0000-000000000000	220e10ea-babd-4789-9825-3ae29cff8fc1	{"action":"login","actor_id":"68769cb2-86a4-46e7-96fe-ce3efaba8b8e","actor_username":"dahou21@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-06-25 12:09:01.559809+00	
00000000-0000-0000-0000-000000000000	bf9b4d86-0579-4797-b454-9bd085d069f6	{"action":"logout","actor_id":"68769cb2-86a4-46e7-96fe-ce3efaba8b8e","actor_username":"dahou21@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-06-25 12:10:15.195424+00	
00000000-0000-0000-0000-000000000000	f8e42544-e7dd-4e6d-a516-90b94951275c	{"action":"login","actor_id":"87c41a23-24ea-4a88-bbb8-fe3e7973b2ae","actor_username":"ali.derdour@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-06-25 12:11:09.791274+00	
00000000-0000-0000-0000-000000000000	156d2947-fd99-4dfb-a43d-0c37b07e081d	{"action":"logout","actor_id":"87c41a23-24ea-4a88-bbb8-fe3e7973b2ae","actor_username":"ali.derdour@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-06-25 12:17:22.076614+00	
00000000-0000-0000-0000-000000000000	a92514da-4206-4ddb-845d-100eebc5d755	{"action":"login","actor_id":"87c41a23-24ea-4a88-bbb8-fe3e7973b2ae","actor_username":"ali.derdour@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-06-25 12:17:42.128298+00	
00000000-0000-0000-0000-000000000000	217a4b57-bffc-4e4f-8331-cd2fe652c274	{"action":"login","actor_id":"68769cb2-86a4-46e7-96fe-ce3efaba8b8e","actor_username":"dahou21@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-06-25 12:19:19.403393+00	
00000000-0000-0000-0000-000000000000	eb70c145-b5ff-4a8c-8b1a-5ac95f323b53	{"action":"login","actor_id":"68769cb2-86a4-46e7-96fe-ce3efaba8b8e","actor_username":"dahou21@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-06-25 12:37:52.249187+00	
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
fd43e516-7cde-41bc-b6d5-f10c54458bc2	fd43e516-7cde-41bc-b6d5-f10c54458bc2	{"sub": "fd43e516-7cde-41bc-b6d5-f10c54458bc2", "email": "stt.khaled@gmail.com", "email_verified": false, "phone_verified": false}	email	2024-04-13 22:02:39.301269+00	2024-04-13 22:02:39.301341+00	2024-04-13 22:02:39.301341+00	fb5aa203-e1e3-4090-9a99-edaf21ad094a
60e44e8c-a3fb-43ab-92a2-97806af7b62c	60e44e8c-a3fb-43ab-92a2-97806af7b62c	{"sub": "60e44e8c-a3fb-43ab-92a2-97806af7b62c", "email": "nabet@nabet.com", "email_verified": false, "phone_verified": false}	email	2024-05-03 20:02:45.88805+00	2024-05-03 20:02:45.888118+00	2024-05-03 20:02:45.888118+00	c4ca03ff-0fdc-4ce1-965a-c7cf4d48e8eb
6f60f9a0-b528-4727-ac58-1e5473fed6b8	6f60f9a0-b528-4727-ac58-1e5473fed6b8	{"sub": "6f60f9a0-b528-4727-ac58-1e5473fed6b8", "email": "dfj@dj.c", "email_verified": false, "phone_verified": false}	email	2024-05-17 18:57:56.007749+00	2024-05-17 18:57:56.00783+00	2024-05-17 18:57:56.00783+00	bd5a9455-8c94-4fca-9617-7bbd62338254
5de7a4b5-a050-412b-9406-13c05ac5deb3	5de7a4b5-a050-412b-9406-13c05ac5deb3	{"sub": "5de7a4b5-a050-412b-9406-13c05ac5deb3", "email": "karoui@karoui.com", "email_verified": false, "phone_verified": false}	email	2024-05-17 19:01:21.724778+00	2024-05-17 19:01:21.72484+00	2024-05-17 19:01:21.72484+00	a9778276-e098-4549-97bc-88aaef2918b3
1aec828b-701f-48c6-a21d-a968cff794b7	1aec828b-701f-48c6-a21d-a968cff794b7	{"sub": "1aec828b-701f-48c6-a21d-a968cff794b7", "email": "test@test.com", "email_verified": false, "phone_verified": false}	email	2024-05-17 21:07:43.242216+00	2024-05-17 21:07:43.24228+00	2024-05-17 21:07:43.24228+00	719277c6-8f10-4694-b11b-2614f2c29848
d88ada64-2299-4b96-91af-f7e689518875	d88ada64-2299-4b96-91af-f7e689518875	{"sub": "d88ada64-2299-4b96-91af-f7e689518875", "email": "how@how.how", "email_verified": false, "phone_verified": false}	email	2024-05-17 21:53:18.389093+00	2024-05-17 21:53:18.38915+00	2024-05-17 21:53:18.38915+00	cf9167c1-1c30-43a2-a752-1f2fdc9658de
44f73b43-19e0-41e7-be05-b92bfde54684	44f73b43-19e0-41e7-be05-b92bfde54684	{"sub": "44f73b43-19e0-41e7-be05-b92bfde54684", "email": "lkj@klj.cj", "email_verified": false, "phone_verified": false}	email	2024-05-18 01:42:39.768685+00	2024-05-18 01:42:39.768753+00	2024-05-18 01:42:39.768753+00	552495bf-e58a-49e4-878f-df890b0f7d9c
6fbabc92-a706-43f9-88de-c4bd774ccd56	6fbabc92-a706-43f9-88de-c4bd774ccd56	{"sub": "6fbabc92-a706-43f9-88de-c4bd774ccd56", "email": "badrou@badrou.com", "email_verified": false, "phone_verified": false}	email	2024-05-18 01:52:51.464381+00	2024-05-18 01:52:51.464443+00	2024-05-18 01:52:51.464443+00	9aa3ca29-134d-40b9-b87c-1b66bbbf14de
bac48432-f3eb-4950-9ae0-6158e7d4f91c	bac48432-f3eb-4950-9ae0-6158e7d4f91c	{"sub": "bac48432-f3eb-4950-9ae0-6158e7d4f91c", "email": "khaled.21.02.2000@gmail.com", "email_verified": false, "phone_verified": false}	email	2024-05-18 03:21:58.53476+00	2024-05-18 03:21:58.534843+00	2024-05-18 03:21:58.534843+00	d8be885f-4828-48f4-aeaa-2e9a106521f4
58e3b4b2-1a6e-4d34-becf-cf1217ac948d	58e3b4b2-1a6e-4d34-becf-cf1217ac948d	{"sub": "58e3b4b2-1a6e-4d34-becf-cf1217ac948d", "email": "test@tesst.com", "email_verified": false, "phone_verified": false}	email	2024-05-18 03:26:58.516648+00	2024-05-18 03:26:58.516724+00	2024-05-18 03:26:58.516724+00	8bf09891-dea1-48f2-bbad-e261184f171d
8bfb70a6-1f3e-4316-a580-7c486a40c679	8bfb70a6-1f3e-4316-a580-7c486a40c679	{"sub": "8bfb70a6-1f3e-4316-a580-7c486a40c679", "email": "end@end.co", "email_verified": false, "phone_verified": false}	email	2024-05-18 03:27:48.247044+00	2024-05-18 03:27:48.247111+00	2024-05-18 03:27:48.247111+00	cc2c1fa2-3dcb-48d4-9f33-153220c745cd
0b87fed4-2707-45be-8c13-cd26d1012650	0b87fed4-2707-45be-8c13-cd26d1012650	{"sub": "0b87fed4-2707-45be-8c13-cd26d1012650", "email": "end@end.end", "email_verified": false, "phone_verified": false}	email	2024-05-18 03:28:54.664897+00	2024-05-18 03:28:54.664972+00	2024-05-18 03:28:54.664972+00	cdc7fd72-dd5a-446d-86aa-7ae48436fc12
f934f44e-7c01-4891-9865-710573c3b2c8	f934f44e-7c01-4891-9865-710573c3b2c8	{"sub": "f934f44e-7c01-4891-9865-710573c3b2c8", "email": "karim@gmail.com", "email_verified": false, "phone_verified": false}	email	2024-05-23 20:01:39.079344+00	2024-05-23 20:01:39.079442+00	2024-05-23 20:01:39.079442+00	66f13b18-ae1e-4861-bd58-3dd387e91a4a
4bf92899-c5a6-45c5-b75e-166ca779e5f8	4bf92899-c5a6-45c5-b75e-166ca779e5f8	{"sub": "4bf92899-c5a6-45c5-b75e-166ca779e5f8", "email": "ali@gmail.com", "email_verified": false, "phone_verified": false}	email	2024-05-23 20:30:22.877442+00	2024-05-23 20:30:22.877503+00	2024-05-23 20:30:22.877503+00	f95153bb-3f67-422a-9953-c1233f93f52c
87c41a23-24ea-4a88-bbb8-fe3e7973b2ae	87c41a23-24ea-4a88-bbb8-fe3e7973b2ae	{"sub": "87c41a23-24ea-4a88-bbb8-fe3e7973b2ae", "email": "ali.derdour@gmail.com", "email_verified": false, "phone_verified": false}	email	2024-06-21 21:51:02.363091+00	2024-06-21 21:51:02.363448+00	2024-06-21 21:51:02.363448+00	967b7dbb-4307-4adc-9b79-70212de4326c
01f0935a-60bc-4cb3-b240-3d3b987ce0b3	01f0935a-60bc-4cb3-b240-3d3b987ce0b3	{"sub": "01f0935a-60bc-4cb3-b240-3d3b987ce0b3", "email": "touiker21@gmail.com", "email_verified": false, "phone_verified": false}	email	2024-06-24 23:53:40.903054+00	2024-06-24 23:53:40.903105+00	2024-06-24 23:53:40.903105+00	f7aaa2cc-cec0-49f7-af84-d2474205d407
68769cb2-86a4-46e7-96fe-ce3efaba8b8e	68769cb2-86a4-46e7-96fe-ce3efaba8b8e	{"sub": "68769cb2-86a4-46e7-96fe-ce3efaba8b8e", "email": "dahou21@gmail.com", "email_verified": false, "phone_verified": false}	email	2024-06-25 10:12:48.057849+00	2024-06-25 10:12:48.057907+00	2024-06-25 10:12:48.057907+00	756b9d4b-e7b7-465d-97e8-2a7a0aaad649
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
e40b7a6a-3b49-45af-bd9d-d5e1ee6919b3	2024-04-13 22:02:39.328782+00	2024-04-13 22:02:39.328782+00	password	fd73b5f2-bf23-4f3c-9f78-41082daaebd5
fb1ffa65-aedc-4895-83ce-18c92a331ca1	2024-04-13 22:03:07.134782+00	2024-04-13 22:03:07.134782+00	password	dca1449c-b219-4af9-b1af-29cc40f67543
7e91ce7e-021e-42ce-b18b-0d29b067f516	2024-04-13 23:20:47.350663+00	2024-04-13 23:20:47.350663+00	password	be720a56-1886-4426-a49b-79b6f77558a5
b93415b8-3443-4295-b934-ebed1d7e92e7	2024-04-13 23:21:27.571702+00	2024-04-13 23:21:27.571702+00	password	48d3749b-594d-4ed5-80cd-fcbd3a50335a
44c1aa7f-2f84-49ea-8e5c-12e331cf091e	2024-04-14 17:06:35.786396+00	2024-04-14 17:06:35.786396+00	password	5eaaa947-d612-49a5-b8f9-93b78e4f2edf
1eadba2a-dc96-458e-a75d-a38b89c557ca	2024-04-14 17:08:25.29247+00	2024-04-14 17:08:25.29247+00	password	657b9ec4-81b8-46b6-a1e4-054452c14c68
97c88ae4-228b-48fa-923e-6d8bf4c07348	2024-04-14 17:36:15.525214+00	2024-04-14 17:36:15.525214+00	password	1db22079-0190-448c-96a1-b893b25a163b
4fcdf297-cfb1-47a1-a182-aca04e76e73d	2024-04-14 17:36:18.582032+00	2024-04-14 17:36:18.582032+00	password	23f2ec67-b780-4b98-92f5-33e18cf8c0c6
9222b6c9-b1cc-42b6-b7be-6ff457d551b3	2024-04-14 21:08:59.532268+00	2024-04-14 21:08:59.532268+00	password	253ae358-cd78-4b59-827b-78a204462b3c
40f6f0ff-83f0-4b35-b112-a5558a7c10b5	2024-04-14 21:35:52.752734+00	2024-04-14 21:35:52.752734+00	password	967f8a4d-c587-4a55-845c-883c1c287514
760e8632-55ff-47bd-80cf-f04f7428f05d	2024-04-28 20:10:48.04514+00	2024-04-28 20:10:48.04514+00	password	10c2721c-7ccc-4a61-8552-5eea9237ac50
3b40e2b9-0ac3-44bc-8998-6f3d6539c1cc	2024-05-03 16:43:38.38312+00	2024-05-03 16:43:38.38312+00	password	35f054cf-3c18-4f7a-a0ed-547663e34b49
62821a61-0da8-461a-b5ec-0411df2da4d0	2024-05-03 17:01:08.18429+00	2024-05-03 17:01:08.18429+00	password	a7f9d2f8-2834-488e-9bd7-f1509b8bcff0
d6dd2ecd-f13b-4d71-8853-7179a82e9bd7	2024-05-03 17:08:29.356196+00	2024-05-03 17:08:29.356196+00	password	7575fcf2-75d4-4cd4-b53f-8cf0cc300e9d
c82dcbc7-fd79-4ed2-b8ba-a3febbf567a5	2024-05-03 17:20:07.978634+00	2024-05-03 17:20:07.978634+00	password	d7e3a83e-9883-4786-8821-5c60e819940d
52e14762-115f-4c59-9958-e4d9192da518	2024-05-03 19:02:17.025315+00	2024-05-03 19:02:17.025315+00	password	e33109e5-b5de-40db-b6f7-1150621d9bf4
16e5f574-6345-4312-b46d-4083dae89ee0	2024-05-03 19:33:02.446876+00	2024-05-03 19:33:02.446876+00	password	d396ff52-6982-4419-a4bd-e3dbd4689a8a
5775c54f-3fab-4afc-b9a9-6db068bfa56d	2024-05-03 19:33:35.461645+00	2024-05-03 19:33:35.461645+00	password	84a1e07d-c5cb-4c7b-861b-777481fcba1d
494e98d3-651b-4fa9-8560-a692ae1054cf	2024-05-03 19:33:50.473815+00	2024-05-03 19:33:50.473815+00	password	68dc5409-6b52-4433-a8e7-76aab37b6617
27dd069a-031e-4d65-8049-fdc80e3e1bc6	2024-05-03 19:34:11.004732+00	2024-05-03 19:34:11.004732+00	password	134989f6-8f7b-48b0-bfa2-2d1636ce2970
2c5e515c-0bbf-4c49-9924-e700fdd5234c	2024-05-03 19:34:32.052112+00	2024-05-03 19:34:32.052112+00	password	b1d1d4a7-4a9c-4678-810a-31cd0547375e
33d9b5af-ae43-484e-8ee3-a86521d916e1	2024-05-03 19:34:49.818268+00	2024-05-03 19:34:49.818268+00	password	3614d08e-edd2-4968-918d-8a3fb7cc84ad
b4035d38-00c6-46a7-bbab-d8a097b9ffb9	2024-05-03 19:45:49.981708+00	2024-05-03 19:45:49.981708+00	password	2a643a91-23ca-4e1a-9c1d-a40fa84e747c
1a421221-8a1a-4c0d-9136-15326ff20bbb	2024-05-03 19:47:41.137712+00	2024-05-03 19:47:41.137712+00	password	6c2b3c28-712d-4092-8cb7-0596ce8d3d51
afc139ea-13a5-4fdc-bfb0-6153eb8a6a0b	2024-05-03 19:48:45.12691+00	2024-05-03 19:48:45.12691+00	password	6b6a250c-ba87-4caa-8082-7caed0d8b843
884c8596-dc30-4368-bb7e-5d8c2a622384	2024-05-03 19:49:02.849309+00	2024-05-03 19:49:02.849309+00	password	123f5646-0e40-40f1-8444-4ffed2139819
cca10e52-bdbe-49ad-bd7c-b60b7f47e499	2024-05-03 19:52:37.161171+00	2024-05-03 19:52:37.161171+00	password	da22389f-a7c1-403c-a879-be224438d532
c46a6fb8-a8e4-48f4-a9b5-38bac953aef7	2024-05-03 19:54:12.754803+00	2024-05-03 19:54:12.754803+00	password	c075b755-632b-47a8-a19e-caf3b212dd41
c2c7a585-8035-4f9e-93e8-890cdf0caf3c	2024-05-03 19:57:10.838024+00	2024-05-03 19:57:10.838024+00	password	5ff7550e-61fb-4d98-814d-0c3d1b706917
7dfe9b33-e05b-4be0-b612-4c5eff57b694	2024-05-03 19:58:02.60346+00	2024-05-03 19:58:02.60346+00	password	cfb74701-b61b-496c-a60b-2ff0a8b0c1ae
54d8a3f1-f4c2-4d0e-9239-ce6620166b80	2024-05-03 20:00:32.492379+00	2024-05-03 20:00:32.492379+00	password	7c05fd12-a333-448f-9f76-5fa34076ce42
26c048fc-9141-4dd1-a185-a5140fc26bb9	2024-05-03 20:02:45.900051+00	2024-05-03 20:02:45.900051+00	password	782cff1f-96f4-47d3-ba06-1cf01bc21a5a
c28c50cd-54cf-4f90-b3d0-e2fd122413be	2024-05-03 20:11:38.583565+00	2024-05-03 20:11:38.583565+00	password	3951e245-b3a7-4833-8d46-3365447b2406
fda784e5-8780-4a60-933c-23fcc21c02a3	2024-05-03 21:22:09.315144+00	2024-05-03 21:22:09.315144+00	password	68d0721a-f4f3-4581-a32c-e4bfd89dbc31
f42e4c3b-62db-4dd0-a319-7cbd7df5dc89	2024-05-03 22:09:33.095741+00	2024-05-03 22:09:33.095741+00	password	27e0a71a-ae98-4da4-9dd1-294ef2d41c00
7693d689-65b5-4ed3-96f3-d87d167a5b33	2024-05-03 22:18:45.423117+00	2024-05-03 22:18:45.423117+00	password	9f879f14-cbe4-4230-869f-07c550c08aee
aebbba64-c1e0-48f3-a09d-f3c6149aaac8	2024-05-03 22:51:59.349854+00	2024-05-03 22:51:59.349854+00	password	858bb83f-1786-4680-aa3f-c374ada97f50
bc2655b2-edf2-454a-9dee-8e8c276827e4	2024-05-03 22:53:06.078432+00	2024-05-03 22:53:06.078432+00	password	266157dc-6891-45a0-9d81-5acc70cf7aac
b675d395-7f01-4689-8be4-81e6ce8da51e	2024-05-03 22:55:09.566003+00	2024-05-03 22:55:09.566003+00	password	0d2b5908-aeba-475e-b46f-e39eea8b6453
987b26a3-100b-4115-bf01-658cf7e3b78e	2024-05-03 23:01:19.438356+00	2024-05-03 23:01:19.438356+00	password	7e1e276a-00a7-4fa8-9462-741f0e0c08f6
0b164bfd-345e-487d-9b97-9e4f88851ba6	2024-05-04 00:27:35.832421+00	2024-05-04 00:27:35.832421+00	password	61d98af6-214e-4d0a-8446-63c7ed00c7c2
62c6d71b-3d41-4c1f-be80-c4eff7b7eb9d	2024-05-04 01:33:03.261051+00	2024-05-04 01:33:03.261051+00	password	1a629dc8-0f38-49ad-a4e1-cad90dc1b46a
8bd51f01-f0d8-4a1d-a0c6-71c2dcb57066	2024-05-04 01:34:20.038703+00	2024-05-04 01:34:20.038703+00	password	b7fdceda-61ca-4e20-81d2-900898a2f5c9
cf6a3a31-bd4a-4ec2-bbde-edb10c5dd2ee	2024-05-04 02:11:02.548521+00	2024-05-04 02:11:02.548521+00	password	4f603f46-9d47-4c35-a312-324fb5ad870b
d6e737e6-8ae9-4c02-91fc-c310552972cc	2024-05-04 02:23:30.822039+00	2024-05-04 02:23:30.822039+00	password	47426fa1-0e0c-4e84-8d91-ddb3d13e76a6
107f1ca9-3995-49ae-be96-cc3887d71b4d	2024-05-04 02:26:28.25007+00	2024-05-04 02:26:28.25007+00	password	badba646-e5b4-4397-814e-ff2b98936588
d5528182-e0dd-4ed2-b397-5b127c10108e	2024-05-04 02:28:12.467364+00	2024-05-04 02:28:12.467364+00	password	2a1b4550-901f-4da0-aac4-3057f2411fc5
0b23d7eb-7bf8-4f39-9f09-dc6a3af5a991	2024-05-07 21:30:04.13334+00	2024-05-07 21:30:04.13334+00	password	6b5e5115-d037-4dbb-b42d-ba6b9dff4f87
567a3d8e-8815-401b-a9a6-86be774d9021	2024-05-08 00:47:22.189778+00	2024-05-08 00:47:22.189778+00	password	aa05d4e1-9220-4c67-bdee-551a65dd1601
8134c183-9a66-4066-b98e-c28f030469b3	2024-05-08 01:03:53.166274+00	2024-05-08 01:03:53.166274+00	password	a963b5ce-7678-42eb-862a-cb4ea30238ce
c4deefa9-9388-4d93-b1aa-7eb8b307516e	2024-05-08 21:32:15.087277+00	2024-05-08 21:32:15.087277+00	password	06bc3b53-54eb-4ec9-ba9a-d45802d247a6
a1e772c9-8b81-4a6b-a567-0cc0b2dc5d8d	2024-05-08 21:34:40.863251+00	2024-05-08 21:34:40.863251+00	password	e3708d44-7848-4a7f-88f7-160dcabe4821
f824fe94-4863-4f0e-b520-1727d451e0f9	2024-05-08 21:58:45.58368+00	2024-05-08 21:58:45.58368+00	password	89a23f9d-94a9-45b1-9474-317910b7f83a
c9e6ce48-b283-46ae-93dc-2536be0b0768	2024-05-08 23:12:45.938646+00	2024-05-08 23:12:45.938646+00	password	c800f6b6-6412-4b47-b8a1-76830c53e077
53b5fc74-5256-4b95-9061-02053c7448df	2024-05-08 23:15:03.2944+00	2024-05-08 23:15:03.2944+00	password	5196137f-2757-4e66-b167-e144f2e3bd3f
4562177c-eb0d-4a95-9da5-c3c101c877fd	2024-05-08 23:30:23.743502+00	2024-05-08 23:30:23.743502+00	password	b25f920a-f108-4d66-adb8-1b1e9542ecc5
0a013bba-1108-46a0-998f-1a01a681220a	2024-05-08 23:47:40.719445+00	2024-05-08 23:47:40.719445+00	password	4c9d26c4-db0b-42cf-8249-c7d7c3b3d140
f883ee04-6f60-4506-b7a1-6d5b7974be62	2024-05-09 00:26:04.698125+00	2024-05-09 00:26:04.698125+00	password	ea9bce7f-48db-4c2a-981e-295f6badbeb2
f2dd37b1-f508-43d1-bbee-a6bc4d4ce6b3	2024-05-09 01:17:11.425179+00	2024-05-09 01:17:11.425179+00	password	112428a8-abc5-481c-a0a0-2a599f3309d5
3d3e8a25-2ca3-435d-9899-23788931e8d1	2024-05-09 01:27:13.395042+00	2024-05-09 01:27:13.395042+00	password	a37e49b2-e15a-4e1b-a60a-322dfbcdc0e6
243887d9-41dc-4b26-99a9-6deed542b6cb	2024-05-09 01:30:15.359409+00	2024-05-09 01:30:15.359409+00	password	d6edb124-49f8-4f20-86d1-89e9f6278462
e33f9620-122a-4fc1-9026-fadd876e48f4	2024-05-09 01:31:03.457519+00	2024-05-09 01:31:03.457519+00	password	665ff523-68ec-4a24-b50f-1bb05dd7a33f
b1f64a35-8bb2-4dcc-aa5c-c710b0f5b16f	2024-05-09 01:50:53.749365+00	2024-05-09 01:50:53.749365+00	password	c9beca5b-21ab-41d5-ab24-b240fdf2d854
cc06d5e0-41af-4818-a02c-0dfbbb9a743b	2024-05-09 01:59:07.208584+00	2024-05-09 01:59:07.208584+00	password	b5227b5b-6314-4498-81ba-e33ebab0fcc9
68094567-fbee-4b4e-a384-b333cafe5c4d	2024-05-09 02:47:04.0313+00	2024-05-09 02:47:04.0313+00	password	237a6eb0-cd7e-483b-a909-4bfdf9290bac
672edbff-6b9d-4d28-a846-99b202ee9145	2024-05-09 02:57:43.908014+00	2024-05-09 02:57:43.908014+00	password	9cf2d524-36dd-44f5-bfd8-0ea80220c94b
efbb33b6-2ced-47f7-a7cb-59e796dd9a9a	2024-05-09 02:58:45.088071+00	2024-05-09 02:58:45.088071+00	password	958faf14-5c02-4779-84fa-6626caf7090a
1ae91f4c-9509-4120-88f1-7410a20449ac	2024-05-09 03:00:40.700101+00	2024-05-09 03:00:40.700101+00	password	1690de0b-cb49-40f3-9d83-f2580501635f
ce7f63f3-a983-4b89-b78c-2553afd4483a	2024-05-09 03:02:06.005816+00	2024-05-09 03:02:06.005816+00	password	581843f3-54ec-4905-9aef-369d548a7e30
36665835-8ba4-4bee-ba8b-cf18bb1fb6ef	2024-05-09 03:11:06.766873+00	2024-05-09 03:11:06.766873+00	password	e665ff94-07a2-4408-bdc7-dacfb3efde5b
4869b74d-7a36-45ad-97cf-d87862e4868e	2024-05-09 21:37:51.150611+00	2024-05-09 21:37:51.150611+00	password	2cbf6ba2-c0a2-47b0-b142-3e3f9f9f6289
61323d86-c9f8-4a9d-a8ee-0935471dc6a2	2024-05-09 22:03:41.498803+00	2024-05-09 22:03:41.498803+00	password	e3f00d72-5e71-4a34-a41c-284bacd1f042
999cb08a-5f0e-43bc-9df0-951913fbc922	2024-05-09 22:05:44.717199+00	2024-05-09 22:05:44.717199+00	password	fa10a9ef-227e-4b57-983c-805f50537dd7
5602e28a-62cd-4be4-86c8-fe6620f46fe0	2024-05-10 00:13:18.07089+00	2024-05-10 00:13:18.07089+00	password	40350315-80cb-43f8-ab92-aac6732d455c
8eadac75-9f8f-4444-ae0b-f1ed948f3f99	2024-05-10 00:19:39.53283+00	2024-05-10 00:19:39.53283+00	password	1401f86c-4289-4216-b4f5-3b3854a3f247
b9ae07be-477d-48f8-bc34-85908a943d98	2024-05-10 00:23:35.11162+00	2024-05-10 00:23:35.11162+00	password	f5848e30-c3ed-4c56-bb2d-3ae634fff4f2
1dc49bed-b7d6-4188-a30d-1d264e63a393	2024-05-10 01:46:57.403451+00	2024-05-10 01:46:57.403451+00	password	a038e018-b3fc-418c-af78-07b093584fdc
f34a128e-2ffd-466e-b121-9eda600e3794	2024-05-10 02:46:27.936449+00	2024-05-10 02:46:27.936449+00	password	2862e684-cd8e-4b81-af7a-7027f060aedc
a921e259-f9fb-41bd-89aa-81617bdd5388	2024-05-17 15:07:14.811999+00	2024-05-17 15:07:14.811999+00	password	ff8bc975-8189-4da1-95dc-efd6e9e20f7b
2afefd6c-6fbc-4f70-bf02-7545f7184b9e	2024-05-17 15:19:30.993264+00	2024-05-17 15:19:30.993264+00	password	b6d28f39-387c-4da6-87b0-6a9048eadc81
a4091673-d6b8-4a8e-b5ca-3766b1d317e7	2024-05-17 15:39:33.966849+00	2024-05-17 15:39:33.966849+00	password	51e4eb59-b505-4218-9fa1-d1b883c32d59
662bdb85-1782-4d4a-8222-2e77c7e2ae85	2024-05-17 15:45:00.75373+00	2024-05-17 15:45:00.75373+00	password	73d92805-c6ea-4b03-836a-0075120869e1
adf65043-3cad-4e03-b812-344fd0809500	2024-05-17 15:46:53.437096+00	2024-05-17 15:46:53.437096+00	password	da45ebe0-5ae4-4508-8f7c-b27cb1268550
2fed607f-6e0c-43e7-8d0d-dcbe035abc70	2024-05-17 15:49:16.933149+00	2024-05-17 15:49:16.933149+00	password	fdaa3f7f-e20e-45bc-b10b-5573db2c7b7f
93b3ee5c-315c-4865-bfe0-4348f07dd7f1	2024-05-17 15:50:55.412516+00	2024-05-17 15:50:55.412516+00	password	be8a5454-4381-46d0-afe9-dfae1313a79e
22ba1b39-247b-4ee8-b5de-69aa207b3c94	2024-05-17 15:53:21.728844+00	2024-05-17 15:53:21.728844+00	password	bbb977f1-9552-4b3b-beec-3dc81035fb62
a39d0b49-ee40-4c76-9275-83cf5daf77f6	2024-05-17 16:00:08.308929+00	2024-05-17 16:00:08.308929+00	password	afe03288-90a7-451d-8979-2b59f7f848ef
dcf85663-cc0f-40bb-85d7-0e1e22d5cf1a	2024-05-17 16:02:18.076924+00	2024-05-17 16:02:18.076924+00	password	7897b3ad-edc6-4efc-b335-941c8cb80332
4172a446-910d-4bbd-9b41-ee16639f87fa	2024-05-17 16:04:39.873382+00	2024-05-17 16:04:39.873382+00	password	2f1cd59e-d920-4476-82a7-557327974ed9
9082de1f-f93d-4149-a445-513a3c1fb728	2024-05-17 16:20:18.950459+00	2024-05-17 16:20:18.950459+00	password	2f0db89e-d485-4886-ae8b-60b7b1d2bc45
9594b013-e8c8-40c4-9a90-a2265503bf02	2024-05-17 18:57:56.097062+00	2024-05-17 18:57:56.097062+00	password	83c18203-85f5-42fd-ba70-882af3df707d
65536d9a-2ccd-400e-b5af-4fe97d87ea85	2024-05-17 21:08:37.584542+00	2024-05-17 21:08:37.584542+00	password	ab23de7e-5d38-4097-89e0-65080a39805b
39d1d881-cc80-450e-a21f-1d8aa11bbdda	2024-05-17 22:04:58.706405+00	2024-05-17 22:04:58.706405+00	password	6f5dcd22-5869-43b2-87a9-9e9dc4c48e50
b5029c6c-1c3e-4a17-8da9-9f78a992d7f8	2024-05-17 23:11:20.743398+00	2024-05-17 23:11:20.743398+00	password	e4c79080-0bb5-456d-bdc7-98aec52f832a
822147ba-4ddb-4dc7-858d-69f81bbb0d64	2024-05-18 01:56:32.491175+00	2024-05-18 01:56:32.491175+00	password	485caf09-7bd1-4f3f-9ac3-be0381bda80a
0c612292-58f8-462f-b9a0-7e9d0a5c6e97	2024-05-18 02:36:57.319038+00	2024-05-18 02:36:57.319038+00	password	e0e7216d-6c50-4d5b-9b65-bb1f41cc9e4a
1a08d98f-492a-4172-8b79-86daf385c50d	2024-05-18 02:44:37.963196+00	2024-05-18 02:44:37.963196+00	password	915ef029-9e9e-4b2e-ba04-3745bad7d924
53425bb6-5e6c-47e2-abd5-f1167d004942	2024-05-18 03:10:53.898726+00	2024-05-18 03:10:53.898726+00	password	6ec05a88-695a-40e4-852d-31dc239dd76e
31cf0f8b-7df2-4449-aa2c-339b39dbf21b	2024-05-18 03:19:14.225469+00	2024-05-18 03:19:14.225469+00	password	7151fa67-a155-4c68-ad72-e60970981b54
385b6d6d-79b3-4b1e-9023-c79036122496	2024-05-20 18:35:37.464325+00	2024-05-20 18:35:37.464325+00	password	0dd4192d-e58d-4802-97d5-16a5955fb46e
e5721772-9da3-4acb-ac12-c3330abb57f5	2024-05-23 20:01:39.130024+00	2024-05-23 20:01:39.130024+00	password	027714fd-5b7a-4f54-b249-8859c656f621
d20a00f2-30e7-420d-b76b-95806d79c136	2024-06-21 21:57:26.702563+00	2024-06-21 21:57:26.702563+00	password	2b09bc85-ad48-4c4c-abf0-458bf010f2d5
2e338123-f4f6-4514-b924-f2ab9d4d4901	2024-06-21 22:06:42.369157+00	2024-06-21 22:06:42.369157+00	password	4e1353c9-06e6-4c42-bbe2-235ccc2f4b61
0c5f2dbe-2ad2-42e7-a2c2-4bdf4a5fa6ee	2024-06-21 22:07:10.58259+00	2024-06-21 22:07:10.58259+00	password	e782815e-d324-4373-84a3-25ed1c91ca5a
dfb7cd2b-111e-43d2-9aea-ee6f90cf50e2	2024-06-24 23:53:40.932561+00	2024-06-24 23:53:40.932561+00	password	79e7a58b-9975-4c61-9ee9-82f5ae447ddf
8b413753-b571-454d-bc95-edbc2027fd26	2024-06-25 10:12:48.08403+00	2024-06-25 10:12:48.08403+00	password	28b22de9-3e57-4597-b780-b1958bcac4a0
210498c6-1ca5-4c29-b967-484ff34a442e	2024-06-25 12:17:42.138065+00	2024-06-25 12:17:42.138065+00	password	94c4eece-c880-4138-a0e8-b14633459e5d
7d2e95ef-0de3-4fa8-a158-3717fbfc0c40	2024-06-25 12:19:19.408075+00	2024-06-25 12:19:19.408075+00	password	f8b1dad5-2a52-46ce-9e89-041a48c2d3c0
94e0da87-11b0-4c54-905a-ee1265317b87	2024-06-25 12:37:52.255282+00	2024-06-25 12:37:52.255282+00	password	ebe16069-5852-4cae-99f5-e141963ead70
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	170	qsb8OF9lOhkNyB1pGxaQ3Q	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-18 02:36:57.284341+00	2024-05-18 02:36:57.284341+00	\N	0c612292-58f8-462f-b9a0-7e9d0a5c6e97
00000000-0000-0000-0000-000000000000	173	0b4Jr7lZE5V0FVaz0pEFdQ	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-18 03:10:53.862624+00	2024-05-18 03:10:53.862624+00	\N	53425bb6-5e6c-47e2-abd5-f1167d004942
00000000-0000-0000-0000-000000000000	29	x3oNUFg8rgWyX4_Z1AdvUg	fd43e516-7cde-41bc-b6d5-f10c54458bc2	t	2024-04-29 13:05:56.343947+00	2024-05-18 19:08:25.487172+00	SUUSsTpfGHqPbvu07UlVWA	760e8632-55ff-47bd-80cf-f04f7428f05d
00000000-0000-0000-0000-000000000000	185	-YG69I61zD0ycfnZiy8LOQ	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-23 20:00:26.684652+00	2024-05-23 20:00:26.684652+00	qTgFdRwyFvuPgAv7cSO0Hg	760e8632-55ff-47bd-80cf-f04f7428f05d
00000000-0000-0000-0000-000000000000	14	kJ3KtAgiLWb_-2S2N4IMSQ	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-04-13 22:02:39.324999+00	2024-04-13 22:02:39.324999+00	\N	e40b7a6a-3b49-45af-bd9d-d5e1ee6919b3
00000000-0000-0000-0000-000000000000	15	mBp5AKDHSax8zK9rdxldzQ	fd43e516-7cde-41bc-b6d5-f10c54458bc2	t	2024-04-13 22:03:07.131494+00	2024-04-13 23:02:34.579685+00	\N	fb1ffa65-aedc-4895-83ce-18c92a331ca1
00000000-0000-0000-0000-000000000000	16	N657Xs21gFjz1446m9Vlxg	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-04-13 23:02:34.583056+00	2024-04-13 23:02:34.583056+00	mBp5AKDHSax8zK9rdxldzQ	fb1ffa65-aedc-4895-83ce-18c92a331ca1
00000000-0000-0000-0000-000000000000	17	dMviBi0ODuEtWEZwjxmTVg	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-04-13 23:20:47.343699+00	2024-04-13 23:20:47.343699+00	\N	7e91ce7e-021e-42ce-b18b-0d29b067f516
00000000-0000-0000-0000-000000000000	18	LekYeRd1ze5L6wNNq0uBSQ	fd43e516-7cde-41bc-b6d5-f10c54458bc2	t	2024-04-13 23:21:27.570476+00	2024-04-14 17:06:05.134711+00	\N	b93415b8-3443-4295-b934-ebed1d7e92e7
00000000-0000-0000-0000-000000000000	19	-7ny55D7OaN6z9_OnobNPw	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-04-14 17:06:05.153016+00	2024-04-14 17:06:05.153016+00	LekYeRd1ze5L6wNNq0uBSQ	b93415b8-3443-4295-b934-ebed1d7e92e7
00000000-0000-0000-0000-000000000000	20	zbU1z-q5FcoDZYSbIWjVfw	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-04-14 17:06:35.783249+00	2024-04-14 17:06:35.783249+00	\N	44c1aa7f-2f84-49ea-8e5c-12e331cf091e
00000000-0000-0000-0000-000000000000	21	tj4OBmfBaDQ2YeWoqzcnjQ	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-04-14 17:08:25.2907+00	2024-04-14 17:08:25.2907+00	\N	1eadba2a-dc96-458e-a75d-a38b89c557ca
00000000-0000-0000-0000-000000000000	22	5NGQ-vSOVnvYuiMmr8cgBw	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-04-14 17:36:15.52192+00	2024-04-14 17:36:15.52192+00	\N	97c88ae4-228b-48fa-923e-6d8bf4c07348
00000000-0000-0000-0000-000000000000	23	ZRD7qOxuDg9oFQZpS0LQSA	fd43e516-7cde-41bc-b6d5-f10c54458bc2	t	2024-04-14 17:36:18.580853+00	2024-04-14 21:06:47.199173+00	\N	4fcdf297-cfb1-47a1-a182-aca04e76e73d
00000000-0000-0000-0000-000000000000	24	ZGKLn0dFsjY3Ro29eZijwA	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-04-14 21:06:47.206178+00	2024-04-14 21:06:47.206178+00	ZRD7qOxuDg9oFQZpS0LQSA	4fcdf297-cfb1-47a1-a182-aca04e76e73d
00000000-0000-0000-0000-000000000000	25	k_oV79O638-We9HMRN2IeQ	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-04-14 21:08:59.530941+00	2024-04-14 21:08:59.530941+00	\N	9222b6c9-b1cc-42b6-b7be-6ff457d551b3
00000000-0000-0000-0000-000000000000	26	vgOrx6LqnDBsKrv99AuRMA	fd43e516-7cde-41bc-b6d5-f10c54458bc2	t	2024-04-14 21:35:52.74998+00	2024-04-14 22:35:17.452419+00	\N	40f6f0ff-83f0-4b35-b112-a5558a7c10b5
00000000-0000-0000-0000-000000000000	27	1f_F2wQg9q1MLq3E9Nc9dQ	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-04-14 22:35:17.45327+00	2024-04-14 22:35:17.45327+00	vgOrx6LqnDBsKrv99AuRMA	40f6f0ff-83f0-4b35-b112-a5558a7c10b5
00000000-0000-0000-0000-000000000000	28	SUUSsTpfGHqPbvu07UlVWA	fd43e516-7cde-41bc-b6d5-f10c54458bc2	t	2024-04-28 20:10:48.017294+00	2024-04-29 13:05:56.330273+00	\N	760e8632-55ff-47bd-80cf-f04f7428f05d
00000000-0000-0000-0000-000000000000	30	lscCQeXrfusAWJUCYjyatA	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-03 16:43:38.363868+00	2024-05-03 16:43:38.363868+00	\N	3b40e2b9-0ac3-44bc-8998-6f3d6539c1cc
00000000-0000-0000-0000-000000000000	31	E3TWDfiTqRP2WtZfKRcJRQ	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-03 17:01:08.182178+00	2024-05-03 17:01:08.182178+00	\N	62821a61-0da8-461a-b5ec-0411df2da4d0
00000000-0000-0000-0000-000000000000	32	24vAMhrBEa9OtSBjFYMBmA	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-03 17:08:29.353873+00	2024-05-03 17:08:29.353873+00	\N	d6dd2ecd-f13b-4d71-8853-7179a82e9bd7
00000000-0000-0000-0000-000000000000	33	nj5GdjyR-AZpd9uSkAI8eg	fd43e516-7cde-41bc-b6d5-f10c54458bc2	t	2024-05-03 17:20:07.975627+00	2024-05-03 18:19:36.075759+00	\N	c82dcbc7-fd79-4ed2-b8ba-a3febbf567a5
00000000-0000-0000-0000-000000000000	34	jLJ9QGxqxow9TImFPEUrYA	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-03 18:19:36.099083+00	2024-05-03 18:19:36.099083+00	nj5GdjyR-AZpd9uSkAI8eg	c82dcbc7-fd79-4ed2-b8ba-a3febbf567a5
00000000-0000-0000-0000-000000000000	39	29SMTyefoGFaD_x25VlcFA	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-03 19:02:17.024076+00	2024-05-03 19:02:17.024076+00	\N	52e14762-115f-4c59-9958-e4d9192da518
00000000-0000-0000-0000-000000000000	40	HxKauBirkfRA3gxSd-OrXA	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-03 19:33:02.443522+00	2024-05-03 19:33:02.443522+00	\N	16e5f574-6345-4312-b46d-4083dae89ee0
00000000-0000-0000-0000-000000000000	41	BoQQTMWIpYPlVbuX5IQX6Q	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-03 19:33:35.460387+00	2024-05-03 19:33:35.460387+00	\N	5775c54f-3fab-4afc-b9a9-6db068bfa56d
00000000-0000-0000-0000-000000000000	42	4n07HO25Hb1hgdSViRwx3w	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-03 19:33:50.472559+00	2024-05-03 19:33:50.472559+00	\N	494e98d3-651b-4fa9-8560-a692ae1054cf
00000000-0000-0000-0000-000000000000	43	dxHGRvR7Igka92hItgSswA	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-03 19:34:10.989514+00	2024-05-03 19:34:10.989514+00	\N	27dd069a-031e-4d65-8049-fdc80e3e1bc6
00000000-0000-0000-0000-000000000000	44	k1V2kWqbar9gE_UtsoMcmQ	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-03 19:34:32.050818+00	2024-05-03 19:34:32.050818+00	\N	2c5e515c-0bbf-4c49-9924-e700fdd5234c
00000000-0000-0000-0000-000000000000	45	c8Q_mukRR7tvacBMyrzPZw	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-03 19:34:49.817107+00	2024-05-03 19:34:49.817107+00	\N	33d9b5af-ae43-484e-8ee3-a86521d916e1
00000000-0000-0000-0000-000000000000	46	OkgEnawiwwRSa1f8BuwErw	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-03 19:45:49.978714+00	2024-05-03 19:45:49.978714+00	\N	b4035d38-00c6-46a7-bbab-d8a097b9ffb9
00000000-0000-0000-0000-000000000000	47	ZXA1lhMOJ8_SgWbLMd6H-g	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-03 19:47:41.135223+00	2024-05-03 19:47:41.135223+00	\N	1a421221-8a1a-4c0d-9136-15326ff20bbb
00000000-0000-0000-0000-000000000000	48	o9h5VlGS4s0TfC4vBxXZkA	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-03 19:48:45.124785+00	2024-05-03 19:48:45.124785+00	\N	afc139ea-13a5-4fdc-bfb0-6153eb8a6a0b
00000000-0000-0000-0000-000000000000	49	F9D04-3zadvkgWiFc2wP6A	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-03 19:49:02.848067+00	2024-05-03 19:49:02.848067+00	\N	884c8596-dc30-4368-bb7e-5d8c2a622384
00000000-0000-0000-0000-000000000000	50	Sk9bxERcIESMu6p-Fve82A	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-03 19:52:37.157743+00	2024-05-03 19:52:37.157743+00	\N	cca10e52-bdbe-49ad-bd7c-b60b7f47e499
00000000-0000-0000-0000-000000000000	51	Hct1n5el277fG0M59fFixQ	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-03 19:54:12.753573+00	2024-05-03 19:54:12.753573+00	\N	c46a6fb8-a8e4-48f4-a9b5-38bac953aef7
00000000-0000-0000-0000-000000000000	54	iwZOTeWl4EWPM7Njn8_EWQ	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-03 19:57:10.835199+00	2024-05-03 19:57:10.835199+00	\N	c2c7a585-8035-4f9e-93e8-890cdf0caf3c
00000000-0000-0000-0000-000000000000	55	cUuCc9lOEWPcRbe7QSr2CA	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-03 19:58:02.602248+00	2024-05-03 19:58:02.602248+00	\N	7dfe9b33-e05b-4be0-b612-4c5eff57b694
00000000-0000-0000-0000-000000000000	56	EVPMR-SKxp8msRpVZ9mS2A	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-03 20:00:32.491151+00	2024-05-03 20:00:32.491151+00	\N	54d8a3f1-f4c2-4d0e-9239-ce6620166b80
00000000-0000-0000-0000-000000000000	58	Ami28QHDDMeQGPwgL70QQA	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-03 20:02:45.897324+00	2024-05-03 20:02:45.897324+00	\N	26c048fc-9141-4dd1-a185-a5140fc26bb9
00000000-0000-0000-0000-000000000000	60	4-kx-FrvPLP7WM4TANX_Vw	60e44e8c-a3fb-43ab-92a2-97806af7b62c	t	2024-05-03 20:11:38.580306+00	2024-05-03 21:19:19.643163+00	\N	c28c50cd-54cf-4f90-b3d0-e2fd122413be
00000000-0000-0000-0000-000000000000	61	uz82PbrtIe7TyGtCqFb1VA	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-03 21:19:19.65376+00	2024-05-03 21:19:19.65376+00	4-kx-FrvPLP7WM4TANX_Vw	c28c50cd-54cf-4f90-b3d0-e2fd122413be
00000000-0000-0000-0000-000000000000	63	858lQtGfXPeWwFsM4hub4w	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-03 21:22:09.313468+00	2024-05-03 21:22:09.313468+00	\N	fda784e5-8780-4a60-933c-23fcc21c02a3
00000000-0000-0000-0000-000000000000	67	MYiMjaKsWXO16ZxHeNFWFA	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-03 22:09:33.094691+00	2024-05-03 22:09:33.094691+00	\N	f42e4c3b-62db-4dd0-a319-7cbd7df5dc89
00000000-0000-0000-0000-000000000000	68	QD5vGZ9AFj6at4_1QNfoAA	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-03 22:18:45.411198+00	2024-05-03 22:18:45.411198+00	\N	7693d689-65b5-4ed3-96f3-d87d167a5b33
00000000-0000-0000-0000-000000000000	69	4yoLjha8DG3_kK6AiATQHw	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-03 22:51:59.346804+00	2024-05-03 22:51:59.346804+00	\N	aebbba64-c1e0-48f3-a09d-f3c6149aaac8
00000000-0000-0000-0000-000000000000	70	eKNvvBxB-5TqzncaWFGeUw	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-03 22:53:06.077178+00	2024-05-03 22:53:06.077178+00	\N	bc2655b2-edf2-454a-9dee-8e8c276827e4
00000000-0000-0000-0000-000000000000	71	4vbhyQhbTysVxiln0eFi_g	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-03 22:55:09.564879+00	2024-05-03 22:55:09.564879+00	\N	b675d395-7f01-4689-8be4-81e6ce8da51e
00000000-0000-0000-0000-000000000000	72	S3YJ1h8Qt4CdhQ62jTL1zw	60e44e8c-a3fb-43ab-92a2-97806af7b62c	t	2024-05-03 23:01:19.434252+00	2024-05-04 00:00:45.284337+00	\N	987b26a3-100b-4115-bf01-658cf7e3b78e
00000000-0000-0000-0000-000000000000	73	NTMOsipdgka_bawHHPR54Q	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-04 00:00:45.298872+00	2024-05-04 00:00:45.298872+00	S3YJ1h8Qt4CdhQ62jTL1zw	987b26a3-100b-4115-bf01-658cf7e3b78e
00000000-0000-0000-0000-000000000000	74	yoWEpqZVjl83pXXje3mhug	60e44e8c-a3fb-43ab-92a2-97806af7b62c	t	2024-05-04 00:27:35.808578+00	2024-05-04 01:32:03.991314+00	\N	0b164bfd-345e-487d-9b97-9e4f88851ba6
00000000-0000-0000-0000-000000000000	75	I2czYOUPTQeldso27fLZRg	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-04 01:32:04.004018+00	2024-05-04 01:32:04.004018+00	yoWEpqZVjl83pXXje3mhug	0b164bfd-345e-487d-9b97-9e4f88851ba6
00000000-0000-0000-0000-000000000000	76	P6Vn1C1F_iiGxNxCqoS31A	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-04 01:33:03.255863+00	2024-05-04 01:33:03.255863+00	\N	62c6d71b-3d41-4c1f-be80-c4eff7b7eb9d
00000000-0000-0000-0000-000000000000	77	-B_e0JiQyepwd3KL-qSsqw	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-04 01:34:20.03753+00	2024-05-04 01:34:20.03753+00	\N	8bd51f01-f0d8-4a1d-a0c6-71c2dcb57066
00000000-0000-0000-0000-000000000000	78	P3e-Zjpj2JREoc6RmkXk-Q	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-04 02:11:02.541024+00	2024-05-04 02:11:02.541024+00	\N	cf6a3a31-bd4a-4ec2-bbde-edb10c5dd2ee
00000000-0000-0000-0000-000000000000	79	0pH6AZN5X-D7SpT7dKjm3Q	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-04 02:23:30.807383+00	2024-05-04 02:23:30.807383+00	\N	d6e737e6-8ae9-4c02-91fc-c310552972cc
00000000-0000-0000-0000-000000000000	80	o0rN_5zPDDRccJuhBB0J2w	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-04 02:26:28.248773+00	2024-05-04 02:26:28.248773+00	\N	107f1ca9-3995-49ae-be96-cc3887d71b4d
00000000-0000-0000-0000-000000000000	81	gySs_H7oR2grkCW7oMVkiA	fd43e516-7cde-41bc-b6d5-f10c54458bc2	t	2024-05-04 02:28:12.459951+00	2024-05-04 03:27:35.219927+00	\N	d5528182-e0dd-4ed2-b397-5b127c10108e
00000000-0000-0000-0000-000000000000	82	4muM58_At8UjNDguqYXbvg	fd43e516-7cde-41bc-b6d5-f10c54458bc2	t	2024-05-04 03:27:35.224596+00	2024-05-04 04:27:10.405957+00	gySs_H7oR2grkCW7oMVkiA	d5528182-e0dd-4ed2-b397-5b127c10108e
00000000-0000-0000-0000-000000000000	83	0OTYP6gcI082x0eT8q5dog	fd43e516-7cde-41bc-b6d5-f10c54458bc2	t	2024-05-04 04:27:10.408166+00	2024-05-07 21:28:59.437589+00	4muM58_At8UjNDguqYXbvg	d5528182-e0dd-4ed2-b397-5b127c10108e
00000000-0000-0000-0000-000000000000	84	MitIDaFEteVLv9p9Ftwirg	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-07 21:28:59.45644+00	2024-05-07 21:28:59.45644+00	0OTYP6gcI082x0eT8q5dog	d5528182-e0dd-4ed2-b397-5b127c10108e
00000000-0000-0000-0000-000000000000	86	LKsW3vFrNQxQjJbO_E1-Dw	fd43e516-7cde-41bc-b6d5-f10c54458bc2	t	2024-05-07 21:30:04.131429+00	2024-05-07 23:50:41.15293+00	\N	0b23d7eb-7bf8-4f39-9f09-dc6a3af5a991
00000000-0000-0000-0000-000000000000	87	kgI-QQqrpURfNTBoKvGRfg	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-07 23:50:41.175513+00	2024-05-07 23:50:41.175513+00	LKsW3vFrNQxQjJbO_E1-Dw	0b23d7eb-7bf8-4f39-9f09-dc6a3af5a991
00000000-0000-0000-0000-000000000000	183	qTgFdRwyFvuPgAv7cSO0Hg	fd43e516-7cde-41bc-b6d5-f10c54458bc2	t	2024-05-18 19:08:25.510817+00	2024-05-23 20:00:26.67019+00	x3oNUFg8rgWyX4_Z1AdvUg	760e8632-55ff-47bd-80cf-f04f7428f05d
00000000-0000-0000-0000-000000000000	186	81m_GKFPGnrtV-eMOsTNWw	f934f44e-7c01-4891-9865-710573c3b2c8	f	2024-05-23 20:01:39.119932+00	2024-05-23 20:01:39.119932+00	\N	e5721772-9da3-4acb-ac12-c3330abb57f5
00000000-0000-0000-0000-000000000000	90	_TlCAuyczGZFC-YEgAaSgA	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-08 00:47:22.184575+00	2024-05-08 00:47:22.184575+00	\N	567a3d8e-8815-401b-a9a6-86be774d9021
00000000-0000-0000-0000-000000000000	91	Wgf9X1FPAkkR4nBue06k2g	fd43e516-7cde-41bc-b6d5-f10c54458bc2	t	2024-05-08 01:03:53.140825+00	2024-05-08 02:03:18.261941+00	\N	8134c183-9a66-4066-b98e-c28f030469b3
00000000-0000-0000-0000-000000000000	93	ecxUVvZJhrWF7E5DoAVPew	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-08 21:32:15.037523+00	2024-05-08 21:32:15.037523+00	\N	c4deefa9-9388-4d93-b1aa-7eb8b307516e
00000000-0000-0000-0000-000000000000	94	X5TWpEAAJPrOydHPUiz_jw	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-08 21:34:40.859123+00	2024-05-08 21:34:40.859123+00	\N	a1e772c9-8b81-4a6b-a567-0cc0b2dc5d8d
00000000-0000-0000-0000-000000000000	95	Lp34oO2yx8sapY2P88O0jw	60e44e8c-a3fb-43ab-92a2-97806af7b62c	t	2024-05-08 21:58:45.563443+00	2024-05-08 22:58:09.731727+00	\N	f824fe94-4863-4f0e-b520-1727d451e0f9
00000000-0000-0000-0000-000000000000	96	otQA8Yf8bTqmK-XGFSw_BQ	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-08 22:58:09.755451+00	2024-05-08 22:58:09.755451+00	Lp34oO2yx8sapY2P88O0jw	f824fe94-4863-4f0e-b520-1727d451e0f9
00000000-0000-0000-0000-000000000000	97	wkYv9R1TNYdyI3_uYXejhg	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-08 23:12:45.930927+00	2024-05-08 23:12:45.930927+00	\N	c9e6ce48-b283-46ae-93dc-2536be0b0768
00000000-0000-0000-0000-000000000000	98	wRDft52t5l6UICOKrCrUsQ	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-08 23:15:03.288713+00	2024-05-08 23:15:03.288713+00	\N	53b5fc74-5256-4b95-9061-02053c7448df
00000000-0000-0000-0000-000000000000	99	I25ddLU1x-p3GzpTTVqlWQ	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-08 23:30:23.738343+00	2024-05-08 23:30:23.738343+00	\N	4562177c-eb0d-4a95-9da5-c3c101c877fd
00000000-0000-0000-0000-000000000000	100	RSvG8gsDuUaclCmpwuquBw	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-08 23:47:40.714951+00	2024-05-08 23:47:40.714951+00	\N	0a013bba-1108-46a0-998f-1a01a681220a
00000000-0000-0000-0000-000000000000	101	7TI9vrg0FSgR9scPXNT3ag	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-09 00:26:04.663244+00	2024-05-09 00:26:04.663244+00	\N	f883ee04-6f60-4506-b7a1-6d5b7974be62
00000000-0000-0000-0000-000000000000	92	rYk_mzP18E-6fBPaOCrZbA	fd43e516-7cde-41bc-b6d5-f10c54458bc2	t	2024-05-08 02:03:18.280379+00	2024-05-09 01:16:02.875323+00	Wgf9X1FPAkkR4nBue06k2g	8134c183-9a66-4066-b98e-c28f030469b3
00000000-0000-0000-0000-000000000000	102	pU92i3sibF26odaLCQ5ZLQ	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-09 01:16:02.894153+00	2024-05-09 01:16:02.894153+00	rYk_mzP18E-6fBPaOCrZbA	8134c183-9a66-4066-b98e-c28f030469b3
00000000-0000-0000-0000-000000000000	103	taES3mVEouflXnLWRwSLLg	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-09 01:17:11.418434+00	2024-05-09 01:17:11.418434+00	\N	f2dd37b1-f508-43d1-bbee-a6bc4d4ce6b3
00000000-0000-0000-0000-000000000000	104	ewxQKUe7xff3KHJI0jLw9Q	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-09 01:27:13.391161+00	2024-05-09 01:27:13.391161+00	\N	3d3e8a25-2ca3-435d-9899-23788931e8d1
00000000-0000-0000-0000-000000000000	105	Llq4T7KrWQ7xfTA8aHn7qw	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-09 01:30:15.356142+00	2024-05-09 01:30:15.356142+00	\N	243887d9-41dc-4b26-99a9-6deed542b6cb
00000000-0000-0000-0000-000000000000	106	NdCcsS0vZJkNjJZXoImdrw	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-09 01:31:03.45417+00	2024-05-09 01:31:03.45417+00	\N	e33f9620-122a-4fc1-9026-fadd876e48f4
00000000-0000-0000-0000-000000000000	107	RebkypGgU5VjuEa9MMb7rg	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-09 01:50:53.713058+00	2024-05-09 01:50:53.713058+00	\N	b1f64a35-8bb2-4dcc-aa5c-c710b0f5b16f
00000000-0000-0000-0000-000000000000	108	N8G9h3jWUPkv5w8Q5CUpzA	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-09 01:59:07.196926+00	2024-05-09 01:59:07.196926+00	\N	cc06d5e0-41af-4818-a02c-0dfbbb9a743b
00000000-0000-0000-0000-000000000000	109	twyNh5OCaCpcZGhiY_MqAg	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-09 02:47:03.996665+00	2024-05-09 02:47:03.996665+00	\N	68094567-fbee-4b4e-a384-b333cafe5c4d
00000000-0000-0000-0000-000000000000	110	UuJR00qzo6X1A8QYuLYo8Q	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-09 02:57:43.879095+00	2024-05-09 02:57:43.879095+00	\N	672edbff-6b9d-4d28-a846-99b202ee9145
00000000-0000-0000-0000-000000000000	111	JpLmOFrp6wJtCuEv5AZsOg	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-09 02:58:45.079951+00	2024-05-09 02:58:45.079951+00	\N	efbb33b6-2ced-47f7-a7cb-59e796dd9a9a
00000000-0000-0000-0000-000000000000	112	2SZY8wNpHVoA0o8uhYxb7A	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-09 03:00:40.686991+00	2024-05-09 03:00:40.686991+00	\N	1ae91f4c-9509-4120-88f1-7410a20449ac
00000000-0000-0000-0000-000000000000	113	uUDHJynOHvUY42rFU6-9Xg	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-09 03:02:06.003604+00	2024-05-09 03:02:06.003604+00	\N	ce7f63f3-a983-4b89-b78c-2553afd4483a
00000000-0000-0000-0000-000000000000	114	enxdKsV3k4hcvEXHtamTTw	60e44e8c-a3fb-43ab-92a2-97806af7b62c	t	2024-05-09 03:11:06.761382+00	2024-05-09 21:37:21.540309+00	\N	36665835-8ba4-4bee-ba8b-cf18bb1fb6ef
00000000-0000-0000-0000-000000000000	115	e5Ou3lok8NQ1MMrAxz3hAw	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-09 21:37:21.563184+00	2024-05-09 21:37:21.563184+00	enxdKsV3k4hcvEXHtamTTw	36665835-8ba4-4bee-ba8b-cf18bb1fb6ef
00000000-0000-0000-0000-000000000000	116	IOtItg4VWGuCSILk_8xSyw	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-09 21:37:51.148434+00	2024-05-09 21:37:51.148434+00	\N	4869b74d-7a36-45ad-97cf-d87862e4868e
00000000-0000-0000-0000-000000000000	117	vpiG_46xuiZmu6HtSOlw_g	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-09 22:03:41.467081+00	2024-05-09 22:03:41.467081+00	\N	61323d86-c9f8-4a9d-a8ee-0935471dc6a2
00000000-0000-0000-0000-000000000000	169	vw_HNPdKjq_JIPtC992sGg	5de7a4b5-a050-412b-9406-13c05ac5deb3	f	2024-05-18 01:56:32.476182+00	2024-05-18 01:56:32.476182+00	\N	822147ba-4ddb-4dc7-858d-69f81bbb0d64
00000000-0000-0000-0000-000000000000	118	YvQNmBJkRGBFCeJA0owK-A	60e44e8c-a3fb-43ab-92a2-97806af7b62c	t	2024-05-09 22:05:44.712128+00	2024-05-09 23:05:12.203723+00	\N	999cb08a-5f0e-43bc-9df0-951913fbc922
00000000-0000-0000-0000-000000000000	172	_KzrqKkJDAKAHkOG4E_1mg	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-18 02:44:37.943642+00	2024-05-18 02:44:37.943642+00	\N	1a08d98f-492a-4172-8b79-86daf385c50d
00000000-0000-0000-0000-000000000000	119	LEtPNAqNqe-3BTo4RYijiA	60e44e8c-a3fb-43ab-92a2-97806af7b62c	t	2024-05-09 23:05:12.22612+00	2024-05-10 00:04:41.921439+00	YvQNmBJkRGBFCeJA0owK-A	999cb08a-5f0e-43bc-9df0-951913fbc922
00000000-0000-0000-0000-000000000000	120	97EemkWZcMpzb1NjrcJEhw	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-10 00:04:41.932114+00	2024-05-10 00:04:41.932114+00	LEtPNAqNqe-3BTo4RYijiA	999cb08a-5f0e-43bc-9df0-951913fbc922
00000000-0000-0000-0000-000000000000	121	3pzWMyTReAdQdJbzlA430A	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-10 00:13:18.061693+00	2024-05-10 00:13:18.061693+00	\N	5602e28a-62cd-4be4-86c8-fe6620f46fe0
00000000-0000-0000-0000-000000000000	122	xwU-hZ7tssj7YP1Juhbyng	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-10 00:19:39.527966+00	2024-05-10 00:19:39.527966+00	\N	8eadac75-9f8f-4444-ae0b-f1ed948f3f99
00000000-0000-0000-0000-000000000000	175	6gc-qC_0OBIC8azyNOTKdQ	fd43e516-7cde-41bc-b6d5-f10c54458bc2	f	2024-05-18 03:19:14.206567+00	2024-05-18 03:19:14.206567+00	\N	31cf0f8b-7df2-4449-aa2c-339b39dbf21b
00000000-0000-0000-0000-000000000000	123	ZjqL_wVPqTHW8NYe2rX8FQ	60e44e8c-a3fb-43ab-92a2-97806af7b62c	t	2024-05-10 00:23:35.101079+00	2024-05-10 01:31:12.515158+00	\N	b9ae07be-477d-48f8-bc34-85908a943d98
00000000-0000-0000-0000-000000000000	124	v-qoVfAom2xF1tBoI4MNig	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-10 01:31:12.524399+00	2024-05-10 01:31:12.524399+00	ZjqL_wVPqTHW8NYe2rX8FQ	b9ae07be-477d-48f8-bc34-85908a943d98
00000000-0000-0000-0000-000000000000	125	hWPDhzyc1giMQNUlFVqwyg	60e44e8c-a3fb-43ab-92a2-97806af7b62c	t	2024-05-10 01:46:57.394748+00	2024-05-10 02:46:27.860448+00	\N	1dc49bed-b7d6-4188-a30d-1d264e63a393
00000000-0000-0000-0000-000000000000	126	YcW09Hs7kkLtjFW9ksWq1A	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-10 02:46:27.865575+00	2024-05-10 02:46:27.865575+00	hWPDhzyc1giMQNUlFVqwyg	1dc49bed-b7d6-4188-a30d-1d264e63a393
00000000-0000-0000-0000-000000000000	127	linxK4YJujy_D4VTY_nc0Q	60e44e8c-a3fb-43ab-92a2-97806af7b62c	t	2024-05-10 02:46:27.93449+00	2024-05-17 15:06:48.83136+00	\N	f34a128e-2ffd-466e-b121-9eda600e3794
00000000-0000-0000-0000-000000000000	128	3xA6okCc5MvsvhubAtADjw	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-17 15:06:48.85004+00	2024-05-17 15:06:48.85004+00	linxK4YJujy_D4VTY_nc0Q	f34a128e-2ffd-466e-b121-9eda600e3794
00000000-0000-0000-0000-000000000000	129	YcckXJ9Oh9p4jS9kocnLQQ	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-17 15:07:14.808179+00	2024-05-17 15:07:14.808179+00	\N	a921e259-f9fb-41bd-89aa-81617bdd5388
00000000-0000-0000-0000-000000000000	130	S3xToyP8SgKFjmtxCG1sjg	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-17 15:19:30.963961+00	2024-05-17 15:19:30.963961+00	\N	2afefd6c-6fbc-4f70-bf02-7545f7184b9e
00000000-0000-0000-0000-000000000000	131	emmQwXHQDuvuebglctA-YQ	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-17 15:39:33.93815+00	2024-05-17 15:39:33.93815+00	\N	a4091673-d6b8-4a8e-b5ca-3766b1d317e7
00000000-0000-0000-0000-000000000000	132	fyNNpsXqBZSXBxOGm9lb3g	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-17 15:45:00.731384+00	2024-05-17 15:45:00.731384+00	\N	662bdb85-1782-4d4a-8222-2e77c7e2ae85
00000000-0000-0000-0000-000000000000	133	YBc8dUTLz4_JGPVt7gJMfg	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-17 15:46:53.4272+00	2024-05-17 15:46:53.4272+00	\N	adf65043-3cad-4e03-b812-344fd0809500
00000000-0000-0000-0000-000000000000	134	Bk4w7LLt6AlbvTonsB38zQ	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-17 15:49:16.914269+00	2024-05-17 15:49:16.914269+00	\N	2fed607f-6e0c-43e7-8d0d-dcbe035abc70
00000000-0000-0000-0000-000000000000	135	EUR2hJocGEebvPVxUfZqdw	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-17 15:50:55.406563+00	2024-05-17 15:50:55.406563+00	\N	93b3ee5c-315c-4865-bfe0-4348f07dd7f1
00000000-0000-0000-0000-000000000000	136	tRBGNpYpy879MJKgf4TGZw	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-17 15:53:21.715808+00	2024-05-17 15:53:21.715808+00	\N	22ba1b39-247b-4ee8-b5de-69aa207b3c94
00000000-0000-0000-0000-000000000000	137	PDmTVr3s_Ecg_Zy4MeJKjQ	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-17 16:00:08.290612+00	2024-05-17 16:00:08.290612+00	\N	a39d0b49-ee40-4c76-9275-83cf5daf77f6
00000000-0000-0000-0000-000000000000	138	7GKGJZCjKs3JkmHuWiugsg	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-17 16:02:18.059397+00	2024-05-17 16:02:18.059397+00	\N	dcf85663-cc0f-40bb-85d7-0e1e22d5cf1a
00000000-0000-0000-0000-000000000000	139	PpmDF370v6Dt4EMhFSLC4g	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-17 16:04:39.865801+00	2024-05-17 16:04:39.865801+00	\N	4172a446-910d-4bbd-9b41-ee16639f87fa
00000000-0000-0000-0000-000000000000	140	n1pOts3It-iGoI8MYDIx7g	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-17 16:20:18.918673+00	2024-05-17 16:20:18.918673+00	\N	9082de1f-f93d-4149-a445-513a3c1fb728
00000000-0000-0000-0000-000000000000	184	AuzXOmY8ZUCRcVUTqrWRFw	bac48432-f3eb-4950-9ae0-6158e7d4f91c	f	2024-05-20 18:35:37.414078+00	2024-05-20 18:35:37.414078+00	\N	385b6d6d-79b3-4b1e-9023-c79036122496
00000000-0000-0000-0000-000000000000	144	ATuGyw7ac0dTpt8vC1oe-Q	6f60f9a0-b528-4727-ac58-1e5473fed6b8	f	2024-05-17 18:57:56.069125+00	2024-05-17 18:57:56.069125+00	\N	9594b013-e8c8-40c4-9a90-a2265503bf02
00000000-0000-0000-0000-000000000000	151	yRBy4_pFQMKTaHS_Fd1n1A	60e44e8c-a3fb-43ab-92a2-97806af7b62c	f	2024-05-17 21:08:37.579678+00	2024-05-17 21:08:37.579678+00	\N	65536d9a-2ccd-400e-b5af-4fe97d87ea85
00000000-0000-0000-0000-000000000000	156	lT1pt3tNgkePyTLJ_lDy1A	d88ada64-2299-4b96-91af-f7e689518875	t	2024-05-17 22:04:58.685159+00	2024-05-17 23:04:26.802298+00	\N	39d1d881-cc80-450e-a21f-1d8aa11bbdda
00000000-0000-0000-0000-000000000000	157	gRY38xC9593th9xr9BbsPA	d88ada64-2299-4b96-91af-f7e689518875	f	2024-05-17 23:04:26.824064+00	2024-05-17 23:04:26.824064+00	lT1pt3tNgkePyTLJ_lDy1A	39d1d881-cc80-450e-a21f-1d8aa11bbdda
00000000-0000-0000-0000-000000000000	158	UPhKofEk23w0Y8NhuJngMQ	d88ada64-2299-4b96-91af-f7e689518875	f	2024-05-17 23:11:20.693989+00	2024-05-17 23:11:20.693989+00	\N	b5029c6c-1c3e-4a17-8da9-9f78a992d7f8
00000000-0000-0000-0000-000000000000	194	oXvQVvV-aerdcp7KHemlvw	87c41a23-24ea-4a88-bbb8-fe3e7973b2ae	f	2024-06-21 21:57:26.699844+00	2024-06-21 21:57:26.699844+00	\N	d20a00f2-30e7-420d-b76b-95806d79c136
00000000-0000-0000-0000-000000000000	199	xAeU0A1YdwPnpYIvJcPF1w	58e3b4b2-1a6e-4d34-becf-cf1217ac948d	t	2024-06-21 22:07:10.581384+00	2024-06-24 22:42:31.565157+00	\N	0c5f2dbe-2ad2-42e7-a2c2-4bdf4a5fa6ee
00000000-0000-0000-0000-000000000000	200	CUa2Vqd7lelgdObnvUttYw	58e3b4b2-1a6e-4d34-becf-cf1217ac948d	t	2024-06-24 22:42:31.572321+00	2024-06-24 23:46:50.75084+00	xAeU0A1YdwPnpYIvJcPF1w	0c5f2dbe-2ad2-42e7-a2c2-4bdf4a5fa6ee
00000000-0000-0000-0000-000000000000	201	ccUPwLojho1k1kVmLbweYQ	58e3b4b2-1a6e-4d34-becf-cf1217ac948d	f	2024-06-24 23:46:50.752782+00	2024-06-24 23:46:50.752782+00	CUa2Vqd7lelgdObnvUttYw	0c5f2dbe-2ad2-42e7-a2c2-4bdf4a5fa6ee
00000000-0000-0000-0000-000000000000	202	zQlS-EmPRNBFsoRAug9SXA	01f0935a-60bc-4cb3-b240-3d3b987ce0b3	f	2024-06-24 23:53:40.923744+00	2024-06-24 23:53:40.923744+00	\N	dfb7cd2b-111e-43d2-9aea-ee6f90cf50e2
00000000-0000-0000-0000-000000000000	198	uhQwujG8np0U32gi87Ykug	87c41a23-24ea-4a88-bbb8-fe3e7973b2ae	t	2024-06-21 22:06:42.367159+00	2024-06-25 10:10:42.442891+00	\N	2e338123-f4f6-4514-b924-f2ab9d4d4901
00000000-0000-0000-0000-000000000000	204	7fDoEbWXUSGia31jkd8JJw	87c41a23-24ea-4a88-bbb8-fe3e7973b2ae	f	2024-06-25 10:10:42.453823+00	2024-06-25 10:10:42.453823+00	uhQwujG8np0U32gi87Ykug	2e338123-f4f6-4514-b924-f2ab9d4d4901
00000000-0000-0000-0000-000000000000	205	bQp6n9AcVZdz1tCuuQQoLQ	68769cb2-86a4-46e7-96fe-ce3efaba8b8e	t	2024-06-25 10:12:48.078644+00	2024-06-25 12:08:06.01465+00	\N	8b413753-b571-454d-bc95-edbc2027fd26
00000000-0000-0000-0000-000000000000	206	oA7QaOkuewgQ-ZtK5Nug-w	68769cb2-86a4-46e7-96fe-ce3efaba8b8e	f	2024-06-25 12:08:06.018782+00	2024-06-25 12:08:06.018782+00	bQp6n9AcVZdz1tCuuQQoLQ	8b413753-b571-454d-bc95-edbc2027fd26
00000000-0000-0000-0000-000000000000	209	dUI6WkeXCzsqYZqV9BjMWA	87c41a23-24ea-4a88-bbb8-fe3e7973b2ae	f	2024-06-25 12:17:42.133742+00	2024-06-25 12:17:42.133742+00	\N	210498c6-1ca5-4c29-b967-484ff34a442e
00000000-0000-0000-0000-000000000000	210	vjn-gARgPHYotV2AKMCL2A	68769cb2-86a4-46e7-96fe-ce3efaba8b8e	f	2024-06-25 12:19:19.405846+00	2024-06-25 12:19:19.405846+00	\N	7d2e95ef-0de3-4fa8-a158-3717fbfc0c40
00000000-0000-0000-0000-000000000000	211	MpiNBd2yhfkiMRFiiph2DA	68769cb2-86a4-46e7-96fe-ce3efaba8b8e	f	2024-06-25 12:37:52.252658+00	2024-06-25 12:37:52.252658+00	\N	94e0da87-11b0-4c54-905a-ee1265317b87
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag) FROM stdin;
fda784e5-8780-4a60-933c-23fcc21c02a3	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-03 21:22:09.312803+00	2024-05-03 21:22:09.312803+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.123.178	\N
e40b7a6a-3b49-45af-bd9d-d5e1ee6919b3	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-04-13 22:02:39.322317+00	2024-04-13 22:02:39.322317+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.109.215.97	\N
fb1ffa65-aedc-4895-83ce-18c92a331ca1	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-04-13 22:03:07.130794+00	2024-04-13 23:02:34.587225+00	\N	aal1	\N	2024-04-13 23:02:34.587154	Dart/3.3 (dart:io)	105.109.215.97	\N
7e91ce7e-021e-42ce-b18b-0d29b067f516	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-04-13 23:20:47.342468+00	2024-04-13 23:20:47.342468+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.109.215.97	\N
b93415b8-3443-4295-b934-ebed1d7e92e7	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-04-13 23:21:27.56924+00	2024-04-14 17:06:05.193919+00	\N	aal1	\N	2024-04-14 17:06:05.19383	Dart/3.3 (dart:io)	154.255.242.171	\N
44c1aa7f-2f84-49ea-8e5c-12e331cf091e	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-04-14 17:06:35.778038+00	2024-04-14 17:06:35.778038+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	154.255.242.171	\N
1eadba2a-dc96-458e-a75d-a38b89c557ca	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-04-14 17:08:25.289558+00	2024-04-14 17:08:25.289558+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	154.255.242.171	\N
97c88ae4-228b-48fa-923e-6d8bf4c07348	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-04-14 17:36:15.520061+00	2024-04-14 17:36:15.520061+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	154.255.242.171	\N
4fcdf297-cfb1-47a1-a182-aca04e76e73d	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-04-14 17:36:18.580212+00	2024-04-14 21:06:47.21028+00	\N	aal1	\N	2024-04-14 21:06:47.2102	Dart/3.3 (dart:io)	154.255.242.171	\N
9222b6c9-b1cc-42b6-b7be-6ff457d551b3	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-04-14 21:08:59.529198+00	2024-04-14 21:08:59.529198+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	154.255.242.171	\N
40f6f0ff-83f0-4b35-b112-a5558a7c10b5	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-04-14 21:35:52.748104+00	2024-04-14 22:35:17.456328+00	\N	aal1	\N	2024-04-14 22:35:17.456245	Dart/3.3 (dart:io)	154.255.242.171	\N
3b40e2b9-0ac3-44bc-8998-6f3d6539c1cc	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-03 16:43:38.354967+00	2024-05-03 16:43:38.354967+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.32.138	\N
62821a61-0da8-461a-b5ec-0411df2da4d0	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-03 17:01:08.180361+00	2024-05-03 17:01:08.180361+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.32.138	\N
d6dd2ecd-f13b-4d71-8853-7179a82e9bd7	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-03 17:08:29.352177+00	2024-05-03 17:08:29.352177+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.32.138	\N
c82dcbc7-fd79-4ed2-b8ba-a3febbf567a5	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-03 17:20:07.974254+00	2024-05-03 18:19:36.111599+00	\N	aal1	\N	2024-05-03 18:19:36.110934	Dart/3.3 (dart:io)	105.110.32.138	\N
52e14762-115f-4c59-9958-e4d9192da518	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-03 19:02:17.023164+00	2024-05-03 19:02:17.023164+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.32.138	\N
16e5f574-6345-4312-b46d-4083dae89ee0	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-03 19:33:02.441076+00	2024-05-03 19:33:02.441076+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.123.178	\N
5775c54f-3fab-4afc-b9a9-6db068bfa56d	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-03 19:33:35.459787+00	2024-05-03 19:33:35.459787+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.123.178	\N
494e98d3-651b-4fa9-8560-a692ae1054cf	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-03 19:33:50.471893+00	2024-05-03 19:33:50.471893+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.123.178	\N
27dd069a-031e-4d65-8049-fdc80e3e1bc6	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-03 19:34:10.984932+00	2024-05-03 19:34:10.984932+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.123.178	\N
2c5e515c-0bbf-4c49-9924-e700fdd5234c	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-03 19:34:32.05018+00	2024-05-03 19:34:32.05018+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.123.178	\N
33d9b5af-ae43-484e-8ee3-a86521d916e1	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-03 19:34:49.816467+00	2024-05-03 19:34:49.816467+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.123.178	\N
b4035d38-00c6-46a7-bbab-d8a097b9ffb9	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-03 19:45:49.975576+00	2024-05-03 19:45:49.975576+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.123.178	\N
1a421221-8a1a-4c0d-9136-15326ff20bbb	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-03 19:47:41.133113+00	2024-05-03 19:47:41.133113+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.123.178	\N
afc139ea-13a5-4fdc-bfb0-6153eb8a6a0b	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-03 19:48:45.12373+00	2024-05-03 19:48:45.12373+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.123.178	\N
884c8596-dc30-4368-bb7e-5d8c2a622384	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-03 19:49:02.847401+00	2024-05-03 19:49:02.847401+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.123.178	\N
cca10e52-bdbe-49ad-bd7c-b60b7f47e499	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-03 19:52:37.154762+00	2024-05-03 19:52:37.154762+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.123.178	\N
c46a6fb8-a8e4-48f4-a9b5-38bac953aef7	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-03 19:54:12.752807+00	2024-05-03 19:54:12.752807+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.123.178	\N
c2c7a585-8035-4f9e-93e8-890cdf0caf3c	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-03 19:57:10.832928+00	2024-05-03 19:57:10.832928+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.123.178	\N
7dfe9b33-e05b-4be0-b612-4c5eff57b694	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-03 19:58:02.601516+00	2024-05-03 19:58:02.601516+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.123.178	\N
54d8a3f1-f4c2-4d0e-9239-ce6620166b80	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-03 20:00:32.490014+00	2024-05-03 20:00:32.490014+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.123.178	\N
26c048fc-9141-4dd1-a185-a5140fc26bb9	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-03 20:02:45.896679+00	2024-05-03 20:02:45.896679+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.123.178	\N
c28c50cd-54cf-4f90-b3d0-e2fd122413be	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-03 20:11:38.576568+00	2024-05-03 21:19:19.66544+00	\N	aal1	\N	2024-05-03 21:19:19.665043	Dart/3.3 (dart:io)	105.110.123.178	\N
f42e4c3b-62db-4dd0-a319-7cbd7df5dc89	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-03 22:09:33.094109+00	2024-05-03 22:09:33.094109+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.235.136.189	\N
7693d689-65b5-4ed3-96f3-d87d167a5b33	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-03 22:18:45.409136+00	2024-05-03 22:18:45.409136+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.235.136.189	\N
aebbba64-c1e0-48f3-a09d-f3c6149aaac8	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-03 22:51:59.344175+00	2024-05-03 22:51:59.344175+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.235.136.189	\N
bc2655b2-edf2-454a-9dee-8e8c276827e4	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-03 22:53:06.0765+00	2024-05-03 22:53:06.0765+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.235.136.189	\N
b675d395-7f01-4689-8be4-81e6ce8da51e	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-03 22:55:09.564227+00	2024-05-03 22:55:09.564227+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.235.136.189	\N
987b26a3-100b-4115-bf01-658cf7e3b78e	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-03 23:01:19.432335+00	2024-05-04 00:00:45.313774+00	\N	aal1	\N	2024-05-04 00:00:45.31367	Dart/3.3 (dart:io)	105.235.136.189	\N
0b164bfd-345e-487d-9b97-9e4f88851ba6	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-04 00:27:35.786696+00	2024-05-04 01:32:04.020841+00	\N	aal1	\N	2024-05-04 01:32:04.020746	Dart/3.3 (dart:io)	105.110.123.178	\N
62c6d71b-3d41-4c1f-be80-c4eff7b7eb9d	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-04 01:33:03.192141+00	2024-05-04 01:33:03.192141+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.123.178	\N
8bd51f01-f0d8-4a1d-a0c6-71c2dcb57066	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-04 01:34:20.036242+00	2024-05-04 01:34:20.036242+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.123.178	\N
cf6a3a31-bd4a-4ec2-bbde-edb10c5dd2ee	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-04 02:11:02.536944+00	2024-05-04 02:11:02.536944+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.123.178	\N
d6e737e6-8ae9-4c02-91fc-c310552972cc	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-04 02:23:30.803643+00	2024-05-04 02:23:30.803643+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.123.178	\N
107f1ca9-3995-49ae-be96-cc3887d71b4d	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-04 02:26:28.246692+00	2024-05-04 02:26:28.246692+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.123.178	\N
567a3d8e-8815-401b-a9a6-86be774d9021	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-08 00:47:22.181549+00	2024-05-08 00:47:22.181549+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.204.188	\N
d5528182-e0dd-4ed2-b397-5b127c10108e	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-04 02:28:12.456043+00	2024-05-07 21:28:59.486812+00	\N	aal1	\N	2024-05-07 21:28:59.485951	Dart/3.3 (dart:io)	105.110.204.188	\N
0b23d7eb-7bf8-4f39-9f09-dc6a3af5a991	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-07 21:30:04.130505+00	2024-05-07 23:50:41.200674+00	\N	aal1	\N	2024-05-07 23:50:41.200585	Dart/3.3 (dart:io)	105.110.204.188	\N
243887d9-41dc-4b26-99a9-6deed542b6cb	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-09 01:30:15.353106+00	2024-05-09 01:30:15.353106+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	41.200.82.188	\N
c4deefa9-9388-4d93-b1aa-7eb8b307516e	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-08 21:32:15.001521+00	2024-05-08 21:32:15.001521+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	41.200.82.188	\N
a1e772c9-8b81-4a6b-a567-0cc0b2dc5d8d	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-08 21:34:40.8559+00	2024-05-08 21:34:40.8559+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	41.200.82.188	\N
f824fe94-4863-4f0e-b520-1727d451e0f9	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-08 21:58:45.548348+00	2024-05-08 22:58:09.787499+00	\N	aal1	\N	2024-05-08 22:58:09.787407	Dart/3.3 (dart:io)	41.200.82.188	\N
c9e6ce48-b283-46ae-93dc-2536be0b0768	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-08 23:12:45.922793+00	2024-05-08 23:12:45.922793+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	41.200.82.188	\N
53b5fc74-5256-4b95-9061-02053c7448df	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-08 23:15:03.284142+00	2024-05-08 23:15:03.284142+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	41.200.82.188	\N
4562177c-eb0d-4a95-9da5-c3c101c877fd	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-08 23:30:23.735497+00	2024-05-08 23:30:23.735497+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	41.200.82.188	\N
0a013bba-1108-46a0-998f-1a01a681220a	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-08 23:47:40.711889+00	2024-05-08 23:47:40.711889+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	41.200.82.188	\N
f883ee04-6f60-4506-b7a1-6d5b7974be62	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-09 00:26:04.64184+00	2024-05-09 00:26:04.64184+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	41.200.82.188	\N
8134c183-9a66-4066-b98e-c28f030469b3	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-08 01:03:53.117635+00	2024-05-09 01:16:02.919639+00	\N	aal1	\N	2024-05-09 01:16:02.919538	Dart/3.3 (dart:io)	41.200.82.188	\N
f2dd37b1-f508-43d1-bbee-a6bc4d4ce6b3	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-09 01:17:11.413171+00	2024-05-09 01:17:11.413171+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	41.200.82.188	\N
3d3e8a25-2ca3-435d-9899-23788931e8d1	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-09 01:27:13.388193+00	2024-05-09 01:27:13.388193+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	41.200.82.188	\N
e33f9620-122a-4fc1-9026-fadd876e48f4	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-09 01:31:03.452945+00	2024-05-09 01:31:03.452945+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	41.200.82.188	\N
b1f64a35-8bb2-4dcc-aa5c-c710b0f5b16f	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-09 01:50:53.686949+00	2024-05-09 01:50:53.686949+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.235.136.176	\N
cc06d5e0-41af-4818-a02c-0dfbbb9a743b	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-09 01:59:07.193619+00	2024-05-09 01:59:07.193619+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.235.136.176	\N
68094567-fbee-4b4e-a384-b333cafe5c4d	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-09 02:47:03.969878+00	2024-05-09 02:47:03.969878+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.235.136.176	\N
672edbff-6b9d-4d28-a846-99b202ee9145	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-09 02:57:43.855432+00	2024-05-09 02:57:43.855432+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.235.136.176	\N
efbb33b6-2ced-47f7-a7cb-59e796dd9a9a	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-09 02:58:45.076752+00	2024-05-09 02:58:45.076752+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.235.136.176	\N
1ae91f4c-9509-4120-88f1-7410a20449ac	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-09 03:00:40.684326+00	2024-05-09 03:00:40.684326+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.235.136.176	\N
ce7f63f3-a983-4b89-b78c-2553afd4483a	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-09 03:02:05.999746+00	2024-05-09 03:02:05.999746+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.235.136.176	\N
36665835-8ba4-4bee-ba8b-cf18bb1fb6ef	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-09 03:11:06.759388+00	2024-05-09 21:37:21.581998+00	\N	aal1	\N	2024-05-09 21:37:21.581903	Dart/3.3 (dart:io)	105.110.155.224	\N
4869b74d-7a36-45ad-97cf-d87862e4868e	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-09 21:37:51.14025+00	2024-05-09 21:37:51.14025+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.155.224	\N
61323d86-c9f8-4a9d-a8ee-0935471dc6a2	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-09 22:03:41.453543+00	2024-05-09 22:03:41.453543+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.155.224	\N
999cb08a-5f0e-43bc-9df0-951913fbc922	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-09 22:05:44.70905+00	2024-05-10 00:04:41.944616+00	\N	aal1	\N	2024-05-10 00:04:41.943468	Dart/3.3 (dart:io)	105.110.155.224	\N
5602e28a-62cd-4be4-86c8-fe6620f46fe0	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-10 00:13:18.054896+00	2024-05-10 00:13:18.054896+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.155.224	\N
8eadac75-9f8f-4444-ae0b-f1ed948f3f99	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-10 00:19:39.525043+00	2024-05-10 00:19:39.525043+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.110.155.224	\N
b9ae07be-477d-48f8-bc34-85908a943d98	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-10 00:23:35.099353+00	2024-05-10 01:31:12.532033+00	\N	aal1	\N	2024-05-10 01:31:12.531944	Dart/3.3 (dart:io)	105.110.155.224	\N
1dc49bed-b7d6-4188-a30d-1d264e63a393	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-10 01:46:57.3846+00	2024-05-10 02:46:27.884036+00	\N	aal1	\N	2024-05-10 02:46:27.877373	Dart/3.3 (dart:io)	105.110.155.224	\N
f34a128e-2ffd-466e-b121-9eda600e3794	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-10 02:46:27.929098+00	2024-05-17 15:06:48.875699+00	\N	aal1	\N	2024-05-17 15:06:48.873953	Dart/3.3 (dart:io)	105.111.14.226	\N
a921e259-f9fb-41bd-89aa-81617bdd5388	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-17 15:07:14.800776+00	2024-05-17 15:07:14.800776+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.111.14.226	\N
2afefd6c-6fbc-4f70-bf02-7545f7184b9e	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-17 15:19:30.945564+00	2024-05-17 15:19:30.945564+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.111.14.226	\N
a4091673-d6b8-4a8e-b5ca-3766b1d317e7	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-17 15:39:33.918197+00	2024-05-17 15:39:33.918197+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.111.14.226	\N
662bdb85-1782-4d4a-8222-2e77c7e2ae85	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-17 15:45:00.719079+00	2024-05-17 15:45:00.719079+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.111.14.226	\N
adf65043-3cad-4e03-b812-344fd0809500	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-17 15:46:53.421119+00	2024-05-17 15:46:53.421119+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.111.14.226	\N
2fed607f-6e0c-43e7-8d0d-dcbe035abc70	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-17 15:49:16.907976+00	2024-05-17 15:49:16.907976+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.111.14.226	\N
93b3ee5c-315c-4865-bfe0-4348f07dd7f1	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-17 15:50:55.404039+00	2024-05-17 15:50:55.404039+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.111.14.226	\N
22ba1b39-247b-4ee8-b5de-69aa207b3c94	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-17 15:53:21.710558+00	2024-05-17 15:53:21.710558+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.111.14.226	\N
a39d0b49-ee40-4c76-9275-83cf5daf77f6	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-17 16:00:08.276881+00	2024-05-17 16:00:08.276881+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.111.14.226	\N
dcf85663-cc0f-40bb-85d7-0e1e22d5cf1a	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-17 16:02:18.051316+00	2024-05-17 16:02:18.051316+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.111.14.226	\N
4172a446-910d-4bbd-9b41-ee16639f87fa	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-17 16:04:39.860613+00	2024-05-17 16:04:39.860613+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.111.14.226	\N
9082de1f-f93d-4149-a445-513a3c1fb728	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-17 16:20:18.899804+00	2024-05-17 16:20:18.899804+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.111.14.226	\N
31cf0f8b-7df2-4449-aa2c-339b39dbf21b	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-05-18 03:19:14.196395+00	2024-05-18 03:19:14.196395+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.235.136.169	\N
9594b013-e8c8-40c4-9a90-a2265503bf02	6f60f9a0-b528-4727-ac58-1e5473fed6b8	2024-05-17 18:57:56.052249+00	2024-05-17 18:57:56.052249+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.111.14.226	\N
65536d9a-2ccd-400e-b5af-4fe97d87ea85	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-17 21:08:37.575313+00	2024-05-17 21:08:37.575313+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.111.14.226	\N
39d1d881-cc80-450e-a21f-1d8aa11bbdda	d88ada64-2299-4b96-91af-f7e689518875	2024-05-17 22:04:58.674099+00	2024-05-17 23:04:26.850338+00	\N	aal1	\N	2024-05-17 23:04:26.84975	Dart/3.3 (dart:io)	105.111.14.226	\N
b5029c6c-1c3e-4a17-8da9-9f78a992d7f8	d88ada64-2299-4b96-91af-f7e689518875	2024-05-17 23:11:20.667994+00	2024-05-17 23:11:20.667994+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.111.14.226	\N
822147ba-4ddb-4dc7-858d-69f81bbb0d64	5de7a4b5-a050-412b-9406-13c05ac5deb3	2024-05-18 01:56:32.473787+00	2024-05-18 01:56:32.473787+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.235.136.169	\N
0c612292-58f8-462f-b9a0-7e9d0a5c6e97	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-18 02:36:57.265679+00	2024-05-18 02:36:57.265679+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.235.136.169	\N
1a08d98f-492a-4172-8b79-86daf385c50d	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-18 02:44:37.935534+00	2024-05-18 02:44:37.935534+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.235.136.169	\N
53425bb6-5e6c-47e2-abd5-f1167d004942	60e44e8c-a3fb-43ab-92a2-97806af7b62c	2024-05-18 03:10:53.845662+00	2024-05-18 03:10:53.845662+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.235.136.169	\N
385b6d6d-79b3-4b1e-9023-c79036122496	bac48432-f3eb-4950-9ae0-6158e7d4f91c	2024-05-20 18:35:37.387843+00	2024-05-20 18:35:37.387843+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	129.45.121.171	\N
760e8632-55ff-47bd-80cf-f04f7428f05d	fd43e516-7cde-41bc-b6d5-f10c54458bc2	2024-04-28 20:10:47.997737+00	2024-05-23 20:00:26.705129+00	\N	aal1	\N	2024-05-23 20:00:26.705014	Dart/3.3 (dart:io)	105.107.158.209	\N
e5721772-9da3-4acb-ac12-c3330abb57f5	f934f44e-7c01-4891-9865-710573c3b2c8	2024-05-23 20:01:39.111606+00	2024-05-23 20:01:39.111606+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.107.158.209	\N
d20a00f2-30e7-420d-b76b-95806d79c136	87c41a23-24ea-4a88-bbb8-fe3e7973b2ae	2024-06-21 21:57:26.698925+00	2024-06-21 21:57:26.698925+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.107.143.17	\N
0c5f2dbe-2ad2-42e7-a2c2-4bdf4a5fa6ee	58e3b4b2-1a6e-4d34-becf-cf1217ac948d	2024-06-21 22:07:10.58063+00	2024-06-24 23:46:50.755322+00	\N	aal1	\N	2024-06-24 23:46:50.755236	Dart/3.3 (dart:io)	105.235.134.16	\N
dfb7cd2b-111e-43d2-9aea-ee6f90cf50e2	01f0935a-60bc-4cb3-b240-3d3b987ce0b3	2024-06-24 23:53:40.919828+00	2024-06-24 23:53:40.919828+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.235.134.16	\N
2e338123-f4f6-4514-b924-f2ab9d4d4901	87c41a23-24ea-4a88-bbb8-fe3e7973b2ae	2024-06-21 22:06:42.366145+00	2024-06-25 10:10:42.464986+00	\N	aal1	\N	2024-06-25 10:10:42.464894	Dart/3.3 (dart:io)	105.235.134.90	\N
8b413753-b571-454d-bc95-edbc2027fd26	68769cb2-86a4-46e7-96fe-ce3efaba8b8e	2024-06-25 10:12:48.075872+00	2024-06-25 12:08:06.02944+00	\N	aal1	\N	2024-06-25 12:08:06.029318	Dart/3.3 (dart:io)	105.235.134.154	\N
210498c6-1ca5-4c29-b967-484ff34a442e	87c41a23-24ea-4a88-bbb8-fe3e7973b2ae	2024-06-25 12:17:42.130064+00	2024-06-25 12:17:42.130064+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.235.134.154	\N
7d2e95ef-0de3-4fa8-a158-3717fbfc0c40	68769cb2-86a4-46e7-96fe-ce3efaba8b8e	2024-06-25 12:19:19.404574+00	2024-06-25 12:19:19.404574+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.235.134.154	\N
94e0da87-11b0-4c54-905a-ee1265317b87	68769cb2-86a4-46e7-96fe-ce3efaba8b8e	2024-06-25 12:37:52.250814+00	2024-06-25 12:37:52.250814+00	\N	aal1	\N	\N	Dart/3.3 (dart:io)	105.235.134.154	\N
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	0b87fed4-2707-45be-8c13-cd26d1012650	authenticated	authenticated	end@end.end	$2a$10$g8s5ikzMTKGBkcWal9Zad.K4/QnxuDzSFQYZEbeJZScDpQLjUUoEi	2024-05-18 03:28:54.682762+00	\N		\N		\N			\N	2024-05-23 20:17:16.521029+00	{"provider": "email", "providers": ["email"]}	{"sub": "0b87fed4-2707-45be-8c13-cd26d1012650", "email": "end@end.end", "email_verified": false, "phone_verified": false}	\N	2024-05-18 03:28:54.644295+00	2024-05-23 20:17:16.566306+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	44f73b43-19e0-41e7-be05-b92bfde54684	authenticated	authenticated	lkj@klj.cj	$2a$10$RM/cxfQ2xY1xTrR/ZCZJT.qvGQRs2A8WonIleudlhbtbMyE/Vo5Sa	2024-05-18 01:42:39.804331+00	\N		\N		\N			\N	2024-05-18 01:42:39.82561+00	{"provider": "email", "providers": ["email"]}	{"sub": "44f73b43-19e0-41e7-be05-b92bfde54684", "email": "lkj@klj.cj", "email_verified": false, "phone_verified": false}	\N	2024-05-18 01:42:39.719599+00	2024-05-18 01:42:39.8635+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	6f60f9a0-b528-4727-ac58-1e5473fed6b8	authenticated	authenticated	dfj@dj.c	$2a$10$Vchu.hCwCErS6lTJdo7Q.uP.DgldjRb8akA2yyl0P7O4fgWWqyzKi	2024-05-17 18:57:56.035566+00	\N		\N		\N			\N	2024-05-17 18:57:56.052155+00	{"provider": "email", "providers": ["email"]}	{"sub": "6f60f9a0-b528-4727-ac58-1e5473fed6b8", "email": "dfj@dj.c", "email_verified": false, "phone_verified": false}	\N	2024-05-17 18:57:55.977591+00	2024-05-17 18:57:56.094232+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	d88ada64-2299-4b96-91af-f7e689518875	authenticated	authenticated	how@how.how	$2a$10$ljSKkqSWisCsO9yWpwuYc.cqhHFnVuoSFv7zKJmi6GWL53ZZQKyeG	2024-05-17 21:53:18.407838+00	\N		\N		\N			\N	2024-05-17 23:18:28.307552+00	{"provider": "email", "providers": ["email"]}	{"sub": "d88ada64-2299-4b96-91af-f7e689518875", "email": "how@how.how", "email_verified": false, "phone_verified": false}	\N	2024-05-17 21:53:18.356419+00	2024-05-18 00:17:52.220139+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	60e44e8c-a3fb-43ab-92a2-97806af7b62c	authenticated	authenticated	nabet@nabet.com	$2a$10$YLj6IGoJ/hRjBVJn2S/jluse8LoqsabBhygqJX21UKirTKDjfC4C2	2024-05-03 20:02:45.893387+00	\N		\N		\N			\N	2024-05-18 03:12:56.443924+00	{"provider": "email", "providers": ["email"]}	{"sub": "60e44e8c-a3fb-43ab-92a2-97806af7b62c", "email": "nabet@nabet.com", "email_verified": false, "phone_verified": false}	\N	2024-05-03 20:02:45.868907+00	2024-05-18 03:12:56.463641+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	bac48432-f3eb-4950-9ae0-6158e7d4f91c	authenticated	authenticated	khaled.21.02.2000@gmail.com	$2a$10$ZcYLk7Emt0tKDKN8rC3Pl.B3GD11eH0cpkCUHfu0fLMaKvCXVfq/2	2024-05-18 03:21:58.551177+00	\N		\N		\N			\N	2024-05-20 18:35:37.387323+00	{"provider": "email", "providers": ["email"]}	{"sub": "bac48432-f3eb-4950-9ae0-6158e7d4f91c", "email": "khaled.21.02.2000@gmail.com", "email_verified": false, "phone_verified": false}	\N	2024-05-18 03:21:58.496385+00	2024-05-20 18:35:37.453145+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	fd43e516-7cde-41bc-b6d5-f10c54458bc2	authenticated	authenticated	stt.khaled@gmail.com	$2a$10$LJor1/dFbR1n3GreJm7IeO1zNmxoVIzLjaU.moeSD.TBm481UN5Vm	2024-04-13 22:02:39.315233+00	\N		\N		\N			\N	2024-05-18 03:19:14.196294+00	{"provider": "email", "providers": ["email"]}	{"sub": "fd43e516-7cde-41bc-b6d5-f10c54458bc2", "email": "stt.khaled@gmail.com", "email_verified": false, "phone_verified": false}	\N	2024-04-13 22:02:39.278529+00	2024-05-23 20:00:26.696146+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	6fbabc92-a706-43f9-88de-c4bd774ccd56	authenticated	authenticated	badrou@badrou.com	$2a$10$nvis.NmiDwbGl2HQ4FjlYevn.nSyTop0nu.xWbxDrWtbgFqRHf3ry	2024-05-18 01:52:51.498619+00	\N		\N		\N			\N	2024-05-18 01:52:51.520519+00	{"provider": "email", "providers": ["email"]}	{"sub": "6fbabc92-a706-43f9-88de-c4bd774ccd56", "email": "badrou@badrou.com", "email_verified": false, "phone_verified": false}	\N	2024-05-18 01:52:51.412589+00	2024-05-18 01:52:51.556887+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	1aec828b-701f-48c6-a21d-a968cff794b7	authenticated	authenticated	test@test.com	$2a$10$3njhvyNsp.V8WQWg07zAaewAScwcV3Dqp9w1moS1x3gHa/D41Me6e	2024-05-17 21:07:43.279681+00	\N		\N		\N			\N	2024-05-17 21:58:40.382286+00	{"provider": "email", "providers": ["email"]}	{"sub": "1aec828b-701f-48c6-a21d-a968cff794b7", "email": "test@test.com", "email_verified": false, "phone_verified": false}	\N	2024-05-17 21:07:43.190283+00	2024-05-17 21:58:40.406947+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	8bfb70a6-1f3e-4316-a580-7c486a40c679	authenticated	authenticated	end@end.co	$2a$10$1P3uNzxrwHmA9ohoX6DzEugaCd74UkBjVGrbq4pPgWHGNNYJDTLlG	2024-05-18 03:27:48.258121+00	\N		\N		\N			\N	2024-05-18 03:27:48.265376+00	{"provider": "email", "providers": ["email"]}	{"sub": "8bfb70a6-1f3e-4316-a580-7c486a40c679", "email": "end@end.co", "email_verified": false, "phone_verified": false}	\N	2024-05-18 03:27:48.235033+00	2024-05-18 03:27:48.277349+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	5de7a4b5-a050-412b-9406-13c05ac5deb3	authenticated	authenticated	karoui@karoui.com	$2a$10$05M9ADb3/ttZRbVD2dN7UOyl3VpXavxmijCtyFRo7Sdx53ajWkrJy	2024-05-17 19:01:21.741765+00	\N		\N		\N			\N	2024-05-18 01:56:32.473324+00	{"provider": "email", "providers": ["email"]}	{"sub": "5de7a4b5-a050-412b-9406-13c05ac5deb3", "email": "karoui@karoui.com", "email_verified": false, "phone_verified": false}	\N	2024-05-17 19:01:21.687506+00	2024-05-18 01:56:32.489013+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	f934f44e-7c01-4891-9865-710573c3b2c8	authenticated	authenticated	karim@gmail.com	$2a$10$gnLNcfFLdfcf6hMxVPFhkuZ5STDjcDcpO7yEWPVjvra2kOu2Zc9i6	2024-05-23 20:01:39.096228+00	\N		\N		\N			\N	2024-06-09 11:56:16.08205+00	{"provider": "email", "providers": ["email"]}	{"sub": "f934f44e-7c01-4891-9865-710573c3b2c8", "email": "karim@gmail.com", "email_verified": false, "phone_verified": false}	\N	2024-05-23 20:01:39.044486+00	2024-06-09 11:56:16.114483+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	4bf92899-c5a6-45c5-b75e-166ca779e5f8	authenticated	authenticated	ali@gmail.com	$2a$10$soe99.973QSO5AK4lanD3.XbuO7zjzaYhddcIXY/fesQuzeAAhVpy	2024-05-23 20:30:22.914381+00	\N		\N		\N			\N	2024-05-23 20:30:22.934519+00	{"provider": "email", "providers": ["email"]}	{"sub": "4bf92899-c5a6-45c5-b75e-166ca779e5f8", "email": "ali@gmail.com", "email_verified": false, "phone_verified": false}	\N	2024-05-23 20:30:22.810569+00	2024-05-23 20:30:22.979243+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	58e3b4b2-1a6e-4d34-becf-cf1217ac948d	authenticated	authenticated	test@tesst.com	$2a$10$ylHpf0HUoSi7Ukxjd1oh9.aqfUK5Oc7sLVriSLN/FPBs64HW9NaIm	2024-05-18 03:26:58.531763+00	\N		\N		\N			\N	2024-06-21 22:07:10.580559+00	{"provider": "email", "providers": ["email"]}	{"sub": "58e3b4b2-1a6e-4d34-becf-cf1217ac948d", "email": "test@tesst.com", "email_verified": false, "phone_verified": false}	\N	2024-05-18 03:26:58.482986+00	2024-06-24 23:46:50.75396+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	87c41a23-24ea-4a88-bbb8-fe3e7973b2ae	authenticated	authenticated	ali.derdour@gmail.com	$2a$10$HbwOEfyzif40tC2uhfvEgecZFZYgSxkV0Z/qe75TE4NUxmNxA/4ri	2024-06-21 21:51:02.386428+00	\N		\N		\N			\N	2024-06-25 12:17:42.129962+00	{"provider": "email", "providers": ["email"]}	{"sub": "87c41a23-24ea-4a88-bbb8-fe3e7973b2ae", "email": "ali.derdour@gmail.com", "email_verified": false, "phone_verified": false}	\N	2024-06-21 21:51:02.338843+00	2024-06-25 12:17:42.136834+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	01f0935a-60bc-4cb3-b240-3d3b987ce0b3	authenticated	authenticated	touiker21@gmail.com	$2a$10$TBB.onLjEfXAvbPYouFhIO2eNIf7vrZ3tIxuwpfu9Z0U7vlWo7nCW	2024-06-24 23:53:40.912933+00	\N		\N		\N			\N	2024-06-24 23:55:04.100539+00	{"provider": "email", "providers": ["email"]}	{"sub": "01f0935a-60bc-4cb3-b240-3d3b987ce0b3", "email": "touiker21@gmail.com", "email_verified": false, "phone_verified": false}	\N	2024-06-24 23:53:40.891025+00	2024-06-24 23:55:04.103096+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	68769cb2-86a4-46e7-96fe-ce3efaba8b8e	authenticated	authenticated	dahou21@gmail.com	$2a$10$htCDCAVXgDP1ZzRBGXwnleF9zkYOBlZvDKVu5N5fuaDNYRC4dE7l2	2024-06-25 10:12:48.067819+00	\N		\N		\N			\N	2024-06-25 12:37:52.250742+00	{"provider": "email", "providers": ["email"]}	{"sub": "68769cb2-86a4-46e7-96fe-ce3efaba8b8e", "email": "dahou21@gmail.com", "email_verified": false, "phone_verified": false}	\N	2024-06-25 10:12:48.047247+00	2024-06-25 12:37:52.254635+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--

COPY pgsodium.key (id, status, created, expires, key_type, key_id, key_context, name, associated_data, raw_key, raw_key_nonce, parent_key, comment, user_data) FROM stdin;
\.


--
-- Data for Name: announcement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.announcement (id, uuid, last_name, name, content, created_at) FROM stdin;
16	f934f44e-7c01-4891-9865-710573c3b2c8	derdour	karim	afficage test	2024-05-23 20:02:48.159011+00
18	87c41a23-24ea-4a88-bbb8-fe3e7973b2ae	derdour	ali	test on réal Phone\n	2024-06-21 21:51:49.658343+00
\.


--
-- Data for Name: calendarAppointment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."calendarAppointment" (id, created_at, start_at, end_at, subject, color, date, faculty, department, principal_teacher, exam_level) FROM stdin;
18	2024-05-18 03:30:39.835407+00	09:30	11:00	algo	0xffF46D8D	2024-05-18	science 	informatique 	slimane tich tich 	L3 info si
20	2024-05-23 20:14:12.230775+00	09:00	11:00	daw	0xffADBDFF	2024-05-24	sscience	info	karim	L3 info si
21	2024-05-23 20:15:11.45842+00	08:00	10:00	daw	0xff472C83	2024-05-23	science	info	karim	L3 info si
22	2024-06-21 22:01:44.808458+00	08:00	10:00	SI 2	0xffADBDFF	2024-06-22	science	informatique 	ali	M1 glaa
23	2024-06-25 12:12:43.887406+00	08:00	10:00	POO	0xff2C53DD	2024-06-26	science	informatics	derdour	L3 info si
\.


--
-- Data for Name: student_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_list (id, created_at, name, last_name, id_number, uuid, avatar_url) FROM stdin;
29	2024-05-18 03:31:49.830135+00				bac48432-f3eb-4950-9ae0-6158e7d4f91c	\N
30	2024-05-23 20:23:23.561592+00	badrou	badrou	3600	f934f44e-7c01-4891-9865-710573c3b2c8	\N
28	2024-05-18 03:31:10.989579+00	karim	derdour	fg34klj34	bac48432-f3eb-4950-9ae0-6158e7d4f91c	\N
31	2024-06-21 21:58:00.660074+00	test	test	3600	87c41a23-24ea-4a88-bbb8-fe3e7973b2ae	\N
32	2024-06-25 12:23:38.716451+00	mezian	dahou	36003623	87c41a23-24ea-4a88-bbb8-fe3e7973b2ae	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, created_at, name, last_name, id_number, user_role, email, user_categorie, profile_url) FROM stdin;
0b87fed4-2707-45be-8c13-cd26d1012650	2024-05-18 03:28:55.137822+00	badrou	badrou 	3600	student	end@end.end	L3 info si	\N
f934f44e-7c01-4891-9865-710573c3b2c8	2024-05-23 20:01:40.053449+00	karim	derdour	36003700	teacher	karim@gmail.com	principal	https://hlepvedspymbjldkcomq.supabase.co/storage/v1/object/public/profiles//f934f44e-7c01-4891-9865-710573c3b2c8/profile
8bfb70a6-1f3e-4316-a580-7c486a40c679	2024-05-18 03:27:48.628984+00	kjhf	sdf	36001672	teacher	end@end.co	normal	\N
4bf92899-c5a6-45c5-b75e-166ca779e5f8	2024-05-23 20:30:23.543183+00	ali	ali	1231234	teacher	ali@gmail.com	normal	\N
87c41a23-24ea-4a88-bbb8-fe3e7973b2ae	2024-06-21 21:51:03.064285+00	ali	derdour	24848390	teacher	ali.derdour@gmail.com	principal	https://hlepvedspymbjldkcomq.supabase.co/storage/v1/object/public/profiles//87c41a23-24ea-4a88-bbb8-fe3e7973b2ae/profile
01f0935a-60bc-4cb3-b240-3d3b987ce0b3	2024-06-24 23:53:41.446574+00	touiker	mehdi	3450340	student	touiker21@gmail.com	L3 info si	\N
68769cb2-86a4-46e7-96fe-ce3efaba8b8e	2024-06-25 10:12:48.505284+00	mezian	dahou	36003623	student	dahou21@gmail.com	L3 info isil	\N
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: realtime; Owner: supabase_realtime_admin
--

COPY realtime.messages (id, topic, extension, inserted_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2024-04-05 00:09:58
20211116045059	2024-04-05 00:09:58
20211116050929	2024-04-05 00:09:58
20211116051442	2024-04-05 00:09:58
20211116212300	2024-04-05 00:09:59
20211116213355	2024-04-05 00:09:59
20211116213934	2024-04-05 00:09:59
20211116214523	2024-04-05 00:09:59
20211122062447	2024-04-05 00:09:59
20211124070109	2024-04-05 00:10:00
20211202204204	2024-04-05 00:10:00
20211202204605	2024-04-05 00:10:00
20211210212804	2024-04-05 00:10:01
20211228014915	2024-04-05 00:10:01
20220107221237	2024-04-05 00:10:01
20220228202821	2024-04-05 00:10:01
20220312004840	2024-04-05 00:10:01
20220603231003	2024-04-05 00:10:01
20220603232444	2024-04-05 00:10:02
20220615214548	2024-04-05 00:10:02
20220712093339	2024-04-05 00:10:02
20220908172859	2024-04-05 00:10:02
20220916233421	2024-04-05 00:10:02
20230119133233	2024-04-05 00:10:03
20230128025114	2024-04-05 00:10:03
20230128025212	2024-04-05 00:10:03
20230227211149	2024-04-05 00:10:03
20230228184745	2024-04-05 00:10:03
20230308225145	2024-04-05 00:10:03
20230328144023	2024-04-05 00:10:04
20231018144023	2024-04-05 00:10:04
20231204144023	2024-04-05 00:10:04
20231204144024	2024-04-05 00:10:04
20231204144025	2024-04-05 00:10:04
20240108234812	2024-04-05 00:10:05
20240109165339	2024-04-05 00:10:05
20240227174441	2024-04-05 00:10:05
20240311171622	2024-04-05 00:10:05
20240321100241	2024-04-05 00:10:06
20240401105812	2024-04-05 00:10:06
20240418121054	2024-04-29 13:02:57
20240523004032	2024-06-09 11:54:25
20240618124746	2024-06-21 21:50:03
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id) FROM stdin;
profiles	profiles	\N	2024-05-17 23:36:25.752179+00	2024-05-17 23:36:25.752179+00	t	f	\N	\N	\N
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2024-04-05 00:07:30.444319
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2024-04-05 00:07:30.860184
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2024-04-05 00:07:30.905683
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2024-04-05 00:07:31.116415
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2024-04-05 00:07:31.283699
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2024-04-05 00:07:31.32938
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2024-04-05 00:07:31.33393
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2024-04-05 00:07:31.38153
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2024-04-05 00:07:31.429424
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2024-04-05 00:07:31.433815
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2024-04-05 00:07:31.481555
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2024-04-05 00:07:31.488138
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2024-04-05 00:07:31.73379
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2024-04-05 00:07:31.738603
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2024-04-05 00:07:31.745258
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2024-04-05 00:07:31.814045
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2024-04-05 00:07:31.861523
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2024-04-05 00:07:31.866383
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2024-04-05 00:07:31.871458
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2024-04-05 00:07:31.892357
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2024-04-17 08:11:19.687703
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2024-04-17 08:11:19.772336
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2024-04-17 08:11:19.888567
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2024-04-17 08:11:19.980124
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2024-06-21 21:49:58.086463
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id) FROM stdin;
f7432f68-5873-45cf-9b46-cafb05c37297	profiles	avatar.jpg	\N	2024-05-18 00:00:42.484436+00	2024-05-18 00:00:42.484436+00	2024-05-18 00:00:42.484436+00	{"eTag": "\\"fa8301829c23fead43cfaabf1395adbd\\"", "size": 2991392, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-05-18T00:00:43.000Z", "contentLength": 2991392, "httpStatusCode": 200}	d7f93bf3-26c7-4cee-afb0-c52e694624a6	\N
f86976df-1fbd-491e-8cb1-f938498545d9	profiles	d88ada64-2299-4b96-91af-f7e689518875/profile	d88ada64-2299-4b96-91af-f7e689518875	2024-05-17 23:44:24.491362+00	2024-05-18 00:19:49.975061+00	2024-05-17 23:44:24.491362+00	{"eTag": "\\"c8188a5bd80729071fb46d7b66e29288\\"", "size": 163698, "mimetype": "image/jpg", "cacheControl": "max-age=3600", "lastModified": "2024-05-18T00:19:50.000Z", "contentLength": 163698, "httpStatusCode": 200}	95158ac8-7433-4909-be24-3acc3407a2e0	d88ada64-2299-4b96-91af-f7e689518875
166e5eae-59f0-42f5-8b04-749c973f3117	profiles	5de7a4b5-a050-412b-9406-13c05ac5deb3/profile	5de7a4b5-a050-412b-9406-13c05ac5deb3	2024-05-18 01:16:55.54472+00	2024-05-18 01:16:55.54472+00	2024-05-18 01:16:55.54472+00	{"eTag": "\\"3a342cdcd8cdea293885bde6703bf82b\\"", "size": 153453, "mimetype": "image/jpg", "cacheControl": "max-age=3600", "lastModified": "2024-05-18T01:16:56.000Z", "contentLength": 153453, "httpStatusCode": 200}	5f9d3b01-81a0-4861-a91b-f371c1419507	5de7a4b5-a050-412b-9406-13c05ac5deb3
da362a4d-801d-4377-996c-9db7e9749ae1	profiles	6fbabc92-a706-43f9-88de-c4bd774ccd56/profile	6fbabc92-a706-43f9-88de-c4bd774ccd56	2024-05-18 01:53:39.7018+00	2024-05-18 01:53:39.7018+00	2024-05-18 01:53:39.7018+00	{"eTag": "\\"e74531387d9132efbf122e3a781f86bf\\"", "size": 2956710, "mimetype": "image/jpg", "cacheControl": "max-age=3600", "lastModified": "2024-05-18T01:53:40.000Z", "contentLength": 2956710, "httpStatusCode": 200}	2ecf7592-01e7-4ec0-b196-51f422e6a933	6fbabc92-a706-43f9-88de-c4bd774ccd56
5597c884-7efb-4de8-8959-c02a9b586d1b	profiles	f934f44e-7c01-4891-9865-710573c3b2c8/profile	f934f44e-7c01-4891-9865-710573c3b2c8	2024-05-23 20:26:07.939587+00	2024-05-23 20:26:07.939587+00	2024-05-23 20:26:07.939587+00	{"eTag": "\\"b6e7f4676a3388e47415a6af1774a92d\\"", "size": 64650, "mimetype": "image/jpg", "cacheControl": "max-age=3600", "lastModified": "2024-05-23T20:26:08.000Z", "contentLength": 64650, "httpStatusCode": 200}	69ef5b73-a240-4312-a0c7-574f3927990b	f934f44e-7c01-4891-9865-710573c3b2c8
d61cdf46-81e2-4c54-901a-b214aff676b0	profiles	87c41a23-24ea-4a88-bbb8-fe3e7973b2ae/profile	87c41a23-24ea-4a88-bbb8-fe3e7973b2ae	2024-06-21 22:00:51.482628+00	2024-06-21 22:00:51.482628+00	2024-06-21 22:00:51.482628+00	{"eTag": "\\"69099538d58e9a0d07a3ce2ef474d39e\\"", "size": 4194675, "mimetype": "image/jpg", "cacheControl": "max-age=3600", "lastModified": "2024-06-21T22:00:52.000Z", "contentLength": 4194675, "httpStatusCode": 200}	e00fb3f3-7c65-449f-a760-4b752b0b1ca7	87c41a23-24ea-4a88-bbb8-fe3e7973b2ae
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 211, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('pgsodium.key_key_id_seq', 1, false);


--
-- Name: announcement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.announcement_id_seq', 18, true);


--
-- Name: calendarAppointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."calendarAppointment_id_seq"', 23, true);


--
-- Name: student_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_list_id_seq', 32, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_realtime_admin
--

SELECT pg_catalog.setval('realtime.messages_id_seq', 1, false);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: announcement announcement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.announcement
    ADD CONSTRAINT announcement_pkey PRIMARY KEY (id);


--
-- Name: calendarAppointment calendarAppointment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."calendarAppointment"
    ADD CONSTRAINT "calendarAppointment_pkey" PRIMARY KEY (id);


--
-- Name: student_list student_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_list
    ADD CONSTRAINT student_list_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING hash (entity);


--
-- Name: messages_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_topic_index ON realtime.messages USING btree (topic);


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets Enable read access for all users; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Enable read access for all users" ON storage.buckets FOR SELECT USING (true);


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: objects user can upload their profile image 1ige2ga_0; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "user can upload their profile image 1ige2ga_0" ON storage.objects FOR INSERT TO authenticated WITH CHECK (((bucket_id = 'profiles'::text) AND ((auth.uid())::text = (storage.foldername(name))[1])));


--
-- Name: objects users can update their image profile 1ige2ga_0; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "users can update their image profile 1ige2ga_0" ON storage.objects FOR UPDATE TO authenticated USING (((bucket_id = 'profiles'::text) AND ((auth.uid())::text = (storage.foldername(name))[1])));


--
-- Name: objects users can update their image profile 1ige2ga_1; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "users can update their image profile 1ige2ga_1" ON storage.objects FOR SELECT TO authenticated USING (((bucket_id = 'profiles'::text) AND ((auth.uid())::text = (storage.foldername(name))[1])));


--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT ALL ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT ALL ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;
GRANT ALL ON FUNCTION auth.email() TO postgres;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;
GRANT ALL ON FUNCTION auth.role() TO postgres;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;
GRANT ALL ON FUNCTION auth.uid() TO postgres;


--
-- Name: FUNCTION algorithm_sign(signables text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sign(payload json, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION try_cast_double(inp text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;


--
-- Name: FUNCTION url_decode(data text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;


--
-- Name: FUNCTION url_encode(data bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION verify(token text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION comment_directive(comment_ text); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO postgres;
GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO anon;
GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO authenticated;
GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO service_role;


--
-- Name: FUNCTION exception(message text); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql.exception(message text) TO postgres;
GRANT ALL ON FUNCTION graphql.exception(message text) TO anon;
GRANT ALL ON FUNCTION graphql.exception(message text) TO authenticated;
GRANT ALL ON FUNCTION graphql.exception(message text) TO service_role;


--
-- Name: FUNCTION get_schema_version(); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql.get_schema_version() TO postgres;
GRANT ALL ON FUNCTION graphql.get_schema_version() TO anon;
GRANT ALL ON FUNCTION graphql.get_schema_version() TO authenticated;
GRANT ALL ON FUNCTION graphql.get_schema_version() TO service_role;


--
-- Name: FUNCTION increment_schema_version(); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql.increment_schema_version() TO postgres;
GRANT ALL ON FUNCTION graphql.increment_schema_version() TO anon;
GRANT ALL ON FUNCTION graphql.increment_schema_version() TO authenticated;
GRANT ALL ON FUNCTION graphql.increment_schema_version() TO service_role;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION lo_export(oid, text); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pg_catalog.lo_export(oid, text) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_export(oid, text) TO supabase_admin;


--
-- Name: FUNCTION lo_import(text); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pg_catalog.lo_import(text) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_import(text) TO supabase_admin;


--
-- Name: FUNCTION lo_import(text, oid); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pg_catalog.lo_import(text, oid) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_import(text, oid) TO supabase_admin;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: postgres
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_keygen(); Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_keygen() TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION can_insert_object(bucketid text, name text, owner uuid, metadata jsonb); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) TO postgres;


--
-- Name: FUNCTION extension(name text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.extension(name text) TO postgres;


--
-- Name: FUNCTION filename(name text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.filename(name text) TO postgres;


--
-- Name: FUNCTION foldername(name text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.foldername(name text) TO postgres;


--
-- Name: FUNCTION get_size_by_bucket(); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.get_size_by_bucket() TO postgres;


--
-- Name: FUNCTION list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) TO postgres;


--
-- Name: FUNCTION list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) TO postgres;


--
-- Name: FUNCTION search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) TO postgres;


--
-- Name: FUNCTION update_updated_at_column(); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.update_updated_at_column() TO postgres;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT ALL ON TABLE auth.audit_log_entries TO postgres;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.flow_state TO postgres;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.identities TO postgres;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT ALL ON TABLE auth.instances TO postgres;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.mfa_amr_claims TO postgres;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.mfa_challenges TO postgres;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.mfa_factors TO postgres;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.one_time_tokens TO postgres;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT ALL ON TABLE auth.refresh_tokens TO postgres;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.saml_providers TO postgres;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.saml_relay_states TO postgres;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.schema_migrations TO dashboard_user;
GRANT ALL ON TABLE auth.schema_migrations TO postgres;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.sessions TO postgres;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.sso_domains TO postgres;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.sso_providers TO postgres;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT ALL ON TABLE auth.users TO postgres;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: SEQUENCE seq_schema_version; Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE graphql.seq_schema_version TO postgres;
GRANT ALL ON SEQUENCE graphql.seq_schema_version TO anon;
GRANT ALL ON SEQUENCE graphql.seq_schema_version TO authenticated;
GRANT ALL ON SEQUENCE graphql.seq_schema_version TO service_role;


--
-- Name: TABLE decrypted_key; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.decrypted_key TO pgsodium_keyholder;


--
-- Name: TABLE masking_rule; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.masking_rule TO pgsodium_keyholder;


--
-- Name: TABLE mask_columns; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.mask_columns TO pgsodium_keyholder;


--
-- Name: TABLE announcement; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.announcement TO anon;
GRANT ALL ON TABLE public.announcement TO authenticated;
GRANT ALL ON TABLE public.announcement TO service_role;


--
-- Name: SEQUENCE announcement_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.announcement_id_seq TO anon;
GRANT ALL ON SEQUENCE public.announcement_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.announcement_id_seq TO service_role;


--
-- Name: TABLE "calendarAppointment"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."calendarAppointment" TO anon;
GRANT ALL ON TABLE public."calendarAppointment" TO authenticated;
GRANT ALL ON TABLE public."calendarAppointment" TO service_role;


--
-- Name: SEQUENCE "calendarAppointment_id_seq"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public."calendarAppointment_id_seq" TO anon;
GRANT ALL ON SEQUENCE public."calendarAppointment_id_seq" TO authenticated;
GRANT ALL ON SEQUENCE public."calendarAppointment_id_seq" TO service_role;


--
-- Name: TABLE student_list; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.student_list TO anon;
GRANT ALL ON TABLE public.student_list TO authenticated;
GRANT ALL ON TABLE public.student_list TO service_role;


--
-- Name: SEQUENCE student_list_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.student_list_id_seq TO anon;
GRANT ALL ON SEQUENCE public.student_list_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.student_list_id_seq TO service_role;


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.users TO anon;
GRANT ALL ON TABLE public.users TO authenticated;
GRANT ALL ON TABLE public.users TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: SEQUENCE messages_id_seq; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON SEQUENCE realtime.messages_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.messages_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.messages_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.messages_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.messages_id_seq TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres;


--
-- Name: TABLE migrations; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.migrations TO anon;
GRANT ALL ON TABLE storage.migrations TO authenticated;
GRANT ALL ON TABLE storage.migrations TO service_role;
GRANT ALL ON TABLE storage.migrations TO postgres;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;
GRANT ALL ON TABLE storage.s3_multipart_uploads TO postgres;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;
GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO postgres;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON SEQUENCES  TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON TABLES  TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON SEQUENCES  TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON FUNCTIONS  TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON TABLES  TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: postgres
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO postgres;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

