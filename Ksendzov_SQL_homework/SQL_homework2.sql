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
		
			


	



		

		
