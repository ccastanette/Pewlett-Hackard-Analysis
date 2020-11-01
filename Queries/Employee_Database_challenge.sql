SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees AS e
LEFT JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO distinct_retirement_emp
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * FROM distinct_retirement_emp;

SELECT COUNT(title),
	title
INTO retiring_titles
FROM distinct_retirement_emp
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT DISTINCT ON(de.emp_no)de.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibilty
FROM employees AS e
LEFT JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;