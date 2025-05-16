select * from ardvorlich limit 5

with result as (
select
	extract(hour from log_date) as hrs,
	round(avg(active_power)::numeric,3) as meanpow,
	round(avg(penstock_pressure)::numeric,3) as meanpsi
from ardvorlich
	group by hrs
order by hrs,meanpow,meanpow)

select * 
	 from result 
		where meanpow=(select max(meanpow) from result);





