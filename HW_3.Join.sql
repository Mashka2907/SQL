-- SQL HomeWork 2. Joins 
-- 
select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;
select * from roles_employee;

--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employee_name, monthly_salary from employees
join employee_salary es on employees.id = es.employee_id 
join salary on es.salary_id = salary.id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.

select employee_name, monthly_salary from employees
join employee_salary on employee_id = employees.id 
join salary on salary_id = salary.id
where monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_name, monthly_salary from salary s 
left join employee_salary es on s.id = es.salary_id 
left join employees e on es.employee_id = e.id 
where employee_name is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_name, monthly_salary from salary s 
left join employee_salary es on s.id = es.salary_id 
left join employees e on es.employee_id = e.id 
where monthly_salary < 2000 and employee_name is null;

-- 5. Найти всех работников кому не начислена ЗП.

select employee_name, monthly_salary from employees e 
left join employee_salary es on e.id = es.employee_id 
left join salary s on es.salary_id = s.id 
where monthly_salary is null;

-- 6. Вывести всех работников с названиями их должности.

select employee_name, role_name from employees
join roles_employee on employee_id = employees.id 
join roles on role_id = roles.id;

-- 7. Вывести имена и должность только Java разработчиков.

select employee_name, role_name from employees
join roles_employee re on re.employee_id = employees.id 
join roles on re.role_id = roles.id
where role_name like '%Java developer';

-- 8. Вывести имена и должность только Python разработчиков.

select employee_name, role_name from employees
join roles_employee re  on re.employee_id = employees.id 
join roles on re.role_id = roles.id
where role_name like '%Python developer';

-- 9. Вывести имена и должность всех QA инженеров.

select employee_name, role_name from employees
join roles_employee re on re.employee_id = employees.id 
join roles on re.role_id = roles.id
where role_name like '%QA%';

-- 10. Вывести имена и должность ручных QA инженеров.

select employee_name, role_name from employees
join roles_employee re  on re.employee_id = employees.id 
join roles on re.role_id = roles.id
where role_name like '%Manual QA%';

-- 11. Вывести имена и должность автоматизаторов QA

select employee_name, role_name from employees
join roles_employee re on re.employee_id = employees.id 
join roles on re.role_id = roles.id
where role_name like '%Automation QA%';

-- 12. Вывести имена и зарплаты Junior специалистов

select employee_name, monthly_salary, role_name from employees e 
join roles_employee re  on re.employee_id = e.id
join roles on re.role_id = roles.id
join employee_salary es on re.employee_id = es.employee_id  
join salary on es.salary_id = salary.id
where role_name like 'Junior%';

-- 13. Вывести имена и зарплаты Middle специалистов

select employee_name, monthly_salary, role_name from employees e 
join roles_employee re  on re.employee_id = e.id
join roles on re.role_id = roles.id
join employee_salary es on re.employee_id = es.employee_id  
join salary on es.salary_id = salary.id
where role_name like 'Middle%';

-- 14. Вывести имена и зарплаты Senior специалистов

select employee_name, monthly_salary, role_name from employees e 
join roles_employee re  on re.employee_id = e.id
join roles on re.role_id = roles.id
join employee_salary es on re.employee_id = es.employee_id  
join salary on es.salary_id = salary.id
where role_name like 'Senior%';

-- 15. Вывести зарплаты Java разработчиков

select role_name, monthly_salary from salary s 
right join employee_salary es on s.id = es.salary_id 
right join roles_employee re on re.employee_id = es.employee_id 
right join roles on re.role_id = roles.id  
where role_name like '%Java developer';

-- 16. Вывести зарплаты Python разработчиков

select role_name, monthly_salary from salary s  
right join employee_salary es on s.id = es.salary_id 
right join roles_employee re on es.employee_id = re.employee_id 
right join roles on re.role_id = roles.id 
where role_name like '%Python developer';

-- 17. Вывести имена и зарплаты Junior Python разработчиков

select employee_name, monthly_salary, role_name from employees e 
left join roles_employee re on re.employee_id = e.id
left join roles on re.role_id = roles.id
left join employee_salary es on re.employee_id = es.employee_id  
left join salary on es.salary_id = salary.id
where role_name like 'Junior Python%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков

