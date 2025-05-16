select * from ardvorlich limit 5;

/*
adding column to ard
-----------------------
alter table ardvorlich
add status varchar(10);

alter table ardvorlich
alter column status type integer using status ::integer;

dropping the newly created column
------------------------------
alter table ardvorlich
drop column status;
*/

/*
select date(log_date), active_power 
from ardvorlich;

select active_power from ardvorlich
where active_power>500 order by active_power;

select date(log_date) from ardvorlich
order by date(log_date) limit 10;

select distinct(top_spear_position)
from ardvorlich;


select avg(active_power) from 
ardvorlich;

select min(penstock_pressure) as low,
max(penstock_pressure) as high
from ardvorlich;


select count(bottom_spear_position) as freq
from ardvorlich where bottom_spear_position>80;


select 
	date_trunc('hour',log_date) as hour_bucket,
	ceil(avg(chamber_level)) as chamb_lvl
from ardvorlich
group by hour_bucket
order by hour_bucket;

select 
	sum(active_power)
	from ardvorlich where 
	log_date between '2014-11-13 00:00:00'
	and '2014-11-13 05:59:00';

select 
	log_date,penstock_pressure
	from ardvorlich 
	order by penstock_pressure DESC limit 5;
	
select *,
	case
	when active_power>=800 then 'High'
	when active_power >=400 and active_power<800 then 'Medium'
	when active_power<400 then 'Low'
end as power_share
from ardvorlich;
*/
-------------

/*select 
	date(log_date) as day,
	max(active_power) as max_power
from ardvorlich
group by day;*/

------ update in sql
	
update ardvorlich
	set top_spear_position=100
	where log_date='2014-11-13 00:00:00';

select 
	max(top_spear_position),
	date(log_date) from 
	ardvorlich group by date(log_date);

