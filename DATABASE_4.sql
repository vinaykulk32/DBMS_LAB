show databases;
create database stud_fac188;
use stud_fac188;
show tables;

create table student
(
snum int primary key,
sname varchar(20),
major varchar(20),
level_ char(2),
age int
);
desc student;

create table facculty
(
fid int primary key,
fname varchar(20),
deptid int
);
desc facculty;

create table class
(
cname varchar(20) primary key,
meets_at date,
room varchar(20),
fid int,
foreign key(fid) references facculty(fid) on delete cascade
);
desc class;

create table enrolled
(
snum int,
cname varchar(20),
primary key(snum,cname),
foreign key(snum) references student(snum) on delete cascade,
foreign key(cname) references class(cname) on delete cascade
);
desc enrolled;

insert into student values(1,'a','cse','sn',22);
insert into student values(2,'b','ise','jn',19);
insert into student values(3,'c','ec','cm',20);
insert into student values(4,'d','eee','so',21);
insert into student values(5,'e','cse','sn',22);
insert into student values(6,'f','cse','jn',19);
insert into student values(7,'g','cse','jn',19);
insert into student values(8,'h','cse','sn',19);
insert into student values(9,'i','cse','jn',19);
insert into student values(10,'j','cse','cm',22);
insert into student values(11,'k','cse','sn',26);
insert into student values(12,'l','cse','jn',19);
select * from student; 

insert into facculty values(01,'AB',011);
insert into facculty values(02,'AC',012);
insert into facculty values(03,'AD',013);
insert into facculty values(04,'AE',14);
insert into facculty values(05,'AF',15);
insert into facculty values(06,'AG',16);
insert into facculty values(07,'AH',17);
select * from facculty; 

insert into class values('ADA','2000-01-13','A01',01);
insert into class values('DBMS','2000-01-14','A01',02);
insert into class values('TFCS','2000-01-13','R128',03);
insert into class values('CNS','2000-01-13','C01',04);
insert into class values('LD','2000-01-15','A51',05);
insert into class values('FC','2000-01-23','R128',06);
insert into class values('TFS','2000-01-03','R128',07);
select * from class;

insert into  enrolled values(1,'ADA');
insert into  enrolled values(2,'DBMS');
insert into  enrolled values(3,'TFCS');
insert into  enrolled values(7,'TFCS');
insert into  enrolled values(8,'TFCS');
insert into  enrolled values(9,'TFCS');
insert into  enrolled values(10,'TFCS');
insert into  enrolled values(11,'TFCS');
insert into  enrolled values(4,'CNS');
insert into  enrolled values(5,'LD');
insert into  enrolled values(6,'LD');
select * from enrolled;

#Find the names of all Juniors (level = JR) who are enrolled in a class taught by 
select s.sname
from student s,enrolled e
where s.snum=e.snum and s.level_='jn';

#Find the names of all classes that either meet in room R128 or have five or more Students enrolled
select distinct e.cname
from student s,enrolled e,class c
where c.room='R128' and e.snum=s.snum and c.cname=e.cname
group by e.cname
having count(*)>=5;

#Find the names of all students who are enrolled in two classes that meet at the same time.
select s.sname
from student s,enrolled e,class c
where s.snum=e.snum
group by s.sname
having count(*)>2;
