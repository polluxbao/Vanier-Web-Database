set serveroutput on size 4000;

--1. Implicit Cursor in PL/SQL

select * from faculty;
select f_id, f_first, f_last from faculty;

DECLARE
    current_f_last      faculty.f_last%TYPE;
    current_f_first     faculty.f_first%TYPE;    
BEGIN
    select f_last, f_first
    into current_f_last, current_f_first
    from faculty
    where f_id = 2;
    dbms_output.put_line('The faculty member''s name is '
            || current_f_first || ' ' || current_f_last);
END;


--2. Explicit Cursor:
DECLARE
    cursor faculty_cursor is
        select f_id, f_last, f_first
        from faculty;
    faculty_row faculty_cursor%ROWTYPE;
BEGIN
    open faculty_cursor;
    loop
        fetch faculty_cursor into faculty_row;
        exit when faculty_cursor%NOTFOUND;
        dbms_output.put_line('The faculty member : ' ||
                faculty_row.f_last || ' ' || faculty_row.f_first);
    end loop;
    close faculty_cursor;
end;

describe faculty;

--3. Execute the script file Registration.sql for creating tables of 
--Registration System.
--a) Edit PL/SQL program using an implicit cursor to display the course 
--number MIS 441 as shown in Figure 1. Use Anchored Declaration %TYPE.
select * from course;
describe course;

DECLARE
    c_course_name       course.course_name%TYPE;
    c_credits           course.credits%TYPE;
    c_max_enrollment    course.max_enrl%TYPE;
BEGIN
    select course_name, credits, max_enrl
    into c_course_name, c_credits, c_max_enrollment
    from course
    where course_no = 'MIS 441';
    dbms_output.put_line('The Course is ' || c_course_name
                || ' with credits ' || c_credits
                || ' and max enrollment is ' || c_max_enrollment);
END;


--b) Edit PL/SQL program to calculate the number of records within faculty
--table, and display the output as shown in Figure 2.

DECLARE
    cursor faculty_cursor is
        select f_id
        from faculty;
    faculty_row faculty_cursor%ROWTYPE;
    num     number :=0;
BEGIN
    open faculty_cursor;
    loop
        fetch faculty_cursor into faculty_row;
        exit when faculty_cursor%NOTFOUND;
        num := num + 1;
    end loop;
    dbms_output.put_line('The Nember of records whithin faculty table is: ' 
            || num);
    close faculty_cursor;
end;


--c) Write a PL/SQL program to calculate the number of records within 
--student table, who’s considered as being registered as Expert 
--(s_class = ‘EX’), and display the output as shown in Figure 3. Use 
--%ROWTYPE variable to display explicit cursor values.

select * from student;

DECLARE
    cursor student_cursor is
        select s_id, s_last, s_first, s_class
        from student;
    student_row student_cursor%ROWTYPE;
BEGIN
    open student_cursor;
    dbms_output.put_line('The Expert students of Vanier College are:');
    loop
        fetch student_cursor into student_row;
        exit when student_cursor%NOTFOUND;
        if student_row.s_class = 'EX' then
            dbms_output.put_line(student_row.s_last || ' '
                    || student_row.s_first
                    || ', who''s S_class is ' || student_row.s_class);
        end if;
    end loop;
    close student_cursor;
end;


--d) Re-Write the same program of (c) taking into account to display all 
--students registered as JR (Junior) and SR (Senior). 
--You have to consider only the (R) of s_class field as search value in 
--WHERE clause statement within the student table. 

DECLARE
    cursor student_cursor is
        select s_id, s_last, s_first, s_class
        from student;
    student_row student_cursor%ROWTYPE;
BEGIN
    open student_cursor;
    dbms_output.put_line('The Expert students of Vanier College are:');
    loop
        fetch student_cursor into student_row;
        exit when student_cursor%NOTFOUND;
        if substr(student_row.s_class,-1) = 'R' then
            dbms_output.put_line(student_row.s_last || ' '
                    || student_row.s_first
                    || ', who''s S_class is ' || student_row.s_class);
        end if;
    end loop;
    close student_cursor;
end;

--4. Answer the following questions:
--1. Write the appropriate statement to declare an anchored variable which
--has the same data type as hos_num_surgery (number of surgeries / year) 
--field in the following Hospital table.

