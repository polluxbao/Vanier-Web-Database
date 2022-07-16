set serveroutput on size 2000;
Declare
    w_hello varchar2(30) := 'Hello World';
    today_date DATE;
Begin
    today_date := sysdate;

    dbms_output.put_line('My first message My first message My first message');
    dbms_output.put_line(w_hello);
    DBMS_OUTPUT.PUT_LINE('Today''s date With a given Format is ' 
        || TO_CHAR (today_date, 'DY, MONTH DD, YYYY HH:MI:SS P.M.'));
end;