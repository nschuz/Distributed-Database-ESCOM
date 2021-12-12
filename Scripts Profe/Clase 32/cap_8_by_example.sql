SPOOL  C:\Users\ORA_bases\2021_02_24_clase_2\salida\cap8_by_example_sets.sql
set pagesize 130
set linesize 130
set colsep '|=|'
set feedback on
set null s/Dato

rem [ Rischert,2004, 424]
SELECT first_name, last_name, phone 
 FROM instructor 
 UNION 
SELECT first_name, last_name, phone 
 FROM student;
 
 
rem desc student  & instructor 
rem combiemos una columna
desc student
desc instructor


SELECT first_name, phone,  last_name
 FROM instructor 
 UNION 
SELECT first_name, last_name, phone 
 FROM student;
 
rem The following query shows duplicate rows in the STUDENT 
rem   table.

rem  [ Rischert,2004,425] 
SELECT first_name, last_name, phone, COUNT(*) 
 FROM student 
 GROUP BY first_name, last_name, phone 
HAVING COUNT(*) > 1;

rem  [ Rischert,2004,425]
SELECT first_name, last_name, phone 
 FROM instructor 
 UNION ALL 
SELECT first_name, last_name, phone 
 FROM student;
 
 rem  con operacion de conjuntos 
 rem  los duplicados
 rem  [ Rischert,2004,426]
 
 SELECT first_name, last_name, phone 
 FROM instructor 
 minus 
SELECT first_name, last_name, phone 
 FROM student;

rem order by 
/*
Consider what happens if you add 
the instructor and student IDs to the 
previous example using UNION 
and order the results by 
the LAST_NAME column:
*/
 rem    [ Rischert,2004,426]
 
SELECT instructor_id id, first_name, last_name, phone 
 FROM instructor 
 UNION 
SELECT student_id, first_name, last_name, phone 
 FROM student 
 ORDER BY 3;
 
  rem    [ Rischert,2004,427]
 rem con operador minus
 SELECT instructor_id id, first_name, last_name, phone 
 FROM instructor 
 minus 
SELECT student_id, first_name, last_name, phone 
 FROM student 
 ORDER BY 3;
 
 rem explain el siguiente resultado
  rem    [ Rischert,2004,427]
 SELECT first_name, last_name, 
 'Instructor' "Type" 
 FROM instructor 
 UNION 
SELECT first_name, last_name, 
 'Student' 
 FROM student;
 
  rem    [ Rischert,2004,427]
  rem con operacion minus siguiente resultado
 SELECT first_name, last_name, 
   'Instructor' "Type" 
   FROM instructor 
 minus 
    SELECT first_name, last_name, 
   'Student' 
    FROM student;
 
rem    [ Rischert,2004,429]
rem explain el siguiente resultado
rem  con order by 1,2
 SELECT first_name, last_name, 
 'Instructor' "Type" 
 FROM instructor 
 UNION 
 SELECT first_name, last_name, 
 'Student' 
 FROM student
 order by 1,2;
 
 
 rem    [ Rischert,2004,427]
SELECT course_no, description 
	FROM course 
	WHERE prerequisite IS NOT NULL 
	ORDER BY 1 
 UNION 
SELECT course_no, description 
	FROM course 
	WHERE prerequisite IS NULL;
	
SELECT course_no, description 
	FROM course 
	WHERE prerequisite IS NOT NULL  
 UNION 
SELECT course_no, description 
	FROM course 
	WHERE prerequisite IS NULL;
rem 

SELECT course_no, description, prerequisite
	FROM course 
	ORDER BY 1;	
	
SELECT course_no, description, prerequisite
	FROM course 
	ORDER BY 3;	
	
REM    [ Rischert,2004, 433]	
SELECT course_no, description 
	FROM course 
	WHERE prerequisite IS NOT NULL  
 UNION 
SELECT course_no, description 
	FROM course 
	WHERE prerequisite IS NULL;
 
 rem por partes 
 SELECT course_no, description 
	FROM course 
	WHERE prerequisite IS NOT NULL ;
	
rem   segunda parte
SELECT course_no, description 
	FROM course 
	WHERE prerequisite IS NULL;
	
rem 
rem  What is wrong with the following set operation, and what do you have to change to 
rem  make it work correctly? 
SELECT instructor_id, last_name 
 FROM instructor 
 UNION 
