spool ..\Salidas\cap11_2byexample.txt
set colsep '|=|'
set pagesize 99
set linesize 130
set feedback on
set underline =


set feedback off
SHOW user
SELECT systimestamp from dual;
set feedback on


REM LAB 11.1 EXERCISES Closing a Cursor


SET SERVEROUTPUT ON;
DECLARE
	CURSOR c_student_name IS
		SELECT first_name, last_name
			FROM student
			WHERE rownum <= 5;
	vr_student_name c_student_name%ROWTYPE;
BEGIN
	OPEN c_student_name;
	LOOP
		FETCH c_student_name INTO vr_student_name;
		EXIT WHEN c_student_name%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE('Student name: '||
			vr_student_name.first_name
			||' '||vr_student_name.last_name);
	END LOOP;
	CLOSE c_student_name;
END;

/

SPOOL off