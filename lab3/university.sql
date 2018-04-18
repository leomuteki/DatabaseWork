DROP TABLE professor CASCADE;
DROP TABLE dept CASCADE;
DROP TABLE project CASCADE;
DROP TABLE graduate CASCADE;
DROP TABLE work_proj CASCADE;
DROP TABLE work_dept CASCADE;

CREATE TABLE professor (
	ssn numeric(9,0) NOT NULL CONSTRAINT professor_key PRIMARY KEY,
	name text NOT NULL,
	age int NOT NULL,
	rank text NOT NULL,
	specialty text NOT NULL);

CREATE TABLE dept (
	dno int NOT NULL CONSTRAINT dept_key PRIMARY KEY,
	dname text NOT NULL,
	office text NOT NULL);

CREATE TABLE project (
	pno int NOT NULL CONSTRAINT project_key PRIMARY KEY,
	sponsor text NOT NULL,
	start_date text NOT NULL,
	end_date text NOT NULL,
	budget float NOT NULL);

CREATE TABLE graduate (
	ssn numeric(9,0) NOT NULL CONSTRAINT graduate_key PRIMARY KEY,
	name text NOT NULL,
	age int NOT NULL,
	deg_pg text NOT NULL);

CREATE TABLE work_dept (
	professor numeric(9,0) NOT NULL references professor(ssn) CONSTRAINT work_dept_key PRIMARY KEY,
	dept int NOT NULL references dept(dno),
	time_pc int NOT NULL);

CREATE TABLE 

CREATE TABLE work_proj (
	project int NOT NULL references project(pno) CONSTRAINT work_proj_key PRIMARY KEY,
	graduate numeric(9,0) NOT NULL references graduate(ssn),
	since text NOT NULL,
	supervise numeric(9,0) NOT NULL references professor(ssn));

