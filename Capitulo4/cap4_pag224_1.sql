spool D:\Praxedes\Documents\O11\registros\cap4_pag224_1.txt
rem [Rischert, 2004, 224]
SELECT student_id, last_name, registration_date,  
 FROM student 
 WHERE student_id IN (123, 161, 190);
spool off 