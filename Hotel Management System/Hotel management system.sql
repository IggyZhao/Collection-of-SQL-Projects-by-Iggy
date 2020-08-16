
create table hotel_department (
    "department_id" int CONSTRAINT exdeptid_pk PRIMARY KEY
,"deptartment_name" varchar(20)
,"department_manager" int);

-- Values into hotel_department
insert into hotel_department values (10, 'Accounting',9901);
insert into hotel_department values (20, 'Shipping', 9902);
insert into hotel_department values (30, 'Housekeeping', 9903);
insert into hotel_department values (40, 'Food', 9904);
insert into hotel_department values (50, 'Cleaning', 9905);

select * from hotel_department;


create table hotel_employee ( 
  "employee_id" int CONSTRAINT exemployee_pk PRIMARY KEY
,"department_id" int --FK
,"emp_name" varchar(20)
,"emp_telephone" varchar(12)
,"emp_address" varchar(20)
,"hourly_rate" int
,"emp_type" varchar(1) 
,constraint exdepartment_fkid foreign key (department_id) references hotel_department (department_id)
);

-- Values into hotel_employee
insert into hotel_employee values (9901, 10, 'Anna', '860-999-7766', '100 Constitution Pl', 15.00, 'H');
insert into hotel_employee values (9902, 10, 'Mike', '860-999-7722', '109 Constitution Pl', 15.00, 'H');
insert into hotel_employee values (9903, 20, 'Olivia', '860-999-7711', '108 Constitution Pl', 15.00, 'H');
insert into hotel_employee values (9904, 20, 'Joe', '860-999-7733', '177 Constitution Pl', 15.00, 'H');
insert into hotel_employee values (9905, 30, 'Andrew', '860-999-7744', '107 Constitution Pl', 35.00, 'M');
insert into hotel_employee values (9906, 40, 'Robert', '860-999-7755', '102 Constitution Pl', 35.00, 'M');
insert into hotel_employee values (9907, 50, 'Julia', '860-999-1111', '103 Constitution Pl', 35.00, 'M');
insert into hotel_employee values (9908, 50, 'Laura', '860-999-4444', '103 Constitution Pl', 25.00, 'D');
insert into hotel_employee values (9909, 50, 'Bob', '860-999-5555', '104 Constitution Pl', 25.00, 'D');
insert into hotel_employee values (9910, 50, 'Jose', '860-999-1199', '105 Constitution Pl', 25.00, 'D');
insert into hotel_employee values (9911, 50, 'Meghan', '860-999-3399', '105 Constitution Pl', 25.00, 'D');
insert into hotel_employee values (9912, 50, 'Ian', '860-999-2299', '106 Constitution Pl', 25.00, 'D');
insert into hotel_employee values (9913, 10, 'Aggie', '203-776-2299', '106 Constitution Pl', 15.00, 'H');
insert into hotel_employee values (9914, 10, 'John', '203-777-2299', '106 Constitution Pl', 15.00, 'H');

alter table hotel_department add 
constraint deptmanagerid_fk foreign key (department_manager) references hotel_employee(employee_id)
;

select * from hotel_employee;



--hotel_housekeeper table has information about housekeepers. they are a type of employee and this table has unique attributes. This is a subtype table.
create table hotel_housekeeper (
   "housekeeper_id" int constraint housekeeperid_pk primary key
, "employee_id" int  -- FK
, "housekeeper_desc" varchar(20)
, "bonus_rate" int
, constraint exemployeeid_fk foreign key (employee_id) references hotel_employee (employee_id)
);

-- Values into hotel_housekeeper
insert into hotel_housekeeper values (9901, 9901, 'part-time', 20);
insert into hotel_housekeeper values (9902, 9902, 'full-time', 20.25);
insert into hotel_housekeeper values (9903, 9903, 'part-time', 10.50);
insert into hotel_housekeeper values (9904, 9904, 'part-time', 30.75);
insert into hotel_housekeeper values (9913, 9913, 'part-time', 20);
insert into hotel_housekeeper values (9914, 9914, 'full-time', 20.25);

select * from hotel_housekeeper;



--hotel_maintenance table has information about hotel_maintenance employees. Just like the housekeepr table, it is a subtype table.
create table hotel_maintenance (
   "maintenance_emp_id" int constraint maintempid_pk primary key
, "employee_id" int -- FK
, "maintenance_desc" varchar(30)
, "bonus_rate" int
, constraint exemployeeid2_fk foreign key (employee_id) references hotel_employee (employee_id)
);


