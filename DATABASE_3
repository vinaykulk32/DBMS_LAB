show databases;
create database vinay_supplier_insurance;
use vinay_supplier_insurance;
create table SUPPLIERS
(
sid int(5) primary key,
sname varchar(20),
city varchar(20));

show tables;

create table PARTS
(
pid int(5) primary key,
pname varchar(20),
color varchar(10));

create table CATALOG
(
sid int(5),
pid int(5),
cost float(6),
primary key(sid,pid),
foreign key(pid) references PARTS(pid) on delete cascade
);

drop table catalog;

desc SUPPLIERS;

insert into SUPPLIERS values('1001','abc','xyz');
insert into SUPPLIERS values('1002','abc1','xyz1');
insert into SUPPLIERS values('1003','abc2','xyz2');
insert into SUPPLIERS values('1004','abc3','xyz3');
insert into SUPPLIERS values('1005','abc4','xyz4');

select * from suppliers;

insert into parts values('2001','name1','red');
insert into parts values('2002','name2','blue');
insert into parts values('2003','name3','black');
insert into parts values('2004','name4','green');
insert into parts values('2005','name5','yellow');

select * from parts;

insert into catalog values('1001','2001','15');
insert into catalog values('1002','2002','25');
insert into catalog values('1003','2003','35');
insert into catalog values('1004','2004','45');
insert into catalog values('1005','2005','55');

select * from catalog;

select distinct P.pname from parts P,Catalog C where P.pid=C.pid;
