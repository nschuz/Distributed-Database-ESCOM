spool out\cap8byexample.txt
rem Rischert, A(2004).Chapter 8. SQL: Set Operators
rem IN Oracle SQL by Example(423-445),USA: prentice hall
SELECT first_name, last_name,
       'Instructor' "Type"
  FROM instructor
 UNION
SELECT first_name, last_name,
       'Student'
  FROM student; 

SELECT created_by
  FROM enrollment
 UNION
SELECT created_by 
  FROM grade 
 UNION
SELECT created_by
  FROM grade_type
 UNION
SELECT created_by
  FROM grade_conversion;

SELECT created_by, 'GRADE' AS SOURCE, 1 AS SORT_ORDER
  FROM grade
 UNION
SELECT created_by, 'GRADE_TYPE', 2
  FROM grade_type
 UNION
SELECT created_by, 'GRADE_CONVERSION', 3
  FROM grade_conversion
 UNION
SELECT created_by, 'ENROLLMENT', 4
  FROM enrollment
 ORDER BY 3;

SELECT DISTINCT salutation, CAST(NULL AS NUMBER),
       state, z.created_date
  FROM instructor i, zipcode z
 WHERE i.zip = z.zip
UNION ALL
SELECT salutation, COUNT(*),
       state, TO_DATE(NULL)
  FROM student s, zipcode z
 WHERE s.zip = z.zip
 GROUP BY salutation, state;

SELECT course_no, description
  FROM course
 MINUS
SELECT s.course_no, c.description
  FROM section s, course c 
 WHERE s.course_no = c.course_no;

spool off
