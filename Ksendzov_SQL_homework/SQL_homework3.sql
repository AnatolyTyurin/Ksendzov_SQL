select * from employee_salary
select * from employees
select * from salary2
select * from roles2
select * from roles_salary

--1.  Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employee_name, monthly_salary
from employees e
join employee_salary es on es.employee_id = e.id 
join salary2 s on s.id = es.salary_id;



--2.  Вывести всех работников у которых ЗП меньше 2000.

select employee_name, monthly_salary
from employees e
join employee_salary es on es.employee_id = e.id 
join salary2 s on s.id = es.salary_id
where monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select monthly_salary
from employee_salary es
join salary2 s on s.id = es.salary_id
where employee_id > (select max(id) from employees e);

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select monthly_salary
from employee_salary es
join salary2 s on s.id = es.salary_id
where employee_id > (select max(id) from employees e)
and monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.
 
  select employees.id, employee_name 
  from employees
  where employees.id not in (select employee_id from employee_salary);
  
--   6. Вывести всех работников с названиями их должности.

  select employee_name, role_name
  from employees e 
  join employee_salary es on es.employee_id = e.id
  join salary2 s on s.id = es.salary_id
  join roles2 r on r.id = s.id;
  
--   7. Вывести имена и должность только Java разработчиков.

  select employee_name, role_name
  from employees e 
  join employee_salary es on es.employee_id = e.id
  join salary2 s on s.id = es.salary_id
  join roles2 r on r.id = s.id
  where role_name like '%Java%';
 
--  8. Вывести имена и должность только Python разработчиков.

  select employee_name, role_name
  from employees e 
  join employee_salary es on es.employee_id = e.id
  join salary2 s on s.id = es.salary_id
  join roles2 r on r.id = s.id
  where role_name like '%Python%';
  
--  9. Вывести имена и должность всех QA инженеров.

  select employee_name, role_name
  from employees e 
  join employee_salary es on es.employee_id = e.id
  join salary2 s on s.id = es.salary_id
  join roles2 r on r.id = s.id
  where role_name like '%QA%';
  
-- 10. Вывести имена и должность ручных QA инженеров.

  select employee_name, role_name
  from employees e 
  join employee_salary es on es.employee_id = e.id
  join salary2 s on s.id = es.salary_id
  join roles2 r on r.id = s.id
  where role_name like '%Manual QA%';
  
--  11. Вывести имена и должность автоматизаторов QA

  select employee_name, role_name
  from employees e 
  join employee_salary es on es.employee_id = e.id
  join salary2 s on s.id = es.salary_id
  join roles2 r on r.id = s.id
  where role_name like '%Automation QA%';
  
--  12. Вывести имена и зарплаты Junior специалистов

  select employee_name, monthly_salary
  from employees e 
  join employee_salary es on es.employee_id = e.id
  join salary2 s on s.id = es.salary_id
  join roles2 r on r.id = s.id
  where role_name like '%Junior%';
  
--  13.  Вывести имена и зарплаты Middle специалистов

  select employee_name, monthly_salary
  from employees e 
  join employee_salary es on es.employee_id = e.id
  join salary2 s on s.id = es.salary_id
  join roles2 r on r.id = s.id
  where role_name like '%Middle%';
  
--   14. Вывести имена и зарплаты Senior специалистов

  select employee_name, monthly_salary
  from employees e 
  join employee_salary es on es.employee_id = e.id
  join salary2 s on s.id = es.salary_id
  join roles2 r on r.id = s.id
  where role_name like '%Senior%';
  
--   15. Вывести зарплаты Java разработчиков

  select role_name, monthly_salary
  from roles2 r
  join salary2 s on s.id = r.id
  where role_name like '%Java %';
  
   16. Вывести зарплаты Python разработчиков

  select role_name, monthly_salary
  from roles2 r
  join salary2 s on s.id = r.id
  where role_name like '%Python%';
  
--   17. Вывести имена и зарплаты Junior Python разработчиков
   
  select employee_name, monthly_salary
  from employees e 
  join employee_salary es on es.employee_id = e.id
  join salary2 s on s.id = es.salary_id
  join roles2 r on r.id = s.id
  where role_name like '%Python%';
 
