drop database weapon;
create database weapon;
use weapon;

-- Table befor normalization ----------------
create table wepList(
ФІО varchar(30),
Взвод int,
Зброя varchar(10),
ЗброюВидав varchar(40));

insert into wepList(ФІО, Взвод, Зброя, ЗброюВидав)
values('Петров В.А., оф.205', 222, 'АК-47', 'Буров О.С., майор'),
('Петров В.А., оф.205', 222, 'Глок20', 'Рибаков Н.Г., майор'),
('Лодарєв П.С., оф.221', 232, 'АК-47', 'Деребанов В.Я., майор'),
('Лодарєв П.С., оф.221', 232, 'Глок20', 'Рибаков Н.Г., майор'),
('Леонтьєв К.В., оф.201', 212, 'АК-47', 'Буров О.С., майор'),
('Леонтьєв К.В., оф.201', 212, 'Глок20', 'Рибаков Н.Г., майор'),
('Духов Р.М.', 200, 'АК-47', 'Буров О.С., майор');

select * from wepList;

-- Переходим до першої нормальної форми(1NF)---------------------

drop table wepList;

create table wepList(
PN int not null,
PW int not null,
primary key (PN, PW),
LName varchar(15) not null,
FName varchar(15) not null,
MName varchar(15) not null,
OFNum varchar(6) default '',
division int not null,
weapon varchar(10),
LNameOficer varchar(15),
FNameOficer varchar(15),
MNameOficer varchar(15),
rankk varchar(10));

insert into wepList(PN, PW, LName, FName, MName, OFNum, division, weapon, LNameOficer, FNameOficer, MNameOficer, rankk)
values(1, 1, 'Петров', 'В.', 'А.', 'оф.205', 222, 'АК-47', 'Буров', 'О.', 'С.', 'майор'),
(1, 2, 'Петров', 'В.', 'А.', 'оф.205', 222, 'Глок20', 'Рибаков', 'Н.', 'Г.', 'майор'),
(2, 1, 'Лодарєв', 'П.', 'С.', 'оф.221', 232, 'АК-74', 'Деребанов','В.','Я.', 'майор'),
(2, 2, 'Лодарєв', 'П.', 'С.', 'оф.221', 232, 'Глок20', 'Рибаков', 'Н.', 'Г.', 'майор'),
(3, 1, 'Леонтьєв', 'К.', 'В.', 'оф.201', 212, 'АК-47', 'Буров', 'О.', 'С.', 'майор'),
(3, 2, 'Леонтьєв', 'К.', 'В.', 'оф.201', 212, 'Глок20', 'Рибаков', 'Н.', 'Г.', 'майор'),
(4, 1, 'Духов', 'Р.', 'М.', '', 200, 'АК-47', 'Буров', 'О.', 'С.', 'майор');

select * from wepList;

-- 2NF --------------------------------------------------------------------------

Drop table wepList;

create table soldjer(
person_id int auto_increment primary key,
LName varchar(15) not null,
FName varchar(15) not null,
MName varchar(15) not null,
OFNum varchar(6) default '',
division int not null);

insert into soldjer(LName, FName, MName, OFnum, division)
values ('Петров', 'В.', 'А.', 'оф.205', 222),
('Лодарєв', 'П.', 'С.', 'оф.221', 232),
('Леонтьєв', 'К.', 'В.', 'оф.201', 212),
('Духов', 'Р.', 'М.', '', 200);


create table oficers(
id int auto_increment primary key,
LNameOficer varchar(15),
FNameOficer varchar(15),
MNameOficer varchar(15),
rankk varchar(10));

insert into oficers(LNameOficer, FNameOficer, MNameOficer, rankk)
values ('Буров', 'О.', 'С.', 'майор'),
('Рибаков', 'Н.', 'Г.', 'майор'),
('Деребанов','В.','Я.', 'майор');

create table weapon(
weapon_id int not null,
name varchar(10),
responsible_person int,
foreign key(responsible_person) references oficers(id) );

insert into weapon(weapon_id, name, responsible_person)
values (23459, 'AK-47', 1),
(56378, 'AK-74', 3),
(12784, 'Глок20', 2);

create table issuance_of_weapons(
soldjer_id int references soldjer(person_id),
weapon int references weapon(weapon_id),
oficer int references oficers(id),
primary key (soldjer_id, weapon));

insert into issuance_of_weapons(soldjer_id, weapon, oficer)
values ( 1, 23459, 1),
(1, 12784, 2),
(2, 56378, 3),
(2, 12784, 2),
(3, 23459, 1),
(3, 12784, 2),
(4, 23459, 1);

select * from issuance_of_weapons;
select * from weapon;
select * from soldjer;
select * from oficers;

-- Данний вид задовільняє 2 та 3 нормальні форми......................
-- Принаймні мені так здається)))