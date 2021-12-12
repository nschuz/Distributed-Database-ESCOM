
spool out\salida_pag304_3.txt
rem (Rischert,A(2004). Chapter 5. Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

/* 
La letra mayúscula "A" es igual al valor ASCII 65, "B" es 66, etc. respectiva primera y última letra  en orden alfabético.
*/
SELECT MIN (description) AS MIN, MAX (description) AS MAX 
 FROM course;
 
spool off