--creating data staging table-
create table ard_raw(
	date text,
	time text,
	top_sp text,
	bot_sp_pos text,
	cham_lvl text,
	power text,
	rvr_lvl text,
	pen_pres text
);

--copying value to staging table before cleaning the data
copy ard_raw from 'F:\\VScode_postgresql\\ardvorlich.csv' 
with (
	Format csv,
	Header True,
	Delimiter ','
);

--checking the staging table
select 
	* from ard_raw;


--target table where data will be inserted
create table Ardvorlich_real(
	log_date Timestamp primary key not null,
	event_time time not null,
	top_spear_position decimal,
	bottom_spear_postion decimal,
	chamber_level decimal,
	power decimal,
	river_level decimal,
	penstock_pressure decimal
);

--cleaning the data and inserting the data into real table
insert into Ardvorlich_real (log_date,even_time,top_spear_position,bottom_spear_postion,chamber_level,power,river_level,penstock_pressure)
	select
		COALESCE(NULLIF(date,'')::Timestamp, '2000-01-01 00:00:00'),
		COALESCE(NULLIF(time,'')::Time, '00:00:00'),
		COALESCE(NULLIF(top_sp, '')::decimal,0),
		COALESCE(NULLIF(bot_sp_pos, '')::decimal,0),
		COALESCE(NULLIF(cham_lvl, '')::decimal,0),
		COALESCE(NULLIF(power, '')::decimal,0),
		COALESCE(NULLIF(rvr_lvl, '')::decimal,0),
		COALESCE(NULLIF(pen_pres, '')::decimal,0)
	from ard_raw;
	

--checking cleaned data in arvorlich real table
select * 
	 from ardvorlich_real;






)