spool ..\Salidas\cap13_5byexample.txt

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
REM Create or modify a trigger on the SECTION table that fires before an UPDATE statement. Make sure
REM that the trigger validates incoming values so that there are no constraint violation errors.

CREATE OR REPLACE TRIGGER section_bu
BEFORE UPDATE ON SECTION
FOR EACH ROW
DECLARE
	v_valid NUMBER := 0;
BEGIN
	IF :NEW.INSTRUCTOR_ID IS NOT NULL THEN
		SELECT COUNT(*)
		INTO v_valid
		FROM instructor
		WHERE instructor_id = :NEW.instructor_ID;
		IF v_valid = 0 THEN
			RAISE_APPLICATION_ERROR (-20000,
			'This is not a valid instructor');
		END IF;
	END IF;
	:NEW.MODIFIED_BY := USER;
	:NEW.MODIFIED_DATE := SYSDATE;
END;
/
UPDATE section
SET instructor_id = 105
WHERE section_id = 79;

SPOOL off