CREATE TABLE departments
(
    dept_no   VARCHAR(6)  NOT NULL,
    dept_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE titles
(
    title_id VARCHAR(7)  NOT NULL,
    title    VARCHAR(30) NOT NULL,
    PRIMARY KEY (title_id),
    UNIQUE (title)
);

CREATE TABLE employees
(
    emp_no       INTEGER    NOT NULL,
    emp_title_id VARCHAR(7) NOT NULL,
    first_name   VARCHAR(30),
    last_name    VARCHAR(30),
    sex          VARCHAR(1),
    birth_date   DATE,
    hire_date    DATE,
    PRIMARY KEY (emp_no),
    CONSTRAINT employees_titles_title_id_fk
        FOREIGN KEY (emp_title_id) REFERENCES titles
);

CREATE TABLE salaries
(
    emp_no INTEGER NOT NULL,
    salary INTEGER,
    CONSTRAINT salaries_pk
        PRIMARY KEY (emp_no),
    CONSTRAINT salaries_employees_emp_no_fk
        FOREIGN KEY (emp_no) REFERENCES employees
);

CREATE TABLE dept_emp
(
    emp_no  INTEGER    NOT NULL,
    dept_no VARCHAR(7) NOT NULL,
    CONSTRAINT dept_emp_pk
        PRIMARY KEY (emp_no, dept_no),
    CONSTRAINT dept_emp_employees_emp_no_fk
        FOREIGN KEY (emp_no) REFERENCES employees,
    CONSTRAINT dept_emp_departments_dept_no_fk
        FOREIGN KEY (dept_no) REFERENCES departments
);

CREATE TABLE dept_manager
(
    dept_no VARCHAR(7) NOT NULL,
    emp_no  INTEGER    NOT NULL,
    CONSTRAINT dept_manager_pk
        PRIMARY KEY (dept_no, emp_no),
    CONSTRAINT dept_manager_departments_dept_no_fk
        FOREIGN KEY (dept_no) REFERENCES departments,
    CONSTRAINT dept_manager_employees_emp_no_fk
        FOREIGN KEY (emp_no) REFERENCES employees
);


