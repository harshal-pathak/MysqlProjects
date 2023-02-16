/* Write a SQL query to find those employees whose first name contains the letters D, S, or N. 
Sort the result-set in descending order by salary. Return all fields. Table: employees */
USE hr;
SELECT * FROM employees;
SELECT * FROM employees WHERE first_name LIKE '%D' or first_name LIKE 'S%' or first_name LIKE 'N%' ORDER BY salary  DESC;

/* From the following table, write a SQL query to find those employees who worked more than two jobs in the past. 
Return employee id. Table : job_history */ 
SELECT * FROM job_history;
SELECT job_id,COUNT(job_id) FROM job_history GROUP BY job_id;
SELECT employee_id 'employee id' FROM job_history GROUP BY job_id HAVING COUNT(job_id)>2;

/* Write a SQL query to count the number of employees, sum of all salary, and difference between the highest salary and
 lowest salary by each job id. Return job_id, count, sum, salary_difference. Table : employees */
 SELECT * FROM employees;
 SELECT job_id, COUNT(employee_id) count, SUM(salary) sum, Max(salary)-MIN(salary) salary_difference 
 FROM employees GROUP BY job_id;
 
 /* Write a SQL query to count the number of cities each country has. Return country ID and number of cities.
 Table locations. */
 SELECT * FROM locations;
 SELECT country_id 'country ID',COUNT(city) 'Number of cities' FROM locations GROUP BY country_id;
 
 /* Write a SQL query to count the number of employees worked under each manager. 
 Return manager ID and number of employees. */
 SELECT * FROM employees;
 SELECT manager_id 'manager ID', COUNT(employee_id) 'Number of employees' FROM employees GROUP BY manager_id;