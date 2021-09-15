spool D:\Praxedes\Documents\O11\registros\cap4_pag278_1.txt
rem [Rischert, 2004, 278]
SELECT DISTINCT TO_CHAR(created_date, 'DD-MON-YY HH24:MI')"CREATED_DATE", 
 TO_CHAR(start_date_time, 'DD-MON-YY 
HH24:MI')"START_DATE_TIME", 
 start_date_time-created_date"Decimal", 
 NUMTODSINTERVAL(start_date_time-created_date, 
'DAY')"Interval" 
 FROM section 
 ORDER BY 3 ;
 spool off