rem [Rischert, 2002,329] 
set pagesize 99
set linesize 130
set null s/Datos
set colsep '|=|'
SET SQLNUMBER ON
col curso format 9999
col section_no format 9999
col description format a30
col location format a6

SELECT course.course_no curso, section_no, description, 
 location, instructor_id 
 FROM course, section 
 WHERE course.course_no = section.course_no
 order by 1,2;
 
rem filtrando tuplas 
rem [Rischert, 2002,330] 
SELECT c.course_no, s.section_no, c.description, 
 s.location, s.instructor_id 
 FROM course c, section s 
 WHERE c.course_no = s.course_no 
 AND c.description LIKE 'Intro to%';
 
rem NULLS and JOINS 
rem In an equijoin, a null value 
rem in the common column
rem  has the effect that 
rem the row is not included in the 
rem result.
set numwidth 10
col instructor_id format 9999
col zip           format A10
col last_name     format a10
col last_name     format a10
SELECT instructor_id, zip, last_name, first_name 
 FROM instructor 
 WHERE zip IS NULL;
 
 
rem Next, formulate the join 
rem to the ZIPCODE table via 
rem the ZIP column. Observe 
rem that instructor Irene 
rem Willig does not appear 
rem in the result.
 SELECT i.instructor_id, i.zip, i.last_name, i.first_name 
 FROM instructor i, zipcode z 
 WHERE i.zip = z.zip; 

rem incluyamos los nulos NO FUNCIONA
SELECT i.instructor_id, i.zip, i.last_name, i.first_name 
 FROM instructor i, zipcode z 
 WHERE i.zip = z.zip
   or i.zip is null; 

REM LEFT OUTER JOIN
SELECT i.instructor_id, i.zip, i.last_name, i.first_name 
 FROM instructor i, zipcode z 
 WHERE i.zip = z.zip(+); 
  
  
REM The USING Condition 
rem [Rischert, 2002,331]
COL LOCATION FORMAT A8
SELECT course_no, s.section_no, c.description, 
 s.location, s.instructor_id 
 FROM course c JOIN section s 
USING (course_no);

REM you can include the optional INNER keyword
SELECT course_no, s.section_no, c.description, 
 s.location, s.instructor_id 
 FROM course c INNER JOIN section s 
 USING (course_no);
 
 REM NO ACEPTA ALIAS.
  SELECT course_no, s.section_no, c.description, 
  s.location, s.instructor_id 
  FROM course c JOIN section s 
  USING (c.course_no);
 
  REM NO ACEPTA ALIAS.
  SELECT course_no, s.section_no, c.description, 
  s.location, s.instructor_id 
  FROM course c JOIN section s 
  USING (course_no);
  
  REM Cartesian Product 
  rem [Rischert, 2002,334]
  SELECT COUNT(*) 
 FROM section, instructor;
 
 SELECT COUNT(*) FROM SECTION;
 SELECT COUNT(*) FROM INSTRUCTOR;
 
 SELECT s.instructor_id s_instructor_id, 
 i.instructor_id i_instructor_id 
 FROM section s, instructor i;
   rem [Rischert, 2002,335]
 REM The ANSI Standard Cross-Join
 SELECT COUNT(*) 
 FROM section CROSS JOIN instructor;
 
 REM DESPLEGUEMOS 
 SELECT c.course_no, c.description, s.section_no 
 FROM course c, section s 
 WHERE c.course_no = s.course_no 
 AND c.prerequisite IS NULL 
 ORDER BY c.course_no, s.section_no;
 
 REM CAMBIUEMOS EL PREDICADO A NOT NULL
 SELECT c.course_no, c.description, s.section_no 
 FROM course c, section s 
 WHERE c.course_no = s.course_no 
 AND c.prerequisite IS NOT NULL 
 ORDER BY c.course_no, s.section_no;
 
 
 SELECT s.last_name, s.zip, z.state, z.city 
 FROM student s, zipcode z 
 WHERE s.zip = z.zip 
 ORDER BY s.zip;
 
REM If you choose the 
REM USING condition instead, 
REM do not alias the common column 
REM because this will cause 
REM  an error. 

SELECT s.last_name, zip, z.state, z.city 
 FROM student s JOIN zipcode z 
 USING (zip) 
 ORDER BY zip;
 
REM 
rem [Rischert, 2002,338]
SELECT s.first_name, s.last_name, s.student_id 
 FROM student s, enrollment e 
 WHERE s.student_id = e.student_id 
 ORDER BY s.last_name;
REM Note that student Salewa Zuckerberg with STUDENT_ID 184 
REM is returned three times. T 

