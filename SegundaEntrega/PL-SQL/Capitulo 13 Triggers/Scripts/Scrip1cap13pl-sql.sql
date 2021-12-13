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


REM LAB 13.1.2 Exercises Use BEFORE and AFTER Triggers
REM In this exercise, you create a trigger on the INSTRUCTOR table that fires before an INSERT statement is
REM issued against the table. The trigger determines the values for the columns CREATED_BY, MODIFIED_BY
REM CREATED_DATE, and MODIFIED_DATE. In addition, it determines if the value of zip provided by an INSERT
REM statement is valid

CREATE OR REPLACE TRIGGER student_bi
BEFORE INSERT ON student
FOR EACH ROW
DECLARE
v_student_id STUDENT.STUDENT_ID%TYPE;
BEGIN
SELECT STUDENT_ID_SEQ.NEXTVAL
INTO v_student_id
FROM dual;
:NEW.student_id := v_student_id;
:NEW.created_by := USER;
:NEW.created_date := SYSDATE;
:NEW.modified_by := USER;
:NEW.modified_date := SYSDATE;
END;
/


INSERT INTO student (student_id, first_name, last_name, zip,
registration_date, created_by, created_date, modified_by,
modified_date)
VALUES (STUDENT_ID_SEQ.NEXTVAL, 'John', 'Smith', '00914', SYSDATE,
USER, SYSDATE, USER, SYSDATE);


INSERT INTO student (first_name, last_name, zip, registration_date)
VALUES ('John', 'Smith', '00914', SYSDATE);

SPOOL off