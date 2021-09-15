
spool C:\basesRepo\Distributed-Database-ESCOM\Capitulo5\out\salida_pag303_2.txt
rem (Rischert,A(2004). Chapter 5. Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

--La función SUM suma los valores de un grupo de filas, no cuenta valores NULL
SELECT SUM(capacity)
 FROM section;
 
spool off;