# Pewlett-Hackard-Analysis

## Overview

The purpose of the analysis is to give us a better understanding of the people we anticipate retiring soon from the company Pewlett-Hackard. We needed to create a table that included the employees numbers, first name, last name, current job title, and the from date and to dates of their job titles, this was called ``retirement_titles.csv``. We then used this to create the table called ``unique_titles.csv`` that only had their current job title, this was done using the ``SELECT DISTINCT ON (emp_no) emp_no,`` and ordering that data based on the to_date of their titles to only pull the most recent one. From there we used the ``unique_titles.csv`` and the ``count()`` function to count up the number of each job title that will be retiring. 
!(retiring_titles.csv)[https://github.com/ccastanette/Pewlett-Hackard-Analysis/blob/main/Data/retiring_titles.csv]

Then after we got a better idea of the numbers of jobs per title we would need to be replacing we wanted to look at the people who will be available to enter into a mentorship program. They needed to be born between Jan 1st, 1965 & Dec 31st, 1965 and were still currently employed with the company. This was accomplished using the code below:
```
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
```
and the results are here: https://github.com/ccastanette/Pewlett-Hackard-Analysis/blob/main/Data/mentorship_eligibilty.csv

### Resources

Tables:
  1. https://github.com/ccastanette/Pewlett-Hackard-Analysis/blob/main/Data/departments.csv
  2. https://github.com/ccastanette/Pewlett-Hackard-Analysis/blob/main/Data/dept_emp.csv
  3. https://github.com/ccastanette/Pewlett-Hackard-Analysis/blob/main/Data/dept_manager.csv
  4. https://github.com/ccastanette/Pewlett-Hackard-Analysis/blob/main/Data/employees.csv
  5. https://github.com/ccastanette/Pewlett-Hackard-Analysis/blob/main/Data/salaries.csv
  6. https://github.com/ccastanette/Pewlett-Hackard-Analysis/blob/main/Data/titles.csv
  7. https://github.com/ccastanette/Pewlett-Hackard-Analysis/blob/main/Data/retirement_info.csv
  8. https://github.com/ccastanette/Pewlett-Hackard-Analysis/blob/main/Data/dept_count.csv
  9. https://github.com/ccastanette/Pewlett-Hackard-Analysis/blob/main/Data/mentorship_eligibilty.csv
  10. https://github.com/ccastanette/Pewlett-Hackard-Analysis/blob/main/Data/retiring_titles.csv
  11. https://github.com/ccastanette/Pewlett-Hackard-Analysis/blob/main/Data/unique_titles.csv
  12. https://github.com/ccastanette/Pewlett-Hackard-Analysis/blob/main/Data/retirement_titles.csv
  
 Software:
  1. PGAdmin  

## Results

The results are that the upcoming wave of retirements will most likely contain more that 90,000 employees and there are only 1549 people eligible for the mentorship program. And it is not guaranteed that all of the people eligible will be interested in the program.

## Summary

The total number of roles that will need to be filled is 90,398 and with only 1549 people being eligible for the mentorship program Pewlett-Hackard will need to be prepared to hire more that 88,000 that will not have mentors. So they will greatly need to expand their mentorship capabilities, I would recommend possibly expanding the people eligible to mentor by looking at the titles & managers table and if someone has been in their position for a certain number of years making them also a mentor. 
