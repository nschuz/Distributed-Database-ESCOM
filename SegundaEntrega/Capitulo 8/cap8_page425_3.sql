
spool out\salida_pag425_1.txt
rem (Rischert,A(2004). Chapter 8. Set Operators
rem IN Oracle SQL by Example(424-444),USA: Prentice Hall 

set pagesize 130
set linesize 130
set colsep '|=|'
set feedback on
set null s/Dato


/*
Union All muestra los duplicados 
*/

SELECT first_name, last_name, phone 
FROM instructor 
UNION ALL 
SELECT first_name, last_name, phone 
FROM student;

spool off