SET serveroutput ON SIZE 4000

--1. PL/SQL Procedure
--a) Definition of Procedure without Parameters (Header and Body).

CREATE OR REPLACE PROCEDURE Display_Message
IS
    today_date      DATE;                               -- Date Data type
    w_hello         VARCHAR2(30) := 'Hello World!';     -- Character Data type
BEGIN
    today_date := SYSDATE;
    dbms_output.put_line('My first message with PL/SQL Procedure: ' || w_hello);
    dbms_output.put_line('Today''s date is ' || today_date);
END;

--Call of Procedure without Parameters.
DECLARE
    w_message VARCHAR2(30) := 'Call procedure';
BEGIN
    Display_Message;
END;

EXECUTE Display_Message;

--b) Definition of Procedure with Parameters (Header and Body)
--Definition of Procedure with Parameters
CREATE OR REPLACE PROCEDURE Issue_Billing    --Body of procedure Issue_Billing
    (Prd_Price IN number, Prd_Qty IN number)
IS
    total_price     number(7,2);    --Number Data type
    Fed_Tax         number(5,3) := 0.075;
    Prv_Tax         number(5,3) := 0.060;
BEGIN
    total_price := (Prd_Price * Prd_Qty)
                + (Prd_Price * Prd_Qty) * Fed_Tax
                + (Prd_Price * Prd_Qty) * Prv_Tax;
    dbms_output.put_line('The Entered Product Price is: ' || Prd_Price);
    dbms_output.put_line('The Entered Product Quantity is: ' || Prd_Qty);
    dbms_output.put_line('TheTotal of Billing is: ' || total_price || ' $');
END;

--Using substitution variable for Billing system
DECLARE
    Product_Price   number(7,2);        --Number Data type
    Product_Qty     number(7);          --Number Data type
    total_price     number(7,2);        --Number Data type
BEGIN
    Product_Price := &Prod_Price;
    Product_Qty := &Prod_Qty;
    Issue_Billing(Product_Price, Product_Qty);  --Call
END;



--2. PL/SQL Package
--a) The general syntax
--Package specification
CREATE OR REPLACE PACKAGE BillingPackage
AS
    PROCEDURE Display_Message;
    PROCEDURE Issue_Billing
        (Prd_Price IN number, Prd_Qty IN number);
END BillingPackage;

--Package Body
CREATE OR REPLACE PACKAGE BODY BillingPackage
AS
    PROCEDURE Display_Message       --Body of procedure Display_Message
    IS
        today_date      DATE;
        w_hello         VARCHAR2(30) := 'Hello World!';
    BEGIN
        today_date := SYSDATE;
        dbms_output.put_line('My first message with PL/SQL Procedure: ' || w_hello);
        dbms_output.put_line('Today''s date is ' || today_date);
    END Display_Message;

    PROCEDURE Issue_Billing         --Body of procedure Issue_Billing
        (Prd_Price IN number, Prd_Qty IN number)
    IS
        total_price     number(7,2);
        Fed_Tax         number(5,3) := 0.075;
        Prv_Tax         number(5,3) := 0.060;
    BEGIN
        total_price := (Prd_Price * Prd_Qty)
                    + (Prd_Price * Prd_Qty) * Fed_Tax
                    + (Prd_Price * Prd_Qty) * Prv_Tax;
        dbms_output.put_line('The Entered Product Price is: ' || Prd_Price);
        dbms_output.put_line('The Entered Product Quantity is: ' || Prd_Qty);
        dbms_output.put_line('TheTotal of Billing is: ' || total_price || ' $');
    END Issue_Billing;
END BillingPackage;

--b) Calling procedure and function from package
BEGIN
    BillingPackage.Display_Message;
END;

BEGIN
    BillingPackage.Issue_Billing(&price, &qty);
END;

--3. Execute the script file Registration.sql (Lab 2) for creating tables 
--of Registration System.
--a) Create a Procedure to be named Display_CategoryStudent
CREATE OR REPLACE PROCEDURE Display_CategoryStudent
    (stud_id in categorystudent.cat_stud_id%TYPE)
AS
    s_start_date categorystudent.cat_start_date%TYPE;
    s_end_date categorystudent.cat_end_date%TYPE;
    s_desc categorystudent.cat_stud_desc%TYPE;
BEGIN
    SELECT cat_start_date, cat_end_date, cat_stud_desc
    INTO s_start_date, s_end_date, s_desc
    from categorystudent
    where cat_stud_id=stud_id;
    dbms_output.put_line('The Category Student description found is : ' || s_desc);
    dbms_output.put_line('Category Student Date : ' || s_start_date);
    dbms_output.put_line('Category Student End Date : ' || s_end_date);
END Display_CategoryStudent;

