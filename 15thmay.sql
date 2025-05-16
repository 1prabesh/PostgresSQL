select 
	* from ardvorlich limit 5

select count(*) from ardvorlich;

select
	date_trunc('Month',log_date) as month,
	avg(active_power) as meankW
from ardvorlich
	group by month
	order by month;