
spool C:\basesRepo\Distributed-Database-ESCOM\Capitulo5\out\salida_pag304_3.txt
rem (Rischert,A(2004). Chapter 5. Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

--MIN Y MAX con varchar2
SELECT MIN (description) AS MIN, MAX (description) AS MAX 
 FROM course;
 
spool off