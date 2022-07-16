with min_salaries(start_date, min_salary) as (
    select from_date, min(salary) from salaries group by from_date
)
select distinct first_name || ' ' || last_name as name
from employees inner join salaries using (emp_no),
    min_salaries
where start_date = from_date and salary = min_salary;

