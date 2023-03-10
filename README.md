## HW_SQL_1. Решение задач на сайте sql-ex.ru
```sql
1. Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd

SELECT model, speed, hd
FROM PC
WHERE price < 500

2. Найдите производителей принтеров. Вывести: maker

SELECT DISTINCT(maker)
FROM product
WHERE type = 'Printer'

3. Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
SELECT model, ram, screen
FROM laptop
WHERE price > 1000

4. Найдите все записи таблицы Printer для цветных принтеров.

SELECT *
FROM printer
WHERE color = 'y'

5. Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.

SELECT DISTINCT(model), speed, hd
FROM PC
WHERE CD IN('12x','24x')
AND price < 600

6. Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.

SELECT Distinct(maker), speed
FROM product
JOIN laptop ON product.model = laptop.model
WHERE hd > = 10

7. Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).

SELECT DISTINCT(product.model), price
FROM product
JOIN PC ON pc.model = product.model
WHERE maker = 'B'
UNION
SELECT DISTINCT(product.model), price
FROM product
JOIN Laptop ON laptop.model = product.model
WHERE maker = 'B'
UNION
SELECT DISTINCT(product.model), price
FROM product
JOIN Printer ON printer.model = product.model
WHERE maker = 'B'

8. Найдите производителя, выпускающего ПК, но не ПК-блокноты.

SELECT maker
FROM product
WHERE type = 'pc'
EXCEPT
SELECT maker
FROM product
WHERE type = 'laptop'

9. Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker

SELECT DISTINCT(maker)
FROM product
JOIN PC ON pc.model = product.model
WHERE speed >= 450
AND type = 'PC'

10. Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price

SELECT model, price
FROM printer
WHERE price = (
SELECT MAX(price)
FROM printer)

11. Найдите среднюю скорость ПК.

SELECT AVG(speed) AS AVG_speed
FROM pc

12. Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.

SELECT AVG(speed)
FROM laptop
WHERE price IN(SELECT price
FROM laptop
WHERE price > 1000)

13. Найдите среднюю скорость ПК, выпущенных производителем A.

SELECT AVG(speed) as average_speed
FROM pc
JOIN product ON product.model = pc.model
WHERE maker IN (SELECT maker FROM product
WHERE maker = 'A')

14. Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.

SELECT ships.class, ships.name, classes.country
FROM ships
LEFT JOIN classes ON classes.class = ships.class
WHERE NUMGUNS >=10

15. Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD

SELECT hd
FROM pc
GROUP BY hd
HAVING count(hd) >1

16. Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.

SELECT DISTINCT p1.model, p2.model, p1.speed, p1.ram
FROM pc p1, pc p2
WHERE p1.speed = p2.speed AND p1.ram = p2.ram AND p1.model > p2.model
<br>
<br>
```
## HW_SQL_2.
```sql
--1) Создать таблицу employees - id serial,  primary key, - employee_name. Varchar(50), not null

create table employees(
		id serial primary key,
		employee_name varchar(50) not null)


--2) Наполнить таблицу employee 70 строками

insert into employees(employee_name)
values ('Avery Holloway'),
		('Sutton Newton'),
		('Braelynn Cunningham'),
		('Alejandro Ellison'),
		('Raina Espinoza'),
		('Dallas McCullough'),
		('Hana Phelps'),
		('Hamza Lucero'),
		('Ila Kline'),
		('Ramon Dixon'),
		('Blakely Taylor'),
		('Jackson Maynard'),
		('Carolyn Kemp'),
		('Melvin Warren'),
		('Sloane Rivera'),
		('Charles Ramos'),
		('Alice Knight'),
		('Beckett Galindo'),
		('Corinne Jones'),
		('William Preston'),
		('Indie Yang'),
		('Malcolm Pitts'),
		('Nala Jordan'),
		('Sawyer Cantu'),
		('Galilea Barton'),
		('Cassius Burgess'),
		('Emory Hamilton'),
		('Jason Kaur'),
		('Holland Myers'),
		('Adam Owen'),
		('Mikayla Olsen'),
		('Skyler Gregory'),
		('Alaya Velasquez'),
		('Sullivan Avalos'),
		('Paloma McCormick'),
		('Jasiah Pruitt'),
		('Brylee Small'),
		('Rudy McCullough'),
		('Hana Moses'),
		('Niklaus Maxwell'),
		('Kyla Andrews'),
		('Lukas Acevedo'),
		('Ashlynn Hoffman'),
		('Steven Prince'),
		('Greta McDowell'),
		('Lachlan Pineda'),
		('Nola Huber'),
		('Mac Murray'),
		('Faith Knight'),
		('Beckett Arnold'),
		('Finley Parks'),
		('Gianni McGuire'),
		('April George'),
		('Mark Daugherty'),
		('Magdalena Bradley'),
		('Richard Tapia'),
		('Michaela Nolan'),
		('Maximo Hunter'),
		('Khloe Dean'),
		('Ronan Thomas'),
		('Elizabeth Long'),
		('Jace Peck'),
		('Crystal May'),
		('Finley Short'),
		('Cheyenne Velasquez'),
		('Sullivan Higgins'),
		('Leighton Reilly'),
		('Alvaro Huynh'),
		('Oaklee Lucas'),
		('Chance Brennan');
		
--3) Создать таблицу salary - id Serial primary key, - monthly_salary Int, not null

create table salary2(
		id serial primary key,
		monthly_salary int not null);
	
--4) Наполнить таблицу salary 15 строками:

insert into salary2(monthly_salary)
values (1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2220),
		(2300),
		(2400),
		(2500);

--5) Создать таблицу employee_salary - id Serial  primary key, - employee_id Int, not null, unique, - salary_id Int, not null

create table employee_salary(
		id serial primary key,
		employee_id int not null unique,
		salary_id int not null);
	
--6) Наполнить таблицу employee_salary 40 строками: - в 10 строк из 40 вставить несуществующие employee_id

insert into employee_salary(employee_id, salary_id)
values(3,7),
		(1,4),
		(5,9),
		(40,13),
		(23,4),
		(11,2),
		(52,10),
		(15,13),
		(26,4),
		(16,1),
		(33,7),
		(71,16),
		(72,15),
		(73,14),
		(74,13),
		(75,12),
		(76,11),
		(77,10),
		(78,9),
		(79,8),
		(80,7),
		(44,7),
		(29,8),
		(13,2),
		(18,10),
		(56,8),
		(2,11),
		(31,3),
		(57,4),
		(69,12),
		(62,9),
		(39,4),
		(45,11),
		(58,13),
		(19,5),
		(48,7),
		(51,4),
		(53,14),
		(54,8),
		(68,12);
	
--7) Создать таблицу roles - id Serial  primary key, - role_name int, not null, unique

create table roles2(
		id serial primary key,
		role_name int not null unique);

--8) Поменять тип столба role_name с int на varchar(30)

alter table roles2
alter column role_name type varchar(30);

--9) Наполнить таблицу roles 20 строками:

insert into roles2(role_name)
values ('Junior Python developer'),
		('Middle Python developer'),
		('Senior Python developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer');
	
--10) Создать таблицу roles_employee - id Serial  primary key, - employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id) - role_id. Int, not null (внешний ключ для таблицы roles, поле id)

create table roles_employee
			(id serial primary key,
			employee_id int not null unique,
			foreign key (employee_id) references employees(id),
			role_id int not null,
			foreign key (role_id) references roles2(id));
		
--11) Наполнить таблицу roles_employee 40 строками:

insert into roles_employee(employee_id, role_id)
values (7,2),
		(20,4),
		(3,9),
		(5,13),
		(23,4),
		(11,2),
		(10,9),
		(22,13),
		(21,3),
		(34,4),
		(6,7),
		(1,8),
		(2,20),
		(4,19),
		(8,18),
		(9,17),
		(12,16),
		(13,15),
		(14,14),
		(15,13),
		(16,12),
		(17,11),
		(18,10),
		(19,9),
		(24,7),
		(25,6),
		(26,5),
		(27,4),
		(28,3),
		(29,2),
		(30,1),
		(31,7),
		(32,12),
		(33,9),
		(35,17),
		(36,11),
		(37,8),
		(38,12),
		(39,5),
		(40,2);

```

## HW_SQL_3.

```sql				
			
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


		

		
