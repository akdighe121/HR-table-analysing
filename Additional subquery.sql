# Subquery Assignment

use hr;

##################################################################################################

#1 Write a query to find the name (first_name, last_name) and the salary of the employees who have a higher salary than the employee whose last_name='Bull'. 
select concat(first_name,' ',last_name) as name,salary from employees where salary > (select salary from employees where last_name='Bull');

##################################################################################################

#2 Write a query to find the name (first_name, last_name) of all employees who works in the IT department.
select concat(first_name,' ',last_name) as name from employees where department_id in (select department_id from departments where department_name='IT');

##################################################################################################

#3 Write a query to find the name (first_name, last_name) of the employees who have a manager and worked in a USA based department. 
select * from country_new;
select concat(first_name,' ',last_name) as name from employees where manager_id<>0 and manager_id in (select city from locations where city="USA");
select concat(e.first_name,' ',e.last_name) as name from employees e inner join departments d on e.department_id=d.department_id where e.manager_id<>0 and e.manager_id in (select l.city from locations l inner join departments dd on l.location_id=dd.location_id where l.city="USA");

select concat(e.first_name,' ',e.last_name) as name from employees e inner join departments d on e.department_id=d.department_id inner join locations l on d.location_id=l.location_id inner join country_new c on l.country_id=c.country_id where e.manager_id = (select e.manager_id from country_new c inner join locations l on l.country_id=c.country_id inner join departments d on d.location_id=l.location_id inner join employees on e.department_id=d.department_id where c.country_id='US');

select concat(e.first_name,' ',e.last_name) as name from employees e where e.manager_id is not null and e.department_id in (select department_id from departments d inner join locations n on d.location_id=n.location_id where n.state="Texas");

##################################################################################################

#4 Write a query to find the name (first_name, last_name) of the employees who are managers. 
select concat(first_name,' ',last_name) as name,manager_id from employees group by manager_id,name;
select concat(first_name,' ',last_name) as name from employees where manager_id in (select manager_id from employees);
##################################################################################################

#5 Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary. 
select concat(first_name,' ',last_name) as name,salary from employees where salary > (select avg(salary) from employees);

##################################################################################################

#6 Write a query to find the name (first_name, last_name), and salary of the employees whose salary is equal to the minimum salary for their job grade. 
select * from jobs;
select concat(e.first_name,' ',e.last_name) as name,e.salary from employees e inner join jobs j on j.job_id=e.job_id where e.salary = (select min_salary	);
select concat(first_name,' ',last_name) as name,salary from employees where salary = (select min_salary from jobs);

##################################################################################################

#7 Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the average salary and works in any of the IT departments. 
select concat(e.first_name,' ',e.last_name) as name,e.salary from employees e where e.salary > (select avg(e.salary) from employees e inner join departments d on e.department_id=d.department_id where d.department_name="IT" group by d.department_id);

##################################################################################################

#8 Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the earning of Mr. Bell.
select * from employees;
select concat(first_name,' ',last_name) as name,salary from employees where salary > (select salary from employees where first_name="Lisa");

##################################################################################################

#9  Write a query to find the name (first_name, last_name), and salary of the employees who earn the same salary as the minimum salary for all departments. 
select concat(first_name,' ',last_name) as name,salary from employees where salary=(select min(salary) from employees group by department_id order by department_id desc limit 1);

##################################################################################################

#10 