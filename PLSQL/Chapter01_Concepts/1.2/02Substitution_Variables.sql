
spool C:\Bases\PLSQL\Chapter01_Concepts\1.2\Out\salida02.txt
rem ROSENZWEIG,B &  RAKHIMOV,E (2009).Oracle PL/SQL by example / Benjamin Rosenzweig, Elena Silvestrova Rakhimov

SET SERVEROUTPUT on; --default value 5000 bytes

REM EJERCICIO DE LA PAGINA 42
DECLARE
	v_student_id NUMBER := &sv_student_id; --Dato que se pedira por teclado
	v_first_name VARCHAR2(35);
	v_last_name VARCHAR2(35);
BEGIN
	SELECT first_name, last_name
		INTO v_first_name, v_last_name
		FROM student
		WHERE student_id = v_student_id;
		DBMS_OUTPUT.PUT_LINE ('Student name: '||v_first_name||' '||
		v_last_name);
EXCEPTION
	WHEN NO_DATA_FOUND THEN
	DBMS_OUTPUT.PUT_LINE ('There is no such student');
END;
.
/

spool off