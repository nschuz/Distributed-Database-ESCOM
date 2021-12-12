
spool out\salida_pag340_1.txt
rem (Rischert,A(2004). Chapter 6. EquiJoins 
rem IN Oracle SQL by Example(326-363),USA: Prentice Hall 

set pagesize 99
set linesize 130
set null s/Datos
set colsep '|=|'
SET SQLNUMBER ON
col curso format 9999
col section_no format 9999
col description format a30
col location format a6



/* */

SELECT e.student_id, s.course_no, 
TO_CHAR(e.enroll_date,'MM/DD/YYYY HH:MI PM'), 
e.section_id 
FROM enrollment e JOIN section s 
ON (e.section_id = s.section_id) 
WHERE s.course_no = 20 
AND e.enroll_date >= TO_DATE('01/30/2003','MM/DD/YYYY') 
AND e.enroll_date < TO_DATE('01/31/2003','MM/DD/YYYY');

SELECT e.student_id, s.course_no, 
TO_CHAR(e.enroll_date,'MM/DD/YYYY HH:MI PM'), 
e.section_id 
FROM enrollment e, section s 
WHERE e.section_id = s.section_id 
AND s.course_no = 20 
AND e.enroll_date >= TO_DATE('01/30/2003','MM/DD/YYYY') 
AND e.enroll_date < TO_DATE('01/31/2003','MM/DD/YYYY');

spool off