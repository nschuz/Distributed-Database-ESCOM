
spool out\salida_pag330_3.txt
rem (Rischert,A(2004). Chapter 6. EquiJoins 
rem IN Oracle SQL by Example(326-363),USA: Prentice Hall 

set pagesize 99
set linesize 130
set null s/Datos
set colsep '|=|'
SET SQLNUMBER ON
col curso format 9999
col section_no format 9999
col description format a30
col location format a6



/*
Null y Joins
Nulls no se muestran
Irene no aprece en el join
*/
SELECT instructor_id, zip, last_name, first_name 
 FROM instructor 
 WHERE zip IS NULL;

SELECT i.instructor_id, i.zip, i.last_name, i.first_name 
 FROM instructor i, zipcode z 
 WHERE i.zip = z.zip;


spool off