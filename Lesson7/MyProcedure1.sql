drop database MyFunkDB;
create database MyFunkDB;
use MyFunkDB;

create table positions(
id int auto_increment primary key,
position varchar(15),
salary int);

create table workersList(
id int auto_increment primary key,
name varchar(15),
phone varchar(12),
workerPosition int not null references positions.id);

create table workerInfo(
id int references workerList.id,
family varchar(25),
birthday date,
adress varchar(35)
);

DELIMITER |
create procedure newWorker(in name varchar(15), in phone varchar(12), in pos int)
begin
	insert into workersList (name, phone, workerPosition) 
    values (name, phone, pos);
end|

DELIMITER |
create procedure addPosition(in position varchar(15), in salary int)
begin
	insert into positions (position, salary)
    values (position, salary);
end
|

DELIMITER |
create procedure addInfo(in id int, in family varchar(25), in birthday date, in adress varchar(35))
begin
	insert into workerInfo (id, family, birthday, adress)
    values(id, family, birthday, adress);
end
|

DELIMITER |
create procedure getContact ()
begin
	select name, phone, adress from workersList join workerInfo on workersList.id = workerInfo.id; 
end
|

DELIMITER |
create procedure getSingleones ()
begin
	select name, phone, birthday from workersList join workerInfo on workersList.id = workerInfo.id where workerInfo.family = 'Single'; 
end
|

DELIMITER |
create procedure getMenegers ()
begin
	select name, phone, birthday from workersList join workerInfo on workersList.id = workerInfo.id where workersList.workerPosition = 2; 
end
|

DELIMITER |
call addPosition('Director', 200000);
call addPosition('Manager', 10000);
call addPosition('Worker', 5000);

CALL newWorker('Ivan', '380954258796', 1);
CALL newWorker('Oleg', '380955543215', 2);
CALL newWorker('Olga', '380974613855', 3);
CALL newWorker('Vova', '380985648921', 3);
CALL newWorker('Artem', '380951354862', 2);

call addInfo(1, 'Single', '1996/12/12', 'Random Adress 1');
call addInfo(2, 'Maried', '1993/9/2', 'Random Adress 2');
call addInfo(3, 'Maried', '1986/2/2', 'Random Adress 3');
call addInfo(4, 'Single', '1979/1/1', 'Random Adress 4');
call addInfo(5, 'Single', '1999/10/12', 'Random Adress 5');
|

Delimiter |
call getMenegers;
call getSingleones;
call getContact;
|
Delimiter ;
select * from workersList;
select * from workerInfo;
select * from positions;

-- ----------------------------------------------------------------------------------
-- drop function minAge; -- drop if it need

alter table workerslist
add age int;

update workerslist
set age = (2023 - year((select birthday from workerinfo where workerinfo.id = workerslist.id)));
select * from workerslist;

DELIMITER |
create function  minAge() 
returns int deterministic
begin
	declare age int;
    set age = (2023 - year((select max(birthday) from workerinfo)));
    return age;
end
|
select minAge();

select name, position, workerslist.age, phone, salary from positions join workerslist  on positions.id = workerposition
where minAge() = workerslist.age;