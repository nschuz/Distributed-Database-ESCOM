
spool out\salida_pag316_2.txt
rem (Rischert,A(2004). Chapter 5. Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

col location format A10;

/* 
La cláusula WHERE es ejecutada primero, reduciendo el conjunto de resultados a filas en el
Tabla de SECTION donde SECTION_NO es igual a 2 o 3. El siguiente paso es agrupar el resultado por las columnas enumeradas en la cláusula GROUP BY y
aplicar las funciones agregadas. Por último, la condición HAVING se prueba con los grupos
*/

SELECT location "Location", instructor_id, 
 COUNT(location) "Total Locations", 
 SUM(capacity) "Total Capacity" 
 FROM section 
 WHERE section_no IN (2, 3) 
 GROUP BY location, instructor_id 
HAVING SUM(capacity) > 50 ;

spool off