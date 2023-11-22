use hr2;
create database Wildcard;
use wildcard;
-- ---------------------------------------------------------------------------------------------------------------------
 -- Sales person table
CREATE TABLE salespeople (
    salesman_id INT,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(10, 2)
);
drop table salespeople;
INSERT INTO salespeople (salesman_id, name, city, commission) VALUES
(1, 'John Doe', 'Paris', 0.50),
(2, 'Jane Smith', 'Mumbai', 0.06),
(3, 'Alice Johnson', 'Rome', 0.55),
(4, 'Bob Patel', 'Delhi', 0.02),
(5, 'Rahul Verma', 'Bengaluru', 0.18),
(6, 'Priya Singh', 'Mumbai', 0.12),
(7, 'Amit Shah', 'Delhi', 0.53),
(8, 'Anjali Patel', 'Ahmedabad', 0.11),
(9, 'Sneha Rao', 'Chennai', 0.19),
(10, 'Karan Gupta', 'Mumbai', 0.14),
(11, 'Shreya Singh', 'Delhi', 0.17),
(12, 'Rajesh Iyer', 'Bengaluru', 0.16),
(13, 'Neha Sharma', 'Hyderabad', 0.16),
(14, 'Sanjay Verma', 'Pune', 0.11),
(15, 'Meera Kapoor', 'Kolkata', 0.13);

-- ---------------------------------------------------------------------------------------------------------------------
-- Customer table
CREATE TABLE customers (
    customer_id INT,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade VARCHAR(10),
    salesman_id INT
);

INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES
(3000, 'Aarav Gupta', 'Bengaluru', 'B', 9),
(3001, 'Anaya Patel', 'Mumbai', 'C', 10),
(3002, 'Ishaan Kumar', 'Chennai', 'A', 11),
(3003, 'Aaradhya Reddy', 'Delhi', 'B', 12),
(3004, 'Vihaan Sharma', 'Hyderabad', 'C', 13),
(3005, 'Siya Singh', 'Pune', 'A', 14),
(3006, 'Reyansh Malhotra', 'Kolkata', 'B', 15),
(3007, 'Arya Verma', 'Mumbai', 'A', 1),
(3008, 'Ved Bhat', 'Delhi', 'B', 2),
(3009, 'Advait Khanna', 'Kolkata', 'C', 3),
(3010, 'Ishita Gupta', 'Chennai', 'A', 4),
(3011, 'Neha Rao', 'Bengaluru', 'A', 5),
(3012, 'Karan Gupta', 'Mumbai', 'B', 6),
(3013, 'Shreya Singh', 'Delhi', 'C', 7),
(3014, 'Rajesh Iyer', 'Bengaluru', 'A', 8),
(3015, 'Anika Reddy', 'Hyderabad', 'B', 9),
(3016, 'Samaira Malhotra', 'Chennai', 'C', 10),
(3017, 'Yuvan Sharma', 'Mumbai', 'A', 11),
(3018, 'Dhruv Khanna', 'Delhi', 'B', 12),
(3019, 'Amaira Patel', 'Hyderabad', 'C', 13),
(3020, 'Aanya Gupta', 'Pune', 'A', 14),
(3021, 'Aadhira Singh', 'Kolkata', 'B', 15);

