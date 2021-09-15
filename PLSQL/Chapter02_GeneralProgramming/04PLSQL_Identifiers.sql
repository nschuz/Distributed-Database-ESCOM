
spool C:\Bases\PLSQL\Chapter02_GeneralProgramming\out\salida04.txt
rem ROSENZWEIG,B &  RAKHIMOV,E (2009).Oracle PL/SQL by example / Benjamin Rosenzweig, Elena Silvestrova Rakhimov

REM PAGINA 56
SET SERVEROUTPUT ON;
DECLARE
	v_var1 VARCHAR2(20);
	v_var2 VARCHAR2(6);
	v_var3 NUMBER(5,3);
BEGIN
	v_var1 := 'string literal';
	v_var2 := '12.345';
	v_var3 := 12.345;
	DBMS_OUTPUT.PUT_LINE('v_var1: '||v_var1);
	DBMS_OUTPUT.PUT_LINE('v_var2: '||v_var2);
	DBMS_OUTPUT.PUT_LINE('v_var3: '||v_var3);
END;
.
/

spool off