--1. Details of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e join salaries s on (e.emp_no = s.emp_no)

--2. Employees hired in 1986
SELECT first_name,last_name, hire_date FROM employees
	WHERE hire_date BETWEEN '01/01/1986' AND '31/12/1986';

--3. Details of manager of each department
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm JOIN departments AS d ON (dm.dept_no = d.dept_no)
						JOIN employees AS e ON (dm.emp_no = e.emp_no)
						

--4. Department number for each employee
SELECT de.dept_no, de.emp_no,e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de JOIN employees AS e ON (de.emp_no = e.emp_no)
					JOIN departments AS d ON (d.dept_no = de.dept_no)
					
--5. Employees whose first name is Hercules and last name begins with letter B
SELECT first_name,last_name, sex 
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%'

--6. Employees in the Sales department
SELECT de.emp_no, e.last_name, e.first_name
FROM dept_emp AS de JOIN employees AS e ON (de.emp_no = e.emp_no)
					JOIN departments AS d ON (d.dept_no = de.dept_no)
WHERE d.dept_name='Sales' 

--7. Employees in the Sales and Development Departments 
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de JOIN employees AS e ON (de.emp_no = e.emp_no)
					JOIN departments AS d ON (d.dept_no = de.dept_no)
WHERE d.dept_name='Sales' OR d.dept_name='Development'

--8 Number of employees who share same last name 
SELECT last_name, COUNT(last_name) AS "Frequency of last name"
FROM employees
group by last_name
ORDER BY last_name DESC;