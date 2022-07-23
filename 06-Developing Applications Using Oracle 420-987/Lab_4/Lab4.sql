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
    dbms_output.put_line('Enter value for course_price: ');
    course_price := &course_price;
    dbms_output.put_line('Enter value for num_course: ');
    num_course := &num_course;
    dbms_output.put_line('Enter value for cost_manual: ');
    cost_manual := &cost_manual;
    
    doCalc_Cost_Tuition(course_price, num_course, cost_manual, cost_tuition);
    dbms_output.put_line('The Total Cost of Tuition Corresponding to');
    dbms_output.put_line('Course Price: ' || course_price || '$');
    dbms_output.put_line('Number of Courses: ' || num_course);
    dbms_output.put_line('Cost Manual: ' || cost_manual);
    dbms_output.put_line('is: ' || cost_tuition || '$');
END;

--b) Create a package to be named RegistrationPackage that contains 
--all previous procedures (Display_CategoryStudent, doCalc_Cost_Tuition) 
CREATE OR REPLACE PACKAGE RegistrationPackage
AS
    PROCEDURE Display_CategoryStudent;
    PROCEDURE doCalc_Cost_Tuition;

END RegistrationPackage;


