
spool out\salida_pag447_1.txt
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

/* Algunos cursos no se incluyen en el resultado porque no hay números de curso coincidentes en la tabla de SECCIÓN. */

SELECT course_no, description, 
 section_id 
 FROM course JOIN section 
 USING (course_no) 
 ORDER BY course_no;

/* 
La combinación externa muestra valores nulos para las columnas s.course_no y s.section_id donde no existe una coincidencia.
*/

SELECT c.course_no, c.description, 
 s.section_id, s.course_no 
 FROM course c LEFT OUTER JOIN section s 
 ON c.course_no = s.course_no 
 ORDER BY c.course_no;

/* Es el mismo resultado  que el anterior solo cambia el orden */
SELECT c.course_no, c.description, 
 s.section_id, s.course_no 
 FROM section s RIGHT OUTER JOIN course c 
 ON c.course_no = s.course_no 
 ORDER BY c.course_no;


 SELECT c.course_no, c.description, 
 s.section_id, s.course_no 
 FROM section s FULL OUTER JOIN course c 
 ON c.course_no = s.course_no 
 ORDER BY c.course_no;

 SELECT col1, col2 
 FROM t1 RIGHT OUTER JOIN t2 
 ON t1.col1 = t2.col2 ;


 SELECT col1, col2 
 FROM t1 FULL OUTER JOIN t2 
 ON t1.col1 = t2.col2 ;


/* Tambien podemos utilizar  USING*/
SELECT course_no, description, 
section_id 
FROM section RIGHT OUTER JOIN course 
USING (course_no) 
ORDER BY course_no;




spool off