create table Hospital(
hos_id NUMBER(6),
hos_Name VARCHAR2(30),
hos_addr VARCHAR2 (30),
hos_num_surgery NUMBER (8));

INSERT INTO Hospital VALUES
(1, 'Montréal General Hospital', '1650 Cedar Ave', 1235);
INSERT INTO Hospital VALUES
(2, 'McGill Health Centre', '1001 Decarie Blvd', 6548);
INSERT INTO Hospital VALUES
(3, 'Royal Victoria Hospital', '1002 Decarie Blvd', 3878);
INSERT INTO Hospital VALUES
(4, 'Montreal Sacred Heart', '5400 Boul Gouin O', 587);

select * from Hospital;
--drop table Hospital;


--4. Write the appropriate statement (s) that uses an implicit 
--cursor in order to search for a given hospital where hos_id = 555

DECLARE
    current_hos_Name            Hospital.hos_Name%TYPE;
    current_hos_addr            Hospital.hos_addr%TYPE;
    current_hos_num_surgery     Hospital.hos_num_surgery%TYPE;
BEGIN
    select hos_Name, hos_addr, hos_num_surgery
    into current_hos_Name, current_hos_addr, current_hos_num_surgery
    from Hospital
    where hos_id = 555;
    dbms_output.put_line('The Hospital is '
            || current_hos_Name || ' ' 
            || current_hos_addr || ' '
            || current_hos_num_surgery);
END;


--5. Write the appropriate statement to declare an explicit cursor which
--stores the fields (hos_id, hos_Name, hos_num_surgery) in the above
--Hospital table. 
DECLARE
    cursor hospital_cursor is
        select hos_id, hos_Name, hos_num_surgery
        from Hospital;
    hospital_row hospital_cursor%ROWTYPE;
BEGIN
    open hospital_cursor;
    loop
        fetch hospital_cursor into hospital_row;
        exit when hospital_cursor%NOTFOUND;
        dbms_output.put_line(hospital_row.hos_id || ' '
                || hospital_row.hos_Name || ' '
                || hospital_row.hos_num_surgery);
    end loop;
    close hospital_cursor;
END;

--8. Give an example of two tables (Parent & Child tables) which has 
--1:M relationship, declare explicit cursor for each table including 
--at least three fields for each table.

CREATE TABLE Publishers(
    p_id          number not null,
    p_name        varchar2(60),
    p_establish   date,
    p_adress      varchar2(80),
    CONSTRAINT pk_publisher_id PRIMARY KEY (p_id)
);

CREATE TABLE Books(
    b_id         number not null,
    b_name       varchar2(60),
    b_author     date,
    b_category   varchar2(80),
    CONSTRAINT fk_book_id FOREIGN KEY (p_id)
        REFERENCES Publishers(p_id)
);

--Declare explicit cursor publisher_cursor to skip through all records 
--to display the values of fields (p_id, p_name, p_establish, p_adress).
DECLARE
    cursor publisher_cursor is
        select p_id, p_name, p_establish, p_adress
        from Publishers;
    p_row publisher_cursor%ROWTYPE;
BEGIN
    open publisher_cursor;
    loop
        fetch publisher_cursor into p_row;
        exit when publisher_cursor%NOTFOUND;
        dbms_output.put_line(p_row.p_id || ' ' || p_row.p_name || ' '
                || p_row.p_establish || ' ' ||  p_row.p_adress);
    end loop;
    close publisher_cursor;
end;

--Declare explicit cursor book_cursor to skip through all records 
--to display the values of fields (b_id, b_name, b_author, b_category).
DECLARE
    cursor book_cursor is
        select b_id, b_name, b_author, b_category
        from Books;
    b_row book_cursor%ROWTYPE;
BEGIN
    open book_cursor;
    loop
        fetch book_cursor into b_row;
        exit when book_cursor%NOTFOUND;
        dbms_output.put_line(b_row.b_id || ' ' || b_row.b_name || ' '
                || b_row.b_author || ' ' ||  b_row.b_category);
    end loop;
    close book_cursor;
end;


DECLARE
    doctortitle varchar2(40);
    vdoctortitle doctortitle%TYPE;
BEGIN
    vdoctortitle := &doctortitle;
    dbms_output.put_line(vdoctortitle);
end;