
spool out\salida_pag334_2.txt
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
Producto Cartesiano: Indica una relacion varios a varios 
No tiene columnas de union
*/

SELECT s.instructor_id s_instructor_id, 
 i.instructor_id i_instructor_id 
 FROM section s, instructor i;

spool off