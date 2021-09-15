SELECT description
FROM course;

SELECT description, cost
FROM course;

SELECT * FROM course;

SELECT last_name, zip
FROM instructor;



SELECT DISTINCT zip
FROM instructor;

SET FEEDBACK 1;

--- 2.2--
SELECT FIRST_NAME , LAST_NAME from student;
SELECT  city , state , zip  FROM ZIPCODE;
SELECT * FROM grade_type;

--FORMATING  YOUR RESULTS
COL description FORMAT  A13
COL created_by FORMAT A8
COL modified_by FORMAT A8

--FORMATING NUMBER
COL cost FORMAT $ 9,999.99
COL cost FORMAT $9,999.99
SELECT  DISTINCT  cost FROM COURSE;
SELECT  DISTINCT  cost FROM COURSE;

SELECT LETTER_GRADE FROM GRADE_CONVERSION;

--2.2.2
SELECT  letter_grade
FROM grade_conversion;

SELECT DISTINCT letter_grade
FROM grade_conversion;


SET FEEDBACK 1;
SELECT  DISTINCT  cost FROM course;

--ERROR
SELECT  DISTINCT  COURSE_NO FROM class;


---2.3
SELECT COURSE_NO FROM COURSE;

--Palabras que se refieren al buffer de lasconsulatas antetiores
sql> LIST
sql> 1
sql> CHANGE/course_no/description

SELECT * FROM COURSE;
SELECT  state FROM ZIPCODE;

--EXCEUTE FILE SQL
SQL>@c:\exmaple\myfile2

SELECT EMPLOYER FROM STUDENT;
SELECT salutation , FIRST_NAME, LAST_NAME , phone FROM INSTRUCTOR;
SELECT  DISTINCT  state FROM  ZIPCODE;

--2.3.1 Answers
SELECT EMPLOYER FROM STUDENT;
SQL> C/SELECT/SELECT phone,
SELECT phone , REGISTRATION_DATE FROM  STUDENT;

SQL> L

----- 2.3.2
SELECT  SALUTATION , FIRST_NAME , LAST_NAME , PHONE FROM INSTRUCTOR;
SQL>@file.sql
SELECT DISTINCT  state FROM ZIPCODE;
SELECT  DISTINCT  ZIP FROM  ZIPCODE;

/* MULTI COMMENT*/
-- COMMENT LINE


---2.4 WHERE CLAUSE : COMPARASION AND LOGICAL OPERARTORS
SELECT  FIRST_NAME , LAST_NAME , PHONE  FROM
INSTRUCTOR WHERE LAST_NAME= 'Schorin';

DESCR INSTRUCTOR;

--NO ROWS
SELECT FIRST_NAME , LAST_NAME , PHONE FROM INSTRUCTOR
WHERE LAST_NAME='schorin';

--NOT EQUALS
SELECT  FIRST_NAME , LAST_NAME , PHONE FROM INSTRUCTOR
WHERE LAST_NAME <> 'Schorin';

SELECT  DESCRIPTION , cost FROM COURSE WHERE COST>=1195;


---BETWEEN COMPARISON OPERATOR
SELECT  DESCRIPTION , COST FROM COURSE WHERE COST
BETWEEN  1000 AND 1100;

---IN OPERATOR THE IN OPERATOR WORKS WITH OF LIST OF VALUES , SEPARATED BY COMMAS
-- conatined within a set of patehesese
-- NO LISTA VALORES EN ESE RANGO DE PRECIOS
SELECT  DESCRIPTION , COST  FROM COURSE
WHERE  COST IN (1095 , 1595);


--LIKE OPERATOR
SELECT FIRST_NAME ,  LAST_NAME , PHONE   FROM INSTRUCTOR
WHERE LAST_NAME LIKE 'S%';

--%
SELECT FIRST_NAME , LAST_NAME FROM INSTRUCTOR WHERE LAST_NAME LIKE  '_o%';

-- NEGATING USING NOT
SELECT LAST_NAME ,PHONE FROM INSTRUCTOR WHERE LAST_NAME NOT LIKE 'S%';

--- EVALUATING NULL VALUES
SELECT  DESCRIPTION , PREREQUISITE from COURSE
WHERE PREREQUISITE IS NULL ;

--LOGICAL OPERATORS
SELECT  DESCRIPTION , COST FROM COURSE WHERE
COST = 1095 AND DESCRIPTION LIKE 'I%';

SELECT  DESCRIPTION , COST , PREREQUISITE  FROM COURSE
WHERE  COST =1195 AND   PREREQUISITE=20  OR PREREQUISITE =25;


