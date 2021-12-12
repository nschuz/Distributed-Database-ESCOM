
spool out\salida_pag333_2.txt
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
Natural  joins une tablas con el mismo nombre columnas y mismo datatype USING y ON no son permitidos 
*/

SELECT course_no, s.section_no, c.description, 
 s.location, s.instructor_id 
 FROM course c NATURAL JOIN section s;

spool off