select employee_name, monthly_salary, role_name from employees e 
join roles_employee re on re.employee_id = e.id
join roles on re.role_id = roles.id
join employee_salary es on re.employee_id = es.employee_id  
join salary on es.salary_id = salary.id
where role_name like 'Middle JavaScript%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков

select employee_name, monthly_salary, role_name from employees e 
join roles_employee re  on re.employee_id = e.id
join roles on re.role_id = roles.id
join employee_salary es on re.employee_id = es.employee_id  
join salary on es.salary_id = salary.id
where role_name like 'Senior Java %';

-- 20. Вывести зарплаты Junior QA инженеров

select role_name, monthly_salary from salary s 
right join employee_salary es on es.salary_id = s.id 
right join roles_employee re on re.employee_id = es.employee_id 
right join roles on re.role_id = roles.id 
where role_name like 'Junior%QA%';

-- 21. Вывести среднюю зарплату всех Junior специалистов

select AVG(monthly_salary) as avg_salary_junior from salary s  
join employee_salary es on es.salary_id = s.id 
join roles_employee re on re.employee_id = es.employee_id 
join roles on re.role_id = roles.id
join employees e on e.id = re.employee_id 
where role_name like 'Junior%';

-- 22. Вывести сумму зарплат JS разработчиков

select sum(monthly_salary) as sum_salary_js from salary s 
join employee_salary es on es.salary_id  = s.id 
join roles_employee re on re.employee_id = es.employee_id 
join roles on roles.id = re.role_id
join employees on employees.id = re.employee_id
where role_name like '%JavaScript%';

-- 23. Вывести минимальную ЗП QA инженеров

select min(monthly_salary) as min_salary_qa from salary s 
join employee_salary es on es.salary_id  = s.id 
join roles_employee re on re.employee_id = es.employee_id 
join roles on roles.id = re.role_id
join employees on employees.id = re.employee_id
where role_name like '%QA%';

-- 24. Вывести максимальную ЗП QA инженеров

select max(monthly_salary) as max_salary_qa from salary s 
join employee_salary es on es.salary_id  = s.id 
join roles_employee re on re.employee_id = es.employee_id 
join roles on roles.id = re.role_id
join employees on employees.id = re.employee_id
where role_name like '%QA%';

-- 25. Вывести количество QA инженеров

select count(role_name)  as count_qa from employees e 
join roles_employee re on re.employee_id = e.id
join roles on re.role_id = roles.id
where  role_name like '%QA%';


-- 26. Вывести количество Middle специалистов.

select count(role_name) as coun_middl from employees e  
join roles_employee re on re.employee_id = e.id 
join roles on re.role_id = roles.id 
where role_name like 'Middl%';

-- 27. Вывести количество разработчиков

select count(role_name) as count_developer from employees e  
join roles_employee re on re.employee_id = e.id 
join roles on re.role_id = roles.id 
where role_name like '%developer';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(monthly_salary) as sum_salary_developer from salary s
join employee_salary es on s.id = es.salary_id 
join roles_employee re on re.employee_id = es.employee_id 
join roles on re.role_id = roles.id 
join employees e on e.id = re.employee_id 
where role_name like '%developer';

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select employee_name, role_name, monthly_salary from employees e 
left join roles_employee re on e.id = re.employee_id
left join roles on re.role_id = roles.id 
left join employee_salary es on re.employee_id = es.employee_id 
left join salary on es.salary_id = salary.id 
order by employee_name;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select employee_name, role_name, monthly_salary from employees e 
join roles_employee re on e.id = re.employee_id
join roles on re.role_id = roles.id 
join employee_salary es on re.employee_id = es.employee_id 
join salary on es.salary_id = salary.id 
where monthly_salary between 1700 and 2300
order by employee_name;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select employee_name, role_name, monthly_salary from employees e 
join roles_employee re on e.id = re.employee_id
join roles on re.role_id = roles.id 
join employee_salary es on re.employee_id = es.employee_id 
join salary on es.salary_id = salary.id 
where monthly_salary < 2300
order by employee_name;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select employee_name, role_name, monthly_salary from employees e 
join roles_employee re on e.id = re.employee_id
join roles on re.role_id = roles.id 
join employee_salary es on re.employee_id = es.employee_id 
join salary on es.salary_id = salary.id 
where monthly_salary in (1100, 1500, 2000)
order by employee_name;
