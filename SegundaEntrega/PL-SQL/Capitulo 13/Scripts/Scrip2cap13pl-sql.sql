spool ..\Salidas\cap13_2byexample.txt
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

REM LAB 13.2.1 Exercises Use Row and Statement Triggers
REM In this exercise, you create a trigger that fires before an INSERT statement is issued against the COURSE
REM table

CREATE OR REPLACE TRIGGER course_bi
BEFORE INSERT ON COURSE
FOR EACH ROW
DECLARE
	v_course_no COURSE.COURSE_NO%TYPE;
BEGIN
	SELECT COURSE_NO_SEQ.NEXTVAL
		INTO v_course_no
		FROM DUAL;
	:NEW.COURSE_NO := v_course_no;
	:NEW.CREATED_BY := USER;
	:NEW.CREATED_DATE := SYSDATE;
	:NEW.MODIFIED_BY := USER;
	:NEW.MODIFIED_DATE := SYSDATE;
END;

/

SPOOL off