SELECT  DESCRIPTION , COST , PREREQUISITE  FROM COURSE
WHERE  COST =1195 AND  ( PREREQUISITE=20  OR PREREQUISITE =25);


---nulls and logical operators
SELECT  DESCRIPTION ,  PREREQUISITE FROM COURSE WHERE
DESCRIPTION LIKE 'Intro to%'
AND PREREQUISITE >=140;

SELECT  DESCRIPTION , PREREQUISITE , COST
FROM  COURSE WHERE PREREQUISITE IS NULL ;

SELECT  DESCRIPTION , PREREQUISITE FROM
COURSE WHERE NOT PREREQUISITE >=140;

-- 2.4 EXERCISES
--1 WRITE A SELECT STATEMENT TO LIS THE LAS NAMES OF STUDENTS LIVING EITHER IN ZIP  CODE
-- 10048 , 11102  OR 11209

SELECT  LAST_NAME FROM  STUDENT WHERE  ZIP IN ('10048' , '11102' , '11209');

-- OTHERWISE
SELECT  LAST_NAME FROM  STUDENT WHERE
ZIP = '1OO48' OR  ZIP='11102' OR ZIP='11209';

-- Write a SELECT statement to list the first and last names of instructors with the letter "i"
-- (either uppercase or lowercase) in their last name living in the zip code 10025.
SELECT  FIRST_NAME  , LAST_NAME FROM INSTRUCTOR WHERE (LAST_NAME LIKE '%i%'
    OR LAST_NAME LIKE '%I%') AND ZIP = '10025';

--Does the following statement contain an error? Explain.
SELECT last_name
FROM instructor
WHERE created_date = modified_by;
/*
Answer: Yes. The two columns in the WHERE clause are not the same datatype and the
Oracle database returns an error when this statement is executed.
 */

-- RETURN no rows porque primero va 1000 a 1500
SELECT course_no, cost
FROM course
WHERE cost BETWEEN 1500 AND 1000;

--VERSION CORRECT
SELECT course_no, cost
FROM course
WHERE cost BETWEEN 1000 AND 1500;

--- BETWEEN AND TEXT LITERALS
SELECT  STUDENT_ID , LAST_NAME FROM STUDENT
WHERE  LAST_NAME BETWEEN  'W' AND 'Z';

--OTHER WISE
SELECT  STUDENT_ID , LAST_NAME
FROM STUDENT
WHERE  LAST_NAME BETWEEN  'W' AND 'Z'
OR LAST_NAME BETWEEN  'w' AND 'Z';


SELECT  DESCRIPTION FROM GRADE_TYPE WHERE
DESCRIPTION BETWEEN  'Midterm' and 'Project';
-- OTHERWISE
SELECT  DESCRIPTION FROM GRADE_TYPE  WHERE
DESCRIPTION>= 'Midterm' AND DESCRIPTION<= 'Project';

--Indica que soloq ueremos 10 rows gracias a ROWNUM
SELECT LAST_NAME  , STUDENT_ID FROM STUDENT WHERE  ROWNUM <=10;

SELECT  ROWNUM,   LAST_NAME  , STUDENT_ID FROM STUDENT WHERE  ROWNUM <=10;

-- 2.4.2 ANSWERS
---A) Write a SELECT statement to list descriptions of courses with prerequisites and cost less
--than 1100.
SELECT  DESCRIPTION , COST , PREREQUISITE FROM COURSE
WHERE PREREQUISITE  IS NOT  NULL AND COST <1100;

-- B) Write a SELECT statement to list the cost of courses without a prerequisite; do not
-- repeat the cost.
SELECT  DISTINCT  COST FROM COURSE WHERE  PREREQUISITE IS NULL ;


-- 2.5  THE ORDER BY CKAUSE
/*
By default, when the ORDER BY is used, the result set is sorted in ascending order; or you can be
explicit by adding the abbreviation ASC after the column. If descending order is desired, the
abbreviation DESC is used after the column in the ORDER BY clause:
 */

SELECT COURSE_NO , DESCRIPTION FROM  COURSE
WHERE PREREQUISITE IS NULL ORDER BY  DESCRIPTION ASC;

SELECT COURSE_NO , DESCRIPTION FROM  COURSE
WHERE PREREQUISITE IS NULL ORDER BY  DESCRIPTION DESC;

SELECT  COURSE_NO , DESCRIPTION FROM COURSE WHERE PREREQUISITE
IS NULL ORDER BY  1  DESC ;

SELECT  COURSE_NO , DESCRIPTION FROM COURSE WHERE PREREQUISITE
IS NULL ORDER BY  1  DESC ;

-- COLUMN ALIAS

