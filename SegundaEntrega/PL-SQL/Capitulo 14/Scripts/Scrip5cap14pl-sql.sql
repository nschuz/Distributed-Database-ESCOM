spool ..\Salidas\cap14_5byexample.txt

set colsep '|=|'
set pagesize 99
set linesize 130
set feedback on
set underline =


set feedback off
SHOW user
SELECT systimestamp from dual;
set feedback on


REM Try it Yourself EXERCISES 
REM Create a compound trigger on the ZIPCODE table that fires on the INSERT and UPDATE statements
REM The trigger should populate the CREATED_BY, CREATED_DATE, MODIFIED_BY, and MODIFIED_DATE
REM columns with their default values. In addition, it should record in the STATISTICS table the type of 
REM the transaction, the name of the user who issued the transaction, and the date of the transaction.

CREATE OR REPLACE TRIGGER zipcode_compound
FOR INSERT OR UPDATE ON zipcode
COMPOUND TRIGGER
	v_date DATE;
	v_user VARCHAR2(30);
	v_type VARCHAR2(10);
BEFORE STATEMENT IS
BEGIN
	v_date := SYSDATE;
	v_user := USER;
END BEFORE STATEMENT;
BEFORE EACH ROW IS
BEGIN
	IF INSERTING THEN
		:NEW.created_by := v_user;
		:NEW.created_date := v_date;
	ELSIF UPDATING THEN
		:NEW.created_by := :OLD.created_by;
		:NEW.created_date := :OLD.created_date;
	END IF;
	:NEW.modified_by := v_user;
	:NEW.modified_date := v_date;
END BEFORE EACH ROW;
AFTER STATEMENT IS
BEGIN
	IF INSERTING THEN
		v_type := 'INSERT';
	ELSIF UPDATING THEN
		v_type := 'UPDATE';
	END IF;
	
	INSERT INTO statistics
		(table_name, transaction_name, transaction_user,
		transaction_date)
	VALUES ('ZIPCODE', v_type, v_user, v_date);
END AFTER STATEMENT;
END zipcode_compound;

UPDATE zipcode
SET city = 'Test City'
WHERE zip = '01247';

/

SPOOL off