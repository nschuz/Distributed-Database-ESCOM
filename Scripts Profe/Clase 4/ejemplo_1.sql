spool C:\Users\ORA_bases\2021_02_24_clase_2\salida\cap_2_clase_4.txt
rem                  Chapter 4. Date and Conversion 
rem                           Functions
rem [Rischert,2004,134]
col first_name format A13
COL last_name format  a13
col phone     format  a11  
SELECT first_name, last_name, phone 
 FROM instructor 
 WHERE last_name = 'Schorin';
 
 SELECT first_name, last_name, phone 
 FROM instructor;
 
  SELECT first_name, last_name, phone 
 FROM instructor
 order by 2;
 
 rem [Rischert,2004,135]
SELECT first_name, last_name, phone 
 FROM instructor 
 WHERE last_name <> 'Schorin';
 
 rem [Rischert,2004,136] 
 col description format a34
 SELECT description, cost 
 FROM course 
 WHERE cost >= 1195;
 
  SELECT description, cost 
 FROM course 
 WHERE cost >= 1195
 order by 1;
 
 rem [Rischert,2004,136] 
 SELECT description, cost 
 FROM course 
 WHERE cost BETWEEN 1000 AND 1100 ;
 
  rem [Rischert,2004,137] 
 rem  el IN indica conjunto de valores
 SELECT description, cost 
 FROM course 
 WHERE cost IN (1095, 1595); 
 
  rem [Rischert,2004,137]
  rem LIKE esta peleado con el =
 SELECT first_name, last_name, phone 
 FROM instructor 
 WHERE last_name LIKE 'S%' ;
 
   rem [Rischert,2004,137]
   rem los que tengan una o minuscula
   rem    en segunda posición
 SELECT first_name, last_name 
 FROM instructor 
 WHERE last_name LIKE '_o%';
 
 rem revisemos los valores NULL
 rem [Rischert,2004,138]
 SELECT description, prerequisite 
 FROM course 
 WHERE prerequisite IS NULL; 
 
  SELECT description, prerequisite 
 FROM course 
 WHERE prerequisite IS not NULL; 
 
   SELECT description, prerequisite 
 FROM course ; 

set NULL s/Dato

   SELECT description, prerequisite 
 FROM course 
 order by 2;
spool off
