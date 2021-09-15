spool D:\Praxedes\Documents\O11\registros\cap4_pag231_2.txt
rem [Rischert, 2004, 231]
SELECT student_id, 
		TO_CHAR(enroll_date, 'DD-MON-YYYY HH24:MI:SS') fecha2
 FROM enrollment 
 WHERE enroll_date >= DATE '2003-02-07' 
 AND enroll_date < DATE '2003-02-08';
 spool off