REM , if you are not interested 
REM in the SECTION_ID and you want 
REM to only list the names without 
REM the duplication, 
REM use DISTINCT in the SELECT statement. 
COL last_name  format a12
SELECT DISTINCT s.first_name, s.last_name, s.student_id 
 FROM student s, enrollment e 
 WHERE s.student_id = e.student_id 
 ORDER BY s.last_name;
 
rem [Rischert, 2002,338]
SELECT s.first_name, s.last_name, s.student_id 
 FROM student s JOIN enrollment e 
 ON (s.student_id = e.student_id) 
 ORDER BY s.last_name;
rem [Rischert, 2002,339]
rem Or you may write the statement 
rem with the USING clause 
SELECT first_name, last_name, student_id 
 FROM student JOIN enrollment 
 USING (student_id) 
 ORDER BY last_name;
 
rem  This query includes both 
rem a join condition and a condition 
rem that restricts the rows 
rem to courses that have 
rem  no prerequisite
SELECT c.course_no, c.description, s.section_no 
 FROM course c, section s 
 WHERE c.course_no = s.course_no 
 AND c.prerequisite IS NULL 
 ORDER BY c.course_no, s.section_no;

rem  Select the student ID, 
rem course number, enrollment date,
rem  and section ID for students who 
rem enrolled in course number 
rem 20 on January 30, 2003
SELECT e.student_id, s.course_no, 
 TO_CHAR(e.enroll_date,'MM/DD/YYYY HH:MI PM'), 
 e.section_id 
 FROM enrollment e JOIN section s 
 ON (e.section_id = s.section_id) 
 WHERE s.course_no = 20 
 AND e.enroll_date >= TO_DATE('01/30/2003','MM/DD/YYYY') 
 AND e.enroll_date < TO_DATE('01/31/2003','MM/DD/YYYY');
 
rem Alternatively, you can use the
rem  USING clause 
SELECT e.student_id, s.course_no, 
 TO_CHAR(e.enroll_date,'MM/DD/YYYY HH:MI PM'), 
 section_id 
 FROM enrollment e  JOIN section s 
 using (section_id)  
 WHERE course_no = 20 
 AND e.enroll_date >= TO_DATE('01/30/2003','MM/DD/YYYY') 
 AND e.enroll_date < TO_DATE('01/31/2003','MM/DD/YYYY');


rem or the more 
rem traditional join syntax, 
rem listed here.



SELECT e.student_id, s.course_no, 
 TO_CHAR(e.enroll_date,'MM/DD/YYYY HH:MI PM'), 
 e.section_id 
 FROM enrollment e, section s 
 WHERE e.section_id = s.section_id 
 AND s.course_no = 20 
 AND e.enroll_date >= TO_DATE('01/30/2003','MM/DD/YYYY') 
 AND e.enroll_date < TO_DATE('01/31/2003','MM/DD/YYYY');
 
 rem 
 SELECT s.student_id, i.instructor_id, 
 s.zip, i.zip 
 FROM student s, instructor i 
 WHERE s.zip = i.zip 
 ORDER BY s.student_id, i.instructor_id; 
 
 
 SELECT student_id, zip 
 FROM student 
 WHERE zip = '10025';

SELECT instructor_id, zip 
 FROM instructor 
 WHERE zip = '10025';

rem [Rischert, 2002,343]
rem Find the error(s) in the following SQL statement. 
 SELECT stud.last_name, stud.first_name, 
 stud.zip, zip.zip, zip.state, zip.city, 
 TO_CHAR(stud.student_id) 
 FROM student stud, zipcode zip 
 WHERE stud.student_id = 102 
 AND zip.zip = '11419' 
 AND zip.zip = s.zip;
 
 
 col cadena format a15
  SELECT stud.last_name, stud.first_name, 
 stud.zip, zip.zip, zip.state, zip.city, 
 TO_CHAR(stud.student_id) cadena
 FROM student stud, zipcode zip 
 WHERE stud.student_id = 102 
 AND zip.zip = '11419' 
 AND zip.zip = stud.zip;
 
 rem [Rischert, 2002,343]
SELECT s.*, zipcode.zip, 
 DECODE(s.last_name, 'Smith', szip, 
 UPPER(s.last_name)) 
 FROM student s, zipcode 
 WHERE stud.zip = zipcode.zip 
 AND s.last_name LIKE 'Smi%';
 
 
 SELECT s.*, zipcode.zip, 
 DECODE(s.last_name, 'Smith', s.zip, 
 UPPER(s.last_name)) 
 FROM student s, zipcode 
 WHERE s.zip = zipcode.zip 
 AND s.last_name LIKE 'Smi%';
 
  SELECT s.* 
 FROM student s, zipcode 
 WHERE s.zip = zipcode.zip 
 AND s.last_name LIKE 'Smi%';
 
