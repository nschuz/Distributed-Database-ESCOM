
spool out\salida_pag339_1.txt
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
Esta consulta incluye una condición de combinación y una condición que restringe las filas a cursos que no tienen requisitos previos. El resultado está ordenado por el número de curso y el número de sección.
*/

SELECT c.course_no, c.description, s.section_no 
FROM course c, section s 
WHERE c.course_no = s.course_no 
AND c.prerequisite IS NULL 
ORDER BY c.course_no, s.section_no ;


SELECT c.course_no, c.description, s.section_no 
FROM course c JOIN section s 
ON (c.course_no = s.course_no) 
WHERE c.prerequisite IS NULL 
ORDER BY c.course_no, section_no ;


spool off