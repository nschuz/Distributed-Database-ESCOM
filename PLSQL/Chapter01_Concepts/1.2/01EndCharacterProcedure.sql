
spool C:\Bases\PLSQL\Chapter01_Concepts\1.2\Out\salida01.txt
rem ROSENZWEIG,B &  RAKHIMOV,E (2009).Oracle PL/SQL by example / Benjamin Rosenzweig, Elena Silvestrova Rakhimov

REM EJERCICIO DE LA PÁGINA 41
DECLARE
	v_first_name VARCHAR2(35);
	v_last_name VARCHAR2(35);
BEGIN
	SELECT first_name, last_name
	INTO v_first_name, v_last_name
	FROM student
	WHERE student_id = 123;
	DBMS_OUTPUT.PUT_LINE ('Student name: '||v_first_name||' '||
	v_last_name);
EXCEPTION
	WHEN NO_DATA_FOUND THEN
	DBMS_OUTPUT.PUT_LINE ('There is no student with '||
		'student id 123');
END;
. --Punto para indicar que termino el pl/sql (opcional)
/

spool off