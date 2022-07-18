set serveroutput on size 4000;


--1. Explicit cursor using %TYPE anchored declaration.
DECLARE
    current_f_last faculty.f_last%TYPE;
    current_f_first faculty.f_first%TYPE;
    current_f_fid faculty.f_id%TYPE;

    CURSOR faculty_cursor IS
        SELECT f_last, f_first, f_id
        FROM faculty;
BEGIN
    OPEN faculty_cursor;
    LOOP
        FETCH faculty_cursor INTO current_f_last, current_f_first, current_f_fid;
        EXIT WHEN faculty_cursor%NOTFOUND;
        dbms_output.put_line('The faculty member: ' ||
            current_f_last || ' ' || current_f_first || ' ' || current_f_fid);
    END LOOP;
    CLOSE faculty_cursor;
END;

--2. Execute the script file registration.sql for creating tables of 
--Registration System.
--a) Using explicit cursor, and the reserved word %TYPE variables to display 
--explicit cursor values, Edit PL/SQL program to display all level classes and
--the description of class using the nested IF/THEN/ELSE as shown in Figure 1.
DECLARE
    current_lc_desc levelclass.lc_desc%TYPE;
    current_lc_min levelclass.lc_min%TYPE;
    current_lc_max levelclass.lc_max%TYPE;
    CURSOR lc_cursor IS
        SELECT lc_desc, lc_min, lc_max
        FROM levelclass;
BEGIN
    OPEN lc_cursor;
    LOOP
        FETCH lc_cursor INTO current_lc_desc, current_lc_min, current_lc_max;
        EXIT WHEN lc_cursor%NOTFOUND;
        IF current_lc_max <= 12 THEN
            dbms_output.put_line('LC Type 1, Desc of Class: ' || 
                'Small Class, Need to upgrade this class building');
        ELSIF current_lc_max <= 30 AND current_lc_min > 12 THEN
            dbms_output.put_line('LC Type 2, Desc of Class: ' || 
                'Medium Class, Need to Renovate this class building');
        ELSIF current_lc_max <= 90 AND current_lc_min > 30 THEN
            dbms_output.put_line('LC Type 3, Desc of Class: ' || 
                'Large Class, No Renovation for this class building');
        ELSE
            dbms_output.put_line('LC Type 4, Desc of Class: ' || 
                'Extra Large Class, Need to equip this class building with new speakers');
        END IF;
    END LOOP;
    CLOSE lc_cursor;
END;



--b) Using Explicit Cursor, Edit PL/SQL program to display all students’ 
--names within student table along with the first name and last name of 
--their respective supervisor to be fetched from faculty table as shown 
--in Figure 2. Use %ROWTYPE variable to display explicit cursor values.

--Solution I
DECLARE
    current_s_last student.s_last%TYPE;
    current_s_first student.s_first%TYPE;
    current_s_class student.s_class%TYPE;
    current_f_id student.f_id%TYPE;

    CURSOR s_cursor IS
        SELECT s_last, s_first, s_class, f_id
        FROM student;
BEGIN
    OPEN s_cursor;
    LOOP
        FETCH s_cursor INTO current_s_last, current_s_first, 
            current_s_class, current_f_id;
        EXIT WHEN s_cursor%NOTFOUND;
        DECLARE
            current_f_last faculty.f_last%TYPE;
            current_f_first faculty.f_first%TYPE;
            
            CURSOR f_cursor IS 
                select f_last, f_first from faculty
                WHERE f_id = current_f_id;
        BEGIN
            OPEN f_cursor;
            FETCH f_cursor INTO current_f_last, current_f_first;
            dbms_output.put_line(current_s_last || ' ' || current_s_first
                    || ', who''s S_class is ' || current_s_class
                    || ', Supervisor name: ' || current_f_last || ' ' || current_f_first); 
            CLOSE f_cursor;
        END;
    END LOOP;
    CLOSE s_cursor;
END;

--Solution II
DECLARE
    s_s_last student.s_last%TYPE;
    s_s_first student.s_first%TYPE;
    s_s_class student.s_class%TYPE;
    f_f_last faculty.f_last%TYPE;
    f_f_first faculty.f_first%TYPE;
    CURSOR c_cursor is
        select s.s_last, s.s_first, s.s_class, f.f_last, f.f_first
        from student s, faculty f
        where s.f_id = f.f_id;
BEGIN
    OPEN c_cursor;
    LOOP
        FETCH c_cursor INTO s_s_last, s_s_first, s_s_class, f_f_last, f_f_first;
        EXIT WHEN c_cursor%NOTFOUND;
        dbms_output.put_line(s_s_last || ' ' || s_s_first
                    || ', who''s S_class is ' || s_s_class
                    || ', Supervisor name: ' || f_f_last || ' ' || f_f_first); 
    END LOOP;
    CLOSE c_cursor;
END;