-- ---------------------------------------------------------------------------------------------------------------------
--  orders table
CREATE TABLE orders (
    ord_no INT,
    purch_amt DECIMAL(8,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(1001, 2500.00, '2023-05-10', 3001, 1),
(1002, 1500.00, '2023-06-22', 3002, 2),
(1003, 3000.00, '2023-07-15', 3003, 3),
(1004, 2000.00, '2023-08-05', 3004, 4),
(1005, 1000.00, '2023-09-18', 3005, 5),
(1006, 500.00, '2023-10-29', 3006, 6),
(1007, 3500.00, '2023-11-14', 3007, 7),
(1008, 2200.00, '2023-12-09', 3008, 8),
(1009, 4000.00, '2024-01-04', 3009, 9),
(1010, 1200.00, '2024-02-17', 3010, 10),
(1011, 600.00, '2024-03-28', 3011, 11),
(1012, 2700.00, '2024-04-19', 3012, 12),
(1013, 800.00, '2024-05-25', 3013, 13),
(1014, 3800.00, '2024-06-30', 3014, 14),
(1015, 2100.00, '2024-07-14', 3015, 15);
show tables;
-- 1. write a SQL query to find the details of those salespeople who come from the 'Paris' City or 'Rome' City. Return salesman_id, name, city, commission.
select salesman_id,name ,city,commission from salespeople where city like '%paris%' or city like '%Rome%'; 

-- 2.write a SQL query to find the details of the salespeople who come from either 'Paris' or 'Rome'. Return salesman_id, name, city, commission.
select salesman_id,name ,city,commission from salespeople where city like '%paris%' or city like '%Rome%'; 

-- 3. write a SQL query to find the details of those salespeople who live in cities other than Paris and Rome. Return salesman_id, name, city, commission.  
select salesman_id,name,city,commission from salespeople where city not like '%paris%' and city not like '%rome%';

-- 4. write a SQL query to retrieve the details of all customers whose ID belongs to any of the values 3007, 3008 or 3009. Return customer_id, cust_name, city, grade, and salesman_id.  
select customer_id,cust_name,city,grade,salesman_id from customers where customer_id like 3007 or customer_id like 3008 or   customer_id like 3009;
-- 5. write a SQL query to find salespeople who receive commissions between 0.12 and 0.14 (begin and end values are included). Return salesman_id, name, city, and commission.  
select salesman_id, name, city,commission from salespeople where commission between 0.12 and 0.14;

-- 6. write a SQL query to select orders between 500 and 4000 (begin and end values are included). Exclude orders amount 948.50 and 1983.43. Return ord_no, purch_amt, ord_date, customer_id, and salesman_id. 
select ord_no, purch_amt,ord_date,customer_id, salesman_id from orders where purch_amt between 500 and 4000 and purch_amt!=948.50 and purch_amt !=1983.43;
-- 7. write a SQL query to retrieve the details of the salespeople whose names begin with any letter between 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission. 

select salesman_id, salesman_id, name , city,commission from salespeople where name between 'A' and 'L';

-- 8.write a SQL query to find the details of all salespeople except those whose names begin with any letter between 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission.  
select salesman_id, salesman_id, name , city,commission from salespeople where name not like  '[A-L]%';
-- 9.write a SQL query to retrieve the details of the customers whose names begins with the letter 'B'. Return customer_id, cust_name, city, grade, salesman_id.. 
select salesman_id, salesman_id, name , city,commission from salespeople where name like  'b%';
-- 10. write a SQL query to find the details of the customers whose names end with the letter 'n'. Return customer_id, cust_name, city, grade, salesman_id.
select salesman_id, salesman_id, name , city,commission from salespeople where name like  '%n';
-- 11. write a SQL query to find the details of those salespeople whose names begin with ‘N’ and the fourth character is 'l'. Rests may be any character. Return salesman_id, name, city, commission. 
select salesman_id, salesman_id, name , city,commission from salespeople where name like  'n__l';
-- 12.write a SQL query to find those rows where col1 contains the escape character underscore ( _ ). Return col1.
SELECT name
FROM salespeople
WHERE name LIKE '%\\_%' ESCAPE '\\';


-- 13. write a SQL query to identify those rows where col1 does not contain the escape character underscore ( _ ). Return col1.
SELECT name
FROM salespeople
WHERE name not LIKE '%\\_%' ESCAPE '\\';

-- 14.write a SQL query to find rows in which col1 contains the forward slash character ( / ). Return col1.
SELECT name
FROM salespeople
WHERE name LIKE '%/%';

-- 15. write a SQL query to identify those rows where col1 does not contain the forward slash character ( / ). Return col1.
SELECT name
FROM salespeople
WHERE name not LIKE '%/%';
-- 16. write a SQL query to find those rows where col1 contains the string ( _/ ). Return col1.
SELECT name
FROM salespeople
WHERE name LIKE '%_/%';
-- 17. write a SQL query to find those rows where col1 does not contain the string ( _/ ). Return col1.
select * from customers WHERE col1 not like '%\_/%' escape '\\' ;

-- 18. write a SQL query to find those rows where col1 contains the character percent ( % ). Return col1.
select * from customers WHERE col1 like '%\%%' escape '\\' ;

-- 19. write a SQL query to find those rows where col1 does not contain the character percent ( % ). Return col1.
select * from customers WHERE col1 not like '%\%%' escape '\\' ;

-- 20. write a SQL query to find all those customers who does not have any grade. Return customer_id, cust_name, city, grade, salesman_id.
select  customer_id, cust_name, city, grade, salesman_id from customers where grade='null';

-- 21. write a SQL query to locate all customers with a grade value. Return customer_id, cust_name,city, grade, salesman_id.
select  customer_id, cust_name, city, grade, salesman_id from customers where grade != 'null';

-- 22. write a SQL query to locate the employees whose last name begins with the letter 'D'. Return emp_idno, emp_fname, emp_lname and emp_dept. 
use hr;
select employee_id, FIRST_NAME, last_name ,department_id from employees where last_name like 'D%'