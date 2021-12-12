
spool out\salida_pag442_2.txt
rem (Rischert,A(2004). Chapter 8. Set Operators
rem IN Oracle SQL by Example(424-444),USA: Prentice Hall 

set pagesize 130
set linesize 130
set colsep '|=|'
set feedback on
set null s/Dato

/*
Mueestra todos los estudianstes inscritos
*/

SELECT student_id 
 FROM student 
INTERSECT 
SELECT student_id 
 FROM enrollment;

spool of