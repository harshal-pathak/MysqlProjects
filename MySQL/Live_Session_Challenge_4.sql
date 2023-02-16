-- Write a SQL query to find the first name, last name, department number, and department name for each employee.
USE hr;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT e.first_name, e.last_name, e.department_id 'department number', d.department_name 'department name' FROM employees e INNER JOIN departments d ON e.department_id = d.department_id;

-- Write a SQL query to find the first name, last name, department, city, and state province for each employee.
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM locations;
SELECT e.first_name, e.last_name, d.department_name department, l.city, l.state_province 'state province' FROM employees e INNER JOIN departments d ON e.department_id = d.department_id INNER JOIN locations l ON l.location_id = d.location_id;

-- Write a SQL query to find those employees whose first name contains a letter ‘z’. Return first name, last name, department, city, and state province.
SELECT e.first_name, e.last_name, d.department_name department, l.city, l.state_province 'state province'FROM employees e INNER JOIN departments d ON e.department_id = d.department_id INNER JOIN locations l ON l.location_id = d.location_id WHERE e.first_name LIKE 'Z%';

-- Write a SQL query to find those employees who earn less than the employee of ID 182. Return first name, last name and salary.
SELECT * FROM employees;
SELECT e1.first_name, e1.last_name,e1.salary FROM employees e1, employees e2 WHERE e1.salary < e2.salary AND e2.employee_id =182;

-- Write a SQL query to compute the average salary of employees for each job title
SELECT employee_id, job_id , AVG(salary) OVER(PARTITION BY job_id) 'Avg Salary'FROM employees;