-- drop database storage;
create database Storage;

use storage;

-- Створюємо таблиці ---------------------------------------
create table Personnel(
id_personal int auto_increment,
name varchar(20),
position varchar(20),
primary key(id_personal));

create table Distributor(
id_distributor int auto_increment,
Name_Distributor varchar(30) unique,
Product varchar(20) unique,
number int,
primary key(id_distributor));

create table RegularCostumer(
id_costumer int auto_increment,
name_costumer varchar(30) unique,
Product varchar(20),
Number int,
primary key (id_costumer));

create table InStorage(
id int auto_increment,
date datetime default current_timestamp,
worker int,
name_company varchar(30),
name_costumer varchar(30),
product varchar(20),
operation varchar(20),
primary key(id));

-- Дивимось створені таблиці	-------------------------------------
select * from distributor;
select * from regularcostumer;
select * from personnel;
select * from instorage;
-- -------------------------------------------------------

-- Створюємо заязки --------------------------------------
alter table instorage
add constraint worker
foreign key (worker) references personnel(id_personal);

alter table instorage
add constraint name_company
foreign key(name_company) references distributor(name_distributor);

alter table instorage
add constraint name_costumer
foreign key(name_costumer) references RegularCostumer(name_costumer);

alter table instorage
add constraint product
foreign key(product) references distributor(product);

-- Заповнення таблиць -------------------------------------------
insert into personnel(name, position)
values('Ivan', 'Manager'),
('Petro', 'Worker'),
('Oleg', 'Worker');

insert into Distributor(Name_Distributor, Product, number)
values ('Panasonic', 'TV', '20'),
('Samsung', 'Smartphone','30'),
('LG', 'Vacuumclener','25'),
('Apple', 'Iphone','10');

insert into RegularCostumer(Name_costumer, product, number)
values ('Bilka', 'TV', '10'),
('Foxtrot', 'Iphone', '5'),
('Eldorado', 'Vacuumclener', '20');

insert into instorage(worker, name_company, name_costumer, product, operation)
values ('1', 'LG', 'Bilka', 'Vacuumclener', 'unloading/receiving'),
('2', 'Apple', 'Foxtrot', 'Iphone', 'loading'),
('3', 'Samsung', 'Eldorado', 'Smartphone', 'loading'),
('2', 'Panasonic', 'Bilka', 'TV', 'unloading'),
('1', 'Panasonic', 'Foxtrot', 'TV', 'receiving');

-- Дивимось створені таблиці	-------------------------------------
select * from distributor;
select * from regularcostumer;
select * from personnel;
select * from instorage;