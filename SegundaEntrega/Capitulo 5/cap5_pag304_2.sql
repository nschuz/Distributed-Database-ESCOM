spool out\salida_pag304_2.txt
rem (Rischert,A(2004). Chapter 5. Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

-- MIN y MAX  con  otro tipo de dato

SELECT MIN(registration_date) "First", MAX(registration_date) "Last" 
 FROM student;
 
spool off