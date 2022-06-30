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
foreign key(branch_name) references branch(branch_name) on delete cascade
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

insert into branch values('a','A',100);
insert into branch values('b','B',101);
insert into branch values('c','C',102);
insert into branch values('d','D',103);
insert into branch values('e','E',104);
select * from branch ;

insert into accounts values('001','a',100);
insert into accounts values('002','b',101);
insert into accounts values('003','c',102);
insert into accounts values('004','d',103);
insert into accounts values('005','e',104);
insert into accounts values('006','a',100);
insert into accounts values('007','a',100);
insert into accounts values('008','a',100);
insert into accounts values('009','a',100);
select * from accounts;

insert into depositor values('l','ab','AB');
insert into depositor values('m','cd','CD');
insert into depositor values('n','ef','EF');
insert into depositor values('o','gh','GH');
insert into depositor values('p','ij','IJ');
select * from depositor;

insert into loan values(00001,'a',1000);
insert into loan values(00002,'b',1001);
insert into loan values(00003,'c',1002);
insert into loan values(00004,'d',1003);
insert into loan values(00005,'e',1004);
select * from loan;

insert into borrower values('l',00001);
insert into borrower values('m',00002);
insert into borrower values('n',00003);
insert into borrower values('o',00004);
insert into borrower values('p',00005);
select * from borrower;

#Find all the customers who have at least two accounts at the Main branch
select cust_name 
from depositor d,accounts a 
where a.account_no=d.accno AND a.branch_name='Main_branch' 
group by d.customer_name 
having count(*) >=2;

#Find all the customers who have an account at all the branches located in a specific city.
select * from depositor d,accounts a,branch b 
where b.branch_city='Bangalore' 
group by d.customer_name 
having count(distinct b.branch_name)=(
select count(branch_name) from branch 
where branch_city='Bangalore');

#Demonstrate how you delete all account tuples at every branch located in a specific city.
delete from accounts 
where branch_name IN(
select branch_name from branch 
where branch_city='Delhi');
