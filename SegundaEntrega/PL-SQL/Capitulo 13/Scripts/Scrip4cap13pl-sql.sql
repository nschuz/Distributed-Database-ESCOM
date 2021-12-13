spool ..\Salidas\cap13_4byexample.txt

set colsep '|=|'
set pagesize 99
set linesize 130
set feedback on
set underline =


set feedback off
SHOW user
SELECT systimestamp from dual;
set feedback on


prompt ***************************************
prompt Alumno:Jesus Alberto Castillo Hernandez
prompt Asignatura: Base de datos
prompt Grupo:2CM12
prompt ***************************************

REM TRY IT YOURSELF
REM Create or modify a trigger on the ENROLLMENT table that fires before an INSERT statement. Make
REM sure that all columns that have NOT NULL and foreign key constraints defined on them are populated
REM lated with their proper values.

CREATE OR REPLACE TRIGGER enrollment_bi
BEFORE INSERT ON ENROLLMENT
FOR EACH ROW
DECLARE
	v_valid NUMBER := 0;
BEGIN
	SELECT COUNT(*)
	INTO v_valid
	FROM student
	WHERE student_id = :NEW.STUDENT_ID;
	IF v_valid = 0 THEN
		RAISE_APPLICATION_ERROR (-20000,
		'This is not a valid student');
	END IF;
	SELECT COUNT(*)
	INTO v_valid
	FROM section
	WHERE section_id = :NEW.SECTION_ID;
	IF v_valid = 0 THEN
		RAISE_APPLICATION_ERROR (-20001,
		'This is not a valid section');
	END IF;
	:NEW.ENROLL_DATE := SYSDATE;
	:NEW.CREATED_BY := USER;
	:NEW.CREATED_DATE := SYSDATE;
	:NEW.MODIFIED_BY := USER;
	:NEW.MODIFIED_DATE := SYSDATE;
END;

/


SPOOL off