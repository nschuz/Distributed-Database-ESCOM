
spool out\salida_pag331_1.txt
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
ANSI JOIN Syntax
El término combinación interna se utiliza para expresar una combinación que cumple la condición de combinación. Normalmente, la condición de unión se basa en la igualdad, creando así una combinación igual. (La unión interior contrasta con la exterior
entrar. Además de las filas coincidentes, la combinación externa también incluye las filas no coincidentes de dos tablas).

The keyword INNER is optional and typically omitted. To express a join condition, you can specify 
either the USING condition or the ON condition. 
The USING Condition 
The USING condition, also referred as the USING clause, identifies the common column between 
the tables. Here the common column is the COURSE_NO column, which has the same name and 
compatible datatype in both tables. An equijoin is always assumed with the USING clause. 


*/
SELECT course_no, s.section_no, c.description, 
s.location, s.instructor_id 
FROM course c JOIN section s 
USING (course_no);

SELECT course_no, s.section_no, c.description, 
 s.location, s.instructor_id 
 FROM course c INNER JOIN section s 
 USING (course_no)

spool off