CREATE DATABASE MyDB;

USE MyDB;

CREATE TABLE Workers(
id INT auto_increment NOT NULL,
Name VARCHAR(15),
Phone VARCHAR(15),
PRIMARY KEY (id)
);

CREATE TABLE Workers_Position(
id INT auto_increment NOT NULL,
Position VARCHAR(20),
Salary INT,
PRIMARY KEY (id)
);

CREATE TABLE Workers_Personal_Info(
id INT auto_increment NOT NULL,
Civil_Status VARCHAR(10),
Birth_Date DATE,
Adress VARCHAR(35),
PRIMARY KEY (id)
);

insert into workers(name, phone)
values('Anton', '380995246851');

insert into workers(name, phone)
values('Maxim', '380984265895');

insert into workers(name, phone)
values('Roma', '3809546894562');

insert into workers(name, phone)
values('Ivan', '380971158963');

insert into workers(name, phone)
values('Vasa', '380995568681');

select * from workers;

insert into Workers_Position(Position, salary)
values('Worker', '5000');

insert into Workers_Position(Position, salary)
values('Maneger', '35000');

insert into Workers_Position(Position, salary)
values('Developer', '15000');

insert into Workers_Position(Position, salary)
values('HR', '15000');

insert into Workers_Position(Position, salary)
values('Student', '3000');

select * from workers_position;

insert into workers_personal_info(civil_status, birth_date, adress)
values('Marige','1985/12/05','Some-street, 11');

insert into workers_personal_info(civil_status, birth_date, adress)
values('Single','1987/04/25','Second-street, 22');

insert into workers_personal_info(civil_status, birth_date, adress)
values('Single','1990/12/01','Unknown-street, 10');

insert into workers_personal_info(civil_status, birth_date, adress)
values('Marige','1995/09/19','Primary-street, 1');

insert into workers_personal_info(civil_status, birth_date, adress)
values('Betrothed','2000/10/25','Happy-street, 5');

select * from workers_personal_info;

select id from workers_position
where salary > 10000;

update workers_personal_info
set civil_status = 'single'
where id = 1;

select * from workers_personal_info;