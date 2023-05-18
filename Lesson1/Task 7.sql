create database cars;

use cars;

create table cars(
id int auto_increment not null,
mark varchar(15),
model varchar(10),
engene varchar(8),
price mediumint,
speed smallint,
primary key (id)
);

insert into cars(mark, model, engene, price, speed)
values('Audi','A6','2.0 TDI','12000','280');
insert into cars(mark, model, engene, price, speed)
values('BMW','X6','3.0 M50d','25000','320');
insert into cars(mark, model, engene, price, speed)
values('VW','Jetta 6','1.9 TDI','14000','300');
insert into cars(mark, model, engene, price, speed)
values('Shkoda','Oktavia','1.6','8000','260');
insert into cars(mark, model, engene, price, speed)
values('Reno','Megan 5','1.4','8000','260');
insert into cars(mark, model, engene, price, speed)
values('KIA','Ceed','1.9','10000','275');
insert into cars(mark, model, engene, price, speed)
values('Citroen','C4 Cactus','1.6','7000','275');
insert into cars(mark, model, engene, price, speed)
values('Chevrolet','Spark','1.2','4000','240');

select * from cars;