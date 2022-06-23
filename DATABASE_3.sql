show databases;
create database vinay_supplier_insurance;
use vinay_supplier_insurance;

create table SUPPLIERS
(
sid int(5) primary key,
sname varchar(20),
city varchar(20));

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
foreign key(pid) references PARTS(pid) on delete cascade,
foreign key(sid) references SUPPLIERS(sid) on delete cascade
);
show tables;

insert into SUPPLIERS values('1001','abc','xyz');
insert into SUPPLIERS values('1002','abc1','xyz1');
insert into SUPPLIERS values('1003','abc2','xyz2');
insert into SUPPLIERS values('1004','abc3','xyz3');
insert into SUPPLIERS values('1005','abc4','xyz4');
insert into SUPPLIERS values('1006','AW','xyz5');
select * from suppliers;

insert into parts values('2001','name1','red');
insert into parts values('2002','name2','blue');
insert into parts values('2003','name3','black');
insert into parts values('2004','name4','green');
insert into parts values('2005','name5','yellow');
insert into parts values('2006','AM','red accent');
select * from parts;

insert into catalog values('1001','2001','15');
insert into catalog values('1002','2002','25');
insert into catalog values('1003','2003','35');
insert into catalog values('1004','2004','45');
insert into catalog values('1005','2005','55');
insert into catalog values('1006','2006','65');
select * from catalog;

#Find the pnames of parts for which there is some supplier.
select distinct P.pname 
from parts P,Catalog C 
where P.pid=C.pid;

#Find the snames of suppliers who supply every part.
select distinct s.sname 
from suppliers s,Catalog C 
where s.sid=C.sid;

#Find the snames of suppliers who supply every red part.
select distinct s.sname
from suppliers s,catalog c,parts p
where p.color='red' and p.pid=c.pid and s.sid=c.sid;

#Find the pnames of parts supplied by Acme Widget Suppliers and by no one else.
select p.pname
from suppliers s,catalog c,parts p
where s.sname='AW' and p.pid=c.pid and s.sid=c.sid;

#Find the sids of suppliers who charge more for some part than the average cost of that part (averaged over
#all the suppliers who supply that part)
select s.sid
from suppliers s
where cost >(
select avg(cost) 
from catalog);
