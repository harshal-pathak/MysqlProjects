-- Write a SQL query to find those employees who get a higher salary than the employee whose ID is 163. Return first name, last name.
USE hr;
SELECT * FROM employees;
SELECT salary FROM employees WHERE employee_id = 163;

SELECT first_name, last_name FROM employees WHERE salary > (SELECT salary FROM employees WHERE employee_id = 163);

-- Write a SQL query to find those employees whose salary matches the smallest salary of any of the departments. Return first name, last name and department ID.
SELECT * FROM employees;
SELECT MIN(salary) FROM employees GROUP BY department_id;

SELECT first_name, last_name, department_id FROM employees WHERE salary IN (SELECT MIN(salary) FROM employees GROUP BY department_id);

-- Write a SQL query to find those employees whose department is located at 'Toronto'. Return first name, last name, employee ID, job ID.
SELECT location_id FROM locations WHERE city = 'Toronto';
(SELECT department_id FROM departments WHERE location_id = (SELECT location_id FROM locations  WHERE city ='Toronto'));
SELECT  first_name, last_name, employee_id, job_id FROM employees WHERE department_id = 20;

SELECT  first_name, last_name, employee_id, job_id FROM employees WHERE department_id = 
(SELECT department_id FROM departments WHERE location_id = (SELECT location_id FROM locations  WHERE city ='Toronto'));

-- Write a SQL query to find those employees who work in departments located in the United Kingdom. Return first name.
SELECT country_id FROM countries WHERE country_name ='United Kingdom';
(SELECT location_id FROM locations WHERE country_id IN ( SELECT country_id FROM countries WHERE country_name ='United Kingdom'));
(SELECT department_id FROM departments WHERE location_id IN (SELECT location_id FROM locations WHERE country_id IN ( SELECT country_id FROM countries WHERE country_name ='United Kingdom')));
SELECT  first_name FROM employees WHERE department_id IN(40,80);

SELECT  first_name FROM employees WHERE department_id IN (SELECT department_id FROM departments WHERE location_id IN (SELECT location_id FROM locations WHERE country_id IN ( SELECT country_id FROM countries WHERE country_name ='United Kingdom')));

