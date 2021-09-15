
spool C:\Bases\PLSQL\Chapter02_GeneralProgramming\out\salida05.txt
rem ROSENZWEIG,B &  RAKHIMOV,E (2009).Oracle PL/SQL by example / Benjamin Rosenzweig, Elena Silvestrova Rakhimov

REM EJERCICIO DE LA PAGINA 58
SET SERVEROUTPUT ON
DECLARE
	v_name student.first_name%TYPE; --Se define con el tipo de dato de la base de datos, en este caso varcar2(25)
	v_grade grade.numeric_grade%TYPE;
BEGIN
	DBMS_OUTPUT.PUT_LINE(NVL(v_name, 'No Name ')|| --Las variables tienen un valor NULL
	' has grade of '||NVL(v_grade, 0)); --NVL sustituye el valor de una variable cuando es NULL
END;
.
/

spool off