--File Name:    Project_1.sql
--Auther:       Qingjun Bao
--Version:      1.1.0
--Date:         2022 May 17
--Description:  Employee Project
--              Using Employee schema to practise DQL
--              Web and Database Vanier College

--1. Get all employee names that were born in September between 1950 and 1965.
select first_name || ' ' || last_name name, to_number(to_char(birth_date, 'yyyy')) year
from employees
where to_char(birth_date, 'MON') = 'SEP' 
and to_number(to_char(birth_date, 'yyyy'))<=1965
and to_number(to_char(birth_date, 'yyyy'))>=1950;


--2. Get all employee names and hire_date that were born in the same month when 
--they were hired. The result should be ordered descending on their hire date.
select first_name || ' ' || last_name name, hire_date
from employees
where to_char(birth_date, 'mm') = to_char(hire_date, 'mm')
order by hire_date desc;


--3. Get all employee names and salary for all employees that had salary greater
--than 50000.
select e.first_name || ' ' || e.last_name name, s.salary
from employees e, salaries s
where s.salary > 50000 and e.emp_no = s.emp_no;

--Employees' name grouped and show their top salary
select em_sa.name, max(em_sa.salary) topsalary
from (select e.first_name || ' ' || e.last_name name, s.salary salary
from employees e, salaries s
where s.salary > 50000 and e.emp_no = s.emp_no) em_sa
group by em_sa.name;

--Employees' name grouped and show their minimum salary
select em_sa.name, min(em_sa.salary) minsalary
from (select e.first_name || ' ' || e.last_name name, s.salary salary
from employees e, salaries s
where s.salary > 50000 and e.emp_no = s.emp_no) em_sa
group by em_sa.name;

--4. Return all department names together with the number of employees that were
--part of the department on 1 Jan 1992.
select d.dept_name, count(*) as employees
from employees e, departments d, dept_emp de
where to_char(e.hire_date, 'yyyymmdd') <= '19920101'
and e.emp_no = de.emp_no 
and d.dept_no = de.dept_no
group by d.dept_no, d.dept_name;


--5. Return the name of all employees that had at one point the lowest company 
--salary.

drop table low_salaries;
create table low_salaries(emp_no, low_salary, point_date)
    as select emp_no, salary, from_date
    from salaries;
truncate table low_salaries;

drop table temp_lowsalary;
create table temp_lowsalary(emp_no, low_salary, point_date)
    as select emp_no, salary, from_date
    from salaries;
truncate table temp_lowsalary;
select * from temp_lowsalary;

DECLARE
    period_start date;
    period_end date;
    v_sql varchar(1000);
begin
    select min(from_date) into period_start from salaries;
    select max(from_date) into period_end from salaries;
    while period_start < period_end loop
        update temp_lowsalary
        set (emp_no, low_salary, point_date)=
            (select emp_no, min(salary), from_date
                from salaries
                where period_start between from_date and to_date
                group by emp_no,from_date);

--        insert into low_salaries(emp_no, low_salary, point_date)
--        select emp_no, min(salary), period_start
--            from salaries
--            where period_start between from_date and to_date
--            group by emp_no, period_start;
        
--        select emp_no, salary, period_start
--        from salaries
--        where salary = 
--            (select min(salary) as low_salary 
--            from salaries
--            where period_start between from_date and to_date);
        
        period_start := period_start + 1;
    end loop;
end;

-- Not finish...


--6. Return the name of employees together with their latest salary.
select 
    (select first_name || ' ' || last_name name 
        from employees 
        where emp_no=s.emp_no),
    (select salary 
        from salaries 
        where emp_no=s.emp_no and to_date=s.to_date) salary
from 
    (select emp_no, max(to_date) to_date 
        from salaries 
        group by emp_no) s;



