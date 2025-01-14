Create database Qauto;
use Qauto;

create table car_brands (
id int auto_increment primary key,
title varchar (255) not null
);
insert into car_brands (title)
values 
('Audi'),
('BMW'),
('Ford'),
('Porsche'),
('Fiat');

create table car_models (
id int auto_increment primary key,
carBrandId int not null,
title varchar (255) not null,
foreign key (carBrandId) references car_brands(id)
);

insert into car_models (carBrandId, title)
values
-- Моделі Audi
    ((SELECT id FROM car_brands WHERE title = 'Audi'), 'TT'),
    ((SELECT id FROM car_brands WHERE title = 'Audi'), 'R8'),
    ((SELECT id FROM car_brands WHERE title = 'Audi'), 'Q7'),
    ((SELECT id FROM car_brands WHERE title = 'Audi'), 'A6'),
    ((SELECT id FROM car_brands WHERE title = 'Audi'), 'A8');

insert into car_models (carBrandId, title)    
values    
-- Моделі BMW
    ((SELECT id FROM car_brands WHERE title = 'BMW'), '3'),
    ((SELECT id FROM car_brands WHERE title = 'BMW'), '5'),
    ((SELECT id FROM car_brands WHERE title = 'BMW'), 'X5'),
    ((SELECT id FROM car_brands WHERE title = 'BMW'), 'X6'),
    ((SELECT id FROM car_brands WHERE title = 'BMW'), 'Z3');
    
    insert into car_models (carBrandId, title)    
values    
-- Моделі Ford
	((SELECT id FROM car_brands WHERE title = 'Ford'), 'Fiesta'),
    ((SELECT id FROM car_brands WHERE title = 'Ford'), 'Focus'),
    ((SELECT id FROM car_brands WHERE title = 'Ford'), 'Fusion'),
    ((SELECT id FROM car_brands WHERE title = 'Ford'), 'Mondeo'),
    ((SELECT id FROM car_brands WHERE title = 'Ford'), 'Sierra');
    
     insert into car_models (carBrandId, title)    
values    
-- Моделі Porsche
	((SELECT id FROM car_brands WHERE title = 'Porsche'), '911'),
    ((SELECT id FROM car_brands WHERE title = 'Porsche'), 'Cayenne'),
    ((SELECT id FROM car_brands WHERE title = 'Porsche'), 'Panamera');
    
    insert into car_models (carBrandId, title)    
values    
-- Моделі Fiat
	((SELECT id FROM car_brands WHERE title = 'Fiat'), 'Palio'),
    ((SELECT id FROM car_brands WHERE title = 'Fiat'), 'Ducato'),
    ((SELECT id FROM car_brands WHERE title = 'Fiat'), 'Panda'),
	((SELECT id FROM car_brands WHERE title = 'Fiat'), 'Punto'),
	((SELECT id FROM car_brands WHERE title = 'Fiat'), 'Scudo');
	create table users (
id int unique auto_increment primary key,
FirstName varchar (255) not null,
LastName varchar (255) not null,
email varchar (255) not null unique,
password varchar (255) not null
);
	insert into users (FirstName, LastName, email, password)
values 
	("Jonh", "Anderson", "qauto1@gmail.com", "Qauto12"),
    ("Tomas", "Anderson", "qauto2@gmail.com", "Qauto13"),
    ("Tom", "Cruise", "qauto3@gmail.com", "Qauto14"),
    ("Jonh", "Wick", "qauto4@gmail.com", "Qauto15"),
    ("Keanu", "Reeves", "qauto5@gmail.com", "Qauto16");

	create table cars (
id int auto_increment primary key,
usersId int not null,
carBrandId int not null,
carModelId int not null,
mileage int not null,
initialMilleage int not null,
foreign key (usersId) references users(Id),
foreign key (carBrandId) references car_brands(id),
foreign key (carModelId) references car_models(id)
);

insert into cars (usersId, carBrandId, carModelId, mileage, initialMilleage)
values
    ((SELECT id FROM users WHERE id = 1), (SELECT id FROM car_brands WHERE title = 'Audi'), (SELECT id FROM car_models WHERE title = 'R8'), 250, 150);
insert into cars (usersId, carBrandId, carModelId, mileage, initialMilleage)
values
    ((SELECT id FROM users WHERE id = 2), (SELECT id FROM car_brands WHERE title = 'BMW'), (SELECT id FROM car_models WHERE title = 'X6'), 350, 251);
insert into cars (usersId, carBrandId, carModelId, mileage, initialMilleage)
values
    ((SELECT id FROM users WHERE id = 3), (SELECT id FROM car_brands WHERE title = 'Ford'), (SELECT id FROM car_models WHERE title = 'Fiesta'), 450, 351);
insert into cars (usersId, carBrandId, carModelId, mileage, initialMilleage)
values
    ((SELECT id FROM users WHERE id = 4), (SELECT id FROM car_brands WHERE title = 'Porsche'), (SELECT id FROM car_models WHERE title = 'Panamera'), 550, 451);
insert into cars (usersId, carBrandId, carModelId, mileage, initialMilleage)
values
    ((SELECT id FROM users WHERE id = 5), (SELECT id FROM car_brands WHERE title = 'Fiat'), (SELECT id FROM car_models WHERE title = 'Panda'), 650, 551);