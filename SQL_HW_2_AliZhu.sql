--Table employees
--
--Create table employees
--- id. serial,  primary key,
--- employee_name. Varchar(50), not null
--Populate the employee table with 70 rows.
--
--
create table employees (
id serial primary key,
employee_name varchar (50) not null
);

insert into employees (id, employee_name)
values (default, 'Alina Pobeditel');

select * from employees;

--=========================================
--Salary table
--
--Create table salary
--- id. Serial  primary key,
--- monthly_salary. Int, not null
--Populate the salary table 15 rows:
--- 1000
--- 1100
--- 1200
--- 1300
--- 1400
--- 1500
--- 1600
--- 1700
--- 1800
--- 1900
--- 2000
--- 2100
--- 2200
--- 2300
--- 2400
--- 2500
create table salary(
id serial primary key,
monthly_salary int not null
);

insert into salary (id, monthly_salary)
values (default, 2500);

select * from salary

--=========================================
-- employee_salary table
--
--Create table employee_salary
--- id. Serial  primary key,
--- employee_id. Int, not null, unique
--- salary_id. Int, not null
--Populate the employee_salary table 40 rows:
--- into 10 lines out of 40 insert non-existent  employee_id

create table employee_salary(
	id serial primary key,
	employee_ID int not null unique,
	salary_id int not null
);

insert into employee_salary (id, employee_ID, salary_id)
values (default, 68, 4);

select * from employee_salary 

--=========================================
--Table  roles
--
--Create table roles
--- id. Serial  primary key,
--- role_name. int, not null, unique
--change the type of a column role_name into int на varchar(30)
--Populate the roles table 20 rows:
--
create table roles (
	id serial primary key,
	role_name int not null unique
);

alter table roles
alter column role_name type varchar(30)
using role_name::integer;
--
insert into roles (id, role_name)
values (default, 'Lead test Engineer')

select * from roles

--=========================================
-- roles_employee table
--
--Create table roles_employee
--- id. Serial  primary key,
--- employee_id. Int, not null, unique (foreign key for employees, field id)
--- role_id. Int, not null (foreign key for table roles, field id)
--Populate the roles_employee table 40 rows:
create table roles_employee (
id serial primary key,
employee_ID int not null unique,
role_id int not null,
foreign key (employee_ID)
	references employees (id),
foreign key (role_id)
	references roles (id)
);

insert into roles_employee (id, employee_ID, role_id)
values (default, 34, 2)

select * from roles_employee 