DECLARE
    category_stud_id number;
BEGIN
    dbms_output.put_line('Enter value for category_stud_id: ');
    category_stud_id := &category_stud_id;
    Display_CategoryStudent(category_stud_id);
END;

--b) Create a Procedure to be named doCalc_Cost_Tuition
--Declare procedures
CREATE OR REPLACE PROCEDURE doCalc_Cost_Tuition
    (course_price IN number, num_course IN number, 
     cost_manual IN number,
     cost_tuition OUT number)
AS
BEGIN
    cost_tuition := (course_price * num_course) + cost_manual;
END doCalc_Cost_Tuition;


DECLARE
    course_price    number;
    num_course      number;
    cost_manual     number;
    cost_tuition    number;
BEGIN
    course_price := &course_price;
    num_course := &num_course;
    cost_manual := &cost_manual;
    
    doCalc_Cost_Tuition(course_price, num_course, cost_manual, cost_tuition);
    dbms_output.put_line('The Total Cost of Tuition Corresponding to');
    dbms_output.put_line('Course Price: ' || course_price || '$');
    dbms_output.put_line('Number of Courses: ' || num_course);
    dbms_output.put_line('Cost Manual: ' || cost_manual);
    dbms_output.put_line('is: ' || cost_tuition || '$');
END;

--c) Create a package to be named RegistrationPackage that contains 
--all previous procedures (Display_CategoryStudent, doCalc_Cost_Tuition)
--Package specification
CREATE OR REPLACE PACKAGE RegistrationPackage
AS
    PROCEDURE Display_CategoryStudent
        (category_stu_id IN number);
    PROCEDURE doCalc_Cost_Tuition
        (course_price IN number, num_course IN number, cost_manual IN number);
END RegistrationPackage;

--Package Body
CREATE OR REPLACE PACKAGE BODY RegistrationPackage
AS
    PROCEDURE Display_CategoryStudent  --Body of procedure Display_CategoryStudent
        (category_stu_id IN number)
    IS
        s_start_date categorystudent.cat_start_date%TYPE;
        s_end_date categorystudent.cat_end_date%TYPE;
        s_desc categorystudent.cat_stud_desc%TYPE;
    BEGIN
        SELECT cat_start_date, cat_end_date, cat_stud_desc
        INTO s_start_date, s_end_date, s_desc
        from categorystudent
        where cat_stud_id=category_stu_id;
        dbms_output.put_line('The Category Student description found is : ' || s_desc);
        dbms_output.put_line('Category Student Date : ' || s_start_date);
        dbms_output.put_line('Category Student End Date : ' || s_end_date);
    END Display_CategoryStudent;
    
    PROCEDURE doCalc_Cost_Tuition      --Body of procedure doCalc_Cost_Tuition
        (course_price IN number, num_course IN number, cost_manual IN number)
    IS
        cost_tuition number;
    BEGIN
        cost_tuition := (course_price * num_course) + cost_manual;
        dbms_output.put_line('The Total Cost of Tuition Corresponding to');
        dbms_output.put_line('Course Price: ' || course_price || '$');
        dbms_output.put_line('Number of Courses: ' || num_course);
        dbms_output.put_line('Cost Manual: ' || cost_manual);
        dbms_output.put_line('is: ' || cost_tuition || '$');
    END doCalc_Cost_Tuition;
END RegistrationPackage;

--d) Calling Procedure
DECLARE
    category_stu_id number := &category_stu_id;
    course_price number := &course_price;
    num_course number := &num_course;
    cost_manual number := &cost_manual;
BEGIN
    RegistrationPackage.Display_CategoryStudent(category_stu_id);
    RegistrationPackage.doCalc_Cost_Tuition(course_price, num_course, cost_manual);
END;

--4. Review Questions
--A. Write necessary PL/SQL statements to create the following components:
--1) Calculate_ProjectContribution
CREATE OR REPLACE PROCEDURE Calculate_ProjectContribution
    (Project_Name IN VARCHAR2, Project_SDate IN DATE)
IS
BEGIN
    dbms_output.put_line(Project_Name || ' ' || Project_SDate);
END;

BEGIN
    Calculate_ProjectContribution('Web and Database', SYSDATE);
END;

--2) A PL/SQL package specification named ProjectPackage which contains 
--the named procedure Calculate_ProjectContribution.
CREATE OR REPLACE PACKAGE ProjectPackage
AS
    PROCEDURE Calculate_ProjectContribution
        (Project_Name IN VARCHAR2, Project_SDate IN DATE);
END ProjectPackage;

--3) A variable cursor named CategoryEmployee_row of type 
--CategoryEmployee_cursor to reference a given record.
DECLARE
    CategoryEmployee_row CategoryEmployee_cursor%ROWTYPE;
