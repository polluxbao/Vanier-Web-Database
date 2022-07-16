-- Professors Table
CREATE TABLE Professors (
    professor_id    INT AUTO_INCREMENT,
    SSN             VARCHAR(9),
    first_name      VARCHAR(40),
    last_name       VARCHAR(40),
    age             INT,
    rank            VARCHAR(20),
    specialty       VARCHAR(40),
    PRIMARY KEY(prof_id)
)
 
-- Students Table
CREATE TABLE Students(
    student_id      INT AUTO_INCREMENT,
    first_name      VARCHAR(40),
    last_name       VARCHAR(40),
    graduate_status NUMBER(1,0),
    CONSTRAINT graduate_status CHECK (graduate_status in ('Y', 'N'));
    PRIMARY KEY(cour_id)
)


-- Projects Table
CREATE TABLE Projects(
    project_id          INT AUTO_INCREMENT,
    project_name        VARCHAR(50),
    CODE VARCHAR(30),
    PRIMARY KEY(cour_id)
)
 
-- Professors with Projects
CREATE TABLE Prof_Proj(
    sc_id INT AUTO_INCREMENT,
    stu_id INT ,
    cour_id INT,
    PRIMARY KEY(sc_id)
)