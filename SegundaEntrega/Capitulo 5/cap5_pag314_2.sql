
spool out\salida_pag314_2.txt
rem (Rischert,A(2004). Chapter 5. Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

col location format A10;

SELECT location, instructor_id, capacity, section_id 
 FROM section 
 WHERE location = 'L210' 
 ORDER BY 1, 2;

spool off