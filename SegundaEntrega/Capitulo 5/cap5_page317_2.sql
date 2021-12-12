
spool out\salida_pag317_2.txt
rem (Rischert,A(2004). Chapter 5. Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

col location format A10;

/* 
Las columnas utilizadas en la cláusula HAVING deben encontrarse en la cláusula GROUP BY o deben ser funciones agregadas. consta
*/

SELECT 'Hello', 1, SYSDATE, course_no "Course #", 
 COUNT(*) 
 FROM section 
 GROUP BY course_no 
HAVING COUNT(*) = 5  ;

spool off