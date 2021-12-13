spool ..\Salidas\cap12_4byexample.txt
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


-- ch12_4a.sql
DECLARE
CURSOR c_stud_zip IS
SELECT s.student_id, z.city
FROM student s, zipcode z
WHERE z.city = 'Brooklyn'
AND s.zip = z.zip
FOR UPDATE OF phone;
BEGIN
FOR r_stud_zip IN c_stud_zip
LOOP
UPDATE student
SET phone = '718'||SUBSTR(phone,4)
WHERE student_id = r_stud_zip.student_id;
END LOOP;
END;

/

SPOOL off