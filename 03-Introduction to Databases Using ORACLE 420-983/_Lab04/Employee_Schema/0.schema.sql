/* EMPLOYEES */

CREATE TABLE employees (
    emp_no      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      CHAR(1)         NOT NULL,    
    hire_date   DATE            NOT NULL,
    CONSTRAINT ck_emp_gender CHECK ( gender IN ('F','M')),
    CONSTRAINT pk_emp PRIMARY KEY (emp_no)
);

/* DEPARTMENTS */

CREATE TABLE departments (
    dept_no     CHAR(4)         NOT NULL,
    dept_name   VARCHAR(40)     NOT NULL,
    CONSTRAINT pk_dept PRIMARY KEY (dept_no),
    CONSTRAINT uk_dept UNIQUE (dept_name)
);


/* DEPT_MANAGER */

CREATE TABLE dept_manager (
   emp_no       INT             NOT NULL,
   dept_no      CHAR(4)         NOT NULL,
   from_date    DATE            NOT NULL,
   to_date      DATE            NOT NULL,
   CONSTRAINT fk_dept_mng_emp FOREIGN KEY (emp_no)  REFERENCES employees (emp_no)    ON DELETE CASCADE,
   CONSTRAINT fk_dept_mng_dept FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
   CONSTRAINT pk_dept_mng PRIMARY KEY (emp_no,dept_no)
); 

/* DEPT_EMP */

CREATE TABLE dept_emp (
    emp_no      INT             NOT NULL,
    dept_no     CHAR(4)         NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    CONSTRAINT fk_dept_emp_emp FOREIGN KEY (emp_no)  REFERENCES employees   (emp_no)  ON DELETE CASCADE,
    CONSTRAINT fk_dept_emp_dept FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
    CONSTRAINT pk_dept_emp PRIMARY KEY (emp_no,dept_no)
);

/* TITLES */

CREATE TABLE titles (
    emp_no      INT             NOT NULL,
    title       VARCHAR(50)     NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE,
    CONSTRAINT fk_titles_emp FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    CONSTRAINT pk_titles PRIMARY KEY (emp_no,title, from_date)
);

/* SALARIES */

CREATE TABLE salaries (
    emp_no      INT             NOT NULL,
    salary      INT             NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    CONSTRAINT fk_salaries_emp FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    CONSTRAINT pk_salaries PRIMARY KEY (emp_no, from_date)
);

