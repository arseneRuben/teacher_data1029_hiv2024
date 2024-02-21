-- Creation de la bd
drop database if exists library2;
create database if not exists library2;
use library2;

-- table Authors
drop table if exists Authors;
create table Authors (
    au_id TINYINT  primary key,
    au_lname varchar(50),
    au_fname varchar(50),
	phone varchar(20) unique check (phone like '+%' and length(phone) between 10 and 15),
	-- phone varchar(20) unique check (phone rlike '^+[0-9]{10,15}$'),
    address varchar(50),
    city varchar(50),
    state varchar(50),
    country varchar(50),
    zip varchar(6) check (zip regexp '^[A-Za-z][0-9][A-Za-z][0-9][A-Za-z][0-9]$'),
    contract text,
    email varchar(50) unique check (email like '%@%')
);

-- table Jobs
create table Jobs (
    job_id tinyint auto_increment primary key,
    job_desc varchar(50),
    min_lvl enum('Stagiaire', 'Junior', 'Intermediaire', 'Seinior'),
    max_lvl enum('Stagiaire', 'Junior', 'Intermediaire', 'Seinior')
);