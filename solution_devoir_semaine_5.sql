-- Creation de la bd
drop database if exists library2;
create database if not exists library2;
use library2;

-- table Authors
create table Authors (
    au_id TINYINT auto_increment primary key,
    au_lname varchar(50),
    au_fname varchar(50),
    phone varchar(20) unique check (phone like '+%' and length(phone) between 10 and 15),
    address varchar(50),
    city varchar(50),
    state varchar(50),
    country varchar(50),
    zip varchar(6) check (zip regexp '^[A-Za-z][0-9][A-Za-z][0-9][A-Za-z][0-9]$'),
    contract text,
    email varchar(50) unique check (email like '%@%')
);