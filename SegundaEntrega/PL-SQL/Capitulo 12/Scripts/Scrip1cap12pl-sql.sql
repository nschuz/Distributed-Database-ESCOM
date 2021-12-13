spool ..\Salidas\cap12_1byexample.txt

set colsep '|=|'
set pagesize 99
set linesize 130
set feedback on
set underline =


set feedback off
SHOW user
SELECT systimestamp from dual;
set feedback on

REM LAB 12.1 Exercises Use Parameters in a Cursor
REM Complete the code for the parameter cursor that was begun in the preceding example. Include
REM a DBMS_OUTPUT line that displays the zip code, city, and state. This is identical to the process
REM you have already used in a CURSOR FOR loop, only now, when you open the cursor, you pass a
REM parameter.


-- ch12_17a.sql
DECLARE
CURSOR c_zip (p_state IN zipcode.state%TYPE) IS
SELECT zip, city, state
FROM zipcode
WHERE state = p_state
BEGIN
FOR r_zip IN c_zip('NJ')
LOOP ...
DBMS_OUTPUT.PUT_LINE(r_zip.city||
' '||r_zip.zip||'');
END LOOP;
END;

/

SPOOL off