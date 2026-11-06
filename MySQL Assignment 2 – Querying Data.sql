-- DDL COMMANDS--
-- (1) CREATE--
-- Create the database employee --
create database if not exists employee;
use employee;
show databases;

create table if not exists departments
(
department_id int primary key,
department_name varchar(100)
);

create table if not exists Location
(
    location_id int primary key,
    location_name varchar(30)
);

-- Delete old tables first
drop table if exists departments;
drop table if exists location;

-- Creating the table Departments--

CREATE TABLE IF NOT EXISTS Departments
(
Department_id int primary key,
Department_name varchar(100)
);

SELECT *FROM Departments;

-- Create Location table--

CREATE TABLE IF NOT EXISTS Location
(
Location_id int primary key,
Location_name varchar(30)
);

SELECT *FROM Location;

-- Create Employees table--

CREATE TABLE IF NOT EXISTS Employees
(
Employee_ID INT PRIMARY KEY,
Employee_name VARCHAR(50) NOT NULL,
Age INT,
Gender ENUM('M','F'),
Hire_date DATE,
Designation VARCHAR(100),
Department_ID INT,
Location_ID INT,
Salary DECIMAL(10,2)
);
SELECT *FROM Employees;

-- (2) Table Alteration (ALTER)--

-- Add a new column named "email" to the Employees table to store employee email addresses--

ALTER TABLE Employees
ADD email VARCHAR(30);

-- Modify the data type of the "designation" column in the Employees table to support a wider range of values--
ALTER TABLE Employees
MODIFY Designation VARCHAR(200);

-- Rename the “hire_date” column to “date_of_joining”--
ALTER TABLE Employees
RENAME COLUMN Hire_date TO Date_of_joining ;

-- Drop the “age” column from the Employees table--
ALTER TABLE Employees
DROP COLUMN Age;

-- (3) Table Renaming (RENAME)--
-- Rename the "Departments" table to "Departments_Info"--
RENAME TABLE Departments TO Department_Info;

-- Rename the "Location" table to "Locations"--
RENAME TABLE Location TO Locations;

-- (4) Table Truncation (TRUNCATE)--
TRUNCATE TABLE Employees;

-- (5) Database & Table Dropping (DROP)--
DROP TABLE Employees;
DROP DATABASE employee;

-- Constraints --
-- Database Recreation-- 
DROP DATABASE IF EXISTS employee;

CREATE DATABASE IF NOT EXISTS employee;

USE employee;

SHOW DATABASES;

-- Departments Table--
CREATE TABLE Departments 
(
    Department_id INT PRIMARY KEY,
    Department_name VARCHAR(100) NOT NULL UNIQUE
);

SELECT *FROM Departments;

INSERT INTO Departments VALUES
(20000,'HR'),(2001,'Finance'),(2002,'Sales & Marketing'),(2003,'IT Department'),(2004,'Operation Department');
DELETE FROM Departments;
SET SQL_SAFE_UPDATES = 0;

DELETE FROM Departments;

SET SQL_SAFE_UPDATES = 1;

-- Location Table--
CREATE TABLE Location
(
 Location_id INT AUTO_INCREMENT PRIMARY KEY,
 Location_name VARCHAR(30) NOT NULL UNIQUE
);

SELECT *FROM Location;
INSERT INTO Location VALUES
(101,'Kottayam'),(102,'Palakkad'),(202,'Malappuram'),(203,'Alappuzha'),(204,'Ernamkulam'),(103,'Trivandrum'),(205,'Kannur');
SET SQL_SAFE_UPDATES = 0;

DELETE FROM Location;

SET SQL_SAFE_UPDATES = 1;
DELETE FROM Location;
TRUNCATE Location;


-- Requirements: Unique employee ID, mandatory employee name, gender restricted to M or F, age at least 18, current date as the default hire date, and foreign keys for department and location--
CREATE TABLE Employees 
(
    employee_id INT PRIMARY KEY,   
    employee_name VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 18),
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    designation VARCHAR(100),
    hire_date DATE DEFAULT (CURRENT_DATE),
    department_id INT,
    location_id INT,

    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),

    FOREIGN KEY (location_id)
        REFERENCES Location(location_id)
);

ALTER TABLE Employees
ADD salary DECIMAL(10,2);

SELECT *FROM Employees;

-- ================================================================================================================================
-- ================================================================================================================================
-- MySQL Assignment 2 – Querying Data --

-- Use the provided DML insert codes to populate the tables from here: Employee Data--
USE employee;
SHOW TABLES;
INSERT INTO Departments (Department_id,Department_name) VALUES 
(1, 'Software Development'),
(2, 'Marketing'),
(3, 'Data Science'),
(4, 'Human Resources'),
(5, 'Product Management'),
(6, 'Content Creation'),
(7, 'Finance'),
(8, 'Design'),
(9, 'Research and Development'),
(10, 'Customer Support'),
(11, 'Business Development'),
(12, 'IT'),
(13, 'Operations');
SELECT * FROM Departments;

