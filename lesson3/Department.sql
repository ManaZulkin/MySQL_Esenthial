drop database Department;
create database Department;
use Department;

create table Department(
department varchar(80),
worker varchar(100),
salary varchar(30));

insert into Department(department, worker, salary)
values ('3487 Workshop, Saint st. 12, tef.34-87-89', 'Mikel Shepard, N24, full day', '45 hours, 120$/hour, 5400'),
('3487 Workshop, Saint st. 12, tef.34-87-89', 'Irina Fox, M14, full day', '47 hours, 120$/hour, 5640'),
('4356 ToolsKeet, Hellvej st. 28, tef.35-54-19', 'Klark Kent, P6, half day', '20 hours, 80$/hour, 1600'),
('4356 ToolsKeet, Hellvej st. 28, tef.35-54-19', 'Leonardo Dikaprio, M24, full day', '50 hours, 110$/hour, 5500'),
('3937 Dreamland, Jorbervej st. 69, tef.22-53-99', 'Olga Skaywalker, P100, full day', '40 hours, 130$/hour, 5200');

-- N24 та інші подібні данні по задумукі це номер справи з персональною інформацією яку мені ліньки тут описувати, але ми представляємо що вона є в окремій таблиці

select * from department;

-- Приводимо до першої нормальної форми----------------------------------

drop table department;
create table department(
id int auto_increment,
id_code int,
primary Key (id, id_code),
shop_name varchar(15),
adress varchar(20),
shop_telf varchar(8),
FName varchar(10),
LName varchar(15),
CaseNum varchar(5),
work_tipe varchar(10),
hours smallint,
rate_per_hour smallint,
salary int);

insert into department(id_code, shop_name, adress, shop_telf, FName, LName, CaseNum, work_tipe, hours, rate_per_hour, salary)
values (3487, 'Workshop', 'Saint st. 12', '34-87-89', 'Mikel', 'Shepard', 'N24', 'full day', 45, 120, hours * rate_per_hour),
(3487, 'Workshop', 'Saint st. 12', '34-87-89', 'Irina', 'Fox', 'M14', 'full day', 47, 120, hours * rate_per_hour),
(4356, 'ToolsKeet', 'Hellvej st. 28', '35-54-19', 'Klark', 'Kent', 'P6', 'half day', 20, 80, hours * rate_per_hour),
(4356, 'ToolsKeet', 'Hellvej st. 28', '35-54-19', 'Leonardo', 'Dikaprio', 'M24', 'full day', 50, 110, hours * rate_per_hour),
(3937, 'Dreamland', 'Jorbervej st. 69', '22-53-99', 'Olga', 'Skaywalker', 'P100', 'full day', 40, 130, hours * rate_per_hour);

select * from department;

-- 2NF --------------------------------------------------------------

drop table department;
-- drop table shops;
-- drop table workers;
-- drop table salary;


create table Shops(
id_code int not null primary key,
name varchar(20),
adress varchar(25),
telephone varchar(9));

insert into Shops(id_code, name, adress, telephone)
values (3487, 'Workshop', 'Saint st. 12', '34-87-89'),
(4356, 'ToolsKeet', 'Hellvej st. 28', '35-54-19'),
(3937, 'Dreamland', 'Jorbervej st. 69', '22-53-99');

create table workers(
id int auto_increment primary key,
FName varchar(10),
LName varchar(15),
CaseNum varchar(5),
work_tipe varchar(10));

insert into workers(FName, LName, CaseNum, work_tipe)
values('Mikel', 'Shepard', 'N24', 'full day'),
('Irina', 'Fox', 'M14', 'full day'),
('Klark', 'Kent', 'P6', 'half day'),
('Leonardo', 'Dikaprio', 'M24', 'full day'),
('Olga', 'Skaywalker', 'P100', 'full day');

create table salary(
recept int not null primary key,
worker_id int references workers(id),
hours smallint,
rate_per_hour smallint,
total int);

insert into salary(recept, worker_id, hours, rate_per_hour, total)
values (12342351, 1, 45, 120, hours * rate_per_hour),
(53412341, 2, 47, 120, hours * rate_per_hour),
(14534143, 3, 20, 80, hours * rate_per_hour),
(43253234, 4, 50, 110, hours * rate_per_hour),
(23456245, 5, 40, 130, hours * rate_per_hour);

Create table department(
id int auto_increment primary key,
shop_id_code int references shops(id_code),
worker_id int references worker(id),
salary_No int references salary(recept)
);

insert into department(shop_id_code, worker_id, salary_No)
values (3487, 2, 53412341),
(3487, 1, 12342351),
(4356, 4, 43253234),
(4356, 3, 14534143),
(3937, 5, 23456245);

select * from department;
select * from shops;
select * from workers;
select * from salary;

-- Дані таблиці задовільняють другу нормальну форму(2NF). Для приведення до третьої нормальної форми(3NF) потрібно видалити стовбець з підрахунком зарплати,
-- що є не доцільним для даної бази даних.