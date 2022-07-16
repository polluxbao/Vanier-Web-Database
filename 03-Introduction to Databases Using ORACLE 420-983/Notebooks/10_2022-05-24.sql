select interval '11 10:09:08.555' DAY TO SECOND(3) from DUAL;

select interval '11 10:09' DAY TO MINUTE from DUAL;
select interval '64' minute from dual;

select interval '250' hour(3) from dual;


select extract(DAY FROM interval '250' HOUR(3) ) from DUAL;

select interval '125-4' year(3) to month as my_interval from dual;
select interval '5' month from dual;
select interval '15' month from dual;
select interval '5' year from dual;

select interval '5' hour from dual;
select interval '15:30' minute to second from dual;

select extract(year from interval '23' month) from dual;
select extract(month from interval '15' month) from dual;


select current_date from dual
union
select current_timestamp from dual;

select dbtimezone, sessiontimezone from dual;
select date '1980-06-14' from dual;



SELECT TO_CHAR(TO_DATE('1/1/2023','DD/MM/YYYY'), ' DD MONTH YYYY "is a " DAY') 
from dual;

SELECT current_date from dual union select current_timestamp from dual;

SELECT DBTIMEZONE, SESSIONTIMEZONE FROM dual;



select current_date - to_date('1/1/2000','DD/MM/YYYY') as days 
from DUAL;
select floor(current_date - to_date('1/1/2000','DD/MM/YYYY')) as days 
from DUAL;
select floor((current_date - to_date('1/1/2000','DD/MM/YYYY'))*24) as hours 
from DUAL;

select floor((current_date - to_date('1/1/2000','DD/MM/YYYY'))*24*60) as minutes 
from DUAL;


select current_timestamp - to_date('1/1/2000','DD/MM/YYYY') from DUAL;
select extract(hour from (current_timestamp - to_date('1/1/2000','DD/MM/YYYY'))) 
from DUAL;


select current_date - to_date('1/1/2000', 'DD/MM/YYY' as days from dual;
select floor(current_date - to_date('1/1/2000', 'DD/MM/YYY')) as days from dual;
select floor((current_date - to_date('1/1/2000', 'DD/MM/YYY'))*24) as days from dual;
select floor((current_date - to_date('1/1/2000', 'DD/MM/YYY'))*24*60) as days from dual;

select current_timestamp - to_date('1/1/2000', 'DD/MM/YYY') from dual;
select extract(hour from (current_timestamp - to_date('1/1/2000', 'DD/MM/YYYY'))) from dual;

select add_days(current_timestamp, 5) from dual;

select add_months(current_timestamp, 5) from dual;

SELECT ADD_DAYS (TO_DATE ('2009-12-05', 'YYYY-MM-DD'), 30) "add days" FROM dual;
SELECT ADD_MONTHS (TO_DATE ('2009-12-05', 'YYYY-MM-DD'), 1) "add months" FROM dual;
SELECT ADD_SECONDS (TO_TIMESTAMP ('2012-01-01 23:30:45'), 60*30) "add seconds" FROM dual;
