
spool out\salida_pag318_1.txt
rem (Rischert,A(2004). Chapter 5. Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

col location format A10;



SELECT prerequisite, COUNT(*) 
 FROM course 
 GROUP BY prerequisite 
 ORDER BY prerequisite ;

spool off