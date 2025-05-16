drop table prod;
create table prod(
Index_no Int,
Product_Name varchar(100),
Product_Description varchar(100),
Brand varchar(100),
Category varchar(100),
Price float,
Currency varchar(100),
Stock integer,
Color varchar(100),
size varchar(100),
Availability varchar(100),
Internal_ID int
);

--syntax :copy tablename from csvpath delimiter csv header
copy prod from 'H:\product.csv' delimiter ',' csv header;

select distinct brand from prod;
------------------------------------

select column_name 
from information_schema.columns where
table_name='prod';



------
select count(distinct color) from prod;
--------------
'where condition'
select * from prod where color='Red' order by category ASC;
---
select size,price,color from prod where availability='in_stock';
---
select * from prod where price between 200 and 500 
order by price ASC;
---
select distinct category from prod 
order by category ASC;
-----
select price 
as paisa from prod;
---
select distinct (brand),stock from prod where price <200 and 
availability='in_stock' 
order by brand ASC;

--- limit and offset---
select brand, stock from prod
limit 5 offset 4;

--In and where---
select * from prod limit 5;
select category,color, price, size from prod where size in ('Small');---> column name to column value
--in and where 
select category, stock, size from prod where 'Small' in (size);---> column value to column name

-- not in operator--
select category, stock,availability from prod where availability not in ('out_of_stock');

--sub query--
select category from prod
where stock in (
select distinct stock 
from prod);

--between--
select * from prod where price between 500 and 550 limit 2;

-- group by

select product_name,product_description,brand from prod;

-- stats in sql--
--max()

select max(price) from prod;

--min()
select min(price) from prod

--subquery with max()
select * from prod 
where price= select max(price) from prod);

select * from prod 
where price=(select max(price) from prod);

select count(distinct (price)) from prod;

-- max, min in list of data
select greatest(10,20,30) as max;
--sum()
select sum(price) as totalprice from prod;

-- i want to sum the price whose price is maximum only
select sum(price) as sumofmax
from prod 
where price=(select max(price) from prod); 

---
select count(*) as fremaxprice
from prod where price=(
select max(price) from prod);

--- 
select * from prod where price=(select max(price) from prod);

---sql average
select avg(price) as mean from prod;
select round(avg(stock),3) as avgstock from prod;

select category,price from prod 
where price in (select distinct(price)from prod);

----------Order by----------------------
select * from prod limit 5;
order by price;

select category,price from prod
order by price ASC;

select price from prod;

select brand,category from prod 
order by brand;

select brand,category,product_name,color,price
from prod
order by (color,price) DESC;

-- group by--
select count(price),category
from prod
group by category;


select color, count (*) as freq
from prod
group by color order by color;

select price, count(*) as noof
from prod
group by price order by price;

select category, count(*) as totalitem
from prod
group by category;

--total price of each category--
select category, sum(price) as totalamt
from prod
group by category order by category;


select category, product_description, brand, sum(price) as totalamt
from prod
group by  category, product_description,brand;

---Like query---
select * from prod
where category like 'Skincare';

select * from prod
where color='Yellow';


---common table expression---
-- It looks like similar with view statement
--where result of one query is stored in another query

--eg
with different_category as (
select category from prod)
select * from different_category;
)


with filtered as (
select * from prod where price
in (select price from prod where price between 252 and 666))
select * from filtered where price=555;

--- sql any and all
create table M515(
log_date Primary key,
log_time time,
top_spear_position real,
bottom_spear_position real,
chamber_level real,
active_power int,
river_level real,
penstock_pressure real
);
--syntax :copy tablename from csvpath delimiter csv header
set datestyle= 'ISO,DMY';
copy M515 from 'F:\PGadmin\M515.csv' delimiter ',' csv header;

select sum(active_power)/4000 as resultif from M515;

select * from M515 limit 5;

----case in sql----
select *,
case
 when active_power>=600 then 'Full power'
 when active_power<400 then 'Partial power'
end as powershare
from M515;

select * from prod limit 5;
select active_power,count(active_power) from M515 
group by active_power
having active_power>500;

select count(active_power) from M515
where active_power='715';

---having in sql-- this supports aggregate function
select category,count(*) as items
from prod
group by category 
having count(*)<300;

-- join in sql---
select student.depart, student.admission from student;

select * from student;
select student.first_name, stdinfo.allowance
from student
join stdinfo
on student.std_id = stdinfo.std_id;

-- more on join

select student.depart, stdinfo.allowance
from student
inner join stdinfo
on student.std_id=stdinfo.std_id;


---back to basic sql commands----
--creating database:

select * from m515
select active_power, count(*) as num from m515
group by active_power order by active_power

select round(avg(active_power),4) as average from m515;

--- just practising
create table fishdetails(
fishpassport int not null primary key,
breed varchar(50),
weight real,
endangered varchar(4)
);

drop table fishdetails;

select * from stdinfo;

--alter table syntax--
alter table tablename
add columnname datatype
--
alter table tablename
add column1 datatype, column2 datatype..
--
--renaming column
alter table tablename
rename column columnname to newcolumnname

-- modify the datatype
alter table tablename
alter column columnname type datatype

---drop the column
alter table tablename
drop column columnname
--rename table
alter table m515
rename to Ardvorlich;




