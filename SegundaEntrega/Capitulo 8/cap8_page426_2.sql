
spool out\salida_pag426_1.txt
rem (Rischert,A(2004). Chapter 8. Set Operators
rem IN Oracle SQL by Example(424-444),USA: Prentice Hall 

set pagesize 130
set linesize 130
set colsep '|=|'
set feedback on
set null s/Dato

/*
	combina los resultados de ambas consultas regresando
	el conjunto de todas las filas que pertenecen a 
	las consultas en la Unión. Order by hace referencia a la posicion de la columna
*/
SELECT instructor_id id, first_name, last_name, phone 
 FROM instructor 
 UNION 
SELECT student_id, first_name, last_name, phone 
 FROM student 
 ORDER BY 3;


spool off