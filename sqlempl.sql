use employees;

select 
	AVG(salary) as aa, d.dept_no
from employees e
inner join salaries s on s.emp_no = e.emp_no
inner join dept_emp d on d.emp_no = e.emp_no
inner join departments de on de.dept_no = d.dept_no
group by d.dept_no
order by aa desc;

select 
	first_name, last_name, MAX(salary) as salary
from employees e
inner join salaries s on s.emp_no = e.emp_no;

select 
	count(*)
from employees
group by gender;

SELECT first_name, last_name, salary
FROM employees e
inner join salaries s on s.emp_no = e.emp_no
ORDER BY s.salary DESC
LIMIT 1 OFFSET 1;

select 
	count(case when gender = 'M' THEN 1 END) as M, 
	count(case when gender = 'F' then 1 end) as F
from employees
order by M desc;

select max(contador) as maximo_cont from (
select 
	count(*) as contador, month(hire_date) as mes
from employees
group by mes) as maximo;

select d.dept_no , d.dept_name
from (
    select dm.dept_no, MIN(e.hire_date) as min_hire_date
    from dept_manager as dm
    inner join employees as e on dm.emp_no = e.emp_no
    group by dm.dept_no) as min_hire_dates
inner join dept_manager as dm on min_hire_dates.dept_no = dm.dept_no and min_hire_dates.min_hire_date = dm.from_date
inner join departments as d on dm.dept_no = d.dept_no;

select 
	e.first_name, e.last_name, de.dept_name
from employees e
inner join dept_emp d on d.emp_no = e.emp_no
inner join departments de on de.dept_no = d.dept_no
where e.first_name not like '%a%' and
e.first_name not like '%e%' and
e.first_name not like '%i%' and
e.first_name not like '%o%' and
e.first_name not like '%u%';

CREATE VIEW current_salary AS
SELECT e.emp_no AS employee_code, e.first_name, e.last_name, s.salary AS current_salary, s.from_date AS salary_date
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'; 

SELECT d.dept_name, AVG(cs.current_salary) AS average_salary
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN current_salary cs ON de.emp_no = cs.employee_code
GROUP BY d.dept_name;

select hire_date from employees e
order by hire_date desc;

show tables from employees;

select * from salaries;

select * from dept_manager;
