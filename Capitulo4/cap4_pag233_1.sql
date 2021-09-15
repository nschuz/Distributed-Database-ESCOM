spool D:\Praxedes\Documents\O11\registros\cap4_pag233_1.txt
rem [Rischert, 2004, 233]
SELECT course_no, section_id, 
 TO_CHAR(start_date_time, 'DD-MON-YYYY HH24:MI') 
 FROM section 
WHERE start_date_time >= TO_DATE('04-MAY-2003', 'DD-MON-YYYY')
 AND start_date_time < TO_DATE('05-MAY-2003', 'DD-MON-YYYY');
  spool off