select * from prod limit 5;
select 
	distinct category
	from prod
	group by category;

select
	distinct(log_date)
	from ardvorlich
	order by log_date;

select
	* from ardvorlich
	

select 	
	extract(quarter from '2024-10-09 05:08:26'::date);

select 	
	extract(dow from '2024-10-09 05:08:26'::date);

select date_trunc('hour',log_date) as hour,
		round(avg(active_power),3) from ardvorlich
		group by date_trunc('hour',log_date)
		order by date_trunc('hour',log_date);



















