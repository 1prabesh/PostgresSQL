drop table if exists student;
create table student(
std_id int primary key ,
first_name varchar(100),
last_name varchar(100),
depart varchar(100),
admission real
);

copy student from 'F:\\PGadmin\\student.csv' delimiter ',' csv header;