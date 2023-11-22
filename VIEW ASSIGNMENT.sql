use hr2;
-- Q1. Create a view to fetch the employees data 
-- EmployeeId, employeesEmployeeName, EmployeeSalary, EmployeeManager, EmployeeDepartment
create view emp_details1 as
select e.employee_id ,concat(e.first_name,' ',e.last_name) Name, e.salary,e.manager_id, d.DEPARTMENT_NAME 
from employees e
left join departments d on e.department_id=d.DEPARTMENT_ID;
select * from emp_details1;

-- Q2. Create a view to fetch all the employees data working on jobs with 
-- minimum salary > 2000 and maximum salary < 5000;
create view emp_sal_with_2k_5k
as
select * from employees where salary between 2000 and 5000 ;
select * from emp_sal_with_2k_5k;

-- Q3. Create a view to fetch employee data 
-- locationsjob_historyEMPLOYEEID,EMPLOYEENAME,EMPLOYEEDEPARTMENT,EMPLOYEESALARY,EMPLOYEECOUNTRY,EMPLOYEELOCATION,
-- EMPLOYEEREGION.
CREATE VIEW emp_region AS
SELECT
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS Name,
    d.department_name,
    e.salary,
    c.country_name,
    l.location_id,
    r.region_id
FROM
    employees e
INNER JOIN
    departments d ON e.department_id = d.department_id
INNER JOIN
    locations l ON d.location_id = l.location_id
INNER JOIN
    countries c ON l.country_id = c.country_id
INNER JOIN REGIONS R ON C.REGION_ID=R.REGION_ID;
SELECT * FROM EMP_REGION;

-- Q3. CREATE A VIEW FOR Q3 AND DISPLAY ONLY THOSE EMPLOYEES WHOSE DEPARTMENTID = 30 AND SALARY < 5000;
CREATE VIEW emp_DATA AS
SELECT
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS Name,
    d.department_name,
    e.salary,
    c.country_name,
    l.location_id,
    r.region_id
FROM employees e
INNER JOIN
    departments d ON e.department_id = d.department_id
INNER JOIN
    locations l ON d.location_id = l.location_id
INNER JOIN
    countries c ON l.country_id = c.country_id
INNER JOIN REGIONS R ON C.REGION_ID=R.REGION_ID
WHERE E.DEPARTMENT_ID=30 AND E.SALARY< 5000;
SELECT * FROM EMP_DATA;
-- Q4. CREATE A VIEW TO FETCH ALL EMPLOYEES DATA WITH THERE APPRAISED SALARY FOR THE CURRENT YEAR.

-- EG : CURRENT SALARY = 3000
-- COMM : 300
-- APPRAISED SALARY RULE : 
-- 		PEOPLE GETTING SALARY 2000 - 10000 :: 10%
-- 		PEOPLE GETTING SALARY 10001 -15000 :: 8%
-- 		PEOPLE GETTING SALARY 15000 - 20000 :: 6%
-- 		PEOPLE GETTING SALARY > 20000 :: 5%
-- 		
CREATE VIEW EMP_APP 
AS 
SELECT EMPLOYEE_ID, CONCAT(FIRST_NAME,' ',LAST_NAME) NAME, SALARY AS CURRENT_SALARY,
SALARY * CASE
			WHEN SALARY BETWEEN 2000 AND 10000 THEN 0.10 
            WHEN SALARY BETWEEN 10001 AND 15000 THEN 0.08
            WHEN SALARY BETWEEN 15001 AND 20000 THEN 0.06
            WHEN SALARY >20000 THEN 0.05
            ELSE 0
		END AS APP_SALARY
FROM EMPLOYEES;
SELECT * FROM EMP_APP;

-- Q5. CREATE A VIEW ON THE EMPLOYEES TABLE WITH EMPNO , EMPNAME, EMPSALARY

-- 	1. UPDATE THE SALARY OF EMPLOYEE ID = 105;
-- 	2. DELETE THE ROW OF THE EMPLOYEE ID = 106;
-- 	3. UPDATE THE EMPLOYEE DEPARTMET ID OF THE EMPLOYEEID = 108
-- 	OBSERVE THE PARENT TABLE EMPLOYEES
-- 	
create VIEW EMP_DATA2
AS
SELECT EMPLOYEE_ID, CONCAT(FIRST_NAME,' ',LAST_NAME) NAME, SALARY FROM EMPLOYEES;
SELECT * FROM EMP_DATA2;
UPDATE EMPLOYEES SET SALARY=30000 WHERE employee_ID = 105;
SELECT * FROM EMP_DATA2;
DELETE FROM EMPLOYEES WHERE EMPLOYEE_ID=106;
SELECT * FROM EMP_DATA2;
update EMPLOYEES SET department_ID=10 WHERE EMPLOYEE_ID= 108;
SELECT * FROM EMP_DATA2;
SELECT * FROM EMPLOYEES;
-- Q6. CREATE A VIEW ON EMPLOYEES AND DEPARTMENT WITH DEPARTMENTID COMPARISON
-- 	1. TRY TO DO UPDATE 
-- 		
CREATE VIEW EMP_DEPT
AS 
SELECT E.EMPLOYEE_ID, CONCAT(E.FIRST_NAME,' ',E.LAST_NAME) NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E
LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID;
select * FROM EMP_DEPT;
update DEPARTMENTS SET DEPARTMENT_NAME='ANALYST' WHERE DEPARTMENT_ID=10;
SELECT * FROM EMP_DEPT;
