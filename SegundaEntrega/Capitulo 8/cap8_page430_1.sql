
spool out\salida_pag425_1.txt
rem (Rischert,A(2004). Chapter 8. Set Operators
rem IN Oracle SQL by Example(424-444),USA: Prentice Hall 

set pagesize 130
set linesize 130
set colsep '|=|'
set feedback on
set null s/Dato

/*
crea una lista de usuarios que crearon filas en las tablas ENROLLMENT, GRADE, GRADE_TYPE y GRADE_CONVERSION. Mostrar cada nombre de usuario solo una vez
*/
SELECT created_by 
 FROM enrollment 
 UNION 
SELECT created_by 
 FROM grade 
 UNION 
SELECT created_by 
 FROM grade_type 
 UNION 
SELECT created_by 
 FROM grade_conversion;

spool off