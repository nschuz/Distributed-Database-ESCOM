spool D:\Praxedes\Documents\O11\registros\cap4_pag226_1.txt
-- col "1.Day" format a12
--col "2.Day" format a12
--col "Look at the Month" format a22
--col "Time"   format a16
rem [Rischert, 2004, 226]
 SELECT last_name, 
 TO_CHAR(registration_date, 'Dy') AS "1.Day", 
 TO_CHAR(registration_date, 'DY') AS "2.Day", 
 TO_CHAR(registration_date, 'Month DD, YYYY') 
 AS "Look at the Month", 
 TO_CHAR(registration_date, 'HH:MI pm') AS "Time" 
 FROM student 
 WHERE student_id IN (123, 161, 190);
 spool off