
spool C:\Bases\PLSQL\Chapter02_GeneralProgramming\out\salida01.txt
rem ROSENZWEIG,B &  RAKHIMOV,E (2009).Oracle PL/SQL by example / Benjamin Rosenzweig, Elena Silvestrova Rakhimov


REM EJERCICIO DE LA PAGINA 53
SET SERVEROUTPUT ON

DECLARE
	first&last_names VARCHAR2(30); --Debido al ampersand nos pedira ingresar la variable last_names
BEGIN
	first&last_names := 'TEST NAME'; --Igual aqui
	DBMS_OUTPUT.PUT_LINE(first&last_names); --Y aca
END;
.
/

spool off