--Using Employee schema write simple queries to test following functions:

--ADD_DAYS(date,n)
select sysdate+7 "Next Week" from dual;
--select ADD_DAYS ('30-DEC-1990', 6) from dual;

--ADD_MONTHS(date,n)
select add_months(sysdate,1) "Next Month" from dual;

--ADD_YEARS(date,n)
select add_months(sysdate,12) "Next Year" from dual;

--GREATEST(date1,date2[,date3]…)
select greatest(12,5,32,9) "GREATEST" from dual;

--LEAST(date1,date2[,date3]…)
select least(12,5,32,9) "LEAST" from dual;

--DAYS_BETWEEN(date1,date2)
select trunc(sysdate) - to_date('20100101', 'yyyy-mm-dd') "DAYS_BETWEEN" from dual;
--select DAYS_BETWEEN('27-JUN-1995', '03-JUL-1995') "DAYS_BETWEEN" from dual;

--MONTHS_BETWEEN(date1,date2)
select months_between(trunc(sysdate), to_date('20100101', 'yyyy-mm-dd')) "MONTHS_BETWEEN" from dual;

--TRUNC(date)
select trunc(sysdate) CURRENT_DATE from dual;
select trunc(3.1415926, 4) PI from dual;
