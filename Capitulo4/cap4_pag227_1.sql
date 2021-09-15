spool D:\Praxedes\Documents\O11\registros\cap4_pag227_1.txt
rem [Rischert, 2004, 227]
--col "Eliminating Spaces" format a26
--col "Spelled out"        format a30
 SELECT last_name, 
 TO_CHAR(registration_date, 'fmMonth ddth, YYYY') 
 "Eliminating Spaces", 
 TO_CHAR(registration_date, 'Ddspth "of" fmMonth') 
 "Spelled out" 
 FROM student 
 WHERE student_id IN (123, 161, 190);
spool off