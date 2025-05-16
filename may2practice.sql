select * from prod limit 5;

create index prodindex
on prod(index_no);

---window function practice--

select
	product_name,stock
	group by product_name
	order by stock
from prod;

select
	category, sum(stock) as totalitems
from prod
	group by category 
	order by category,totalitems;

