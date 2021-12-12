spool out\salida_pag305.txt
rem (Rischert,A(2004). Chapter 5. Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

--Funciones case
SELECT AVG(CASE WHEN prerequisite IS NOT NULL THEN cost*1.1 
 WHEN prerequisite = 20 THEN cost*1.2 
 ELSE cost 
 END) AS avg 
 FROM course;
 
spool off