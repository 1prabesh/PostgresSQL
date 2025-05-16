 select * from ardvorlich limit 5;

 select
 	count(*) as total_rows
	 from ardvorlich;


--using cte---
with calc as(
select
	date_trunc('hour',log_time) as hour,
	min(active_power) as hrlymin,
	max(active_power) as hrlymax,
	round(avg(active_power),3) as hrlyavg
from ardvorlich
	group by hour
	order by hour)

select
	* from calc where hrlyavg=(select max(hrlyavg) from calc);

select
	date_trunc('hour',log_time) as hour,
	min(active_power) as hrlymin,
	max(active_power) as hrlymax,
	round(avg(active_power),3) as hrlyavg
from ardvorlich
	group by hour
	order by hour;

select * from student;
select * from stdinfo;



select 
	s.first_name, s.depart, d.allowance
from student s
Inner join
	stdinfo d
on s.std_id=d.std_id;
