spool  out/salida_pag302.txt

rem (Rischert,A(2004). Chapter 5. Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

-- Cuenta el número tuplas que hay en la tabla enrollment
-- La función COUNT es útil para determinar si una tabla tiene datos.
SELECT COUNT(*) 
 FROM enrollment;


 
spool off