-- INSERT VALUES TO LOCATION TABLE --

INSERT INTO Location (Location_name) VALUES
('Chennai'),
('Bangalore'),
('Hyderabad'),
('Pune');
SELECT Location_name FROM Location;
 
-- INSERT EMPLOYEE DETAILS --

INSERT INTO Employees(employee_id, employee_name, gender, age, hire_date,designation, department_id, location_id, salary) VALUES
(5001, 'Vihaan Singh', 'M', 27, '2015-01-20', 'Data Analyst', 3, 229, 60000),
(5002, 'Reyansh Singh', 'M', 31, '2015-03-10', 'Network Engineer', 12, 226, 80000),
(5003, 'Aaradhya Iyer', 'F', 26, '2015-05-20', 'Customer Support Executive', 10, 227, 45000),
(5004, 'Kiara Malhotra', 'F', 29, '2015-07-05', NULL, 8, 228, 70000),
(5005, 'Anvi Chaudhary', 'F', 25, '2015-09-11', 'Business Development Executive', 11, 226, 55000),
(5006, 'Dhruv Shetty', 'M', 28, '2015-11-20', 'UI Developer', 8, 227, 65000),
(5007, 'Anushka Singh', 'F', 32, '2016-01-15', 'Marketing Manager', 2, 228, 90000),
(5008, 'Diya Jha', 'F', 27, '2016-03-05', 'Graphic Designer', 8, 229, 70000),
(5009, 'Kiaan Desai', 'M', 30, '2016-05-20', 'Sales Executive', 11, 228, 55000),
(5010, 'Atharv Yadav', 'M', 29, '2016-07-10', 'Systems Administrator', 12, 229, 80000),
(5011, 'Saanvi Patel', 'F', 28, '2016-09-20', 'Marketing Analyst', 2, 226, 60000),
(5012, 'Myra Verma', 'F', 26, '2016-11-05', 'Operations Manager', 13, 227, 95000),
(5013, 'Arnav Rao', 'M', 33, '2017-01-20', 'Customer Success Manager', 10, 228, 75000),
(5014, 'Vihaan Mohan', 'M', 30, '2017-03-10', 'Supply Chain Analyst', 10, 227, 60000),
(5015, 'Ishaan Kumar', 'M', 27, '2017-05-20', 'Financial Analyst', 7, 226, 85000),
(5016, 'Zoya Khan', 'F', 31, '2017-07-05', 'Legal Counsel', 4, 229, 100000),
(5017, 'Kabir Nair', 'M', 28, '2017-09-11', 'IT Support Specialist', 12, 227, 80000),
(5018, 'Ishan Mishra', 'M', 25, '2017-11-20', 'Research Scientist', 9, 228, 75000),
(5019, 'Ishika Patel', 'F', 29, '2018-01-15', 'Talent Acquisition Specialist', 4, 229, 55000),
(5020, 'Aarav Nair', 'M', 32, '2018-03-05', 'Software Engineer', 1, 226, 90000),
(5021, 'Advik Kapoor', 'M', 26, '2018-05-20', 'Finance Analyst', 7, 228, 85000),
(5022, 'Aadhya Iyengar', 'F', 28, '2018-07-10', 'HR Specialist', 4, 229, 60000),
(5023, 'Anika Paul', 'F', 30, '2018-09-20', 'Public Relations Specialist', 2, 227, 70000),
(5024, 'Aryan Shetty', 'M', 27, '2018-11-05', 'Product Manager', 5, 226, 95000),
(5025, 'Avni Iyengar', 'F', 31, '2019-01-20', 'Data Scientist', 3, 229, 100000),
(5026, 'Vivaan Singh', 'M', 29, '2019-03-10', 'Business Analyst', 3, 227, 75000),
(5027, 'Ananya Paul', 'F', 32, '2019-05-20', 'Content Writer', 6, 228, 60000),
(5028, 'Anaya Kapoor', 'F', 26, '2019-07-05', 'Event Coordinator', 6, 226, 60000),
(5029, 'Arjun Kumar', 'M', 33, '2019-09-11', 'Quality Assurance Analyst', 12, 227, 80000),
(5030, 'Sara Iyer', 'F', 28, '2019-11-20', 'Project Manager', 5, 226, 90000);

SELECT *FROM Employees;
-- ---------------------------------------------------------------------------------------------------------------------
-- (1) Distinct Values:
-- A query to retrieve distinct salaries from the Employees table.
SELECT DISTINCT salary FROM Employees;

