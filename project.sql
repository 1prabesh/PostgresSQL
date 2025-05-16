-- creating database
create database school;

-- creating table in school
create table studentinfo(
studentrollno serial Primary key,
Faculty varchar(100),
Plus2passyear int,
Graudation_year int,
Classrepresentative varchar(100),
Monthlyfee decimal
);

-- inserting into table
insert into studentinfo(Faculty,Plus2passyear,Graudation_year,Classrepresentative,Monthlyfee)
values('Engineering',2016,2021,'Prabesh Raj Ojha',2300.45),
('Humanities',2017,2021,'Hazel lanchasire',1890.45),
('Economics',2013,2017,'Muna Dhakal',3400.45),
('Social_work',2011,2020,'Rabindra Mishra',5055.34)
on conflict (studentrollno) do nothing;

select  distinct faculty from studentinfo; 
select distinct studentinfo.Graudation_year from studentinfo;

select count(distinct Faculty) from studentinfo;

select * from studentinfo where monthlyfee <> 3500;

select * from studentinfo;
select distinct studentinfo.monthlyfee from studentinfo;
-- dropping the duplicates value from the table

-- distinct
select distinct faculty, plus2passyear
from studentinfo;
-- conditional select
select * from studentinfo where faculty='Engineering';
--- order by decending
select * from studentinfo 
order by faculty DESC;

-- order by ascending
select * from studentinfo
order by faculty ASC;

-- conditional sorting
select * from studentinfo
order by faculty ASC, classrepresentative DESC;

--- and operation with where
select * from studentinfo
where faculty='Engineering' and classrepresentative like 'P%';

-- sql or
select * from studentinfo
where faculty ='Engineering';


select classrepresentative from studentinfo;

select * from studentinfo where faculty='Engineering';

--and query
select * from studentinfo where faculty='Engineering' and monthlyfee>5000;

-- distinct operation
select distinct faculty, classrepresentative from studentinfo;

select distinct faculty, classrepresentative, monthlyfee from studentinfo;

-- distinct with count
select count(distinct(faculty, classrepresentative, monthlyfee))from studentinfo;

-- altering table to add information
alter table studentinfo
add Major varchar(100);

update studentinfo 
set major ='Electrical' where faculty='Engineering';

create database hydro;
