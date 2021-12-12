spool out\salida_pag347_1.txt
rem (Rischert,A(2004). Chapter 6. EquiJoins 
rem IN Oracle SQL by Example(326-363),USA: Prentice Hall 

set pagesize 99
set linesize 130
set colsep '|=|'
SET SQLNUMBER ON
col curse_no format 9999
col section_no format 9999
col instructor_id format 9999
col description format a15
col location format a8




/* JOIN Con tres tablas */

SELECT c.course_no, s.section_no, c.description, s.location, 
s.instructor_id, i.last_name, i.first_name
FROM course c, section s, instructor i
WHERE c.course_no = s.course_no 
AND s.instructor_id = i.instructor_id;

/* ANSI JOIN */

SELECT c.course_no, s.section_no, c.description, s.location, 
s.instructor_id, i.last_name, i.first_name
FROM course c JOIN section s 
ON (c.course_no = s.course_no) 
JOIN instructor i
ON (s.instructor_id = i.instructor_id);


SELECT course_no, s.section_no, c.description, s.location, 
instructor_id, i.last_name, i.first_name
FROM course c JOIN section s 
USING (course_no) 
JOIN instructor i
USING (instructor_id);


spool off

