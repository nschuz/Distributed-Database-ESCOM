
spool C:\Bases\PLSQL\Chapter02_GeneralProgramming\out\salida02.txt
rem ROSENZWEIG,B &  RAKHIMOV,E (2009).Oracle PL/SQL by example / Benjamin Rosenzweig, Elena Silvestrova Rakhimov


REM EJERCICIO DE LA PAGINA 54
SET SERVEROUTPUT ON

DECLARE
v_name VARCHAR2(30);
v_dob DATE;
v_us_citizen BOOLEAN;
BEGIN
DBMS_OUTPUT.PUT_LINE(v_name||'born on'||v_dob); --No imprime las variables por que estan vacias
END;
.
/

spool off