-- ---------------------------------------------------------------------------------------------------------------------
-- (2) Alias (AS):
-- Provide aliases for the "age" and "salary" columns as "Employee_Age" and "Employee_Salary", respectively.
SELECT 	age AS Employee_Age,
		salary AS Employee_Salary 
FROM Employees;

-- ------------------------------------------------------------------------------------------------------------------
-- (3) Where Clause & Operators:
-- Retrieve employees with a salary greater than ₹50000 and hired before 2016-01-01.
SELECT *FROM Employees WHERE salary > 50000 AND hire_date < '2016-01-01';

-- Find the employee whose designation is missing and fill it with "Data Scientist".
UPDATE Employees SET designation='Data Scientist' WHERE designation IS NULL ;
SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;

-- -------------------------------------------------------------------------------------------------------------------
-- Sorting and Grouping Data:
-- (1) ORDER BY:
-- Find employees sorted by department ID in ascending order and salary in descending order.
SELECT *FROM Employees ORDER BY department_id ASC , salary DESC ;

-- -------------------------------------------------------------------------------------------------------------------
-- (2) LIMIT:
-- Display the first 5 employees hired in the year 2018.
SELECT *FROM Employees WHERE YEAR(hire_date) = 2018 
ORDER BY hire_date LIMIT 5 ; 

-- -------------------------------------------------------------------------------------------------------------------
-- (3) Aggregate Functions:
-- COUNT(), MAX() , MIN(), SUM(), AVG()
-- Calculate the sum of all salaries in the Finance department.
		-- (5015, 'Ishaan Kumar', 'M', 27, '2017-05-20', 'Financial Analyst', 7, 226, 85000),(5021, 'Advik Kapoor', 'M', 26, '2018-05-20', 'Finance Analyst', 7, 228, 85000),
		-- SAME DEPARTMENT ID, RESULT  WILL BE 85000+85000= 170,000
SELECT SUM(salary) AS Total_Salary 
FROM Employees 
WHERE department_id =7;

-- Find the minimum age among all employees.
SELECT MIN(age) AS Minimum_age FROM Employees;

-- -------------------------------------------------------------------------------------------------------------------
-- (4) GROUP BY:
-- List the maximum salary for each location.
		-- WANT TO CONNECT TWO TABLES 
SELECT Location_id, MAX(salary) AS Maximum_Salary FROM Employees GROUP BY Location_id ;

-- Calculate the average salary for each designation containing the word 'Analyst'.
SELECT designation, AVG(salary) AS AVG_Salary 
FROM Employees WHERE designation LIKE '%Analyst%' 
GROUP BY designation ;

-- -------------------------------------------------------------------------------------------------------------------
-- (5) HAVING:
-- Find departments with less than 3 employees.
-- // SELECT department_id, COUNT(*) AS Employee_Count FROM Employees GROUP BY department_id; // --
-- Want to find less than 3.Apply HAVING.alter
SELECT department_id, COUNT(*) AS Employee_Count
FROM Employees
GROUP BY department_id
HAVING COUNT(*) < 3;

-- Find locations with female employees whose average age is below 30.
SELECT location_id,AVG(age) AS Average_age 
FROM Employees
WHERE gender ='F' 
GROUP BY location_id
HAVING AVG(age) < 30; 

-- ------------------------------------------------------------------------------------------------------------------
-- Joins:
-- (1) Inner Join:
-- List employee names, their designations, and department names where employees are assigned to a department.
-- employee names,designation department name from table Employees and Department_name from Departments table.
-- We want to join two tables with a common column ie,department_id
              
SELECT Employees.employee_name,Employees.designation,Departments.Department_name 
FROM employees            
INNER JOIN Departments
ON Employees.department_id = Departments.department_id;

-- ------------------------------------------------------------------------------------------------------------------
-- (2) Left Join:
-- List all departments along with the total number of employees in each department, including departments with no employees.

-- Left side Employees table right side Departmrnts
-- Employees tables have many columns, Departments have only two columns.
-- In left join common column placed on the left side. ie, department_id 
-- Shows Department_name with  its corresponding total employees 

SELECT d.department_name,
    COUNT(e.employee_id) AS Total_Employees
FROM Departments AS d
LEFT JOIN Employees AS e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- ------------------------------------------------------------------------------------------------------------------
-- (3) Right Join:
-- Display all locations along with the names of employees assigned to each location. If no employees are assigned to a location, display NULL for employee name.

-- Join Location table with Employees
-- Shows Location and Names of the employee
-- Location_id is common for both tables
SELECT l.Location_name,e.employee_name 
FROM Employees AS e
RIGHT JOIN Location AS l
ON e.location_id = l.location_id;