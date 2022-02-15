--SQL_DDL
--Первая часть.
--
--Таблица employees
--
--1. Создать таблицу employees
--- id. serial,  primary key,
--- employee_name. Varchar(50), not null

create table employees 
(
	id serial primary key,
	employee_name varchar(50) not null
);
 
--2. Наполнить таблицу employee 70 строками.
					  
insert into employees(employee_name) 
values ('Angelina Jolie'),
	   ('Charlize Theron'),
	   ('James Bond'),
	   ('Mary Bianchi'),
	   ('Jessica Alba'),
	   ('Megan Fox'),
	   ('Salma Hayek'),
	   ('Keira Knightley'),
	   ('Katherine Heigl'),
	   ('Nina Dobrev'),
	   ('Monica Bellucci'),
	   ('Penelope Cruz'),
	   ('Armand Hammer'),
	   ('Henry Cavill'),
	   ('Jensen Ackles'),
	   ('Antonio Banderas'),
	   ('John Depp'),
	   ('Bradley Pitt'),
	   ('Orlando Bloom'),
	   ('Robert Pattinson'),
	   ('George Clooney'),
	   ('David Boreanaz'),
	   ('Marvin Eaton'),
	   ('Lenard Robertson'),
	   ('Harry Potter'),
	   ('Harry Barker'),
	   ('Collin Norton'),
	   ('Leslie Black'),
	   ('Merry Wood'),
	   ('Caroline King'),
	   ('Jennifer Curtis'),
	   ('Ethel Stone'),
	   ('Marry Parker'),
	   ('Elizabeth Riley'),
	   ('Jessica Hunter'),
	   ('Erica Atkins'),
	   ('Meghan Miller'),
	   ('Megan Wood'),
	   ('Roberta Adams'),
	   ('Clarence Willis'),
	   ('Peter Hoover'),
	   ('Collin Wood'),
	   ('David Stivenson'),
	   ('Mark Kennedy'),
	   ('Henry Kennedy'),
	   ('Charles Burke'),
	   ('Oliver French'),
	   ('Salma Burke'),
	   ('Megan Wood'),
	   ('Monica Bloom'),
	   ('Robert King'),
	   ('Giles Lamb'),
	   ('Nina Lamb'),
	   ('Steven Sutton'),
	   ('Walter Butler'),
	   ('Marvin Stone'),
	   ('Byron Carson'),
	   ('Leslie Peters'),
	   ('Anis Nelson'),
	   ('Audra Carson'),
	   ('Mary Miller'),
	   ('Meghan Hill'),
	   ('Connon Fulton'),
	   ('Thomas Lopez'),
	   ('Jordan Flatcher'),
	   ('Sheila Clifford'),
	   ('Lilly Dunce'),
	   ('Mary Farrell'),
	   ('Liza Adderiy'),
	   ('Jacob Hill');
	
--
--Таблица salary
--
--3. Создать таблицу salary
--- id. Serial  primary key,
--- monthly_salary. Int, not null
	  
create table Salary
(
	id serial primary key,
	monthly_salary int not null
);
				   
--4. Наполнить таблицу salary 15 строками:
				   
insert into salary(monthly_salary)
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
       (2200),
       (2300),
       (2400);
    
--Таблица employee_salary
--
--Создать таблицу employee_salary
--- id. Serial  primary key,
--- employee_id. Int, not null, 
--- salary_id. Int, not null 
      
create table employee_salary 
(
	id serial primary key,
	employee_id int not null,
	salary_id int not null
);
							
--Наполнить таблицу employee_salary 40 строками:
--- в 10 строк из 40 вставить несуществующие employee_id
		
insert into employee_salary (employee_id, salary_id)
values (1, 15),
	   (2, 14),
	   (3, 13),
	   (4, 12),
	   (5, 11),
	   (6, 10),
	   (7, 9),
	   (8, 8),
	   (9, 7),
	   (10, 6),
	   (20, 5),
	   (21, 4),
	   (22, 3),
	   (23, 2),
	   (24, 1),
	   (25, 15),
	   (26, 14),
	   (27, 13),
	   (28, 12),
	   (29, 11),
	   (40, 10),
	   (41, 9),
	   (42, 8),
	   (43, 7),
	   (44, 6),
	   (45, 5),
	   (46, 4),
	   (47, 3),
	   (48, 2),
	   (49, 1),
-- 10 несуществующих
	   (80, 10),
	   (81, 9),
	   (82, 8),
	   (83, 7),
	   (84, 6),
	   (85, 5),
	   (86, 4),
	   (87, 3),
	   (88, 2),
	   (89, 1);
	  
--7. Создать таблицу roles
--- id. Serial  primary key,
--- role_name. int, not null, 
	  
create	table roles 
(
	id serial primary key,
	role_name int not null
);  

--8. Поменять тип столбца role_name с int на varchar(30)

alter table roles alter column role_name type varchar(30);

--9. Наполнить таблицу roles 20 строками:

insert into roles (role_name)
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
	  
--Таблица roles_employee
--
--10. Создать таблицу roles_employee
--- id. Serial  primary key,
--- employee_id. Int, not null (внешний ключ для таблицы employees, поле id)
--- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
	  
create table roles_employee
(
	id serial primary key,
	employee_id int not null,
	role_id int not null,
	foreign key (employee_id) references employees (id),
	foreign key (role_id) references roles(id)
);
 
--11. Наполнить таблицу roles_employee 40 строками:

insert into roles_employee(employee_id, role_id)
values (7, 2),
       (20, 4),
       (3, 9),
       (5, 13),
       (6, 1),
       (1, 3),
       (2, 5),
       (4, 6),
       (8, 8),
       (9, 10),
       (10, 11),
       (11, 12),
       (13, 14),
       (12, 15),
       (14, 16),
       (15, 17),
       (16, 18),
       (17, 19),
       (19, 20),
       (18, 2),
       (21, 5),
       (22, 3),
       (23, 5),
       (28, 6),
       (25, 7),
       (27, 8),
       (26, 10),
       (24, 15),
       (30, 16),
       (29, 17),
       (32, 18),
       (31, 19),
       (33, 20),   
       (36, 1),
       (34, 4),
       (37, 13),
       (35, 14),
       (38, 9),
       (40, 3),
       (39, 11);
	 