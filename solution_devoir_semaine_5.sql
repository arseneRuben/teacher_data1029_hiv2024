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

-- table Publishers
create table Publishers (
    pub_id tinyint auto_increment primary key,
    pub_name varchar(50),
    city varchar(50),
    state varchar(50),
    country varchar(50),
    email varchar(50) unique check (email like '%@%')
);

-- table Employees
create table Employees (
    emp_id tinyint auto_increment primary key,
    emp_name varchar(50) NOT NULL,
    salary smallint,
    fname varchar(50),
    lname varchar(50),
    job_id smallint references Jobs(job_id),
    pub_id smallint NOT NULL references  Publishers(pub_id),
    pub_date date NOT NULL,
    email varchar(50) unique check (email like '%@%')
);

-- table Titles
create table Titles (
    title_id tinyint auto_increment primary key,
    title varchar(100),
    type enum('Roman', 'Politique', 'Science', 'Histoire'),
    pub_id smallint references Publishers(pub_id),
    price float,
    advance float,
    notes varchar(255),
    pub_date date
);

-- table Redactions
create table Redactions (
    au_id tinyint references Authors(au_id),
    title_id tinyint references Titles(title_id),
    au_ord tinyint,
    royalty float,
    constraint pk_redactions primary key (au_id, title_id)
);

-- table Stores
create table Stores (
    stor_id tinyint auto_increment primary key,
    stor_name varchar(50),
    stor_address varchar(50),
    city varchar(50),
    state varchar(50),
    country varchar(50)
);

-- table Sales
create table Sales (
    store_id tinyint references Stores(stor_id),
    ord_num tinyint,
    title_id smallint references Titles(title_id),
    ord_date datetime,
    qty int,
    primary key (store_id, ord_num, title_id)
);

-- Renommer la table redactions en writing

ALTER TABLE redactions RENAME TO writing;
RENAME TABLE writing TO writings;

-- Ajouter les colonnes ZIP et EMAIL a la table STORES
ALTER TABLE stores ADD (
	zip varchar(6) check (zip regexp '^[A-Za-z][0-9][A-Za-z][0-9][A-Za-z][0-9]$'),
    email varchar(50) unique check (email like '%@%')
);

-- Renommer la colonne zip en code zip dans la table stores
ALTER TABLE stores
CHANGE zip codezip varchar(6) check (codezip regexp '^[A-Za-z][0-9][A-Za-z][0-9][A-Za-z][0-9]$') 
AFTER stor_id;


insert into jobs(job_desc, min_lvl, max_lvl) values
( "Traducteur", "Stagiaire", "SEINIOR");

SELECT * FROM jobs;
INSERT INTO `employees` (`emp_id`, `fname`, `lname`, `job_id`, `email`, `salary`) VALUES
(1, 'Emmanuel', 'Bopda', 4, 'eman@gmail.com',   25),
(2, 'Stephane', 'Lapointe', 3, 'valeryccnb.ca',   35),
(3, 'Albert', 'Einstein', 4, 'steph@outlook.com', 25); 

SELECT * FROM employees;