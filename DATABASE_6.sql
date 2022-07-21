show databases;
create database order188;
use order188;
show tables;

create table customer(
    cust int primary key,
    cname varchar(20),
    city varchar(20)
);
desc customer;

create table orderr(
    orderid int primary key,
    orderdate date,
    cust int,
    orderamt int,
    foreign key(cust) references customer(cust) on delete cascade
);
desc orderr;

create table item(
    itemid int primary key,
    price int
);
desc item;

create table orderitem(
    orderid int,
    itemid int,
    qty int,
    primary key(itemid,orderid),
    foreign key(orderid) references orderr(orderid) on delete cascade,
    foreign key(itemid) references item(itemid) on delete cascade
);
desc orderitem;

create table warehouse(
    warehouseid int primary key,
    warehousecity varchar(20)
);
desc warehouse;

create table shipment(
    orderid int,
    warehouseid int,
    shipdate date,
    primary key(orderid,warehouseid),
    foreign key(orderid) references orderr(orderid) on delete cascade,
    foreign key(warehouseid) references warehouse(warehouseid) on delete cascade
);
desc shipment;

insert into customer values(1,'a','A');
insert into customer values(2,'b','B');
insert into customer values(3,'c','C');
insert into customer values(4,'d','D');
insert into customer values(5,'e','E');
select * from customer;

insert into orderr values(11,'2008-11-11',1,100);
insert into orderr values(21,'2008-11-12',2,200);
insert into orderr values(31,'2008-11-13',3,300);
insert into orderr values(41,'2008-11-14',4,400);
insert into orderr values(51,'2008-11-15',5,500);
select * from orderr;

insert into item values(111,1000);
insert into item values(112,2000);
insert into item values(113,3000);
insert into item values(114,4000);
insert into item values(115,5000);
select * from item;

insert into orderitem values(11,111,1);
insert into orderitem values(21,112,2);
insert into orderitem values(31,113,3);
insert into orderitem values(41,114,4);
insert into orderitem values(51,115,5);
select * from orderitem;

insert into warehouse values(1111,'AA');
insert into warehouse values(1112,'BB');
insert into warehouse values(1113,'CC');
insert into warehouse values(1114,'DD');
insert into warehouse values(1115,'EE');
select * from warehouse;

insert into shipment values(11,1111,'2018-10-01');
insert into shipment values(21,1112,'2018-10-02');
insert into shipment values(31,1113,'2018-10-03');
insert into shipment values(41,1114,'2018-10-04');
insert into shipment values(51,1115,'2018-10-05');
select * from shipment;

#produce a listing CUSTNAME, #oforders, AVG_ORDER_AMT,where the middle coloumn is the total numbers of orders by 
#customers and last column is average order amount of the customer
CREATE VIEW custname AS
SELECT c.cname,count(o.orderid) as oforder,avg(i.price) as AVG_ORDER_AMT
FROM customer c,orderr o, item i,orderitem ot
WHERE c.cust=o.cust and o.orderid=ot.orderid and ot.itemid=i.itemid;
select * from custname;

#list the #order for orders that were shipped from all warehouses that the company has in a specific city
select o.orderid 
from orderr o,warehouse w,shipment s
where w.warehouseid=s.warehouseid and s.orderid=o.orderid and warehousecity='EE';

#demonstrate how you delete item# 10 from the ITEM table and make the field null in the order_item table 
select * from item; 
delete from item WHERE itemid=111;
select * from orderitem;

-- drop database order188;
