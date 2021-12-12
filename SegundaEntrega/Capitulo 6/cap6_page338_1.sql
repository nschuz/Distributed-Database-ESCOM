
spool out\salida_pag338_1.txt
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



/*
Selecciona el nombre y apellido de todos los estudiantes inscritos y ordena por apellido en orden ascendente
*/

SELECT s.first_name, s.last_name, s.student_id 
FROM student s, enrollment e 
WHERE s.student_id = e.student_id 
ORDER BY s.last_name;

/* 
Un estudiante pude esatr escrito en distintas secciones
*/
SELECT DISTINCT s.first_name, s.last_name, s.student_id 
FROM student s, enrollment e 
WHERE s.student_id = e.student_id 
ORDER BY s.last_name;


SELECT s.first_name, s.last_name, s.student_id 
FROM student s JOIN enrollment e 
ON (s.student_id = e.student_id) 
ORDER BY s.last_name;

/* 
Desventaja de utilizar using es no poder utilizar alias
*/
SELECT first_name, last_name, student_id 
FROM student JOIN enrollment 
USING (student_id) 
ORDER BY last_name 


spool off