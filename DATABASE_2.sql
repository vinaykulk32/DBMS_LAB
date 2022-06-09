create database banking188;
show databases;
use banking188;
show tables;

create table branch
(
branch_name varchar(10) primary key,
branch_city varchar(10),
assets int(5)
);
show tables;
desc branch;

create table accounts
(
account_no int(5) primary key,
branch_name varchar(10),
balance int(5),
foreign key(branch_name) references branch(branch_name) on delete cascade,
);
show tables;
desc accounts;

create table depositor
(
cust_name varchar(5) primary key,
cust_street varchar(5),
cust_city varchar(5)
);
show tables;
desc depositor;

create table loan 
(
loan_no int(5),
branch_name varchar(10),
amount int(5),
foreign key(branch_name) references branch(branch_name) on delete cascade
);
show tables;
desc loan;
alter table loan add primary key(loan_no);

create table borrower
(
cust_name varchar(5),
loan_no int(5),
foreign key(cust_name) references depositor(cust_name) on delete cascade,
foreign key(loan_no) references loan(loan_no) on delete cascade,
primary key(cust_name,loan_no)
);
show tables;
desc borrower;

insert into branch values('a','ABC');
select * from branch;
