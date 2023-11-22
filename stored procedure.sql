use hr2;
-- Write a stored procedure to retrieve all employees from the Employees table for a given department ID.
delimiter $$
create procedure emp_dept(in emp_id int)
begin
	select * from employees where employee_id=emp_id;
    end; $$
delimiter ;
call emp_dept(105);

-- Create a function that calculates the total salary expenditure for a given department ID.
DELIMITER $$
CREATE FUNCTION sal_expen(dept_id int)
RETURNS INTEGER
deterministic
BEGIN
declare total_exp integer;
select sum(salary) as total_exp into total_exp 
from employees 
where department_id=dept_id;
RETURN total_exp;
END$$

DELIMITER ;
select sal_expen(20);

-- Develop a stored procedure that accepts an employee ID as an input parameter and increases the salary of that employee by a specified percentage.
delimiter $$
create procedure emp_with_incre1(in emp_id int, incre decimal(5,2))
begin
select employee_id, salary, salary+salary*incre as incre_sal from employees where employee_id=emp_id;
end; $$
delimiter ;
call emp_with_incre1(101,0.5);
##
-- delimiter $$
-- create procedure sal_inc(emp_id int,perc decimal(10,2))
-- deterministic
-- begin
-- 	declare sal_inc decimal(10,2);
-- 	set sal_inc = (select  salary * (perc / 100) from employees where employee_id = emp_id);
--     update employees set salary = salary + sal_inc where employee_id = emp_id;
-- end $$
-- DELIMITER ;

-- select  salary  from employees where employee_id = 101;
-- call sal_inc(101,5);
-- select  salary  from employees where employee_id = 101;
####
-- Write a function to determine the average salary for employees in a specific job title category.
use hr2;
delimiter $$
create function avg_with_job_title(job_t varchar(50))
returns varchar (50)
deterministic
begin
	declare avg_sal varchar(50);
    select avg(e.salary) into avg_sal
    from employees e
   
    inner join jobs j on e.job_id=j.job_id
	where job_title=job_t;
    return avg_sal;
end; $$
delimiter ;
select avg_with_job_title('president') as avg_sal;

select * from jobs;
-- Create a stored procedure that takes an employees first name and last name as input parameters and returns the full name in uppercase letters.
delimiter $$
create procedure full_name(fname varchar(100),lname varchar(100))

begin
	select upper(concat(first_name," ",last_name)) as Full_Name 
    from employees 
    where first_name=fname and Last_name=lname;
    end$$
delimiter ;

select * from employees;
call full_name('Bruce','Ernst');
-- Write a stored procedure to insert a new employee into the Employees table with the provided first name, last name, and department ID.
delimiter $$
create procedure add_employee1(f_name varchar(20), l_name varchar(20), d_id int, e_mail varchar(20))
begin
	insert into employees(first_name,last_name,department_id, email ) values (f_name,l_name,d_id, e_mail);
    end;$$
delimiter ;
call  add_employee1('akash','dighe',004, 'akdighe121@gmail');
-- Create a function to calculate the total number of employees in a specific department.
delimiter $$
create function total_emp_in_dept( d_id int)
returns integer
deterministic
begin
	declare total_emp integer;
    select count(*)  into total_emp 
    from employees
    where department_id=d_id
    group by department_id;
    return total_emp;
end;$$
delimiter ;
select total_emp_in_dept(50)
    
    
    
-- Develop a stored procedure that accepts an employee ID as input and deletes that employees record from the Employees table.
delimiter $$
create procedure delete_emp(emp_id int)
begin
	delete from employees where employee_id=emp_id;
end; $$
delimiter ;
call delete_emp(004);
-- Write a function to determine the highest salary in the Employees table.
delimiter $$
create function max_sal()
returns integer
deterministic
begin
	declare max_salary integer;
    select max(salary) into max_salary from employees;
    return max_salary;
end; $$
delimiter ;
select max_sal();
-- Create a stored procedure that takes a department ID as an input parameter and returns the list of employees sorted by their salary in descending order within that department.
delimiter $$
create procedure emp_with_desc3(d_id int)
begin 
		select concat(e.first_name,' ',e.last_name) fullname,e.salary,d.department_name
        from employees e
        join departments d on e.department_id=d.department_id
        where e.department_id=d_id
        order by e.salary desc;
end;$$
delimiter ;
call emp_with_desc3(50);
        
        

-- Write a stored procedure to update the job title of an employee based on their employee ID.
delimiter $$
create procedure update_job_title(emp_id int,new_title varchar(20))
begin
	update employees e 
    join jobs j on e.job_id=j.job_id
    set j.job_title=new_title
    where e.employee_id=emp_id;
    end;$$
