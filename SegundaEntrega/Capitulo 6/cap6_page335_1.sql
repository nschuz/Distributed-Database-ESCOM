
spool out\salida_pag335_1txt
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
Producto Cartesiano: con la nomenclatura ANSI JOIN
*/

SELECT COUNT(*) 
FROM section CROSS JOIN instructor ;

spool off