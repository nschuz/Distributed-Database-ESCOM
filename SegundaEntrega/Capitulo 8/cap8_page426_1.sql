
spool out\salida_pag425_1.txt
rem (Rischert,A(2004). Chapter 8. Set Operators
rem IN Oracle SQL by Example(424-444),USA: Prentice Hall 

set pagesize 130
set linesize 130
set colsep '|=|'
set feedback on
set null s/Dato

/*
	 devuelve los registros de la tabla instructor
	 que no se encuentran en la tabla student
*/
SELECT first_name, last_name, phone 
FROM instructor 
minus 
SELECT first_name, last_name, phone 
FROM student;

spool off