delimiter ;
select * from employees;
select * from jobs;
call update_job_title(100,'Presidents');
-- Create a function that returns the number of employees hired in a specific year.
delimiter $$
create function emp_with_hiredate( h_year int)
returns int
deterministic
begin
	declare hire_year int;
    select count(*) as emp_count into hire_year
    from employees
    where year(hire_date)=h_year;
    return hire_year;
    end;$$
delimiter ;
select emp_with_hiredate(1987);
-- Develop a stored procedure that accepts an employee ID as input and retrieves the employees details, including their name, department, and salary.
delimiter $$
create procedure  emp_details(emp_id int)
begin
	select concat(e.first_name,' ',e.last_name) Fullname,e.salary,d.department_name
    from employees e
    join departments d on e.department_id=d.department_id
    where employee_id=emp_id;
    end;$$
delimiter ;
call emp_details(100);
-- Write a function to calculate the average tenure (in years) of employees in the company.

-- Create a stored procedure that takes a department ID as an input parameter and returns the department name along with the count of employees in that department.
delimiter $$
create procedure dept_count3(in d_id int)
begin
	select d.department_name, count(*) as emp_count
    from employees e
    join departments d on e.department_id=d.department_id
    where e.department_id=d_id
    group by department_name;
    end;$$
delimiter ;
call dept_count3(50);
-- Write a stored procedure to retrieve the top N highest-paid employees in the company, where N is an input parameter.
delimiter $$
create procedure nth_sal(in n int)
begin
	select employee_id,concat(first_name,' ',last_name) Fullname, salary
    from employees 
    WHERE salary = (
        SELECT salary
        FROM employees
        ORDER BY salary DESC
        LIMIT 1 OFFSET n );
end;  $$
delimiter ;
call nth_sal(1);
-- Create a function that calculates the total bonus amount for all employees based on their performance ratings.
DELIMITER $$

CREATE FUNCTION CalculateTotalBonusForRating(IN rating DECIMAL(3, 2)) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE totalBonus DECIMAL(10, 2) DEFAULT 0;

    -- Calculate and add bonus for employees with the specified rating
    SELECT SUM(
        CASE
            WHEN performance_rating = rating THEN salary * bonus_percentage
            ELSE 0
        END
    ) INTO totalBonus
    FROM employees;

    RETURN totalBonus;
END$$
DELIMITER ;


-- Develop a stored procedure that accepts a salary threshold as an input parameter and retrieves all employees with salaries above that threshold.

-- Write a function to determine the average age of employees in the company based on their birthdates.

-- Create a stored procedure that takes an employees last name as an input parameter and returns all employees with a similar last name.

-- Write a stored procedure to update the email address of an employee based on their employee ID.

-- Create a function that calculates the total experience (in years) of all employees combined in the company.

-- Develop a stored procedure that accepts a department ID as input and returns the department name along with the average salary of employees in that department.

-- Write a function to determine the number of employees who have been with the company for more than a specified number of years.

-- Create a stored procedure that takes a job title as an input parameter and returns the count of employees holding that job title.

-- Write a stored procedure to retrieve the details of employees who have a salary within a specified range.

-- Create a function that calculates the total number of working hours for an employee in a given month.

-- Develop a stored procedure that accepts an employee ID as input and retrieves the employees department name and managers name.

-- Write a function to determine the total number of employees hired in each year, grouped by the year of hire.

-- Create a stored procedure that takes a city name as an input parameter and returns the list of employees residing in that city.

-- Write a stored procedure that calculates the average salary increase percentage for employees who have been with the company for more than five years.

-- Create a function that calculates the total sales revenue generated by each employee in the Sales department, considering both individual and team contributions.

-- Develop a stored procedure that accepts a date range as input and retrieves all employee attendance records within that period, including late arrivals and early departures.

-- Write a function that determines the average number of projects handled by employees in each department and identifies departments with exceptionally high or low project volumes.

-- Create a stored procedure that takes a job title as an input parameter and returns the list of employees holding that job title, along with the total compensation considering bonuses and allowances.

-- Write a stored procedure that calculates the performance rating for each employee based on various criteria, such as project completion, client feedback, and adherence to deadlines.

-- Create a function that determines the average time taken to resolve customer issues for each support agent, considering different issue categories and urgency levels.

-- Develop a stored procedure that accepts a date range and a specific project ID as input and retrieves all employee work hours dedicated to that project within the given period.

-- Write a function that calculates the employee turnover rate for each department, considering the number of new hires and the number of departures over a specified time frame.

-- Create a stored procedure that takes a location as an input parameter and returns the list of employees who have been involved in projects related to that location, along with their project contributions and performance ratings.

