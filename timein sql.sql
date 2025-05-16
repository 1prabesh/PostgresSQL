drop procedure inc_allow;

select * from ardvorlich limit 5;

select
	date_trunc('hour', log_time) as Hour,
	avg(active_power) as Hrsavg
from ardvorlich
group by Hour
order by Hour;

select
	date_trunc('hour', log_time) as Hour,
	avg(active_power) as Hrsavg
from ardvorlich
	where date_trunc('hour',log_time)::time='04:00:00'
group by Hour
order by Hour;