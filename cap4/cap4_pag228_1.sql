spool D:\Praxedes\Documents\O11\registros\cap4_pag228_1.txt
rem [Rischert, 2004, 228]
SELECT last_name, registration_date 
 FROM student 
 WHERE registration_date = 
		--TO_DATE('22-JAN-2003', 'DD-MON-YYYY') 
        TO_DATE('22-ENE-2003', 'DD-MON-YYYY') ;
spool off