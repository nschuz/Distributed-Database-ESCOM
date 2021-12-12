
spool out\salida_pag440_1.txt
rem (Rischert,A(2004). Chapter 8. Set Operators
rem IN Oracle SQL by Example(424-444),USA: Prentice Hall 

set pagesize 130
set linesize 130
set colsep '|=|'
set feedback on
set null s/Dato

/*
La operación de conjunto resta todos los cursos que tienen secciones de todos los cursos, lo que da como resultado los dos cursos sin secciones coincidentes
*/

SELECT course_no, description 
 FROM course 
 MINUS 
SELECT s.course_no, c.description 
 FROM section s, course c 
 WHERE s.course_no = c.course_no ;

spool of