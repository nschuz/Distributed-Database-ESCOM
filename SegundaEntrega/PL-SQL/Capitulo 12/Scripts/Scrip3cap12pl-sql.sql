spool ..\Salidas\cap12_3byexample.txt
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

REM LAB 12.2 Exercises For UPDATE and WHERE CURRENT Cursors 
REM The following example shows how to update the cost of all courses that cost less than $2,500
REM It increments them by 10.


-- ch12_2a.sql
DECLARE
CURSOR c_course IS
SELECT course_no, cost
FROM course FOR UPDATE;
BEGIN
FOR r_course IN c_course
LOOP
IF r_course.cost < 2500
THEN
UPDATE course
SET cost = r_course.cost + 10
WHERE course_no = r_course.course_no;
END IF;
END LOOP;
END;

/

SPOOL off