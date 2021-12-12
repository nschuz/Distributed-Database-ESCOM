
spool out\salida_pag332_2.txt
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



/*Ecuntra el error: el campo comun en el select va sin el operador punto*/
SELECT c.course_no, s.section_no, c.description, 
s.location, s.instructor_id 
FROM course c JOIN section s 
USING (course_no) 

spool off