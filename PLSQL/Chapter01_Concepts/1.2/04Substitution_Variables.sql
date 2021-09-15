
spool C:\Bases\PLSQL\Chapter01_Concepts\1.2\Out\salida04.txt
rem ROSENZWEIG,B &  RAKHIMOV,E (2009).Oracle PL/SQL by example / Benjamin Rosenzweig, Elena Silvestrova Rakhimov

REM EJERCICIO DE LA PAGINA 46
SET SERVEROUTPUT ON
DECLARE
	v_day VARCHAR2(20);
BEGIN
	v_day := TO_CHAR(SYSDATE, 'Day');
	DBMS_OUTPUT.PUT_LINE ('Today is '||v_day);
END;
.
/

spool off