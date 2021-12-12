
spool out\salida_pag425_2.txt
rem (Rischert,A(2004). Chapter 8. Set Operators
rem IN Oracle SQL by Example(424-444),USA: Prentice Hall 

set pagesize 130
set linesize 130
set colsep '|=|'
set feedback on
set null s/Dato


/*
	Hace un conteo e imprime solo los duplicados
*/

SELECT first_name, last_name, phone, COUNT(*) 
 FROM student 
 GROUP BY first_name, last_name, phone 
HAVING COUNT(*) > 1;

 
spool off