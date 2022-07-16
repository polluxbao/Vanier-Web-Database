set serveroutput on size 4000;

declare
    address             VARCHAR2(40);
    street_number       Number(10);
    street_name         VARCHAR2(60);
    postal_code         VARCHAR2(10);
    blank_space         Number(3);
    today_date          date;
begin
    address := '&address';
--    address := '1356 Rene Levesque  H4G1J2';
    blank_space := instr(address, ' ');
    street_number := substr(address, 0, blank_space);
    postal_code := trim(substr(address, -7));
    street_name := substr(address, blank_space, 
                    length(address) - blank_space - 7);
    street_name := trim(street_name);
    today_date := sysdate;
    dbms_output.put_line('Today''s date With a given Format is ' || 
                    to_char(today_date,'DY, MONTH DD, YYYY HH24:MI:SS A.M.'));
    dbms_output.put_line('Original Address is : ' || address);
    dbms_output.put_line('The Street Number is : ' 
                    || street_number);
    dbms_output.put_line('The Street Name is : ' 
                    || street_name);
    dbms_output.put_line('The Postal Code is : ' 
                    || postal_code);
end;