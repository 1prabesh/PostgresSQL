---stored procedure-----
--1
select * from stdinfo;

--goal using stored procedure : increase the allowance to one specific department--

insert into stdinfo
values(25,'Rajiv','Gandhi','Economics',1989,'Delhi',250000);

--creating stored procedure
drop procedure inc_allow();

create procedure inc_allow()
language plpgsql
as $$
	begin
		update stdinfo
		set allowance=allowance+(0.5*allowance)
		where dept='Economics';
	end;
	$$;

call inc_allow();
----

--prametrized stored procedure--
drop procedure inc_allow();

create procedure inc_allow(depart varchar, percent numeric)
language plpgsql
as $$
begin
	update stdinfo
	set allowance=allowance+(allowance*percent/100)
	where dept=depart;
end;
$$;

call inc_allow('Comp',50);