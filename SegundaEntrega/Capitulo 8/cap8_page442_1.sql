
spool out\salida_pag442_1.txt
rem (Rischert,A(2004). Chapter 8. Set Operators
rem IN Oracle SQL by Example(424-444),USA: Prentice Hall 

set pagesize 130
set linesize 130
set colsep '|=|'
set feedback on
set null s/Dato

/*
INTERSECT  encuentra la intersección de distintos códigos postales en las tablas INSTRUCTOR y ESTUDIANTE
*/

SELECT zip 
 FROM instructor 
INTERSECT 
SELECT zip 
 FROM student;

spool of