SELECT  FIRST_NAME FIRST , FIRST_NAME "FIRST NAME" , FIRST_NAME AS "FIRST"
FROM STUDENT WHERE  ZIP ='10025';


-- DISTINCT AND ORDER BY
/*
 The ORDER BY clause often contains columns listed in the SELECT clause, but it is also possible to
ORDER BY columns that are not selected. One exception is columns qualified using the DISTINCT
keyword—if the SELECT list contains DISTINCT, the column(s) the keyword pertains to must also
be listed in the ORDER BY clause.
The next example shows that the STUDENT_ID column is not a column listed in the DISTINCT
SELECT list and therefore results in an Oracle error message.
 */

-- ERROR  SI USAMOS DISTINCT Y ORDER BY EL ORDER BY DEBE TENE UNA COLUMAN DDE DISTINC
SELECT  DISTINCT  FIRST_NAME  , LAST_NAME FROM
STUDENT WHERE  ZIP = '10025' ORDER BY STUDENT_ID;

SELECT  DISTINCT  FIRST_NAME  , LAST_NAME FROM
STUDENT WHERE  ZIP = '10025' ORDER BY FIRST_NAME;

-- null values  and order by
SELECT  DISTINCT  COST FROM COURSE
ORDER BY COST;

SELECT  DISTINCT  COST FROM COURSE
ORDER BY COST NULLS FIRST ;


-- 2.5 ANSWERS
-- Write a SELECT statement to list each city and zip code in New York or Connecticut. Sort
-- the result in ascending order by zip code.
SELECT city, zip FROM zipcode WHERE state = 'NY' OR state = 'CT'
ORDER BY zip;

--B  Write a SELECT statement to list course descriptions and their prerequisite course
--numbers, sorted in ascending order by description. Do not list courses without a
--prerequisite.
SELECT description, prerequisite FROM course WHERE prerequisite IS NOT NULL
ORDER BY description;

-- C Show the salutation, first, and last name of students with the last name Grant. Order
-- the result by salutation in descending order and the first name in ascending order.
SELECT salutation, first_name, last_name FROM student WHERE last_name = 'Grant'
ORDER BY salutation DESC, first_name ASC;

--- WHAT DO YOU OBSERVE ABOUT THE LAS ROW RETURNED BY THE QUERY
SELECT salutation, first_name, last_name
FROM student
WHERE last_name = 'Grant'
ORDER BY salutation DESC, first_name ASC;


/* CHARACTER 3 CHARACTER , NUMBER  AND MICELLANEOUS FUNCTIONS*/
/* THE LOWER FUNCTION*/
SELECT state, LOWER(state), LOWER('STATE')
FROM zipcode;

-- The Upper And Initcap Functions
SELECT UPPER(city), state, INITCAP(state)
FROM zipcode
WHERE zip = '10035';


--The LPAD and RPAD Functions
SELECT RPAD(city, 20, '*') "City Name",
LPAD(state, 10, '-') "State Name"
FROM zipcode;

SELECT LPAD (city, 20) AS "City Name"
FROM zipcode;


-- The Dual Table
DESCR dual;

--The LTRIM, RTRIM, and TRIM Functions
/*
LTRIM and RTRIM are the opposite of LPAD and RPAD because they trim, or remove, unwanted
characters, symbols, or spaces in strings. In this example, you see the use of the DUAL table to
trim the zero (0) from the left, the right, and both sides. If both the left and right sides of the string
are trimmed, you need to nest the function. The result of one function provides the input for the
other function.
 */

SELECT LTRIM('0001234500', '0') left,
RTRIM('0001234500', '0') right,
LTRIM(RTRIM('0001234500', '0'), '0') both
FROM dual;

/*
 The next example shows the use of LEADING, TRAILING, and BOTH (if neither LEADING nor
TRAILING is specified); the result is identical to the previous query:
 */
SELECT TRIM(LEADING '0' FROM '0001234500') leading,
TRIM(TRAILING '0' FROM '0001234500') trailing,
TRIM('0' FROM '0001234500') both
FROM dual;

--The SUBSTR Function
SELECT last_name,
SUBSTR(last_name, 1, 5),
SUBSTR(last_name, 6)
FROM student;

-- THE INSTR FUNCTION
-- INSTR, meaning in string, looks for the occurrence of a string inside another string, returning the
-- starting position of the search string within the target string. Unlike the other string functions,
-- INSTR does not return another string, but a number instead. This query displays course
-- descriptions and the position in which the first occurrence of the string 'er', if any, in the
-- DESCRIPTION column appears:
SELECT description, INSTR(description, 'er')
FROM course;

-- The lengt function pag 171
SELECT LENGTH('Hello there')
FROM dual;

