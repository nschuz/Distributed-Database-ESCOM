
spool out\salida_pag429_3.txt
rem (Rischert,A(2004). Chapter 8. Set Operators
rem IN Oracle SQL by Example(424-444),USA: Prentice Hall 

set pagesize 130
set linesize 130
set colsep '|=|'
set feedback on
set null s/Dato

/*
	 Muestra todos los zip eliminando duplicados
*/
SELECT zip 
 FROM instructor 
 UNION 
SELECT zip 
 FROM student;

spool off