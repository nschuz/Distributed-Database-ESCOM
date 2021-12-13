spool ..\Salidas\cap11_3yexample.txt
set colsep '|=|'
set pagesize 99
set linesize 130
set feedback on
set underline =


set feedback off
SHOW user
SELECT systimestamp from dual;
set feedback on


REM LAB 11.1 Put It All Together
REM The following is an example of the complete cycle of declaring, opening, fetching, and closing a cursor
REM including the use of cursor attributes.
REM Modify the example to make use of the cursor attributes %FOUND and %ROWCOUNT.


-- ch11_5a.sql
SET SERVEROUTPUT ON
DECLARE
	v_sid student.student_id%TYPE;
	CURSOR c_student IS
		SELECT student_id
		FROM student
		WHERE student_id < 110;
BEGIN
	OPEN c_student;
	LOOP
		FETCH c_student INTO v_sid;
		IF c_student%FOUND THEN
		DBMS_OUTPUT.PUT_LINE
			('Just FETCHED row '
			||TO_CHAR(c_student%ROWCOUNT)||
			' Student ID: '||v_sid);
		ELSE
			EXIT;
		END IF;
	END LOOP;
	CLOSE c_student;
EXCEPTION
	WHEN OTHERS
	THEN
		IF c_student%ISOPEN
		THEN
			CLOSE c_student;
		END IF;
END;

/

SPOOL off