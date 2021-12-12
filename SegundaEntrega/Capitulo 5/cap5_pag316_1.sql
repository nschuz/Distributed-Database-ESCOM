
spool out\salida_pag316_1.txt
rem (Rischert,A(2004). Chapter 5. Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

col location format A10;

/* 
El propósito de la cláusula HAVING es eliminar grupos, al igual que la cláusula WHERE se usa para filtrar.
*/

SELECT location "Location", instructor_id, 
 COUNT(location) "Total Locations", 
 SUM(capacity) "Total Capacity" 
 FROM section 
 GROUP BY location, instructor_id 
HAVING SUM(capacity) > 50 
ORDER BY "Total Capacity" DESC;

spool off