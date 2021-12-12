spool out\salida_pag341_1.txt
rem (Rischert,A(2004). Chapter 6. EquiJoins 
rem IN Oracle SQL by Example(326-363),USA: Prentice Hall 

set pagesize 99
set linesize 130
set null s/Datos
set colsep '|=|'
SET SQLNUMBER ON
col curso format 9999
col section_no format 9999
col description format a30
col location format a6



/* Producto Cartesiano  Existe una relacio Muchos a Muchos*/

SELECT s.student_id, i.instructor_id, 
s.zip, i.zip 
FROM student s, instructor i 
WHERE s.zip = i.zip 
ORDER BY s.student_id, i.instructor_id;



spool off

