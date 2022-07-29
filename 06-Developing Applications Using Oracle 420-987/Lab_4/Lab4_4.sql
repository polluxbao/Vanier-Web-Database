--4) Declare a cursor named course_cursor that self-join a table course 
--(of Registration script) to display course names and its course pre-requisites.
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
