--File Name:    Assignment_1.sql
--Auther:       Qingjun Bao
--Version:      1.0.0
--Date:         2022 May 15
--Description:  Assignment_1
--              Employees schema DQL practice
--              Web and Database Vanier College

--1. Return the name (last name +' '+first_name) for all Female employees.
select last_name || ' ' || first_name from employees
where gender='F';

--2. Return the total number of Male employees.
select count(1) from employees
where gender='M';

--3. Return the top 3 highest salaries (only salary values not the employee name).
select * from (select salary from salaries order by salary asc)
where rownum<=3;

--4. For each department return the department_name and total number of current 
--employees in that department. Note that not all the employees from dept_employee
--table are current employees
select d.dept_name, count(*) as employees
from dept_emp e, departments d
where e.dept_no = d.dept_no
group by d.dept_no, d.dept_name;

--5. For each department return the department_name and the current manager name.
select d.dept_name as department_name, e.first_name || ' ' || e.last_name as manager
from dept_manager m, employees e, departments d
where d.dept_no = m.dept_no and m.emp_no = e.emp_no and m.to_date > sysdate;

 