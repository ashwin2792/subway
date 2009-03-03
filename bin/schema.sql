drop table stations cascade;
drop table trips cascade;
drop table stops cascade;

create table stations (
	line text,
	code text primary key,
	short text,
	long text,
	x integer,
	y integer
);

create table trips (
	id serial primary key,
	line text,
	service int,
	direction text,
	orig_code text references stations (code),
	orig_time real,
	dest_code text references stations (code),
	dest_time real,
	trip_line text
);

create table stops (
	trip_id int references trips,
	code text references stations,
	track text,
	time real,
	type text,
	stop boolean,
	timepoint boolean
);
