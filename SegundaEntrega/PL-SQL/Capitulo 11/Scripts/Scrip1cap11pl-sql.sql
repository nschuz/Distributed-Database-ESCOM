spool ..\Salidas\cap11_1byexample.txt

set colsep '|=|'
set pagesize 99
set linesize 130
set feedback on
set underline =


set feedback off
SHOW user
SELECT systimestamp from dual;
set feedback on


REM LAB 11.1 EXERCISES Make Use of Record Types
REM Here is an example of a record type in an anonymous PL/SQL block:


SET SERVEROUTPUT ON;
DECLARE
	vr_zip ZIPCODE%ROWTYPE;
BEGIN
	SELECT *
		INTO vr_zip
		FROM zipcode
		WHERE rownum < 2;
	DBMS_OUTPUT.PUT_LINE('City: '||vr_zip.city);
	DBMS_OUTPUT.PUT_LINE('State: '||vr_zip.state);
	DBMS_OUTPUT.PUT_LINE('Zip: '||vr_zip.zip);
END;

/

SPOOL off