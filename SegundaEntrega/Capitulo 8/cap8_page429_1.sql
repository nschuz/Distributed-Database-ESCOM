
spool out\salida_pag425_1.txt
rem (Rischert,A(2004). Chapter 8. Set Operators
rem IN Oracle SQL by Example(424-444),USA: Prentice Hall 

set pagesize 130
set linesize 130
set colsep '|=|'
set feedback on
set null s/Dato

/*
	 Muestra los estudiantes o instructores y en la terecra columan type muestra su tipo instructor o estudiante
*/
SELECT first_name, last_name, 
 'Instructor' "Type" 
 FROM instructor 
 UNION 
SELECT first_name, last_name, 
 'Student' 
 FROM student;

spool off