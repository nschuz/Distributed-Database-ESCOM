

spool C:\basesRepo\Distributed-Database-ESCOM\Capitulo5\out\salida_pag302.txt
rem (Rischert,A(2004). Chapter 5. Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

-- Cuenta el número tuplas que hay en la tabla enrollment
SELECT COUNT(*) 
 FROM enrollment;
 
spool off