
spool C:\basesRepo\Distributed-Database-ESCOM\Capitulo5\out\salida_pag302_2.txt
rem (Rischert,A(2004). Chapter 5. Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

SELECT COUNT(final_grade), COUNT(section_id), COUNT(*)  --Count excluye las columnas que sean NULL
 FROM enrollment;
 
 spool off;