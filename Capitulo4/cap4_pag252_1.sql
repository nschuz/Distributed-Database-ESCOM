spool D:\Praxedes\Documents\O11\registros\cap4_pag252_1.txt
rem [Rischert, 2004, 252]

SELECT LOCALTIMESTAMP 
 FROM dual;

SELECT SYSTIMESTAMP 
 FROM dual ;

SELECT CURRENT_TIMESTAMP, LOCALTIMESTAMP 
 FROM dual ;

 SELECT TO_CHAR(CURRENT_DATE, 'DD-MON-YYYY HH:MI:SS PM') 
 FROM dual ;

 spool off