DROP TABLE professor CASCADE;
DROP TABLE dept CASCADE;
DROP TABLE project CASCADE;
DROP TABLE graduate CASCADE;
DROP TABLE work_proj CASCADE;
DROP TABLE work_dept CASCADE;

CREATE TABLE professor (
	ssn numeric(9,0) NOT NULL,
	name text NOT NULL,
	age int NOT NULL,
	rank text NOT NULL,
	specialty text NOT NULL,
	PRIMARY KEY(ssn));

CREATE TABLE dept (
	dno int NOT NULL,
	dname text NOT NULL,
	office text NOT NULL,
	runs numeric(9,0) NOT NULL,
	PRIMARY KEY(dno),
	FOREIGN KEY(runs) REFERENCES professor(ssn),
	ON DELETE NO ACTION);

CREATE TABLE project (
	pno int NOT NULL,
	sponsor text NOT NULL,
	start_date text NOT NULL,
	end_date text NOT NULL,
	budget float NOT NULL),
	work_in numeric(9,0) NOT NULL,
	manage numeric(9,0) NOT NULL,
	PRIMARY KEY(pno),
	FOREIGN KEY(work_in) REFERENCES work_in(professor),
	FOREIGN KEY(manage) REFERENCES professor(ssn));

CREATE TABLE graduate (
	ssn numeric(9,0) NOT NULL CONSTRAINT graduate_key PRIMARY KEY,
	name text NOT NULL,
	age int NOT NULL,
	deg_pg text NOT NULL,
	major int NOT NULL,
	advise numeric(9,0) NOT NULL,
	FOREIGN KEY(major) REFERENCES dept(dno),
	FOREIGN KEY(advise) REFERNCES graduate(ssn));

CREATE TABLE work_dept (
	professor numeric(9,0) NOT NULL,
	dept int NOT NULL,
	time_pc int NOT NULL,
	PRIMARY KEY(professor, dept),
	FOREIGN KEY(professor) REFERENCES professor(ssn)),
	FOREIGN KEY(dept) REFERENCES dept(dno));

CREATE TABLE work_in (
	professor numeric(9,0) NOT NULL,
	project int NOT NULL,
	PRIMARY KEY(professor, project),
	FOREIGN KEY(profesor) REFERENCES professor(ssn),
	FOREIGN KEY(project) REFERENCES professor(ssn));

CREATE TABLE work_proj (
	project int NOT NULL,
	graduate numeric(9,0) NOT NULL,
	since text NOT NULL,
	professor numeric(9,0) NOT NULL,
	PRIMARY KEY(project, graduate),
	FOREIGN KEY(project) REFERENCES project(pno),
	FOREIGN KEY(graduate) REFERENCES graduate(ssn),
	FOREIGN KEY(professor) REFERENCES professor(ssn));

