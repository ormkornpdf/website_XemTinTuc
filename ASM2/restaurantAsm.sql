create database restaurantAsm
use restaurantAsm

create table categories (
	id int primary key identity,
	name varchar(100) 
);

create table users(
	id int primary key identity,
	password varchar(150),
	fullname varchar(100),
	birthday date,
	gender bit,
	phone varchar(10),
	email varchar(100),
	role bit
);

create table newsleetters(
	id int primary key identity,
	email varchar(100) unique,
	enabled bit
);

create table news(
	id int primary key identity,
	title varchar(100),
	content text,
	image nvarchar(200),
	posteddate date,
	auth int foreign key references users(id),
	viewcout int,
	categoty_id int foreign key references categories(id),
	home bit
	
);
select * from users
select * from categories
select * from news
select * from users
insert into users values('admin@gmail.com', '123', N'Quản trị viên', '03-09-2007', 1, '0956123196', 1)

insert into users (email, password, fullname, birthday, gender, phone, role)
values ('linhlnhtc00424@gmail.com', '123', N'Hà Linh', '2007-03-09', 1, '0937103998', 0);
insert into users (email, password, fullname, birthday, gender, phone, role)
values ('halinhilinh20@gmail.com', '123', N'kewtxyx', '2007-03-09', 1, '0937103998', 0);

insert into users (email, password, fullname, birthday, gender, phone, role)
values ('admin@gmail.com', '123', N'Quản trị viên', '2007-03-09', 1, '0937103998', 1);
ALTER TABLE news ALTER COLUMN content NVARCHAR(MAX);
ALTER TABLE categories ALTER COLUMN name NVARCHAR(MAX);
ALTER TABLE news ALTER COLUMN title NVARCHAR(MAX);
ALTER TABLE users ALTER COLUMN fullname NVARCHAR(MAX);

UPDATE users
SET fullname = N'Quản trị viên'
WHERE email = 'admin@gmail.com';
UPDATE users
SET email = 'halinhilinh20@gmail.com'
WHERE fullname = N'kewtxyx';

select * from 

