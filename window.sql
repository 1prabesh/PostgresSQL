select
	col1,
	col2,
window_function() over(
	partition by colx
	order by coly
) as new_col from table_name;

select * from stdinfo;

--using window function to see the rank of stud---

select
	first_name,
	last_name,
	dept,
	adm,
	address,
	allowance,
row_number() over(
	partition by dept
	order by allowance desc) as rank_of_stud 
	from stdinfo;

select
	*,
row_number() over(
	partition by dept
	order by allowance desc) as rank_of_stud 
	from stdinfo;

	