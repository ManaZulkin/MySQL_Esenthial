drop database MyJoinDB;

create database MyJoinDB;

use MyJoinDB;

create table Emploees(
id int auto_increment primary key, -- кластеризовний індекс
EName varchar(20),
phone varchar(15));

create table Posittions(
id int auto_increment primary key, -- кластеризований індекс
name varchar(20) references Emploees.name,
position varchar(15),
salary int);

create table EmploeesDetails(
id int auto_increment primary key, -- кластеризований індекс
Adress varchar(25),
BirthDate varchar(10),
CiwilStatus varchar(10));

insert into Emploees(EName, phone)
values ('Ivan', '38095-333-52-48'),
('Sasha', '38099-559-57-02'),
('Igor', '38098-393-72-41'),
('Oksana', '38097-533-54-99'),
('Valera', '38095-385-48-59');

insert into Posittions(name, position, salary)
values ('Ivan', 'Director', 25000),
('Sasha', 'Worker', 6000),
('Igor', 'Manager', 5000),
('Oksana', 'Manager', 8000),
('Valera', 'worker', 5000);
insert into EmploeesDetails(Adress, BirthDate, CiwilStatus)
values ('First street, 1', '1994-12-12', 'Marige'),
('First street, 1', '1995-11-10', 'Single'),
('First street, 1', '1984-07-24', 'Single'),
('First street, 1', '1989-09-19', 'Single'),
('First street, 1', '1998-10-15', 'Marige');

select * from Emploees join EmploeesDetails on Emploees.id = EmploeesDetails.id;

select EName, phone, adress from Emploees join EmploeesDetails on Emploees.id = EmploeesDetails.id;

select EName, birthdate, phone from emploees join emploeesdetails on emploees.id = emploeesdetails.id where ciwilstatus = 'Single'; 

alter table Emploees
add column Posittion varchar(15) references Position.name;

update Emploees
set posittion = 'Director'
where id = 1;

update Emploees
set posittion = 'Manager'
where id <= 3 and id != 1;

update Emploees
set posittion = 'Worker'
where id > 3;

select name, phone, birthdate from posittions 
join emploees on posittions.name = emploees.EName
join emploeesdetails on emploees.id = emploeesdetails.id
where position = 'Manager';

-- ---------------------------------------------------------------------------------------------------
create view contacts as 
select emploees.ename, emploees.phone, emploeesdetails.Adress from emploees, emploeesdetails
where emploees.id = emploeesdetails.id;

select * from contacts;

create view single as
select emploees.EName, emploees.phone, emploeesdetails.BirthDate from emploees, emploeesdetails
where emploeesdetails.CiwilStatus = 'Single' and emploees.id = emploeesdetails.id;

select * from single;

create view managers as
select emploees.EName, emploees.phone, emploeesdetails.BirthDate from emploees, emploeesdetails
where emploees.id = emploeesdetails.id and emploees.Posittion = 'Manager';

select * from managers;

-- --------------------------------------------------------------------------------
drop table emploees;

create table Emploees(
id int, 
EName varchar(20),
phone varchar(15));

-- створено кучу
insert into Emploees(id, EName, phone)
values (1, 'Ivan', '38095-333-52-48'),
(3, 'Sasha', '38099-559-57-02'),
(2, 'Igor', '38098-393-72-41'),
(5, 'Oksana', '38097-533-54-99'),
(4, 'Valera', '38095-385-48-59');

select * from emploees; -- данні відображаються так як були добавлені

alter table emploees
add index(id);

select * from emploees; -- данні відображаються впорядковано за індексом
