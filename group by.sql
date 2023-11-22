use hr2;
-- Write a SQL query to find the number of employees hired in each year.
select year(HIRE_DATE) hire_year,count(*) employee 
from employees 
group by year(HIRE_DATE)
order by HIRE_year;
-- Write a SQL query to find the number of employees in each department
select DEPARTMENT_ID, count(*) no_of_employee 
from employees
group by department_id;

-- Write a SQL query to find the department with the highest total salary.
select department_id, sum(salary) total_sal 
from employees 
group by department_id
order by total_sal;

--  Write a query to list the number of jobs available in the employees table.


-- Write a query to get the total salaries payable to employees.
-- Write a query to get the minimum salary from the employees table.
-- Write a query to get the maximum salary of an employee working as a Programmer. 
-- Write a query to get the average salary and number of employees working the department 90. 
-- Write a query to get the highest, lowest, sum, and average salary of all employees. 
-- Write a query to get the number of employees with the same job
-- Write a query to get the difference between the highest and lowest salaries. 
-- Write a query to find the manager ID and the salary of the lowest-paid employee for that manager. 
-- Write a query to get the department ID and the total salary payable in each department.
-- Write a query to get the average salary for each job ID excluding programmer. 
-- Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only. 
-- Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.
-- Write a query to get the average salary for all departments employing more than 10 employees