SELECT last_name, student_id 
 FROM student;
 
 REM    [ Rischert,2004, 440]
 rem Controlling The Sort Order

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
 
 
 rem otro escenario no funciona
 SELECT created_by, 'GRADE' AS SOURCE, 1 AS SORT_ORDER 
 FROM grade 
 order by 3
 UNION 
SELECT created_by, 'GRADE_TYPE', 2 
 FROM grade_type 
 UNION 
SELECT created_by, 'GRADE_CONVERSION', 3 
 FROM grade_conversion 
 UNION 
SELECT created_by, 'ENROLLMENT', 4 
 FROM enrollment;
 
--  ORDER BY 3;

 REM    [ Rischert,2004, 433]
Rem  Datatype Conversions And Nulls
col salutation format a12
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
 
 rem con el operador union
 SELECT DISTINCT salutation, CAST(NULL AS NUMBER), 
 state, z.created_date 
 FROM instructor i, zipcode z 
 WHERE i.zip = z.zip 
UNION  
SELECT salutation, COUNT(*), 
 state, TO_DATE(NULL) 
 FROM student s, zipcode z 
 WHERE s.zip = z.zip 
 GROUP BY salutation, state;
 
 rem ejecucion parcial
 SELECT salutation, CAST(NULL AS NUMBER), 
 state, z.created_date 
 FROM instructor i, zipcode z 
 WHERE i.zip = z.zip;
 
rem 
rem The following set operation
rem lists instructors not currently teaching any classes (sections). 
rem   [     ,434]

SELECT instructor_id 
 FROM instructor 
 MINUS 
SELECT instructor_id 
 FROM section;
 
 REM    [ Rischert,2004, 440]
 rem The INTERSECT Operator
 SELECT created_by 
 FROM enrollment 
INTERSECT 
SELECT created_by 
 FROM course;
 
  SELECT created_by 
 FROM enrollment 
union  
SELECT created_by 
 FROM course;
 


rem Here is an 
rem equijoin that returns a list of course numbers 
rem for courses with corresponding sections:
 rem INTERSECT Instead Of EQUIJOINS
 SELECT DISTINCT c.course_no 
 FROM course c, section s 
 WHERE c.course_no = s.course_no;
 
  SELECT  c.course_no 
 FROM course c, section s 
 WHERE c.course_no = s.course_no;
 
   SELECT  c.course_no 
 FROM course c, section s; 
 WHERE c.course_no = s.course_no;
 
 REM    [ Rischert,2004, 436]
rem This INTERSECT set operation 
rem returns the same result: 
 SELECT course_no 
 FROM course 
INTERSECT 
SELECT course_no 
 FROM section;
 
rem Execution Order Of Set Operations
REM    [ Rischert,2004, 436]
SELECT col1 
 FROM t1 
UNION ALL 
SELECT col2 
 FROM t2 
MINUS 
SELECT col3 
 FROM t3;
 
 
REM You use parentheses to indicate 
REM a change the execution order as 
REM in the next following example
REM    [ Rischert,2004, 437]
SELECT col1 
 FROM t1 
UNION ALL 
(SELECT col2 
 FROM t2 
MINUS 
SELECT col3 
 FROM t3);
 
 
REM   [ Rischert,2004, 437]
SELECT course_no, description 
 FROM course 
 MINUS 
SELECT s.course_no, c.description 
 FROM section s, course c 
 WHERE s.course_no = c.course_no;
 
REM    [ Rischert,2004, 440]
REM EJECUTANDO POR PARTES

SELECT course_no, description 
 FROM course;
 

SELECT s.course_no, c.description 
 FROM section s, course c 
 WHERE s.course_no = c.course_no;
 
 REM    [Rischert,2004,441]
 SELECT course_no, description 
 FROM course c 
 WHERE NOT EXISTS 
 (SELECT '*' 
 FROM section 
 WHERE c.course_no = course_no);
 
 
  REM    [Rischert,2004,441]
 SELECT course_no, section_no, 'No Enrollments' "Status" 
 FROM section 
 MINUS 
SELECT course_no, section_no, 'No Enrollments' 
 FROM section s 
 WHERE EXISTS (SELECT section_id 
 FROM enrollment e 
 WHERE e.section_id = s.section_id) 
 ORDER BY 1, 2;
 
 SPOOL OFF
 
 
 
 
 
 
 
 
 
 


 