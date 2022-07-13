show databases;
create database airline188;
use airline188;
show tables;

create table flights(
    fno int primary key,
    from_ varchar(20),
    to_ varchar(20),
    distance int,
    departs timestamp,
    arrives timestamp,
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

insert into flights values(1,'a','b',10,2022-01-19 00:00:01,2022-01-19 00:01:01,100);
insert into flights values(2,'a','c',10,2022-01-19 00:00:02,2022-01-19 00:01:02,200);
insert into flights values(3,'a','d',10,2022-01-19 00:00:03,2022-01-19 00:01:03,300);
insert into flights values(4,'a','e',10,2022-01-19 00:00:04,2022-01-19 00:01:04,400);
insert into flights values(5,'a','f',10,2022-01-19 00:00:05,2022-01-19 00:01:05,500);
select * from flights;
