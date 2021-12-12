
spool out\salida_pag330_2.txt
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
Proyecta todas la filas de la tbla SECTION y COURSE con los valores COURSE_NO coincidentes.
SI limitamos los critecrios podemos utilizar Whre donde la columna Descripcion inicia con 
Introduccion a
*/
SELECT c.course_no, s.section_no, c.description, 
 s.location, s.instructor_id 
 FROM course c, section s 
 WHERE c.course_no = s.course_no 
 AND c.description LIKE 'Intro to%'; 
 
spool off