--c) Using explicit cursor, and the anchored declaration %TYPE to display 
--explicit cursor values. Edit PL/SQL program to display the total of all 
--available seats (max_enrl) of all courses.
DECLARE
    c_course_no course.course_no%TYPE;
    c_course_enrl course.max_enrl%TYPE;
    c_litstr course.course_no%TYPE;
    c_code course.course_no%TYPE;
    seat_number course.max_enrl%TYPE := 0;
    CURSOR c_cursor IS
        SELECT course_no, max_enrl
        FROM course;
BEGIN
    dbms_output.put_line('The Total of available seat courses is:');
    OPEN c_cursor;
    LOOP
        FETCH c_cursor INTO c_course_no, c_course_enrl;
        EXIT WHEN c_cursor%NOTFOUND;
        seat_number := seat_number + c_course_enrl;
        c_litstr := substr(c_course_no, INSTR(c_course_no, ' ') + 1);
        c_code := substr(c_course_no, INSTR(c_course_no, ' ', -1, 1) + 1);
        dbms_output.put_line('The Course Inf ' || c_course_no
                        || ', Course Literal String ' || c_litstr
                        || ', Course Code ' || c_code
                        || ' Course Seats ' || c_course_enrl);
    END LOOP;
    CLOSE c_cursor;
    dbms_output.put_line('The Total of Course Numbering is: ' || seat_number);

END;


--3. Using multiple Explicit Cursors and Joining Tables.
--a) Using explicit cursor and the anchored declaration %TYPE when declaring
--variable, edit PL/SQL program to display all Faculties, their supervised 
--students and to which department they belong.
DECLARE
    current_f_id faculty.f_id%TYPE;
    current_f_last faculty.f_last%TYPE;
    current_f_first faculty.f_first%TYPE;
    current_deptid faculty.deptid%TYPE;
    CURSOR f_cursor IS
        SELECT f_id, f_last, f_first, deptid
        FROM faculty;
BEGIN
    OPEN f_cursor;
    LOOP
        FETCH f_cursor INTO current_f_id, current_f_last, 
                        current_f_first, current_deptid;
        EXIT WHEN f_cursor%NOTFOUND;

        DECLARE
            current_s_last student.s_last%TYPE;
            current_s_first student.s_first%TYPE;
            current_s_class student.s_class%TYPE;
            d_deptname department.deptname%TYPE;
            d_location department.location%TYPE;
            s_f_id student.f_id%TYPE;
            CURSOR s_cursor IS
                SELECT s_last, s_first, s_class, f_id
                FROM student;
        BEGIN
            OPEN s_cursor;
            LOOP
                FETCH s_cursor INTO current_s_last, current_s_first,
                                current_s_class, s_f_id;
                EXIT WHEN s_cursor%NOTFOUND;
                IF s_f_id = current_f_id THEN
                    dbms_output.put_line('The Faculty Inf: ' || current_f_id || ', '
                        || current_f_last || ' ' || current_f_first);
                    dbms_output.put_line('  Student Name:' || current_s_last 
                                    || ' ' || current_s_first
                                    || ', St Class Type:' || current_s_class); 
                    SELECT deptname, location
                    INTO d_deptname, d_location
                    FROM department d
                    WHERE d.deptid = current_deptid;
                    dbms_output.put_line('  Dep Info:' || d_deptname
                                    || ', ' || d_location);
                END IF;
            END LOOP;
            CLOSE s_cursor;
        END;
    END LOOP;
    CLOSE f_cursor;
END;


--b) Using explicit cursor, edit PL/SQL program to display all departments, 
--and its faculties. Display the output shown in Figure 5. Use %ROWTYPE 
--variable to display explicit cursor values.
DECLARE
    d_dept department%ROWTYPE;
    CURSOR cur_dept is SELECT * FROM department;
    f_facu faculty%ROWTYPE;
    CURSOR cur_facu is SELECT * FROM faculty;
    i INTEGER;
BEGIN
    OPEN cur_dept;
    dbms_output.put_line('The List of Departments and its Faculties:'); 
    LOOP
        FETCH cur_dept into d_dept; 
        EXIT WHEN cur_dept%NOTFOUND;
        dbms_output.put_line('Dep ID:' || d_dept.deptid
                        || ', Dep Name: ' || d_dept.deptname
                        || ', Dep Loc: ' || d_dept.location);
        OPEN cur_facu;
        i := 1;
        LOOP
            FETCH cur_facu into f_facu;
            EXIT WHEN cur_facu%NOTFOUND;
            IF f_facu.deptid = d_dept.deptid THEN
                dbms_output.put_line(i || ')       ' 
                                || f_facu.f_last || ' ' || f_facu.f_first
                                || ', who''s SOCIAL INS is ' || f_facu.soc_ins);
                i := i + 1;
            END IF;
        END LOOP;
        CLOSE cur_facu;
        IF i>1 THEN
            dbms_output.put_line('');
        ELSE
            dbms_output.put_line('        -----No Faculty Assigned for this Department so far--');
        END IF;
    END LOOP;
    CLOSE cur_dept;
END;
