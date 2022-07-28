show databases;
create database book188;
use book188;
show tables;

#AUTHOR(author-id: int, name: String, city: String, country: String)
create table author(
authid int primary key,
authname varchar(20),
authcity varchar(20),
authcountry varchar(20)
);
desc author;

#PUBLISHER(publisher-id: int, name: String, city: String, country: String)
create table publisher(
pubid int primary key,
pubname varchar(20),
pubcity varchar(20),
pubcountry varchar(20)
);
desc publisher;

#CATEGORY(category-id: int, description: String)
create table CATEGORY(
catid int primary key,
description varchar(20)
);
desc CATEGORY;

#CATALOG (book-id: int, title: String, author-id: int, publisher-id: int, category-id: int, year: int, price: int)
create table catalog(
bookid int primary key,
title varchar(20),
authid int,
pubid int,
catid int,
year_ int,
price int,
foreign key (authid) references author(authid) on delete cascade,
foreign key (pubid) references publisher(pubid) on delete cascade,
foreign key (catid) references CATEGORY(catid) on delete cascade
);
desc catalog;

#ORDER-DETAILS(order-no: int, book-id: int, quantity: int)
create table ORDERDETAILS(
orderno int primary key,
bookid int,
quantity int,
foreign key (bookid) references catalog(bookid) on delete cascade
);
desc ORDERDETAILS;



#Enter at least five tuples for each relation
insert into author values(1,'a','AA','M');
insert into author values(2,'b','BB','N');
insert into author values(3,'c','CC','O');
insert into author values(4,'d','DD','P');
insert into author values(5,'e','EE','Q');
select * from author;


insert into publisher values(11,'aa','AAA','AAAA');
insert into publisher values(12,'bb','BBB','BBBB');
insert into publisher values(13,'cc','CCC','CCCC');
insert into publisher values(14,'dd','DDD','DDDD');
insert into publisher values(15,'ee','EEE','EEEE');
select * from publisher;


insert into CATEGORY values(50,'abcdef');
insert into CATEGORY values(51,'abcdef');
insert into CATEGORY values(52,'abcdef');
insert into CATEGORY values(53,'abcdef');
insert into CATEGORY values(54,'abcdef');
select * from CATEGORY;

#CATALOG (book-id: int, title: String, author-id: int, publisher-id: int, category-id: int, year: int, price: int)
insert into catalog values(770,'ga',1,11,50,2000,500);
insert into catalog values(771,'gb',2,12,51,2001,5500);
insert into catalog values(772,'gc',3,13,52,2002,600);
insert into catalog values(773,'gd',4,14,53,2003,6500);
insert into catalog values(774,'ge',5,15,54,2004,5600);
insert into catalog values(775,'gf',1,12,52,2004,5600);
insert into catalog values(776,'gg',1,15,50,2006,600);
insert into catalog values(777,'gh',1,14,54,1995,525);
insert into catalog values(778,'gi',2,11,51,2014,5520);
insert into catalog values(779,'gj',2,13,51,2014,5520);
insert into catalog values(780,'gk',2,11,51,2014,5520);
insert into catalog values(781,'gl',3,13,52,2002,600);
insert into catalog values(782,'gm',3,13,54,2016,900);
insert into catalog values(783,'gn',3,11,52,2002,6000);
select * from catalog;


#ORDER-DETAILS(order-no: int, book-id: int, quantity: int)
insert into ORDERDETAILS values(100,770,20);
insert into ORDERDETAILS values(101,771,21);
insert into ORDERDETAILS values(102,772,22);
insert into ORDERDETAILS values(103,773,23);
insert into ORDERDETAILS values(104,774,24);

-- insert into ORDERDETAILS values(105,772,22);
-- insert into ORDERDETAILS values(106,773,23);
-- insert into ORDERDETAILS values(107,774,24);
select * from ORDERDETAILS;



#Give the details of the authors who have 2 or more books in the catalog and the price of the books in the
#catalog and the year of publication is after 2000.
select a.authid,a.authname,a.authcity
from author a,catalog c
where c.year_>2000 and c.authid=a.authid
group by a.authid,a.authname,a.authcity
having count(c.authid) >=2;


#Find the author of the book which has maximum sales.
select a.authname 
from catalog c,orderdetails o,author a
where c.bookid=o.bookid and c.authid=a.authid 
having max(o.quantity);
    
    
#Demonstrate how you increase the price of books published by a specific publisher by 10%.


-- drop database book188;
