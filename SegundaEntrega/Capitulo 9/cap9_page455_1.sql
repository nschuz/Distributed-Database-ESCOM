
spool out\salida_pag451_1.txt
rem (Rischert,A(2004). Chapter 9. Set Operators
rem IN Oracle SQL by Example(446 - 476),USA: Prentice Hall 

set pagesize 130
set linesize 130
set colsep '|=|'
SET SQLNUMBER ON
col curso format 9999
col section_no format 9999
col description format a30
col location format a6
/* 
Para itilizar el simbolo (+) como outher join solo puede ir en una lado de la escuacion
*/
rem Explica que pasa
SELECT c.course_no, s.course_no, s.section_id, 
 c.description, s.start_date_time 
 FROM course c, section s 
 WHERE c.course_no(+) = s.course_no(+) 




spool off