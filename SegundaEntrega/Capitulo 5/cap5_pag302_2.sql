spool out/salida_pag302_2.txt
rem (Rischert,A(2004). Chapter 5. Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

/* 
La diferencia es que COUNT (*) cuenta las filas que contienen valores nulos, mientras que COUNT con una columna excluye filas que contienen nulos.
*/

SELECT COUNT(final_grade), COUNT(section_id), COUNT(*)  
 FROM enrollment;
 
 spool off;