--FUNCTIONS IN WHERE AND ORDER BY CLAUSES
SELECT first_name, last_name
FROM student
WHERE SUBSTR(last_name, 1, 2) = 'Mo';

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


---RESULT: John T.,T.,John
SELECT  FIRST_NAME , SUBSTR(FIRST_NAME , INSTR(FIRST_NAME, '.')-1) mi,
       SUBSTR(FIRST_NAME ,1, INSTR(FIRST_NAME , '.')-2) FIRST
FROM STUDENT WHERE  INSTR(FIRST_NAME , '.')>=3;


-- concatenation
SELECT   CONCAT( CITY , STATE) FROM  ZIPCODE
ORDER BY  STATE;

--The result set is difficult to read without spaces between cities and states. The CONCAT function
--takes only two parameters. By using the || operator, you can easily concatenate several strings:

SELECT   CITY || STATE  || ZIP  FROM  ZIPCODE;

SELECT  CITY || ', ' || STATE || ' '  || ZIP  FROM ZIPCODE;


--- REPLACE FUNCTION PAG 175;
SELECT REPLACE('My had is asleep' , 'had' , 'foot') from DUAL;

-- THE TRANSLATE FUNCTION
/*
Unlike REPLACE, which replaces an entire string, the TRANSLATE function provides a one-for-one
character substitution. For instance, it allows you to determine if all the phone numbers in the
STUDENT table follow the same format. In the next query, TRANSLATE substitutes the '#' character
for every character from '0' to '9'. Then the values are checked against the '###-###-####'
format.
*/
SELECT  PHONE FROM STUDENT WHERE TRANSLATE(PHONE , '0123456789' , '##########') <>
                                 '###-###-####';

--THE SOUNDEX FUNCTION
/*
The SOUNDEX function allows you compare differently spelled words that phonetically sound alike.
The next query uses the SOUNDEX function to display students where the last name sounds like
Martin.
*/
SELECT  STUDENT_ID , LAST_NAME FROM STUDENT
WHERE SOUNDEX(LAST_NAME) = SOUNDEX('MARTIN');

-- 3.1 Exercises
--Execute the following SQL statement. Based on the result, what is the purpose of the
--INITCAP function?

SELECT  DESCRIPTION "Description", INITCAP(DESCRIPTION) "Initcap Description"
FROM COURSE WHERE  DESCRIPTION LIKE  '%SQL%';

--Write the question answered by the following SQL statement.
SELECT  LAST_NAME FROM INSTRUCTOR WHERE  LENGTH(LAST_NAME)>=6;

--c) Describe the result of the following SQL statement. Pay particular attention to the
--negative number parameter.
SELECT  SUBSTR('12345' , 3), SUBSTR('123345', 3 , 2),
       SUBSTR('12345', -4 ,3) FROM DUAL;

--D) Based on the result of the following SQL statement, describe the purpose of the LTRIM
--and RTRIM functions.
SELECT  ZIP , LTRIM(ZIP , 'O') , RTRIM(ZIP , '4') FROM ZIPCODE
ORDER BY  ZIP;


--What do you observe when you execute the next statement? How would you change
--the statement to achieve the desired result?
--ERROR
SELECT  TRIM('01' FROM  '01230145601') FROM  DUAL;

SELECT  TRANSLATE('555-1212' , '0123456789' , '##########')
FROM  DUAL;


SELECT LTRIM('01230145601', '01') left,
RTRIM('01230145601', '01') right,
RTRIM(LTRIM('01230145601', '01'), '01') both,
REPLACE('01230145601', '01') replace
FROM dual;

SELECT TRANSLATE('555-1212', '0123456789',
'##########')
FROM dual;


--USING TRANSLATE FOR PATTERN SEARCH PAG 180
SELECT student_id, employer
FROM student
WHERE TRANSLATE(employer, '_', '+') LIKE '%B+B%';

--The Escape Character and the LIKE Operator
/*
 Yet another way to determine any such employers in the STUDENT table is with the escape
character functionality in conjunction with the LIKE operator. In the next example, the backslash (\)
sign is selected as the escape character to indicate that the underscore character following the
character is to be interpreted as a literal underscore and not as the wildcard underscore.

 */
SELECT  STUDENT_ID , EMPLOYER FROM STUDENT WHERE EMPLOYER
LIKE '%B\_B%' ESCAPE  '\';

SELECT (
LENGTH('Fred fed Ted bread, and Ted fed Fred bread.') -
LENGTH(REPLACE(
'Fred fed Ted bread, and Ted fed Fred bread.',
'ed', NULL))
) /2 AS occurr
FROM dual;