-- Values into hotel_maintenance
insert into hotel_maintenance values (9905, 9905, 'full-time', 15.25);
insert into hotel_maintenance values (9906, 9906, 'full-time', 15.85);
insert into hotel_maintenance values (9907, 9907, 'full-time', 25.50);

select * from hotel_maintenance;


-- hotel_deskclerk table is similar to housekeeper and hotel_maintenance
create table hotel_deskclerk (
   "deskclerk_id" int constraint deskclerk_pk primary key
, "employee_id" int -- FK
, "shift" varchar(15)
, constraint exemployeeid3_fk foreign key (employee_id) references hotel_employee (employee_id)
);


-- Values into hotel_deskclerk
insert into hotel_deskclerk values (9908, 9908, 'DAY');
insert into hotel_deskclerk values (9909, 9909, 'DAY');
insert into hotel_deskclerk values (9910, 9910,  'DAY');
insert into hotel_deskclerk values (9911, 9911, 'NIGHT');
insert into hotel_deskclerk values (9912, 9912,  'NIGHT');


select * from hotel_deskclerk;

-- hotel_suite is a table that has information about hotel_suites that are available in the hotel. And associated details.
create table hotel_suite (
   "suite_nbr" int constraint suiteid_pk primary key
, "suite_type" varchar(10)
, "suite_size_sqft" int
);


-- Values into hotel_suite
insert into hotel_suite values (11101, 'President1', 899);
insert into hotel_suite values (11102, 'President2', 899);
insert into hotel_suite values (11103, 'Junior1', 475);
insert into hotel_suite values (11104, 'Junior2', 475);
insert into hotel_suite values (11105, 'Double1', 350);
insert into hotel_suite values (11106, 'Double2', 350);
insert into hotel_suite values (11107, 'Double3', 350);

select * from hotel_suite;

 
-- hotel_assignment is an associative table between SUITE and HOUSEKEEPER
create table hotel_assignment (
   assignment_id int constraint assignmentid_pk primary key
, suite_nbr int--FK
, housekeeper_id int  --FK
, assignment_date date
, constraint suitenbr_asg_fk foreign key (suite_nbr) references hotel_suite (suite_nbr)
, constraint housekeeper_asg_fk foreign key (housekeeper_id) references hotel_housekeeper (housekeeper_id)
);

-- Values into hotel_assignment
insert into hotel_assignment values (22201, 11101, 9901, '01-JAN-2020');
insert into hotel_assignment values (22202, 11101, 9902, '28-JAN-2020');
insert into hotel_assignment values (22203, 11102, 9903, '09-FEB-2020');
insert into hotel_assignment values (22204, 11102, 9904, '01-DEC-2020');
insert into hotel_assignment values (22205, 11103, 9901, '31-JAN-2020');

select * from hotel_assignment;


create table hotel_work_hours (
   ww_id date -- composite primary key
, ww_employee_id int -- FK
, ww_hours int
,constraint wwempid_fk foreign key (ww_employee_id) references hotel_employee (employee_id)
,constraint wwempid_pk primary key (ww_id, ww_employee_id)
);

-- Values into hotel_work_hours
insert into hotel_work_hours values ('02-MAR-2020', 9901, 40);
insert into hotel_work_hours values ('09-MAR-2020', 9901, 35);
insert into hotel_work_hours values ('16-MAR-2020', 9901, 45);
insert into hotel_work_hours values ('23-MAR-2020', 9901, 50);
insert into hotel_work_hours values ('30-MAR-2020', 9901, 30);
insert into hotel_work_hours values ('02-MAR-2020', 9902, 40);
insert into hotel_work_hours values ('09-MAR-2020', 9902, 35);
insert into hotel_work_hours values ('16-MAR-2020', 9903, 45);
insert into hotel_work_hours values ('23-MAR-2020', 9903, 50);
insert into hotel_work_hours values ('30-MAR-2020', 9903, 30);
insert into hotel_work_hours values ('02-MAR-2020', 9904, 40);
insert into hotel_work_hours values ('09-MAR-2020', 9904, 35);
insert into hotel_work_hours values ('16-MAR-2020', 9908, 45);
insert into hotel_work_hours values ('23-MAR-2020', 9908, 50);
insert into hotel_work_hours values ('30-MAR-2020', 9909, 30);
insert into hotel_work_hours values ('02-MAR-2020', 9911, 40);
insert into hotel_work_hours values ('09-MAR-2020', 9911, 35);
insert into hotel_work_hours values ('16-MAR-2020', 9910, 45);
insert into hotel_work_hours values ('23-MAR-2020', 9911, 50);
insert into hotel_work_hours values ('30-MAR-2020', 9910, 30);
insert into hotel_work_hours values ('16-MAR-2020', 9905, 50);
insert into hotel_work_hours values ('30-MAR-2020', 9905, 30);
insert into hotel_work_hours values ('16-MAR-2020', 9906, 50);
insert into hotel_work_hours values ('16-MAR-2020', 9907, 25);

