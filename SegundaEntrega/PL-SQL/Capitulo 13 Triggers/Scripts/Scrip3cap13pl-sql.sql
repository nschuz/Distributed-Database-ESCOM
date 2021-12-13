spool ..\Salidas\cap13_3byexample.txt

set colsep '|=|'
set pagesize 99
set linesize 130
set feedback on
set underline =


set feedback off
SHOW user
SELECT systimestamp from dual;
set feedback on

REM LAB 13.2.2 Exercises Use INSTEAD OF Triggers
REM In this exercise, you create a view STUDENT_ADDRESS and an INSTEAD OF trigger that fires instead of an
REM INSERT statement issued against the view.

-- ch13_3c.sql, version 3.0
CREATE OR REPLACE TRIGGER student_address_ins
INSTEAD OF INSERT ON student_address
FOR EACH ROW
DECLARE
	v_zip VARCHAR2(5);
BEGIN
	BEGIN
		SELECT zip
		INTO v_zip
		FROM zipcode
		WHERE zip = :NEW.zip;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
		INSERT INTO ZIPCODE
			(zip, city, state, created_by, created_date,
			modified_by, modified_date)
		VALUES
			(:NEW.zip, :NEW.city, :NEW.state, USER, SYSDATE, USER,
			SYSDATE);
END;
INSERT INTO STUDENT
(student_id, first_name, last_name, street_address, zip,
registration_date, created_by, created_date, modified_by,
modified_date)
VALUES
(:NEW.student_id, :NEW.first_name, :NEW.last_name,
:NEW.street_address, :NEW.zip, SYSDATE, USER, SYSDATE, USER,
SYSDATE);
END;
/
INSERT INTO student_address
VALUES (STUDENT_ID_SEQ.NEXTVAL, 'John', 'Smith', '123 Main Street',
'New York', 'NY', '12345');

SPOOL off