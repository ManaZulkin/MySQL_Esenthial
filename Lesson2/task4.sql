-- drop database Department_office;
create database Department_office;
use Department_office;

create table departments(
id int auto_increment,
name varchar(30),
department_phone varchar(20),
department_code varchar(4),
CONSTRAINT DP_unique UNIQUE (department_code, name),
primary key(id));

create table staff_schedule(
id int auto_increment,
name_position varchar(25) unique,
code_position smallint unique,
education varchar(30),
primary key(id));

create table workers(
id int auto_increment,
department_code varchar(4),
code_position smallint,
name varchar(30),
phone int,
salary int,
foreign key(department_code) references departments(department_code),
foreign key(code_position) references staff_schedule(code_position),
primary key(id));

create table workers_data(
worker_id int auto_increment,
foreign key(worker_id) references workers(id),
family_status varchar(10),
childrens tinyint,
vacation_start date default "0000/00/00",
vacation_finish date default "0000/00/00",
primary key (worker_id)
);

-- Створені таблиці --------------------------------------------
select * from departments;
select * from staff_schedule;
select * from workers;
select * from workers_data;

-- Зповнення таблиць-------------------------------------------
insert into departments(name, department_phone, department_code)
values ('Bugaltery', '5248931', '1546'),
('Industrial', '5688491', '1856');

insert into staff_schedule(name_position, code_position, education)
values('Maneger', 23, 'Profile'),
('Practicant', 12, '-'),
('Higth worker', 3, 'Profile'),
('worker', 2, 'Semi-profile');

insert into workers(department_code, code_position, name, phone, salary)
values ('1546','23', 'Ivan', 974525869, 20000),
('1856','12', 'Vova', 984585569, 2000),
('1856','2', 'Nils', 951564896, 12000),
('1546','2', 'Ivan', 685214986, 13000),
('1856','3', 'Sara', 975493132, 15000),
('1546','3', 'Masha', 974525869, 15000);

insert into workers_data(family_status, childrens, vacation_start, vacation_finish)
values ('Single', '0', "2023/09/01", "2023/09/20"),
('Single', '2', "0000/00/00", "0000/00/00"),
('Marige', '1', "2022/12/25", "2023/01/10"),
('Marige', '2', "0000/00/00", "0000/00/00"),
('Marige', '0', "0000/00/00", "0000/00/00"),
('Marige', '1', "2023/03/01", "2023/04/01");



-- Створені таблиці --------------------------------------------
select * from departments;
select * from staff_schedule;
select * from workers;
select * from workers_data;