spool ..\Salidas\cap12_5byexample.txt
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
REM The phone numbers of students living in Brooklyn are being updated to change the
REM area code to 718. The cursor declaration only locks the phone column of the student table. The
REM lock is never released because there is no COMMIT or ROLLBACK statement.


-- ch12_5a.sql
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
DBMS_OUTPUT.PUT_LINE(r_stud_zip.student_id);
UPDATE student
SET phone = '718'||SUBSTR(phone,4)
WHERE CURRENT OF c_stud_zip;
END LOOP;
END;

/

SPOOL off