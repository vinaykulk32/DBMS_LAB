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

create table order(
    orderid int primary key,
    orderdate time,
    cust int,
    orderamt int,
    foreign key(cust) references customer(cust) on delete cascade
);
desc order;

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
    foreign key(orderid) references order(orderid) on delete cascade,
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
    foreign key(orderid) references order(orderid) on delete cascade,
    foreign key(warehouseid) references warehouse(warehouseid) on delete cascade
);
desc shipment;

insert into customer values(1,'a','A');
insert into customer values(2,'b','B');
insert into customer values(3,'c','C');
insert into customer values(4,'d','D');
insert into customer values(5,'e','E');
select * from customer;

insert into order values(11,2008-11-11,1,100);
insert into order values(21,2008-11-12,2,200);
insert into order values(31,2008-11-13,3,300);
insert into order values(41,2008-11-14,4,400);
insert into order values(51,2008-11-15,5,500);
select * from order;

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

insert into shipment values(11,1111,2018-10-01);
insert into shipment values(21,1112,2018-10-02);
insert into shipment values(31,1113,2018-10-03);
insert into shipment values(41,1114,2018-10-04);
insert into shipment values(51,1115,2018-10-05);
select * from shipment;

-- drop database order188;
