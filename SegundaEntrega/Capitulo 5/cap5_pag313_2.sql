
spool out\salida_pag313_2.txt
rem (Rischert,A(2004). Chapter 5. Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

col location format A5;
col capacity format 999;
col section_id format 999;

SELECT location, capacity, section_id 
 FROM section 
 WHERE location = 'L211';
 
 
spool off