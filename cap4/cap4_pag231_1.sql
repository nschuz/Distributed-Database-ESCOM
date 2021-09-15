spool D:\Praxedes\Documents\O11\registros\cap4_pag231_1.txt
rem [Rischert, 2004, 231]
SELECT student_id, 
		TO_CHAR(enroll_date, 'DD-MON-YYYY HH24:MI:SS') 
 FROM enrollment 
		WHERE TRUNC(enroll_date) =
		TO_DATE('07-FEB-2003', 'DD-MON-YYYY');
spool off