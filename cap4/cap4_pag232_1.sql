spool D:\Praxedes\Documents\O11\registros\cap4_pag232_1.txt
rem [Rischert, 2004, 232]
SELECT 'Sección '||section_id||' comienza en '|| 
 TO_CHAR(start_date_time, 'fmDay')||'.' AS "Start" 
 FROM section 
 WHERE section_id IN (146, 127, 121, 155, 110, 85, 148) 
 ORDER BY TO_CHAR(start_date_time, 'D');
 spool off