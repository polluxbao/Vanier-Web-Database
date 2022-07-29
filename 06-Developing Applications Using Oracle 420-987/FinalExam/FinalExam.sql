--1. Display_ClientInfo
CREATE OR REPLACE PROCEDURE Display_ClientInfo (
    c_ClientId number
)
AS 
    row_client client%ROWTYPE;
BEGIN
    SELECT * INTO row_client
    FROM client
    WHERE ClientId = c_ClientId;
    dbms_output.put_line('The Client LName found is : ' || row_client.ClientLname); 
    dbms_output.put_line('Client FName : ' || row_client.ClientFname);
    dbms_output.put_line('Client Add : ' || row_client.ClientAddress);
    dbms_output.put_line('Client Birth date : ' || row_client.BirthDate);
END; 

DECLARE
    ClientId number;
BEGIN
    ClientId := &ClientId;
    Display_ClientInfo(ClientId);
END;


--2. Display_OrderClientInfo
CREATE OR REPLACE PROCEDURE Display_OrderClientInfo
AS
    kidItemNum number := 0;
BEGIN
    FOR row_client IN (select * from client) LOOP
        FOR row_orders IN (select * from orders) LOOP
            if (row_client.ClientId = row_orders.ClientId) THEN
                dbms_output.put_line('The Client Inf: ' || row_client.ClientId
                        || ', ' || row_client.ClientLname
                        || ', ' || row_client.ClientFname
                        || ', ' || row_client.ClientAddress
                        || ', ' || row_client.BirthDate
                        || '  Order Info: ' || row_orders.OrderId
                        || ', ' || row_orders.OrderTitle
                        || ', ' || row_orders.OrderDate);
                IF (row_orders.OrderTitle like '%Kid%') THEN
                    kidItemNum := kidItemNum+1;
                END IF;
            end if;
        END LOOP;
    END LOOP;
    dbms_output.put_line('The Total Order set to Order for Kid Item is: '
                || kidItemNum);
END Display_OrderClientInfo;

BEGIN
    Display_OrderClientInfo();
END;

--Create Tables
drop table client;
drop table orders;
CREATE TABLE client 
	(ClientId    NUMBER (5),
    ClientLname		VARCHAR2 (15) CONSTRAINT client_lname_nn NOT NULL,
	ClientFname 		VARCHAR2 (15) CONSTRAINT client_fname_nn NOT NULL, 
	ClientAddress 		VARCHAR2 (40) CONSTRAINT client_Address_nn NOT NULL, 
	BirthDate  	DATE,
	CONSTRAINT client_ClientId_pk 
		PRIMARY KEY (ClientId)
	);

CREATE TABLE orders
	(OrderId	NUMBER (5),	
	ClientId	NUMBER (5) NOT NULL,
	OrderTitle	VARCHAR2 (25),
	OrderDate	DATE,
	CONSTRAINT orders_OrderId_pk PRIMARY KEY (OrderId),
	CONSTRAINT orders_ClientId_fk FOREIGN KEY (ClientId)
		REFERENCES client (ClientId));

INSERT INTO client VALUES (111, 'Nour', 'Ali', '10 Blew street, Montreal',  
	TO_DATE ('04/15/1960', 'mm/dd/yyyy'));
INSERT INTO client VALUES (246, 'Houstonson', 'Anais','25 Johnson Dr, New York', 
	TO_DATE ('05/19/1967', 'mm/dd/yyyy'));
INSERT INTO client VALUES (123, 'Robertson', 'Sarah', '35 Bay Street, Nevada', 
	TO_DATE ('12/02/1991', 'mm/dd/yyyy'));
INSERT INTO client VALUES (433, 'McCall', 'Alex', '88 Rene Levesque Est, Montreal', 
	TO_DATE ('05/10/1997', 'mm/dd/yyyy'));
INSERT INTO client VALUES (543, 'Denver', 'Nicolas', '3865 Ontario Street, Ontario',
	TO_DATE ('03/15/1995', 'mm/dd/yyyy'));
INSERT INTO client VALUES (200, 'Shaw', 'Ho', '9874 Grenada street, British Columbia',
	TO_DATE ('01/03/00', 'mm/dd/yy'));
INSERT INTO client VALUES (135, 'Garner', 'Nancy', '1400 Saint Laurent, Montreal', 
	TO_DATE ('02/29/1996', 'mm/dd/yyyy'));
INSERT INTO client VALUES (222, 'Ken', 'Robert', '2589 Belle vue, Montreal', 
	TO_DATE ('08/15/1999', 'mm/dd/yyyy'));

INSERT INTO orders VALUES (120, 543, 'Order for Sport Item', TO_DATE ('04/15/2016', 'mm/dd/yyyy'));
INSERT INTO orders VALUES (121, 246, 'Order for Kid Item', TO_DATE ('03/22/2015', 'mm/dd/yyyy'));
INSERT INTO orders VALUES (122, 123, 'Order for Women Item', TO_DATE ('07/17/2015', 'mm/dd/yyyy'));
INSERT INTO orders VALUES (123, 111, 'Order for Kid Item', TO_DATE ('08/09/2015', 'mm/dd/yyyy'));
INSERT INTO orders VALUES (124, 135, 'Order for Kid Item', TO_DATE ('09/24/2014', 'mm/dd/yyyy'));
INSERT INTO orders VALUES (125, 222, 'Order for Men Item', TO_DATE ('10/20/2013', 'mm/dd/yyyy'));

COMMIT;
select * from client;
select * from orders;


