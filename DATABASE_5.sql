show databases;
create database airline188;
use airline188;
show tables;

create table flights(
    fno int primary key,
    from_ varchar(20),
    to_ varchar(20),
    distance int,
    departs time,
    arrives time,
    price int
);
desc flights;

create table aircraft(
    aid int primary key,
    aname varchar(20),
    cruisingrange int
);
desc aircraft;

create table employee(
    eid int primary key,
    ename varchar(20),
    salary int
);
desc employee;

create table certified(
    eid int,
    aid int,
    primary key(eid,aid),
    foreign key(eid) references employee(eid) on delete cascade,
    foreign key(aid) references aircraft(aid) on delete cascade
);
desc certified;

insert into flights values(1,'a','b',500,10,20,100000);
insert into flights values(2,'a','c',510,11,21,200000);
insert into flights values(3,'a','d',520,12,22,300000);
insert into flights values(4,'a','e',530,13,23,400000);
insert into flights values(5,'a','f',540,14,24,1000000);

insert into flights values(6,'Bengaluru','Frankfurt',540,14,24,50000);
insert into flights values(7,'Bengaluru','Frankfurt',540,14,24,60000);
insert into flights values(8,'Bengaluru','Frankfurt',540,14,24,70000);
insert into flights values(9,'Bengaluru','Frankfurt',540,14,24,80000);
insert into flights values(10,'Bengaluru','Frankfurt',540,14,24,90000);
select * from flights;

insert into aircraft values(11,'aaa',100);
insert into aircraft values(21,'bbb',200);
insert into aircraft values(31,'ccc',300);
insert into aircraft values(41,'ddd',400);
insert into aircraft values(51,'eee',500);
insert into aircraft values(61,'fff',600);
insert into aircraft values(71,'ggg',700);
insert into aircraft values(81,'hhh',800);
insert into aircraft values(91,'iii',900);
insert into aircraft values(121,'jjj',1000);
insert into aircraft values(191,'boeing',1000);


insert into aircraft values(131,'kkk',10000);
insert into aircraft values(141,'lll',20000);
insert into aircraft values(151,'mmm',30000);
insert into aircraft values(161,'nnn',40000);
select * from aircraft;

insert into employee values(111,'jj',10000);
insert into employee values(222,'kk',20000);
insert into employee values(333,'ll',30000);
insert into employee values(444,'mm',40000);
insert into employee values(555,'nn',50000);
insert into employee values(666,'oo',60000);
insert into employee values(777,'pp',70000);
insert into employee values(888,'qq',80000);
insert into employee values(999,'rr',90000);
insert into employee values(112,'ss',100000);
select * from employee;

insert into certified values(111,11);
insert into certified values(222,21);
insert into certified values(333,31);
insert into certified values(444,41);
insert into certified values(555,51);
insert into certified values(666,61);
insert into certified values(777,71);
insert into certified values(888,81);
insert into certified values(999,91);
insert into certified values(112,121);

insert into certified values(112,131);
insert into certified values(112,141);
insert into certified values(112,151);
insert into certified values(112,161);
select * from certified;


#Find the names of aircraft such that all pilots certified to operate them have salaries more than Rs.80,000.
select a.aname
from aircraft a, certified c, employee e
where a.aid=c.aid and c.eid=e.eid and e.salary>80000;

#For each pilot who is certified for more than three aircrafts, find the eid and the maximum cruising range of
#the aircraft for which she or he is certified.
select e.eid,max(a.cruisingrange)
from aircraft a, employee e, certified c
where e.eid=c.eid and a.aid=c.aid and 
a.aid in ( select aid from certified where eid in
(select eid from certified group by eid having count(*)>=3));

#Find the names of pilots whose salary is less than the price of the cheapest route from Bengaluru to
#Frankfurt.
select distinct e.ename 
from employee e
where e.salary<(select min(price) from flights 
where from_='Bengaluru' and to_='Frankfurt');

#from all aircraft with cruisingrange over 1000kms, find the name of the aircraft and the averahe salary of all pilots
#certified for this aircraft
select a.aid,a.aname,avg(e.salary)
from aircraft a,certified c,employee e
where a.aid=c.aid and c.eid=e.eid and a.cruisingrange>1000
group by a.aid,a.aname;

#find the names of pilots certified for some boeing aircraft
select distinct e.ename 
from employee e,certified c,aircraft a
where e.eid=c.eid and a.aid=c.aid and a.aname='boeing';

-- drop database airline188;
