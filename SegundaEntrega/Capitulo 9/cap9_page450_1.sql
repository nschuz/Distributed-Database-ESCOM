
spool out\salida_pag450_1.txt
rem (Rischert,A(2004). Chapter 9. Set Operators
rem IN Oracle SQL by Example(446 - 476),USA: Prentice Hall 

set pagesize 130
set linesize 130
set colsep '|=|'
SET SQLNUMBER ON
col curso format 9999
col section_no format 9999
col description format a30
col location format a6

/* Podemos aplicar outher join en oracle con el operador (+)*/

SELECT c.course_no, c.description, 
s.section_id, s.course_no 
FROM course c, section s 
WHERE c.course_no = s.course_no(+)
ORDER BY c.course_no;

SELECT c.course_no, c.description, 
s.section_id, s.course_no 
FROM course c, section s 
WHERE c.course_no (+) = s.course_no
ORDER BY c.course_no;




spool off