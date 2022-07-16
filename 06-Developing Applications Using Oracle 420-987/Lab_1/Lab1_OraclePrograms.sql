set serveroutput on size 4000;

--1: Edit PL/SQL program to display the message “Hello World!”
declare
    w_hello varchar2(20) := 'Hello World!';
begin
    dbms_output.put_line('My first message with PL/SQL ');
    dbms_output.put_line(w_hello);
end;

--2: Edit PL/SQL program to display the current date using DATE type.
declare
    today_date DATE;
begin
    today_date := sysdate;
    dbms_output.put_line('Today''s date is');
    dbms_output.put_line(today_date);
end;

--3: Edit PL/SQL program using all kind of data types.
declare
    today_date          DATE;                       -- Date Data type
    current_course_no   VARCHAR2(9) := 'MIS 101';   -- Character Data Type
    curr_dept           char(3);                    -- Character Data Type
    course_code         number(3);                  -- Number Data type
    tuition_fee         number(7,2);                -- Decimal Number Data type
    foundvar            boolean;                    -- Boolean Data type
begin
    today_date := sysdate;
    tuition_fee := 85.99;
    dbms_output.put_line('Today''s date is');
    dbms_output.put_line(today_date);
    dbms_output.put_line('Original String Value is :' || current_course_no);   
    dbms_output.put_line('The Tuition fee for the course '  || current_course_no
        || ' is ' || to_char(tuition_fee, '$999D99'));
end;

--4: Edit PL/SQL program using character functions (of Block 1) to display the 
--character code and numeric code of the variable current_course_no as shown hereafter.
declare
    today_date          DATE;                       -- Date Data type
    curr_course_no   VARCHAR2(9) := 'MIS 101';   -- Character Data Type
    blank_space         number(2);
    curr_dept           varchar2(30);               -- Character Data Type
    curr_number         varchar2(30);
    course_code         number(3);                  -- Number Data type
    tuition_fee         number(7,2);                -- Decimal Number Data type
    foundvar            boolean;                    -- Boolean Data type
begin
    today_date := sysdate;
    tuition_fee := 85.99;
    dbms_output.put_line('Today''s date With a given Format is ' || 
                    to_char(today_date,'DY, MONTH DD, YYYY HH24:MI:SS A.M.'));
    dbms_output.put_line('Original String Value is :' || curr_course_no);   
    dbms_output.put_line('The Tuition fee for the course '  || curr_course_no
                    || ' is ' || to_char(tuition_fee, '$999D99'));
                    
    blank_space := instr(curr_course_no, ' ');
    curr_dept := substr(curr_course_no, 1, (blank_space -1));
    curr_number := substr(curr_course_no, blank_space,
                    (length(curr_course_no)-blank_space + 1));
    dbms_output.put_line('The Character code of the course captured in curr_dept variable is : '
                    || curr_dept);
    dbms_output.put_line('The Numeric code of the course captured in course_code variable is :'
                    || curr_number);
    dbms_output.put_line('The Character code of the course in lower case is : '
                    || lower(curr_dept));
    dbms_output.put_line('Number of Characters in the course code is : '
                    || length(curr_course_no));                
    dbms_output.put_line('The position of blank space in the course code is : '
                    || blank_space);   
end;


