CREATE TABLE licor_measurements (
    measurement_time timestamp,
    jar_id text,
    readings jsonb
);

CREATE TABLE raw_licor_files (
    measurement_time timestamp,
    file_name text,
    file_contents bytea
);

CREATE TABLE zentra_measurements (
    measurement_time timestamp,
    serial_number text,
    readings jsonb
);

CREATE TABLE experiments (
	id SERIAL PRIMARY KEY,
	field text,
	POC text,
	experiment_name text,
	treatments text[],
	main_group text,
	stat_design text,
	flux_analysis text,
	prompt text
);

CREATE TABLE jars (
	jar_id int,
	experiment_id int,
	port_multiplexer int,
	port_extension int,
	zentra_serial text,
	zentra_port int, 
	treatments jsonb,
	replication text,
	exp text,
	flask_info text,
	extra_data jsonb, 
	FOREIGN KEY (experiment_id) REFERENCES experiments (id)
);

CREATE TABLE events (
	experiment_id int,
	event_occured timestamp,
	event_type text,
	event_data jsonb,
	FOREIGN KEY (experiment_id) REFERENCES experiments (id) 
);
