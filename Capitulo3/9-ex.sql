/*
172
The following SQL statement selects student first and last names, where the value in the
FIRST_NAME column contains a period, and also orders the result set based on the length of
students' last names:
*/
SELECT first_name, last_name
FROM student WHERE INSTR(first_name, '.') > 0 ORDER BY LENGTH(last_name);

--NESTED FUNCTIONS
SELECT RPAD (UPPER(CITY) , 20 , '.')
FROM ZIPCODE WHERE  STATE= 'CT';
