show databases;
create database book188;
use book188;
show tables;

create table author(
authid int primary key,
authname varchar(20),
authcity varchar(20),
authcountry varchar(20)
);
desc author;

create table publisher(
pubid int primary key,
pubname varchar(20),
pubcity varchar(20),
pubcountry varchar(20)
);
desc publisher;
