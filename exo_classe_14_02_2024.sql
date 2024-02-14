Create database library2;

DROP DATABASE IF EXISTS library;
USE library2;
DROP TABLE IF EXISTS jobs ;

CREATE TABLE jobs (
job_id tinyint NOT NULL AUTO_INCREMENT /* PRIMARY KEY */,
job_desc VARCHAR(100) UNIQUE NOT NULL,
min_lvl VARCHAR(50) NULL,
max_lvl VARCHAR(50) NULL,
CONSTRAINT pk_jobs PRIMARY KEY(job_id)
/* CONSTRAINT uniq_job_desc UNIQUE(job_desc) */

);