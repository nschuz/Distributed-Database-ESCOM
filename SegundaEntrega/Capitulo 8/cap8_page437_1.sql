
spool out\salida_pag437_1.txt
rem (Rischert,A(2004). Chapter 8. Set Operators
rem IN Oracle SQL by Example(424-444),USA: Prentice Hall 

set pagesize 130
set linesize 130
set colsep '|=|'
set feedback on
set null s/Dato

/*
El operador INTERSECT determina los valores comunes entre dos conjuntos.
*/

SELECT created_by 
 FROM enrollment 
INTERSECT 
SELECT created_by 
 FROM course;

spool off