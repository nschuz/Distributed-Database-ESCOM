
spool out\salida_pag429_2.txt
rem (Rischert,A(2004). Chapter 8. Set Operators
rem IN Oracle SQL by Example(424-444),USA: Prentice Hall 

set pagesize 130
set linesize 130
set colsep '|=|'
set feedback on
set null s/Dato

/*
	 Muestra solo los instructores
*/
SELECT first_name, last_name, 
 'Instructor' "Type" 
 FROM instructor 
 minus
SELECT first_name, last_name, 
 'Student' 
 FROM student;

spool off