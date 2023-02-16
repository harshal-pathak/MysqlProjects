-- Write a SQL query to find the salaries of all employees. Return salary.
USE hr;
SELECT * FROM employees;
SELECT salary FROM employees;

-- From the following table, write a SQL query to find the unique designations of the employees. Return job name.
SELECT * FROM employees;
SELECT DISTINCT job_id 'job name' FROM employees;

-- Write a SQL query to list the employee's name and job name as a format of "Employee & Job".
SELECT * FROM employees;
SELECT first_name Employee, job_id Job FROM employees;

/* Write a SQL query to find those employees who have no department number. 
Return employee_id, first_name, last_name, email,phone_number,hire_date, job_id, salary,commission_pct,manager_id and 
department_id.*/
SELECT * FROM employees;
SELECT * FROM employees WHERE department_id is null;

/* write a SQL query to find those employees who joined before ‘2003-06-05’ and not included in the department 
number 40, 120 and 70. Return all fields. */
SELECT * FROM employees;
SELECT * FROM employees WHERE hire_date < '2003-06-05' and  (department_id <> 40 and department_id <> 120 and department_id <>70);

/* Write a SQL query to find those employees whose first name ends with the letter ‘m’. 
Return the first and last name, and salary. */
SELECT first_name, last_name, salary FROM employees WHERE first_name LIKE '%m';

