
spool C:\Bases\PLSQL\Chapter02_GeneralProgramming\out\salida03.txt
rem ROSENZWEIG,B &  RAKHIMOV,E (2009).Oracle PL/SQL by example / Benjamin Rosenzweig, Elena Silvestrova Rakhimov


REM EJERCICIO DE LA PAGINA 55

SET SERVEROUTPUT ON;
DECLARE
	exception VARCHAR2(15); --Usando una palabra reservada como nombre de variable
BEGIN
	exception := 'This is a test';
	DBMS_OUTPUT.PUT_LINE(exception);
END;
.
/

spool off