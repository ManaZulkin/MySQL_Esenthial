drop database MyFunkDB;
create database MyFunkDB;
use MyFunkDB;

create table positions(
id int references workerList.id,
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
create procedure addPosition(in id int, in position varchar(15), in salary int)
begin
	insert into positions (id, position, salary)
    values (id, position, salary);
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
call addPosition(1, 'Director', 200000);
call addPosition(2, 'Manager', 10000);
call addPosition(3, 'Worker', 5000);
call addPosition(4, 'Manager', 10000);
call addPosition(5, 'Worker', 5000);

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

Delimiter ;
select * from workersList;
select * from workerInfo;
select * from positions;

-- ----------------------------------------------------------------------------------

Delimiter |
create procedure addWithtransction()
begin
declare id int;
declare name varchar(15);
	start transaction;
	call newWorker('Ruslan', '380955543215', 2);
    set id = @@IDENTITY;
    set name = (select workerslist.name from workerslist where workerslist.id = id);
    call addInfo(6, 'Maried', '1986/2/2', 'Random Adress 3');
    call addPosition(6, 'Worker', 5000);
	if exists (select * from workerslist where workerslist.name = name and workerslist.id != id)
		then rollback;
        end if;
    commit;
end;
|
Delimiter ;
call addWithtransction();

select * from workersList;
select * from workerInfo;
select * from positions;

-- -------------------------------------------------------------
Delimiter |
create trigger deleteWorker
before delete on workerslist
for each row
begin
	delete from workerInfo where workerInfo.id = OLD.id;
    delete from positions where positions.id =old.id;
end;
|

delete from workerslist where id = 5; |

select * from workersList;
select * from workerInfo;
select * from positions;