REM  Find the error(s) in the following SQL statement. 
 rem [Rischert, 2002,345]
SELECT TO_CHAR(w.modified_date, 'dd-mon-yyyy'), 
  t.grade_type_code, description, 
  TO_NUMBER(TO_CHAR(number_per_section)) 
  FROM grade_type t, grade_type_weight w 
  WHERE t.grade_type_code = w.grade_type_cd 
  AND ((t.grade_type_code = 'MT' 
  OR t.grade_type_code = 'HM')) 
  AND t.modified_date >= 
  TO_DATE('01-JAN-2003', 'DD-MON-YYYY'); 
  
 COL CADENA2  FORMAT A28 
 COL NUMERO   FORMAT 999999
SELECT TO_CHAR(w.modified_date, 'dd-mon-yyyy') CADENA2, 
  t.grade_type_code, description, 
  TO_NUMBER(TO_CHAR(number_per_section)) NUMERO  
  FROM grade_type t, grade_type_weight w 
  WHERE t.grade_type_code = w.grade_type_code 
  AND ((t.grade_type_code = 'MT' 
  OR t.grade_type_code = 'HM')) 
  AND t.modified_date < 
  TO_DATE('01-ENE-2003', 'DD-MON-YYYY');
  
REM Lab 6.2 Joining Three Or More Tables
rem [Rischert, 2002,347]
SELECT c.course_no, s.section_no, c.description, s.location, 
 s.instructor_id, i.last_name, i.first_name
 FROM course c, section s, instructor i
 WHERE c.course_no = s.course_no 
 AND s.instructor_id = i.instructor_id;
 
 rem [Rischert, 2002,347]
 SELECT c.course_no, s.section_no, c.description, s.location, 
 s.instructor_id, i.last_name, i.first_name
 FROM course c JOIN section s 
 ON (c.course_no = s.course_no) 
 JOIN instructor i
 ON (s.instructor_id = i.instructor_id);

rem [Rischert, 2002,349]
SELECT course_no, s.section_no, c.description, s.location, 
 instructor_id, i.last_name, i.first_name
 FROM course c JOIN section s 
 USING (course_no) 
 JOIN instructor i
USING (instructor_id);

rem [Rischert, 2002,350]
SELECT g.student_id, g.section_id, 
 g.grade_type_code type, 
 g.grade_code_occurrence no, 
 g.numeric_grade indiv_gr,
 TO_CHAR(e.enroll_date, 'MM/DD/YY') enrolldt
 FROM grade g, enrollment e
 WHERE g.student_id = 220 
 AND g.section_id = 119 
 AND g.student_id = e.student_id
 AND g.section_id = e.section_id;
 
 
REM Expressing Multicolumn Joins Using The ANSI JOIN Syntax 
SELECT g.student_id, g.section_id, 
 g.grade_type_code type, 
 g.grade_code_occurrence no, 
 g.numeric_grade indiv_gr, 
 TO_CHAR(e.enroll_date, 'MM/DD/YY') enrolldt 
 FROM grade g JOIN enrollment e 
 ON (g.student_id = e.student_id 
 AND g.section_id = e.section_id) 
 WHERE g.student_id = 220 
 AND g.section_id = 119;
 
 rem [Rischert, 2002,351]
 SELECT student_id, section_id, 
 grade_type_code type, 
 grade_code_occurrence no, 
 numeric_grade indiv_gr, 
 TO_CHAR(enroll_date, 'MM/DD/YY') enrolldt 
 FROM grade JOIN enrollment 
 USING (student_id, section_id) 
 WHERE student_id = 220 
 AND section_id = 119;
 
 
rem [Rischert, 2002,355]
REM  Produce the mailing addresses for instructors
REM  who taught sections starting in June 2003.
rem nswer: This solution requires the join of three tables:
rem  You join the INSTRUCTOR, 
rem SECTION, and ZIPCODE tables to produce the mailing list
COL NOMBRE FORMAT A30
COL street_address format a20
SELECT i.first_name || ' ' ||i.last_name  NOMBRE, 
 i.street_address, z.city || ', ' || z.state 
 || ' ' || i.zip "City State Zip", 
 TO_CHAR(s.start_date_time, 'MM/DD/YY') start_dt, 
 section_id sect 
 FROM instructor i, section s, zipcode z 
 WHERE i.instructor_id = s.instructor_id 
 AND i.zip = z.zip 
 AND s.start_date_time >= 
 TO_DATE('01-JUN-2003','DD-MON-YYYY') 
 AND s.start_date_time < 
 TO_DATE('01-JUL-2003','DD-MON-YYYY');
