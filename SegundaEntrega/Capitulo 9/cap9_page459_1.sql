
spool out\salida_pag451_1.txt
rem (Rischert,A(2004). Chapter 9. Set Operators
rem IN Oracle SQL by Example(446 - 476),USA: Prentice Hall 

set pagesize 130
set linesize 150
set colsep '|=|'
SET SQLNUMBER ON
col cno format 9999
col sno format 9999
col description format A12
col loc format A9


/* 
Para itilizar el simbolo (+) como outher join solo puede ir en una lado de la escuacion
*/
SELECT c.course_no cno, s.course_no sno,
c.description,
c.prerequisite prereq,
s.location loc, s.section_id
FROM course c LEFT OUTER JOIN section s
ON c.course_no = s.course_no
WHERE c.prerequisite = 350;

SELECT c.course_no, c.description 
 FROM course c, section s 
 WHERE c.course_no = s.course_no(+) 
 AND s.course_no IS NULL ;



spool off