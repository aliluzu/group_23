--Таблица employees
--
--Создать таблицу employees
--- id. serial,  primary key,
--- employee_name. Varchar(50), not null
--Наполнить таблицу employee 70 строками.
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
--Таблица salary
--
--Создать таблицу salary
--- id. Serial  primary key,
--- monthly_salary. Int, not null
--Наполнить таблицу salary 15 строками:
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
--

--Таблица employee_salary
--
--Создать таблицу employee_salary
--- id. Serial  primary key,
--- employee_id. Int, not null, unique
--- salary_id. Int, not null
--Наполнить таблицу employee_salary 40 строками:
--- в 10 строк из 40 вставить несуществующие employee_id

create table employee_salary(
	id serial primary key,
	employee_ID int not null unique,
	salary_id int not null
);

insert into employee_salary (id, employee_ID, salary_id)
values (default, 68, 4);

select * from employee_salary 

--Таблица roles
--
--Создать таблицу roles
--- id. Serial  primary key,
--- role_name. int, not null, unique
--Поменять тип столба role_name с int на varchar(30)
--Наполнить таблицу roles 20 строками:
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

--Таблица roles_employee
--
--Создать таблицу roles_employee
--- id. Serial  primary key,
--- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
--Наполнить таблицу roles_employee 40 строками:
--
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