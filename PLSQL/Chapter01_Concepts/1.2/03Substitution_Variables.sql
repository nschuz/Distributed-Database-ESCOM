
spool C:\Bases\PLSQL\Chapter01_Concepts\1.2\Out\salida03.txt
rem ROSENZWEIG,B &  RAKHIMOV,E (2009).Oracle PL/SQL by example / Benjamin Rosenzweig, Elena Silvestrova Rakhimov

SET SERVEROUTPUT ON;

REM EJERCICIO DE LA PAGINA 45
DECLARE
	v_num NUMBER := &sv_num;
	v_result NUMBER;
BEGIN
	v_result := POWER(v_num, 2);
	DBMS_OUTPUT.PUT_LINE('The value of v_result is: '||v_result);
END;
.
/

spool off