BEGIN
END;

--4) Declare a cursor named course_cursor that self-join a table course 
--(of Registration script) to display course names and its course pre-requisites.
select * from course;

DECLARE
    CURSOR course_cursor IS
        SELECT c1.course_name as course, c2.course_name as prereq_course, 
                c1.prereq as prereq
        FROM course c1
        LEFT OUTER JOIN course c2
        ON c1.prereq = c2.course_no;
    course_cursor_row   course_cursor%ROWTYPE;
    dash varchar2(80);
BEGIN
    dash := rpad('-', 60, '-');
    OPEN course_cursor;
    dbms_output.put_line(rpad('Course name', 30, ' ') 
                    || '|' || lpad('Pre-requisites', 20, ' '));
    dbms_output.put_line(dash);
    LOOP
        FETCH course_cursor
        INTO course_cursor_row;
        EXIT WHEN course_cursor%NOTFOUND;
        IF (course_cursor_row.prereq is NULL) THEN
            dbms_output.put_line(rpad(course_cursor_row.course,30,' ') 
                            || '|  No Pre-requisites');
        ELSE
            dbms_output.put_line(rpad(course_cursor_row.course,30,' ') 
                            || '|  ' || course_cursor_row.prereq_course); 
        END IF;
    END LOOP;
    CLOSE course_cursor;
END;



--5) Declare variable named vsalary of the same type as field Salary 
--from employee table.
DECLARE
    vsalary     employee.salary%TYPE;

--Create employee table
create table employee (
    emp_name    varchar2(80),
    salary      number
);

select * from employee;

--6) A prompt statement to input a value of salary assigned to previous
--variable vsalary.
--Solution I
DECLARE
    vsalary     employee.salary%TYPE := &vsalary;
BEGIN
    dbms_output.put_line(vsalary);
END;

--Solution II
DECLARE
    vsalary     employee.salary%TYPE;
BEGIN
    vsalary := &vsalary;
END;


--7) Declare a cursor named studentgrade_cursor that displays student 
--information (s_last, s_first, s_class, birthday) and their grades 
--(from Registration script).
DECLARE
    CURSOR studentgrade_cursor IS
    SELECT s_id, s_last, s_first, s_class, birthday
    FROM student;
    cur_s_id        student.s_id%TYPE;
    cur_s_last      student.s_last%TYPE;
    cur_s_first     student.s_first%TYPE;
    cur_s_class     student.s_class%TYPE;
    cur_birthday    student.birthday%TYPE;
BEGIN
    OPEN studentgrade_cursor;
    LOOP
        FETCH studentgrade_cursor
        INTO cur_s_id, cur_s_last, cur_s_first, cur_s_class, cur_birthday;
        EXIT WHEN studentgrade_cursor%NOTFOUND;
        dbms_output.put_line('Student: ' || cur_s_last || ' ' || cur_s_first
                        || ', in Class: ' || cur_s_class
                        || ', Birthday: ' || cur_birthday);
        FOR s IN
            (select course_no, grade
             FROM enrollment
             where s_id=cur_s_id)
        LOOP
            dbms_output.put_line('      Course: ' || s.course_no
                            || ', Grade: ' || s.grade);
        END LOOP;
    END LOOP;
END;


--8) Declare a cursor named DeptFacultyStudent_cursor that displays 
--department information (DeptId, DeptName, Location) and its faculty 
--members along with their supervised students
DECLARE
    CURSOR DeptFacultyStudent_cursor IS
    SELECT deptid, deptname, location
    FROM department;
    cur_deptid      department.deptid%TYPE;
    cur_deptname    department.deptname%TYPE;
    cur_location    department.location%TYPE;
BEGIN
    OPEN DeptFacultyStudent_cursor;
    LOOP
        FETCH DeptFacultyStudent_cursor
        INTO cur_deptid, cur_deptname, cur_location;
        EXIT WHEN DeptFacultyStudent_cursor%NOTFOUND;
        dbms_output.put_line('Department id: ' || cur_deptid
                        || ', Name: ' || cur_deptname
                        || ', Location: ' || cur_location);

        --Look up Faculty Members in current Department
        FOR d IN
            (SELECT f_id, f_last, f_first, deptid
             FROM faculty
             WHERE deptid = cur_deptid)
        LOOP
            dbms_output.put_line('-    Faculty member: ' || d.f_last 
                            || ' ' || d.f_first);
            --Look up Faculty Members in current Department
            FOR s IN
                (SELECT s_last, s_first, f_id
                 FROM student
                 WHERE f_id = d.f_id)
            LOOP
                dbms_output.put_line('-        Student: ' || s.s_last
                                || ' ' || s.s_first);
            END LOOP;
        END LOOP;
    END LOOP;
END;