select * from hotel_work_hours;

/*
drop table hotel_maintenance;
drop table hotel_deskclerk;
drop table hotel_assignment;
drop table hotel_housekeeper;
drop table hotel_suite;
alter table hotel_employee drop constraint exdepartment_fkid;
alter table hotel_department drop constraint deptmanagerid_fk;
drop table hotel_employee;
drop table hotel_department;
drop table hotel_work_hours;
*/



--There is a title in row one, and the summed total cost for all of  March 2020. 
--Cost is calculated by taking the hourly rate and multiplying it by the hours worked. 
--The ID on the Hours worked table is the date of the week worked. Use tables hotel_employee, hotel_work_hours. 

select 'Deskclerk - Summed Total Cost:' as Report 
from hotel_employee e join hotel_work_hours w 
on e.employee_id = w.ww_employee_id
union
select 'March 2020:' || sum(e.hourly_rate * w.ww_hours)
from hotel_employee e join hotel_work_hours w 
on e.employee_id = w.ww_employee_id; 




-- Write a SQL statement using the hotel_employee and hotel_work_hours tables, 
--and show which employees have worked more than the average work hours worked thus far by all employees. Show the output as follows.
--(As with the other sql questions, paste your sql statement solution here AND make sure to save on the SQL file that you will submit).


select e.employee_id, e.emp_name, w.ww_hours
from hotel_employee e join hotel_work_hours w 
on e.employee_id = w.ww_employee_id
where w.ww_hours > (
select avg(ww_hours)
from hotel_work_hours);




--.Using only the hotel_employee, hotel_department and hotel_work_hours tables, write a SQL statement showing, per department, 
--the difference between the sum of costs incurred -- for the first two weeks of March (March 2nd & 9th) 
--versus the last two weeks of March (March 16th & 30th). 
--Only show those differences that are greater than and equal to 300.  -- change here difference and 300.


-- first 2 weeks 
select e.department_id, sum(w.ww_hours * e.hourly_rate) as End_Mar_Bal
from hotel_employee e  join hotel_work_hours w 
on w.ww_employee_id = e.employee_id
join hotel_department d on d.department_id= e.department_id
where w.ww_id in ('02-MAR-2020','09-MAR-2020') 
group by e.department_id;

--last 2 weeks 
select e.department_id, sum(w.ww_hours * e.hourly_rate) as End_Mar_Bal
from hotel_employee e join hotel_work_hours w 
on w.ww_employee_id = e.employee_id
join hotel_department d on d.department_id= e.department_id
where w.ww_id in ('16-MAR-2020','30-MAR-2020') 
group by e.department_id;


select a.department_id, b.department_id, a.Beg_Mar_Bal as "Beg Mar Mal", b.End_Mar_Bal as "End Mar Bal",
b.End_Mar_Bal-a.Beg_Mar_Bal as DIFFERENCE
from 
   (select e.department_id, 
   case when sum(w.ww_hours * e.hourly_rate) is not null then sum(w.ww_hours * e.hourly_rate)
   else 0
   end as Beg_Mar_Bal
   from hotel_employee e join hotel_work_hours w 
   on w.ww_employee_id = e.employee_id
   join hotel_department d on d.department_id= e.department_id
   where w.ww_id in ('02-MAR-2020','09-MAR-2020') 
   group by e.department_id)a
full outer join
   (select e.department_id, sum(w.ww_hours * e.hourly_rate) as End_Mar_Bal
   from hotel_employee e join hotel_work_hours w 
   on w.ww_employee_id = e.employee_id
   join hotel_department d on d.department_id= e.department_id
   where w.ww_id in ('16-MAR-2020','30-MAR-2020')
   group by e.department_id)b
   on a.department_id = b.department_id
   where abs(b.End_Mar_Bal-a.Beg_Mar_Bal) >= 300;



