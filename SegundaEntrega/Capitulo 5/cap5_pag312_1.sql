spool out\salida_pag312.txt

rem (Rischert,A(2004). Chapter 5. Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

col location format A5;
col min format 999;
col MAX format 999;

SELECT location, COUNT(*) 
 FROM section 
 GROUP BY location;

 spool off