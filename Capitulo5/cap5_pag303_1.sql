
spool C:\basesRepo\Distributed-Database-ESCOM\Capitulo5\out\salida_pag303.txt
rem (Rischert,A(2004). Chapter 5. Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

--Cuenta las id que son distintas(unicas).
SELECT COUNT(DISTINCT section_id), COUNT(section_id) 
 FROM enrollment;

spool off