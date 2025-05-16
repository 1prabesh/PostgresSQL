select * from ardvorlich limit 5;
/*
select 
	date_trunc('year',log_date) as year,
	avg(active_power) as meanyearlypow
from ardvorlich
group by year order by year;

select
	date_trunc('hour',log_date) as hourly,
	round(avg(active_power),3) as hrlymean
from ardvorlich
group by hourly order by hourly;

with power as(
select
	date_trunc('hour',log_date) as hour,
	count(*) as noofhrrecord,
	round(avg(active_power),3) as meanpowperhr,
	min(active_power) as minpow, 
	max(active_power) as maxpow
from ardvorlich
group by hour order by hour)

select * from power where minpow <750;

select 
	date_trunc('day',log_date) as day,
	avg(active_power) as meandailypow
from  ardvorlich
group by day order by day;
*/

--- advance practice question---
/*
with revel as (
select
	date_trunc('hour',log_date) as hour,
	avg(active_power) as meanpo,
	count(*) as no_of_hr_reading,
	min(active_power) as meanpower,
	max(active_power) as maxpower
from ardvorlich
group by hour order by hour)

select 
	extract(min from hour)
from revel where maxpower in (select max(maxpower) from revel);*/

select 
	stddev(active_power) as deviation
from ardvorlich;

