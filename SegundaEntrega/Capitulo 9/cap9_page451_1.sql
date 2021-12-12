
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
FullOuter Join 
La combinación externa completa incluye todas las filas de ambas tablas, tanto si se encuentra una coincidencia como si no.
*/
SELECT col1, col2 
 FROM t1 FULL OUTER JOIN t2 
 ON t1.col1 = t2.col2;





spool off