--  18. Вывести имена и зарплаты Middle JS разработчиков

  select employee_name, monthly_salary
  from employees e 
  join employee_salary es on es.employee_id = e.id
  join salary2 s on s.id = es.salary_id
  join roles2 r on r.id = s.id
  where role_name like 'Middle JavaScript%';
 
--  19. Вывести имена и зарплаты Senior Java разработчиков

  select employee_name, monthly_salary
  from employees e 
  join employee_salary es on es.employee_id = e.id
  join salary2 s on s.id = es.salary_id
  join roles2 r on r.id = s.id
  where role_name like 'Senior Java %';
 
--  20. Вывести зарплаты Junior QA инженеров

  select role_name, monthly_salary
  from roles2 r
  join salary2 s on s.id = r.id
  where role_name like 'Junior%QA%';
  
--  21. Вывести среднюю зарплату всех Junior специалистов

  select AVG (monthly_salary) avg_salary_all_junior
  from salary2 s
  join roles2 r on r.id = s.id
  where role_name like '%Junior%';  
  
 
--  22. Вывести сумму зарплат JS разработчиков

  select SUM (monthly_salary) sum_salary_JavaScript_developer
  from salary2 s
  join roles2 r on r.id = s.id
  where role_name like '%JavaScript developer%';
 
--  23. Вывести минимальную ЗП QA инженеров

  select MIN (monthly_salary) min_salary_QA_engineer
  from salary2 s
  join roles2 r on r.id = s.id
  where role_name like '%QA engineer%';
 
--  24. Вывести максимальную ЗП QA инженеров

  select MAX (monthly_salary) max_salary_QA_engineer
  from salary2 s
  join roles2 r on r.id = s.id
  where role_name like '%QA engineer%';
  
--  25. Вывести количество QA инженеров

  select count (employee_name) count_QA_employees
  from employees e 
  join employee_salary es on es.employee_id = e.id
  join salary2 s on s.id = es.salary_id
  join roles2 r on r.id = s.id
  where role_name like '%QA%';
  
--   26. Вывести количество Middle специалистов.

  select count (employee_name) count_Middle_employees
  from employees e 
  join employee_salary es on es.employee_id = e.id
  join salary2 s on s.id = es.salary_id
  join roles2 r on r.id = s.id
  where role_name like '%Middle%';
  
--   27. Вывести количество разработчиков

  select count (employee_name) count_Developer_employees
  from employees e 
  join employee_salary es on es.employee_id = e.id
  join salary2 s on s.id = es.salary_id
  join roles2 r on r.id = s.id
  where role_name like '%developer%';
 
--  28. Вывести фонд (сумму) зарплаты разработчиков.

  select sum (monthly_salary) sum_Developer_salary
  from employees e
  join employee_salary es on es.employee_id = e.id
  join salary2 s on s.id = es.salary_id
  join roles2 r on r.id = s.id
  where role_name like '%developer%';
 
--  29. Вывести имена, должности и ЗП всех специалистов по возрастанию

  select employee_name, role_name, monthly_salary
  from employees e
  join employee_salary es on es.employee_id = e.id
  join salary2 s on s.id = es.salary_id
  join roles2 r on r.id = s.id
  order by 3;
 
--  30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

  select employee_name, role_name, monthly_salary
  from employees e
  join employee_salary es on es.employee_id = e.id
  join salary2 s on s.id = es.salary_id
  join roles2 r on r.id = s.id
  where monthly_salary > 1700 and monthly_salary < 2300
  order by 3;
 
--  31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

  select employee_name, role_name, monthly_salary
  from employees e
  join employee_salary es on es.employee_id = e.id
  join salary2 s on s.id = es.salary_id
  join roles2 r on r.id = s.id
  where monthly_salary < 2300
  order by 3;
  
--  32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

  select employee_name, role_name, monthly_salary
  from employees e
  join employee_salary es on es.employee_id = e.id
  join salary2 s on s.id = es.salary_id
  join roles2 r on r.id = s.id
  where monthly_salary in (1100,1500,2000)
  order by 3