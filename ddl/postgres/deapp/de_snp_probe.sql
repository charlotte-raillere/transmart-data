--
-- Name: de_snp_probe; Type: TABLE; Schema: deapp; Owner: -
--
CREATE TABLE de_snp_probe (
    snp_probe_id bigint NOT NULL,
    probe_name character varying(255),
    snp_id bigint,
    snp_name character varying(255),
    vendor_name character varying(255)
);

--
-- Name: sys_c0020609; Type: CONSTRAINT; Schema: deapp; Owner: -
--
ALTER TABLE ONLY de_snp_probe
    ADD CONSTRAINT sys_c0020609 PRIMARY KEY (snp_probe_id);

--
-- Name: u_snp_probe_name; Type: CONSTRAINT; Schema: deapp; Owner: -
--
ALTER TABLE ONLY de_snp_probe
    ADD CONSTRAINT u_snp_probe_name UNIQUE (probe_name);

--
-- Name: tf_trg_de_snp_probe_id(); Type: FUNCTION; Schema: deapp; Owner: -
--
CREATE FUNCTION tf_trg_de_snp_probe_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
      if coalesce(NEW.SNP_PROBE_ID::text, '') = '' then
         select nextval('deapp.SEQ_DATA_ID') into NEW.SNP_PROBE_ID ;
      end if;
RETURN NEW;
end;
$$;

--
-- Name: trg_de_snp_probe_id; Type: TRIGGER; Schema: deapp; Owner: -
--
CREATE TRIGGER trg_de_snp_probe_id BEFORE INSERT ON de_snp_probe FOR EACH ROW EXECUTE PROCEDURE tf_trg_de_snp_probe_id();

