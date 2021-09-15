
spool C:\basesRepo\Distributed-Database-ESCOM\Capitulo5\out\salida_pag303_3.txt
rem (Rischert,A(2004). Chapter 5. Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

-- La función AVG devuelve la media de un grupo de filas.
SELECT AVG(capacity), AVG(NVL(capacity,0)) 
 FROM section;
 
 
spool off