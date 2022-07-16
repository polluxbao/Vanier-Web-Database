
drop table A;
drop table B;

CREATE TABLE A("key" INT, value VARCHAR(10));
CREATE TABLE B("key" INT, value VARCHAR(10));

INSERT INTO A("key", value) VALUES (1,'A1');
INSERT INTO A("key", value) VALUES (2,'A2');
INSERT INTO A("key", value) VALUES (3,'A3');
INSERT INTO B("key", value) VALUES (1,'B1');
INSERT INTO B("key", value) VALUES (4,'B4');
INSERT INTO B("key", value) VALUES (5,'B5');

select * from A;
select * from B;

select * from A, B;

select * from a inner join b using("key");

select * from a left join b on a."key"=b."key";

select * from a left outer join b using("key");
select * from a right outer join b using("key");

union all;


select * 


select dbms_random.random from dual; 

-- Library Student Managerment System
drop table students;
drop table Borrowed;
drop table Books;

CREATE TABLE Students(student_id INT, name VARCHAR(20), gender CHAR(1));
CREATE TABLE Borrowed(student_id INT, book_id VARCHAR(20));
CREATE TABLE Books(book_id VARCHAR(20), author VARCHAR(20), title VARCHAR(20));

INSERT INTO Students(student_id, name, gender) VALUES (1, 'John', 'M');
INSERT INTO Students(student_id, name, gender) VALUES (2, 'Adam', 'M');
INSERT INTO Students(student_id, name, gender) VALUES (3, 'Sandra', 'F');

INSERT INTO Books(book_id, author, title) VALUES ('id100', 'Ullman', 'DBMS');
INSERT INTO Books(book_id, author, title) VALUES ('id200', 'Linz', 'Automata');
INSERT INTO Books(book_id, author, title) VALUES ('id206', 'Baader', 'Term Rew.');

INSERT INTO Borrowed(student_id, book_id) VALUES (1, 'id100');
INSERT INTO Borrowed(student_id, book_id) VALUES (1, 'id200');
INSERT INTO Borrowed(student_id, book_id) VALUES (3, 'id200');
INSERT INTO Borrowed(student_id, book_id) VALUES (1, 'id206');
INSERT INTO Borrowed(student_id, book_id) VALUES (3, 'id200');
-- Library Student Managerment System

select * from students;
select * from borrowed;
select * from books;

select * from students S 
inner join borrowed B on S.student_id=B.student_id
inner join books C on b.book_id=c.book_id
where c.author='Linz'
