DROP TABLE professor;
DROP TABLE dept;
DROP TABLE project;
DROP TABLE graduate;
DROP TABLE work_proj;
DROP TABLE work_dept;

CREATE TABLE professor (
	ssn numeric(9,0) NOT NULL CONSTRAINT constraint_name PRIMARY KEY,
	name text NOT NULL,
	age int NOT NULL,
	rank text NOT NULL,
	specialty text NOT NULL);

CREATE TABLE dept (
	dno int NOT NULL CONSTRAINT constraint_name PRIMARY KEY,
	dname text NOT NULL,
	office text NOT NULL));

CREATE TABLE project (
	pno int NOT NULL CONSTRAINT constraint_name PRIMARY KEY,
	sponsor text NOT NULL,
	start_date text NOT NULL,
	end_date text NOT NULL,
	budget float NOT NULL);

CREATE TABLE graduate (
	ssn numeric(9,0) NOT NULL CONSTRAINT constraint_name PRIMARY KEY,
	name text NOT NULL,
	age int NOT NULL,
	deg_pg text NOT NULL);

CREATE TABLE work_proj (
	project int NOT NULL references project(pno) CONSTRAINT constraint_name PRIMARY KEY,
	graduate numeric(9,0) NOT NULL references graduate(ssn),
	since text NOT NULL),
	supervise numeric(9,0) NOT NULL references professor(ssn));

CREATE TABLE work_dept (
	professor numeric(9,0) NOT NULL references professor(ssn),
	dept int NOT NULL references dept(dno),
	time_pc int NOT NULL);
