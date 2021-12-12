
spool out\salida_pag437_2.txt
rem (Rischert,A(2004). Chapter 8. Set Operators
rem IN Oracle SQL by Example(424-444),USA: Prentice Hall 

set pagesize 130
set linesize 130
set colsep '|=|'
set feedback on
set null s/Dato

/*
La equijoin produce un conjunto de resultados que es la intersección de dos o más tablas, el mismo resultado que con INTERSECT.
*/

SELECT DISTINCT c.course_no 
FROM course c, section s 
WHERE c.course_no = s.course_no;

SELECT course_no 
 FROM course 
INTERSECT 
SELECT course_no 
 FROM section;


spool off