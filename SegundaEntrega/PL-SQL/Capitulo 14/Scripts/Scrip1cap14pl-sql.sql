spool ..\Salidas\cap14_1byexample.txt

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

REM LAB 14.1 Exercises
REM In this exercise, you modify a trigger that causes a mutating table error when an INSERT statement is
REM issued against the ENROLLMENT table

-- ch14_1a.sql, version 1.0
CREATE OR REPLACE TRIGGER enrollment_biu
BEFORE INSERT OR UPDATE ON enrollment
FOR EACH ROW
DECLARE
	v_total NUMBER;
	v_name VARCHAR2(30);
BEGIN
	SELECT COUNT(*)
	INTO v_total
	FROM enrollment
	WHERE student_id = :NEW. student_id;
-- check if the current student is enrolled in too
-- many courses
	IF v_total >= 3 THEN
	SELECT first_name||' '||last_name
	INTO v_name
	FROM student
	WHERE student_id = :NEW.STUDENT_ID;
	RAISE_APPLICATION_ERROR (-20000, 'Student, '||v_name||
							', is registered for 3 courses already');
	END IF;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		RAISE_APPLICATION_ERROR
			(-20001, 'This is not a valid student');
END;
/
CREATE OR REPLACE PACKAGE student_adm AS
v_student_id student.student_id%TYPE;
v_student_name varchar2(50);
END;
/
CREATE OR REPLACE TRIGGER enrollment_biu
BEFORE INSERT OR UPDATE ON enrollment
FOR EACH ROW
BEGIN
IF :NEW.STUDENT_ID IS NOT NULL THEN
BEGIN
student_adm.v_student_id := :NEW. student_id;
SELECT first_name||' '||last_name
INTO student_adm.v_student_name
FROM student
WHERE student_id = student_adm.v_student_id;
EXCEPTION
WHEN NO_DATA_FOUND THEN
RAISE_APPLICATION_ERROR
(-20001, 'This is not a valid student');
END;
END IF;
END;
/
CREATE OR REPLACE TRIGGER enrollment_aiu
AFTER INSERT OR UPDATE ON enrollment
DECLARE
v_total INTEGER;
BEGIN
SELECT COUNT(*)
INTO v_total
FROM enrollment
WHERE student_id = student_adm.v_student_id;
-- check if the current student is enrolled in too
-- many courses
IF v_total >= 3 THEN
RAISE_APPLICATION_ERROR (-20000, 'Student, '||
student_adm.v_student_name||
', is registered for 3 courses already ');
END IF;
END;

/

INSERT INTO ENROLLMENT
(student_id, section_id, enroll_date, created_by, created_date,
modified_by, modified_date)
VALUES (184, 98, SYSDATE, USER, SYSDATE, USER, SYSDATE);

INSERT INTO ENROLLMENT
(student_id, section_id, enroll_date, created_by, created_date,
modified_by, modified_date)
VALUES (399, 98, SYSDATE, USER, SYSDATE, USER, SYSDATE);

UPDATE ENROLLMENT
SET student_id = 399
WHERE student_id = 283;

SPOOL off