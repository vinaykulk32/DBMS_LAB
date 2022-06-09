show databases;
create database vinayinsurance;
use vinayinsurance;
SHOW TABLES;  
CREATE TABLE PERSON
( Drivr_id varchar(2) primary key,
name1 varchar(20),
address varchar(20)
);
select * from PERSON;
create table CAR
(
regno char(5) primary key,
year1 year
);
select * from CAR;
create table ACCIDENT
(
reportno int(2) primary key,
date1 date,
location varchar(50)
);
select * from ACCIDENT;
create table OWNS
(
Drivr_id varchar(2) ,
regno char(5),
foreign key(Drivr_id) references PERSON(Drivr_id) on delete cascade,
foreign key(regno) references CAR(regno) on delete cascade
);
select * from OWNS;
create table PARTICIPATION
(
Drivr_id varchar(2) ,
regno char(5),
reportno int(2),
damage integer(5),
primary key(reportno,Drivr_id,regno),
foreign key(Drivr_id) references PERSON(Drivr_id) on delete cascade,
foreign key(regno) references CAR(regno) on delete cascade,
foreign key(reportno) references ACCIDENT(reportno) on delete cascade
);
select * from PARTICIPATION;
desc PARTICIPATION;

insert into person values('01','a','ABC');
insert into person values('02','b','ACD');
insert into person values('03','c','ADE');
insert into person values('04','d','AEF');
insert into person values('05','e','AFH');
select * from person;

insert into car values('001','2000');
insert into car values('002','2001');
insert into car values('003','2002');
insert into car values('004','2003');
insert into car values('005','2004');
select * from car;


insert into accident values('0001','2000-01-01','A');
insert into accident values('0002','2000-01-02','B');
insert into accident values('0003','2000-01-03','C');
insert into accident values('0004','2000-01-04','D');
insert into accident values('0005','2000-01-05','E');
insert into accident values('0006','2008-01-05','E');
insert into accident values('0007','2008','H');
select * from accident;

insert into owns values('01','001');
insert into owns values('02','002');
insert into owns values('03','003');
insert into owns values('04','004');
insert into owns values('05','005');
select * from owns;

insert into PARTICIPATION values('01','001','00001','1000');
insert into PARTICIPATION values('02','002','00002','2000');
insert into PARTICIPATION values('03','003','00003','3000');
insert into PARTICIPATION values('04','004','00004','4000');
insert into PARTICIPATION values('05','005','00005','5000');
select * from PARTICIPATION;

update PARTICIPATION set damage=12000 where reportno=1;
select * from PARTICIPATION;

select count(date1) from accident where date1='2008-01-05';
