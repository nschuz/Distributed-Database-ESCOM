
spool out\salida_pag317_1.txt
rem (Rischert,A(2004). Chapter 5. Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

col location format A10;

/* 
La cláusula HAVING puede usar múltiples operadores para eliminar aún más cualquier grupo, como en este ejemplo. Las columnas utilizadas en la cláusula HAVING deben encontrarse en la cláusula GROUP BY o deben ser funciones agregadas.
*/

SELECT location "Location", 
 SUM(capacity) "Total Capacity" 
 FROM section 
 WHERE section_no = 3 
 GROUP BY location 
HAVING (COUNT(location) > 3 
 AND location LIKE 'L5%') ;

spool off