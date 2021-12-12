spool out/salida_pag303_1.txt 

rem Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

--Cuenta las id que son distintas(unicas) vs todos.
SELECT COUNT(DISTINCT section_id), COUNT(section_id) 
 FROM enrollment;

spool off