/*
3. Using your own wording, answer the following questions briefly:
    1. What is the assignment operator used in PL/SQL to assign value to 
       a given variable?
       Ans:
       Using  the assignment operator := to assign value to a given variable.

    2. What is the comparison operator used in PL/SQL?
       Ans:
       Comparison operators are used for comparing one expression to another. 
       The result is always either TRUE, FALSE or NULL.
       Such as LIKE, BETWEEN, IN, IS NULL.

    3. What is the concatenation operator used in PL/SQL to display two 
       strings variables?
       Ans:
       Concatenation operator used in PL/SQL is ||
       The || Operator is used to concatenate two or more strings together.
       
    4. What is the exponential symbol used in PL/SQL program?
       Ans:
       The EXP is used to return a value which is e raised to the nth power.
       For example: exp(number)

    5. Why use two single quotations ' ' in line 12 of Program PL/SQL # 3
       Ans:
       Because it needs to display a single quotation in the string.
       The first single quotation is a escaping charactor, to escape the second
       single quotations to be a normal charactor, not a function charactor, in 
       the string.
       
    6. Is it possible to write the following PL/SQL statement within the 
       DECLARE block DBMS_OUTPUT.PUT_LINE('My first message with PL/SQL ');
       Ans:
       No.
       DECLARE to assign the Varible block as a Value, but DBMS_OUTPUT.PUT_LINE()
       is a execute statement, not a Value.

    7. Is PL/SQL program a front-end program executed on client side or 
       back-end program executed on the server side?
       Ans:
       PL/SQL program is back-end program and executed on the server side.

    8. What is the name concept used in PL/SQL to describe DBMS_OUTPUT
       Ans:    
       The DBMS_OUTPUT package is to send messages. 
       The package is especially useful for displaying PL/SQL debugging information.
       
    9. What is the name concept used in PL/SQL to describe PUT_LINE
       Ans:
       PUT_LINE procedure places an entire line of information into the buffer
       including end-of-line (EOL).

    10. True or false and why:
        a. DECLARE block is optional in PL/SQL program
        Ans:
        Yes. The procedure works well without DECLARE block, if there is no 
        Varible in the BEGIN block.
        
        b. You cannot declare PL/SQL variable within BEGIN block
        Ans:
        Yes. We cannot declare PL/SQL variable within BEGIN block, because the 
        compile needs to set the variables space before BEGIN block starts.
        
        c. Semi colon is mandatory at the end of every PL/SQL statement.
        Ans:
        Yes, unless a individual statement is run independently.
        
        d. Line indentation makes PL/SQL program more readable.
        Ans:
        Yes. Line indentation is a good programming habit.
        
        e. PL/SQL program is compiled using a PL/SQL compiler.
        Ans:
        Yes. When a user sends a PL/SQL block from a client to the database 
        server, the PL/SQL compiler translates the machine code.
        
        f. You cannot assign PL/SQL variable within DECLARE block.
        Ans:
        Yes, we should assign PL/SQL variable within DECLARE block.
        
        g. To declare PL/SQL variable, you need to specify date type following 
        the name of variable such as product price NUMBER (6,2);
        Ans:
        Yes, the specify date type should be following the name of variable.
        
        h. Multi-line comment in PL/SQL is double dash --
        Ans:
        No.
        Double dash -- decorate the single line comment, and the Multi-line 
        comments start with / * and end with * /
        
        i. Every PL/SQL program must be terminated by EXCEPTION block.
        Ans:
        No.
        Exceptions can be declared only in the declarative part of a PL/SQL 
        block, subprogram, or package. 
        
*/

--4. Data Types: Anchored Declaration
--PL/SQL uses %TYPE attribute to anchor a variable’s data type. A variable 
--gets the same data type as an existing one.
declare
    today_date          DATE;                       -- Date Data type
    v_date              today_date%TYPE;
    current_course_no   VARCHAR2(9) := 'MIS 101';   -- Character Data Type
    course_code         number(3);                  -- Number Data type
    tuition_fee         number(7,2);                -- Decimal Number Data type
    foundvar            boolean;                    -- Boolean Data type
    curr_dept           char(3);                    
begin
    today_date := sysdate;
    v_date := today_date;
    dbms_output.put_line('Today''s date With a given Format is ' || today_date);
    dbms_output.put_line('Today''s date With a given Format is ' || v_date);
end;

--5. Control Decisions:
--a) Program PL/SQL # 7: Edit PL/SQL program using Selection control structure.
declare
    hot            varchar2(9) := 'yes';       -- Character Data Type
    degree         number(3);                  -- Number Data type
