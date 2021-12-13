spool ..\Salidas\cap13_1byexample.txt
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

REM LAB 13.1.2 Exercises Use BEFORE and AFTER Triggers
REM In this exercise, you create a trigger on the INSTRUCTOR table that fires before an INSERT statement is
REM issued against the table. The trigger determines the values for the columns CREATED_BY, MODIFIED_BY
REM CREATED_DATE, and MODIFIED_DATE. In addition, it determines if the value of zip provided by an INSERT
REM statement is valid

-- ch13_1a.sql, version 1.0
CREATE OR REPLACE TRIGGER instructor_bi
BEFORE INSERT ON INSTRUCTOR
FOR EACH ROW
DECLARE
	v_work_zip CHAR(1);
BEGIN
	:NEW.CREATED_BY := USER;
	:NEW.CREATED_DATE := SYSDATE;
	:NEW.MODIFIED_BY := USER;
	:NEW.MODIFIED_DATE := SYSDATE;
	SELECT 'Y'
		INTO v_work_zip
		FROM zipcode
		WHERE zip = :NEW.ZIP;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			RAISE_APPLICATION_ERROR (-20001, 'Zip code is not valid!');
END;

/

SPOOL off