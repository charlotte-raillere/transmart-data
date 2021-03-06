--
-- Name: observation_fact; Type: TABLE; Schema: i2b2demodata; Owner: -
--
CREATE TABLE observation_fact (
    encounter_num numeric(38,0),
    patient_num numeric(38,0) NOT NULL,
    concept_cd character varying(50) NOT NULL,
    provider_id character varying(50) NOT NULL,
    start_date timestamp without time zone,
    modifier_cd character varying(100) NOT NULL,
    instance_num numeric(18,0),
    valtype_cd character varying(50),
    tval_char character varying(255),
    nval_num numeric(18,5),
    valueflag_cd character varying(50),
    quantity_num numeric(18,5),
    units_cd character varying(50),
    end_date timestamp without time zone,
    location_cd character varying(50),
    observation_blob text,
    confidence_num numeric(18,5),
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id numeric(38,0)
);

--
-- Name: fact_modifier_patient; Type: INDEX; Schema: i2b2demodata; Owner: -
--
CREATE INDEX fact_modifier_patient ON observation_fact USING btree (modifier_cd, patient_num);

