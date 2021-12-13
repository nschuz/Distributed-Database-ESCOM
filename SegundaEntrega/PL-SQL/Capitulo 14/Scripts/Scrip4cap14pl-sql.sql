spool ..\Salidas\cap14_4byexample.txt

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

REM Try it Yourself EXERCISES 
REM Create a compound trigger on the INSTRUCTOR table that fires on the INSERT and UPDATE statements
REM The trigger should not allow an insert or update on the INSTRUCTOR table during off hours.
REM Off hours are weekends and times of day outside the 9 a.m. to 5 p.m. window. The trigger should also
REM populate the INSTRUCTOR_ID, CREATED_BY, CREATED_DATE, MODIFIED_BY, and MODIFIED_DATE columns with their default values.

CREATE OR REPLACE TRIGGER instructor_compound
FOR INSERT OR UPDATE ON instructor
COMPOUND TRIGGER
	v_date DATE;
	v_user VARCHAR2(30);
BEFORE STATEMENT IS
BEGIN
	IF RTRIM(TO_CHAR(SYSDATE, 'DAY')) NOT LIKE 'S%' AND
		RTRIM(TO_CHAR(SYSDATE, 'HH24:MI')) BETWEEN '09:00' AND '17:00'
	THEN
		v_date := SYSDATE;
		v_user := USER;
	ELSE
		RAISE_APPLICATION_ERROR
			(-20000, 'A table cannot be modified during off hours');
	END IF;
END BEFORE STATEMENT;
BEFORE EACH ROW IS
BEGIN
	IF INSERTING THEN
		:NEW.instructor_id := INSTRUCTOR_ID_SEQ.NEXTVAL;
		:NEW.created_by := v_user;
		:NEW.created_date := v_date;
	ELSIF UPDATING THEN
		:NEW.created_by := :OLD.created_by;
		:NEW.created_date := :OLD.created_date;
	END IF;
	:NEW.modified_by := v_user;
	:NEW.modified_date := v_date;
END BEFORE EACH ROW;
END instructor_compound;
/


SET SERVEROUTPUT ON
DECLARE
	v_date VARCHAR2(20);
BEGIN
	v_date := TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI');
	DBMS_OUTPUT.PUT_LINE ('Date: '||v_date);
	INSERT INTO instructor
		(salutation, first_name, last_name, street_address, zip, phone)
	VALUES
		('Mr.', 'Test', 'Instructor', '123 Main Street', '07112',
			'2125555555');
	ROLLBACK;
END;
/


SPOOL off