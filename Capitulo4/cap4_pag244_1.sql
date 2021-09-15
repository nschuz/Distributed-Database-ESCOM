spool D:\Praxedes\Documents\O11\registros\cap4_pag244_1.txt
rem [Rischert, 2004, 244]
SELECT TO_CHAR(SYSDATE,'DD-MON-YYYY HH24:MI') now, 
 TO_CHAR(ROUND(SYSDATE),'DD-MON-YYYY HH24:MI') day, 
 TO_CHAR(ROUND(SYSDATE,'MM'),'DD-MON-YYYY HH24:MI') 
 mon 
 FROM dual;
 spool off