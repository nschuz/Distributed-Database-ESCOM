
spool C:\Bases\PLSQL\Chapter01_Concepts\1.1\Out\salida03.txt
rem ROSENZWEIG,B &  RAKHIMOV,E (2009).Oracle PL/SQL by example / Benjamin Rosenzweig, Elena Silvestrova Rakhimov


REM EJERCICIO DE LA PÁGINA 37
DECLARE
	v_name VARCHAR2(50);
	v_total NUMBER;
BEGIN
	SELECT i.first_name||' '||i.last_name, COUNT(*)
	INTO v_name, v_total
	FROM instructor i, section s --Aqui tengo una duda sobre section
	WHERE i.instructor_id = s.instructor_id
	AND i.instructor_id = 102
	GROUP BY i.first_name||' '||i.last_name;
	DBMS_OUTPUT.PUT_LINE
	('Instructor '||v_name||' teaches '||v_total||' courses');
EXCEPTION
	WHEN NO_DATA_FOUND THEN
	DBMS_OUTPUT.PUT_LINE ('There is no such instructor');
END;
.
/


spool off