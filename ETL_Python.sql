--this is the project on ETL---where I will be importing data in raw table first and make a cleaning procedure using sql
--creating a staging table to

create table Mtest(
	event_time text,
	date text,
	top_sp text,
	botm_sp text,
	cham text,
	active_pwr text,
	rvr_lvl text,
	pen_pre text
);

--inspect staging table
select * from Mtest;


												--DATA EXTRACTION---
copy Mtest from 'F:\VScode_postgresql\Mtest.csv'
	with(
		format 'csv',
		header true,
		delimiter ','
	);

--check data in staging table
select * from Mtest;

--create real table to be inserted
	create table Mtest_564(
			event_time Timestamp primary key not null,
			date  Timestamp,
			Top_spear decimal,
			Bottom_spear decimal,
			Chamber_Lvl decimal,
			Active_power decimal,
			River_lvl decimal,
			Penstock_pressure decimal
		);
						--- DATA LOGGING STAGE----
						
Insert into Mtest_564 (event_time,date,Top_spear,Bottom_spear,Chamber_Lvl,Active_power,River_lvl,Penstock_pressure)
	select 
			COALESCE(NULLIF(event_time,'')::Timestamp,'1999-03-16 00:00:00'),
			COALESCE(NULLIF(date,'')::Time,'00:00:00'),
			COALESCE(NULLIF(top_sp,'')::decimal, 0),
			case
				when NULLIF(botm_sp, '')::decimal <0 then 0
				else COALESCE(NULLIF(botm_sp,'')::decimal,0)
			end,
			
			COALESCE(NULLIF(cham,'')::decimal, 0),
			
			case
				when NULLIF(active_pwr,'')::decimal<0 then 0
				else COALESCE(NULLIF(active_pwr,'')::decimal,0)
			end,
			COALESCE(NULLIF(rvr_lvl,'')::decimal,0),
			COALESCE(NULLIF(pen_pre,'')::decimal, 0)
	from Mtest;

--i got error because i used timestamp in date colum but query expect timestamp, so i am alterting table constraint
		Alter table Mtest_564
		alter column date type time;

--confirming new real table
	select * from  Mtest_564;

-- I made mistake ; I did not check onther columns that could have negative value and i got bottom spear had so 
-- was changing with case but got error becuase it again execture the query to write in the table but it has date as primary key which 
-- cannot be again doubled--- so for now dropping real table and again will create.

 --drop table Mtest_564;

 								---PYTHON ANALYSIS STARTED-----





			
		