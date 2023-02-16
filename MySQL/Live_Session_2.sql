USE hr;
SELECT * FROM employees;
SELECT employee_id, first_name, salary FROM employees WHERE salary < 20000;
SELECT first_name, last_name, salary FROM employees WHERE salary BETWEEN 10000 and 15000;
SELECT first_name, last_name, salary FROM employees WHERE employee_id IN(101,108,111);
SELECT 3 <=> NULL, NULL <=> NULL;
SELECT * FROM employees;
SELECT employee_id, first_name, COALESCE(commission_pct,manager_id,department_id) FROM employees;
SELECT * FROM locations;
SELECT location_id, COALESCE(state_province,country_id) FROM locations;
SELECT employee_id, salary FROM employees WHERE employee_id NOT IN (103,109,112);
SELECT COUNT(employee_id), job_id FROM employees WHERE job_id='ST_CLERK' GROUP BY job_id;