begin
    degree := 150;
    if (degree > 35 and hot = 'yes') then
        dbms_output.put_line(' TEST 1: It''s really hot!');
    else
        dbms_output.put_line(' TEST 1: It''s bearable');
    end if;
end;

--b) Program PL/SQL # 8: Edit PL/SQL program using Looping Structure.
--  1. FOR… END LOOP
create table count_table (counter number(2));
declare
    loop_count BINARY_INTEGER := 1;
begin
    for loop_count in 1..5
    loop
        insert into count_table values(loop_count);
    end loop;
    commit;
end;

--  2. WHILE… END LOOP
declare
    loop_count BINARY_INTEGER := 1;
begin
    while loop_count <= 5
    loop
        insert into count_table values(loop_count);
        loop_count := loop_count + 1;
    end loop;
    commit;
end;

--  3. LOOP…EXIT WHEN… END LOOP
declare
    loop_count BINARY_INTEGER := 1;
begin
    loop
        insert into count_table values(loop_count);
        loop_count := loop_count + 1;
        exit when loop_count > 5;
    end loop;
    commit;
end;

--6. Complete this part and save the following PL/SQL programs and their outputs 
--   in the same file called Lab1_Practice_OraclePrograms.sql
--A. Program PL/SQL # 4A: Edit PL/SQL program using Substitution variable (&) 
--   to calculate the output of the following expression
declare
    x       number(10, 4);
    y       number(10, 4);
    result  number(10, 2);
begin
    x := &x;
    y := &y;
    result := 6*x*sqrt(2*x) + 4*y*power(x, 3);
    dbms_output.put_line('The expression 6 * ' || x || ' square root of (2 * '
                    || x || ') + 4 * ' || y || ' * (' || x || ') power ' || y
                    || ' is: ' || result);
end;

--B. Program PL/SQL # 4B: Edit PL/SQL program using Substitution variable (&) 
--to calculate the payment for a loan based on constant payments and a constant 
--interest rate (the equivalent of PMT function in Excel)
declare
    l           number(10, 4);
    r           number(10, 4);
    y           number(10);
    PMT         number(10, 2);
    strJudge    varchar2(80);
begin
    l := &l;
    r := &r;
    y := &y;
    PMT := l*power(1+r, y);
    dbms_output.put_line('Your payment at the end of ' || y 
                    || ' years is ' || PMT);
    if PMT/l > 2 then 
        strJudge := 'Your Loan is expensive at this interest rate';
    elsif PMT/l < 1.5 then
        strJudge := 'Your Loan is acceptable at this interest rate';
    else
        strJudge := 'You should negotiate better Loan interest rate';
    end if;
    
    dbms_output.put_line(strJudge || ' ' || r);
end;


--C. Program PL/SQL # 4C: Edit PL/SQL program using Oracle character functions 
--to display the hospital name, virus name and number of hospitalisations of 
--a given entered hospital information as shown hereafter.
declare
    hospitalInfo        VARCHAR2(40);
    numberHospital      Number(3);
    blank_space         Number(3);
    nameHospital        VARCHAR2(30);
    today_date          date;
begin
    hospitalInfo := '&hospitalInfo';
--    hospitalInfo := '406 Jewish General Hospital';
    blank_space := instr(hospitalInfo, ' ');
    numberHospital := substr(hospitalInfo, 0, blank_space);
    nameHospital := substr(hospitalInfo, blank_space+1, 
                    length(hospitalInfo) - blank_space);
    today_date := sysdate;
    dbms_output.put_line('Today''s date With a given Format is ' || 
                    to_char(today_date,'DY, MONTH DD, YYYY HH24:MI:SS A.M.'));
    dbms_output.put_line('Original hospitalInfo is : ' || hospitalInfo);
    dbms_output.put_line('Number of hospitalisations is : ' 
                    || numberHospital);
    dbms_output.put_line('Hospital Name is : ' 
                    || nameHospital);
end;

