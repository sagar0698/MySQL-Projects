/*creating the database*/
CREATE DATABASE COMPANY;          

/*creating tables for the company database*/

CREATE TABLE EMPLOYEE
(
Fname VARCHAR(15) NOT NULL,
Minit CHAR,
Lname VARCHAR(15) NOT NULL,
Ssn CHAR(9) PRIMARY KEY NOT NULL,
Bdate DATE,
Address VARCHAR(30),
Sex CHAR,
Salary DECIMAL(10,2),
Super_ssn CHAR(9),
Dno INT NOT NULL,
primary key (Ssn)
);

CREATE TABLE DEPARTMENT
(
Dname VARCHAR(15) UNIQUE NOT NULL,
Dnumber INT PRIMARY KEY NOT NULL,
Mgr_ssn CHAR(9) NOT NULL,
Mgr_start_date DATE,
primary key (Dnumber),
unique (Dname),
foreign key (Mgr_ssn) references EMPLOYEE (Ssn)
);

CREATE TABLE DEPT_LOCATIONS
(
Dnumber INT NOT NULL,
Dlocation VARCHAR(15) PRIMARY KEY NOT NULL,
primary key (Dnumber, Dlocation),
foreign key (Dnumber) references DEPARTMENT (Dnumber)
);

CREATE TABLE PROJECT
(
Pname VARCHAR(15) UNIQUE NOT NULL,
Pnumber INT PRIMARY KEY NOT NULL,
Plocation VARCHAR(15),
Dnum INT NOT NULL,
primary key (Pnumber),
unique (Pname),
foreign key (Dnum) references DEPARTMENT (Dnumber)
);

CREATE TABLE WORKS_ON
(
Essn CHAR(9) PRIMARY KEY NOT NULL,
Pno INT NOT NULL,
Hours DECIMAL(3,1) NOT NULL,
primary key (Essn, Pno),
foreign key (Essn) references EMPLOYEE (Ssn),
foreign key (Dnum) references DEPARTMENT (Dnumber)
);

CREATE TABLE DEPENDENT
(
Essn CHAR(9) NOT NULL,
Dependent_name VARCHAR(15) PRIMARY KEY NOT NULL,
Sex CHAR,
Bdate DATE,
Relationship VARCHAR(8),
primary key (Essn, Dependent_name),
foreign key (Ess) references EMPLOYEE (Ssn)
);

/*providing data for each table*/
INSERT INTO department VALUES ('Headquarters', '1', '888665555', '1981-06-19'), ('Administration', '4', '987654321', '1995-01-01'), ('Research', '5', '333445555', '1988-05-22')







