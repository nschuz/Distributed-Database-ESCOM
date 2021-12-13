spool ..\Salidas\cap14_2byexample.txt
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

CREATE OR REPLACE TRIGGER student_compound
FOR INSERT ON STUDENT
COMPOUND TRIGGER
-- Declaration section
v_day VARCHAR2(10);
v_date DATE;
v_user VARCHAR2(30);
BEFORE STATEMENT IS
BEGIN
v_day := RTRIM(TO_CHAR(SYSDATE, 'DAY'));
IF v_day LIKE ('S%') THEN
RAISE_APPLICATION_ERROR
(-20000, 'A table cannot be modified during off hours');
END IF;
v_date := SYSDATE;
v_user := USER;
END BEFORE STATEMENT;
BEFORE EACH ROW IS
BEGIN
:NEW.student_id := STUDENT_ID_SEQ.NEXTVAL;
:NEW.created_by := v_user;
:NEW.created_date := v_date;
:NEW.modified_by := v_user;
:NEW.modified_date := v_date;
END BEFORE EACH ROW;
END student_compound;
/

SPOOL off