
--The SUBSTR Function
SELECT last_name,
SUBSTR(last_name, 1, 5),
SUBSTR(last_name, 6)
FROM student;