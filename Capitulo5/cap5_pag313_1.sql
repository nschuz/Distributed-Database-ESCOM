
spool C:\basesRepo\Distributed-Database-ESCOM\Capitulo5\out\salida_pag313.txt
rem (Rischert,A(2004). Chapter 5. Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

col location format A5;
col min format 999;
col MAX format 999;

SELECT location, COUNT(*), SUM(capacity) AS sum, 
 MIN(capacity) AS min, MAX(capacity) AS max 
 FROM section 
 GROUP BY location;
 
spool off