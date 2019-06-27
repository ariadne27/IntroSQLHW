-- Data Analysis

-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT  employees.emp_no, last_name, first_name, gender, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no

-- 2. List employees who were hired in 1986.
select emp_no, first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31'

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.
SELECT  dept_manager.dept_no, department.dept_name, dept_manager.emp_no, employees.first_name, employees.last_name, dept_manager.from_date, dept_manager.to_date
FROM dept_manager
JOIN employees ON dept_manager.emp_no = employees.emp_no
JOIN department ON dept_manager.dept_no = department.dept_no

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT  dept_emp.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM dept_emp
JOIN department ON dept_emp.dept_no = department.dept_no
JOIN employees ON dept_emp.emp_no = employees.emp_no

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT emp_no, last_name, first_name
from employees
where first_name = 'Hercules'
AND
last_name like 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT  dept_emp.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM dept_emp
JOIN department ON dept_emp.dept_no = department.dept_no
JOIN employees ON dept_emp.emp_no = employees.emp_no
WHERE dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT  dept_emp.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM dept_emp
JOIN department ON dept_emp.dept_no = department.dept_no
JOIN employees ON dept_emp.emp_no = employees.emp_no
WHERE dept_name = 'Sales'
OR
dept_name = 'Development'

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, COUNT(last_name)
from employees
group by last_name
order by COUNT(last_name) desc
