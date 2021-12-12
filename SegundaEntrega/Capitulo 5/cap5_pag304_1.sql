spool out\salida_pag304.txt
rem (Rischert,A(2004). Chapter 5. Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

-- La funcion MIN devuelve el valor más bajo, y el MAX el más alto
SELECT MIN(capacity), MAX(capacity) 
 FROM section;
 
spool off