spool D:\Praxedes\Documents\O11\registros\cap4_pag230_1.txt
rem [Rischert, 2004, 230]
  SELECT last_name, 
		TO_CHAR(registration_date,
		'DD-MON-YYYY HH24:MI:SS') 
 FROM student 
		WHERE registration_date = 
			TO_DATE('22-ENE-2003', 'DD-MON-YYYY');
spool off