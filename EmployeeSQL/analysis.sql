-- List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no, last_name, first_name, sex, salary
  FROM employees e
           LEFT JOIN salaries s ON e.emp_no = s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
  FROM employees
 WHERE EXTRACT('Year' FROM hire_date) = 1986;

-- List the manager of each department along with their department number, department name,
-- employee number, last name, and first name
SELECT d.dept_no, dept_name, e.emp_no, last_name, first_name
  FROM departments d
           JOIN dept_manager dm ON d.dept_no = dm.dept_no
           JOIN employees e ON dm.emp_no = e.emp_no;

-- List the department number for each employee along with that employee’s employee number,
-- last name, first name, and department name
SELECT d.dept_no, e.emp_no, last_name, first_name, dept_name
  FROM departments d
           JOIN dept_emp de ON d.dept_no = de.dept_no
           JOIN employees e ON de.emp_no = e.emp_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and
-- whose last name begins with the letter B
SELECT first_name, last_name, sex
  FROM employees
 WHERE first_name = 'Hercules'
   AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name,
-- and first name
SELECT e.emp_no, last_name, first_name
  FROM departments d
           JOIN dept_emp de ON d.dept_no = de.dept_no
           JOIN employees e ON de.emp_no = e.emp_no
 WHERE dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee
-- number, last name, first name, and department name
SELECT e.emp_no, last_name, first_name, dept_name
  FROM departments d
           JOIN dept_emp de ON d.dept_no = de.dept_no
           JOIN employees e ON de.emp_no = e.emp_no
 WHERE dept_name = 'Sales'
    OR dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names
-- (that is, how many employees share each last name)
SELECT last_name, COUNT(*) AS n
  FROM employees
 GROUP BY last_name
 ORDER BY n DESC;