--D. Program PL/SQL # 4D: Taking into account the previous requirements, edit 
--PL/SQL program using Oracle character functions (SUBSTR, and INSTR to locate 
--the occurrence of multiple blank spaces) in order to display the number of 
--hospitalisations, cause of hospitalisation, wave number, and hospital name 
--of a given entered hospital info
declare
    hospitalInfo        VARCHAR2(80);
    numberHospital      Number(3);
    causeHospital       VARCHAR2(15);
    waveNumber          Number(2);
    nameHospital        VARCHAR2(30);
    today_date          date;
    blank_space1        Number(3);
    blank_space2        Number(3);
    blank_space3        Number(3);
begin
    hospitalInfo := '&hospitalInfo';
--    hospitalInfo := '406 COVID19Delta 4 Jewish General Hospital';
    blank_space1 := instr(hospitalInfo, ' ', 1, 1);
    blank_space2 := instr(hospitalInfo, ' ', 1, 2);
    blank_space3 := instr(hospitalInfo, ' ', 1, 3);
    numberHospital := substr(hospitalInfo, 0, blank_space1);
    causeHospital := substr(hospitalInfo, blank_space1+1, blank_space2-blank_space1);
    waveNumber := substr(hospitalInfo, blank_space2+1, blank_space3-blank_space2);
    nameHospital := substr(hospitalInfo, blank_space3+1, 
                    length(hospitalInfo) - blank_space3);
    today_date := sysdate;
    dbms_output.put_line('Today''s date With a given Format is ' || 
                    to_char(today_date,'DY, MONTH DD, YYYY HH24:MI:SS A.M.'));
    dbms_output.put_line('Original hospitalInfo is : ' || hospitalInfo);
    dbms_output.put_line('Number of hospitalisations is : ' 
                    || numberHospital);
    dbms_output.put_line('Cause of hospitalisations is : ' 
                    || causeHospital);
    dbms_output.put_line('Wave number is : ' 
                    || waveNumber);
    dbms_output.put_line('Hospital Name is : ' 
                    || nameHospital);
end;

--Solution II Loop Method
declare
    hospitalInfo        VARCHAR2(80);
    hospitalInfoOrg     VARCHAR2(80);
    TYPE str_table IS TABLE OF VARCHAR2(30) INDEX BY BINARY_INTEGER;
    s_table     str_table;
    loop_count          number(2) := 1;
    blank_space         Number(3);
    len                 number(2);
    numberItems         number(2) := 4;
    today_date          date;
begin
    hospitalInfo := '&hospitalInfo';
--    hospitalInfo := '406 COVID19Delta 4 Jewish General Hospital';   
    hospitalInfoOrg := hospitalInfo;
    loop
        blank_space := instr(hospitalInfo, ' ');
        s_table(loop_count) := substr(hospitalInfo, 0, blank_space);
        len := length(hospitalInfo);
        hospitalInfo := substr(hospitalInfo, blank_space+1, len-blank_space-1);
        dbms_output.put_line(loop_count || '  ' || 
                            s_table(loop_count) || '  ' || 
                            blank_space || '  ' || 
                            hospitalInfo);
        loop_count := loop_count + 1;
        exit when loop_count >= numberItems;
    end loop;
    s_table(loop_count) := hospitalInfo;
    
    today_date := sysdate;
    dbms_output.put_line('Today''s date With a given Format is ' || 
                    to_char(today_date,'DY, MONTH DD, YYYY HH24:MI:SS A.M.'));
    dbms_output.put_line('Original hospitalInfo is : ' || hospitalInfoOrg);
    dbms_output.put_line('Number of hospitalisations is : ' 
                    || s_table(1));
    dbms_output.put_line('Cause of hospitalisations is : ' 
                    || s_table(2));
    dbms_output.put_line('Wave number is : ' 
                    || s_table(3));
    dbms_output.put_line('Hospital Name is : ' 
                    || s_table(4));
end;




