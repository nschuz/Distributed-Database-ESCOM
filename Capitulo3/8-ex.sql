--FUNCTIONS IN WHERE AND ORDER BY CLAUSES
SELECT first_name, last_name
FROM student
WHERE SUBSTR(last_name, 1, 2) = 'Mo';
