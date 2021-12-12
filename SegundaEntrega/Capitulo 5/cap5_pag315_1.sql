
spool out\salida_pag315_1.txt
rem (Rischert,A(2004). Chapter 5. Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

col location format A10;

/* 
Ordenando

*/

SELECT location "Location", instructor_id, 
COUNT(location) "Total Locations", 
SUM(capacity) "Total Capacity" 
FROM section 
GROUP BY location, instructor_id 
ORDER BY "Total Capacity" DESC ;

spool off