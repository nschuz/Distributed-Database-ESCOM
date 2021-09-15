spool D:\Praxedes\Documents\O11\registros\cap4_pag237_1.txt
rem [Rischert, 2004, 237]
SELECT course_no, section_id, 
 TO_CHAR(start_date_time, 'Day DD-Mon-YYYY') 
 FROM section 
 WHERE TO_CHAR(start_date_time, 'fmDay') = 'Jueves'; 
spool off