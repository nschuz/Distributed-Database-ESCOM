
spool out\salida_pag434_1.txt
rem (Rischert,A(2004). Chapter 8. Set Operators
rem IN Oracle SQL by Example(424-444),USA: Prentice Hall 

set pagesize 130
set linesize 130
set colsep '|=|'
set feedback on
set null s/Dato

/*
El operador de conjunto MENOS resta un conjunto de datos de otro, identificando qué datos existen en una tabla pero no en la otra
*/

SELECT instructor_id 
 FROM instructor 
 MINUS 
SELECT instructor_id 
 FROM section;

spool off