--7. Return department_name, department manager name and count of the employees 
--under that department on 1 Jan 1992. Note that the manager needs to be active 
--on 1 Jan 1992.
select A.department_name, A.manager_name, B.employees_number
from
    (select 
        dept.dept_name department_name, 
        emp.first_name || ' ' || emp.last_name manager_name
    from 
        departments dept,
        employees emp,
        dept_manager mgr
    where
        dept.dept_no = mgr.dept_no
        and emp.emp_no = mgr.emp_no
        and to_char(mgr.to_date, 'yyyy')>=1992
        and to_char(mgr.from_date, 'yyyy')<1992
    ) A
    ,(select 
        de_em.dept_name department_name,
        count(*) employees_number
    from
        (select de.emp_no, dept.dept_name, de.from_date, de.to_date
        from departments dept, dept_emp de
        where dept.dept_no=de.dept_no
        ) de_em,
        employees emp
    where
        emp.emp_no=de_em.emp_no
        and to_char(emp.hire_date,'yyyy')<1992
    group by
        de_em.dept_name
    )B
where A.department_name = B.department_name;


--8. Return department name, department namanger, employee name with the highest 
--salary in that department on 1 Jan 1992.
select dpt.dept_name, d_mgr.mgr_name, emp.emp_name, max(sal.max_salary)
from
(select emp_no, max(salary) max_salary
    from salaries
    where to_date('19920101','yyyymmdd') between from_date and to_date
    group by emp_no) sal,
(select emp_no, dept_no
    from dept_emp) d_emp,
(select emp_no, first_name||' '||last_name emp_name
    from employees) emp,
(select dept_no, dept_name
    from departments) dpt,
(select ds.dept_no dept_no, emp.first_name || ' ' || emp.last_name mgr_name
    from departments ds
    inner join dept_manager dm 
    on ds.dept_no = dm.dept_no
    inner join employees emp
    on emp.emp_no = dm.emp_no
    where to_date('19920101','yyyymmdd') between dm.from_date and dm.to_date) d_mgr
where sal.emp_no = d_emp.emp_no
    and sal.emp_no = emp.emp_no
    and d_emp.dept_no = dpt.dept_no
    and d_mgr.dept_no = d_emp.dept_no
group by dpt.dept_name, d_mgr.mgr_name,emp.emp_name;

--9. Find employee names that had both "Staff" and "Senior Staff" titles.
select e.emp_no, e.first_name||' '||e.last_name employee_name
from
    (select st.emp_no from
        (select emp_no, title from titles
        where title='Staff') st
    intersect 
    select srst.emp_no from
        (select emp_no, title from titles
        where title='Senior Staff') srst) e_no,
    employees e
where e_no.emp_no = e.emp_no;


--10. Find employee names that had both "Staff" and "Senior Staff" titles but 
--these titles were in different departments.
select r.emp_no, e.first_name || ' ' || e.last_name name, 
        r.from_dept,r.from_title,
        r.to_dept, r.to_title
from
(select Ft.emp_no emp_no, Ft.from_dept from_dept, Ft.from_title from_title, 
        Tt.to_dept to_dept, Tt.to_title to_title
from
(select d.emp_no emp_no, d.dept_no from_dept, t.title from_title
from titles t, dept_emp d
where t.emp_no = d.emp_no
    and t.from_date between d.from_date and d.to_date
    and (t.title='Staff' or t.title='Senior Staff')) Ft ,

(select d.emp_no emp_no, d.dept_no to_dept, t.title to_title
from titles t, dept_emp d
where t.emp_no = d.emp_no
    and t.to_date between d.from_date and d.to_date
    and (t.title='Staff' or t.title='Senior Staff')) Tt
    
where Ft.emp_no = Tt.emp_no
    and Ft.from_title != Tt.to_title
    and Ft.from_dept != Tt.to_dept) r,
employees e
where r.emp_no = e.emp_no;

select * from titles
where emp_no=10209;
select * from dept_emp
where emp_no=10209;

with staff_titles as (
        select emp_no, dept_no, title
        from titles T
            inner join dept_emp DE using(emp_no)
        where
            title = 'Staff' and
            T.from_date between DE.from_date and DE.to_date
    ),
    senior_staff_titles as(
        select emp_no, dept_no, title
        from titles T
            inner join dept_emp DE using(emp_no)
        where
            title = 'Senior Staff' and
            T.from_date between DE.from_date and DE.to_date
    ),
    has_both_from_Seperate_depts as(
        select *
        from staff_titles
            inner join senior_staff_titles using(emp_no)
        minus
        select *
        from staff_titles S
            inner join senior_staff_titles SS using(emp_no)
        where ss.dept_no = s.dept_no
    )
select first_name || ' ' || last_name as emp_name
from employees
inner join has_both_from_seperate_depts using(emp_no);
