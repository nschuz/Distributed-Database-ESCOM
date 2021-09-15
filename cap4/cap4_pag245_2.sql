spool D:\Praxedes\Documents\O11\registros\cap4_pag245_2.txt
rem [Rischert, 2004, 245]
SELECT TO_CHAR(start_date_time, 'DD-MON-YYYY') "Fecha de inicio", 
 EXTRACT(MONTH FROM start_date_time) "Mes", 
 EXTRACT(YEAR FROM start_date_time) "Año", 
 EXTRACT(DAY FROM start_date_time) "Dia" 
 FROM section 
 WHERE EXTRACT(MONTH FROM start_date_time) = 4 
 ORDER BY start_date_time ;
 spool off