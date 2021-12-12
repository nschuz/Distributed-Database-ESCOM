
spool out\salida_pag337_1.txt
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
Muestra el apellido, la ciudad, el estado y el código postal. Muestra el resultado ordenado por código postal.
*/

SELECT s.last_name, s.zip, z.state, z.city 
FROM student s, zipcode z 
WHERE s.zip = z.zip 
ORDER BY s.zip ;

SELECT s.last_name, s.zip, z.state, z.city 
FROM student s JOIN zipcode z 
ON (s.zip = z.zip) 
ORDER BY s.zip ;

SELECT s.last_name, zip, z.state, z.city 
FROM student s JOIN zipcode z 
USING (zip) 
ORDER BY zip; 

spool off