create database alt;
#que1
create table costmers(
c_id int(2),
c_name varchar(10));
alter table costmers add column phone_number varchar(20);
desc costmers;

#que2
create table employes1(
e_id int(2),
e_name varchar(10),
age varchar(10));
alter table employes1 modify column age int;
desc employes1;

#que3
create table contacts(
fname varchar(10),
sno int(10),
address varchar(50));
alter table contacts change column address home_address varchar(40);
desc contacts;

#que4
create table employee(
e_id int primary key,
ename varchar(10),
d_id int);
create table department1(
d_id int primary key,
d_name varchar(10),e_id int);
alter table employee add constraint fk_department foreign key(d_id) references department1(d_id);


create table emp( eid int primary key,name varchar (20),did int );
create table dept (did int primary key,dname varchar(20) );
alter table emp add constraint fk_dept foreign key (did) references dept (did);

create table student(sid int primary key , sname varchar(20));
alter table student drop primary key;

create table users(uid int, uname varchar(10), email varchar(20));
alter table users add constraint uc_email unique(email);

create table inventory(qty int, name varchar(13));
alter table inventory alter column qty set default '0';

create table costmers1(first_name varchar(10), last_name varchar(10));
alter table costmers1 modify first_name varchar(10) after last_name;
desc costmers1;

create table products(pid int ,pname varchar(10));
alter table products auto_increment=1001;
desc products;

use hr;
alter table employees add constraint chk_salary check(salary>2000);
select * from employees;

