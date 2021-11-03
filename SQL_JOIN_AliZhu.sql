--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employees.employee_name,salary.monthly_salary from employee_salary
j	oin employees on employee_salary.employee_id = employees.id 
	join salary on employee_salary.salary_id = salary.id;


-- 2. Вывести всех работников у которых ЗП меньше 2000.
select employees.employee_name,salary.monthly_salary from employee_salary
	join employees on employee_salary.employee_id = employees.id 
	join salary on employee_salary.salary_id = salary.id 
where salary.monthly_salary <2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employees.id, salary.monthly_salary from employee_salary
	left JOIN employees on employee_salary.employee_id = employees.id 
	left JOIN salary on employee_salary.salary_id = salary.id
where employee_name is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select e.id ,s.monthly_salary from employee_salary es 
	left JOIN employees e on es.employee_id = e.id 
	left JOIN salary s on es.salary_id = s.id
where e.employee_name is null and s.monthly_salary <2000;

-- 5. Найти всех работников кому не начислена ЗП.
select e.employee_name,s.monthly_salary from employee_salary es 
	full JOIN employees e on es.employee_id = e.id 
	full join salary s on es.salary_id = s.id
where s.id is null;


-- 6. Вывести всех работников с названиями их должности.
select e.employee_name, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id;

-- 7. Вывести имена и должность только Java разработчиков.
select e.employee_name, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
where r.role_name like '%Java developer%';

-- 8. Вывести имена и должность только Python разработчиков.
select e.employee_name, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
where r.role_name like '%Python%';

-- 9. Вывести имена и должность всех QA инженеров.
select e.employee_name, r.role_name from roles_employee re 
	inner join roles r on re.role_id = r.id 
	inner join employees e on re.employee_id = e.id
where r.role_name like '%QA%';

----второй вариант вывода 9 задания
select employee_name, r.role_name
from employees e
	inner join roles_employee on employee_id = e.id 
	inner join roles r on role_id = r.id
where role_name like '%Python%';

-- 10. Вывести имена и должность ручных QA инженеров.
select e.employee_name, r.role_name from roles_employee re 
join roles r on re.role_id = r.id 
join employees e on re.employee_id = e.id
where r.role_name like '%Manual QA%';

-- 11. Вывести имена и должность автоматизаторов QA
select e.employee_name, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
where r.role_name like '%Automation%';

-- 12. Вывести имена и зарплаты Junior специалистов

select e.employee_name, r.role_name, s.monthly_salary from employees e 
	full join roles_employee re 
on re.employee_id  = e.id 
	full join roles r 
on r.id = re.role_id 
	full join employee_salary es 
on es.employee_id  = e.id 
	inner join salary s 
on re.role_id  = s.id 
	where r.role_name like '%Junior%';

select * from roles where role_name like '%Junior%'

-- 13. Вывести имена и зарплаты Middle специалистов
select e.employee_name, r.role_name, s.monthly_salary from employees e 
	full join roles_employee re 
on re.employee_id  = e.id 
	full join roles r 
on r.id = re.role_id 
	full join employee_salary es 
on es.employee_id  = e.id 
	inner join salary s 
on re.role_id  = s.id 
	where r.role_name like '%Middle%';

-- 14. Вывести имена и зарплаты Senior специалистов
select e.employee_name, r.role_name, s.monthly_salary from employees e 
	full join roles_employee re 
on re.employee_id  = e.id 
	full join roles r 
on r.id = re.role_id 
	full join employee_salary es 
on es.employee_id  = e.id 
	inner join salary s 
on re.role_id  = s.id 
	where r.role_name like '%Senior%';

-- 15. Вывести зарплаты Java разработчиков
select e.employee_name, r.role_name, s.monthly_salary from employees e 
	full join roles_employee re 
on re.employee_id  = e.id 
	full join roles r 
on r.id = re.role_id 
	full join employee_salary es 
on es.employee_id  = e.id 
	inner join salary s 
on re.role_id  = s.id 
	where r.role_name like '%Java developer%';

-- 16. Вывести зарплаты Python разработчиков
select e.employee_name, r.role_name, s.monthly_salary from employees e 
	full join roles_employee re 
on re.employee_id  = e.id 
	full join roles r 
on r.id = re.role_id 
	full join employee_salary es 
on es.employee_id  = e.id 
	inner join salary s 
on re.role_id  = s.id 
where r.role_name like '%Python%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков
select e.employee_name, r.role_name, s.monthly_salary from employees e 
	full join roles_employee re 
on re.employee_id  = e.id 
	full join roles r 
on r.id = re.role_id 
	full join employee_salary es 
on es.employee_id  = e.id 
	inner join salary s 
