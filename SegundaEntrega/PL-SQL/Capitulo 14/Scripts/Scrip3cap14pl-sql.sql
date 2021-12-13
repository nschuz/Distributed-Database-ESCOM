spool ..\Salidas\cap14_3byexample.txt

set colsep '|=|'
set pagesize 99
set linesize 130
set feedback on
set underline =


set feedback off
SHOW user
SELECT systimestamp from dual;
set feedback on


REM LAB 14.2 EXERCISES Understand Compound Triggers


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
		WHERE student_id = :NEW.student_id;
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


-- ch14_2b.sql, version 2.0
CREATE OR REPLACE TRIGGER enrollment_compound
FOR INSERT OR UPDATE ON enrollment
COMPOUND TRIGGER
	v_student_id STUDENT.STUDENT_ID%TYPE;
	v_student_name VARCHAR2(50);
	v_total INTEGER;
	v_date DATE;
	v_user STUDENT.CREATED_BY%TYPE;
BEFORE STATEMENT IS
BEGIN
	v_date := SYSDATE;
	v_user := USER;
END BEFORE STATEMENT;
BEFORE EACH ROW IS
BEGIN
	IF INSERTING THEN
		:NEW.created_date := v_date;
		:NEW.created_by := v_user;
	ELSIF UPDATING THEN
		:NEW.created_date := :OLD.created_date;
		:NEW.created_by := :OLD.created_by;
	END IF;
	:NEW.MODIFIED_DATE := v_date;
	:NEW.MODIFIED_BY := v_user;
	IF :NEW.STUDENT_ID IS NOT NULL THEN
		BEGIN
			v_student_id := :NEW.STUDENT_ID;
			SELECT first_name||' '||last_name
			INTO v_student_name
			FROM student
			WHERE student_id = v_student_id;
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
			RAISE_APPLICATION_ERROR
			(-20001, 'This is not a valid student');
		END;
	END IF;
END BEFORE EACH ROW;
AFTER STATEMENT IS
BEGIN
	SELECT COUNT(*)
	INTO v_total
	FROM enrollment
	WHERE student_id = v_student_id;
	-- check if the current student is enrolled in too
	-- many courses
	IF v_total >= 3 THEN
		RAISE_APPLICATION_ERROR (-20000, 'Student, '||v_student_name||
		', is registered for 3 courses already ');
	END IF;
END AFTER STATEMENT;
END enrollment_compound;
/


INSERT INTO ENROLLMENT
(student_id, section_id, enroll_date, created_by, created_date,
modified_by, modified_date)
VALUES (399, 98, SYSDATE, USER, SYSDATE, USER, SYSDATE);




SPOOL off