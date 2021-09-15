spool D:\Praxedes\Documents\O11\registros\cap4_pag245_1.txt
rem [Rischert, 2004, 245]
SELECT TO_CHAR(TO_DATE('12/31/1999','MM/DD/YYYY'), 
 'MM/DD/YYYY DY') "New Year's Eve", 
 TO_CHAR(NEXT_DAY(TO_DATE('12/31/1999', 
 'MM/DD/YYYY'), 
 'Domingo'),'MM/DD/YYYY DY') 
 "Primer Domingo" 
 FROM dual;
  spool off