on re.role_id  = s.id 
where r.role_name like '%Junior%' and r.role_name like '%Python%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков
select e.employee_name, r.role_name, s.monthly_salary from employees e 
	full join roles_employee re 
on re.employee_id  = e.id 
	full join roles r 
on r.id = re.role_id 
	full join employee_salary es 
on es.employee_id  = e.id 
	inner join salary s 
on re.role_id  = s.id 
where r.role_name like '%Middle JavaS%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков
select e.employee_name, r.role_name, s.monthly_salary from employees e 
	full join roles_employee re 
on re.employee_id  = e.id 
	full join roles r 
on r.id = re.role_id 
	full join employee_salary es 
on es.employee_id  = e.id 
	inner join salary s 
on re.role_id  = s.id 
	where r.role_name like '%Senior%' and r.role_name like '%Java%';

-- 20. Вывести зарплаты Junior QA инженеров
select e.employee_name, r.role_name, s.monthly_salary from employees e 
	inner join roles_employee re 
on re.employee_id  = e.id 
	inner join roles r 
on r.id = re.role_id 
	inner join employee_salary es 
on es.employee_id  = e.id 
	inner join salary s 
on re.role_id  = s.id 
	where r.role_name like '%Junior QA%'

-- 21. Вывести среднюю зарплату всех Junior специалистов

select avg(s.monthly_salary) from employees e 
	full join roles_employee re 
on re.employee_id  = e.id 
	full join roles r 
on r.id = re.role_id 
	full join employee_salary es 
on es.employee_id  = e.id 
	inner join salary s 
on re.role_id  = s.id 
	where r.role_name like '%Junior%';

-- 22. Вывести сумму зарплат JS разработчиков
select sum(s.monthly_salary) from employees e 
	full join roles_employee re 
on re.employee_id  = e.id 
	full join roles r 
on r.id = re.role_id 
	full join employee_salary es 
on es.employee_id  = e.id 
	inner join salary s 
on re.role_id  = s.id 
	where r.role_name like '%JavaS%';

-- 23. Вывести минимальную ЗП QA инженеров
select min(s.monthly_salary) from employees e 
	full join roles_employee re 
on re.employee_id  = e.id 
	full join roles r 
on r.id = re.role_id 
	full join employee_salary es 
on es.employee_id  = e.id 
	inner join salary s 
on re.role_id  = s.id 
	where r.role_name like '%QA Engineer%';


-- 24. Вывести максимальную ЗП QA инженеров
select max(s.monthly_salary) from employees e 
	full join roles_employee re 
on re.employee_id  = e.id 
	full join roles r 
on r.id = re.role_id 
	full join employee_salary es 
on es.employee_id  = e.id 
	inner join salary s 
on re.role_id  = s.id  
	where r.role_name like '%QA%';

-- 25. Вывести количество QA инженеров
select count(r.role_name) from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
where r.role_name like '%QA%';

-- 26. Вывести количество Middle специалистов.
select count(r.role_name) from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
where r.role_name like '%Middle%';

-- 27. Вывести количество разработчиков
select count(r.role_name) from roles_employee re 
	right join roles r on re.role_id = r.id 
	right join employees e on re.employee_id = e.id
where r.role_name like '%developer%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select SUM(s.monthly_salary) from salary s
	inner join employee_salary es on s.id = es.salary_id 
	inner join employees e on es.employee_id = e.id 
	inner join roles_employee re on e.id = re.employee_id 
	inner join roles r on re.role_id = r.id 
where r.role_name like '%developer%';

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select e.employee_name, r.role_name, s.monthly_salary from employees e 
	inner join roles_employee re 
on re.employee_id  = e.id 
	inner join salary s 
on s.id = re.role_id 
	inner join roles r 
on r.id = re.role_id 
	order by s.monthly_salary;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select e.employee_name, r.role_name, s.monthly_salary from employees e 
	inner join roles_employee re 
on re.employee_id  = e.id 
	inner join salary s 
on s.id = re.role_id 
	inner join roles r 
on r.id = re.role_id  
	where s.monthly_salary between 1700 and 2300
order by s.monthly_salary;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select e.employee_name, r.role_name, s.monthly_salary from employees e 
	inner join roles_employee re 
on re.employee_id  = e.id 
	inner join salary s 
on s.id = re.role_id 
	inner join roles r 
on r.id = re.role_id 
	where s.monthly_salary <2300
order by s.monthly_salary;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select e.employee_name, r.role_name, s.monthly_salary from employees e 
	inner join roles_employee re 
on re.employee_id  = e.id 
	inner join salary s 
on s.id = re.role_id 
	inner join roles r 
on r.id = re.role_id 
	where s.monthly_salary = 1000 or s.monthly_salary = 1500 or s.monthly_salary =2000
order by s.monthly_salary;