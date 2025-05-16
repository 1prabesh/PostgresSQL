select * from student;
copy student from 'F:\PGadmin\info.csv' delimiter ',' csv header;

select * from student

create table stdinfo(
std_id int primary key not null,
first_name varchar(100),
last_name varchar(100),
dept varchar(100),
adm varchar(100),
address varchar(100),
allowance real
);

copy stdinfo from 'F:\PGadmin\infox.csv' delimiter ',' csv header;
select * from stdinfo