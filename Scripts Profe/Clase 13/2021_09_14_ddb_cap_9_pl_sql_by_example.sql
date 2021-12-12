REM 

rem  probar con 07024
-- ch9_1b.sql, version 2.0
SET SERVEROUTPUT ON
DECLARE
	v_zip VARCHAR2(5) := '&sv_zip';
	v_total NUMBER(1);
-- outer block
BEGIN
	DBMS_OUTPUT.PUT_LINE ('Check if provided zipcode is valid');
	DBMS_OUTPUT.PUT_LINE ('Verifica si el  zipcode es valido');
	SELECT zip
		INTO v_zip
	FROM zipcode
	WHERE zip = v_zip;
-- inner block
	BEGIN
		SELECT count(*)
			INTO v_total
		FROM student
		WHERE zip = v_zip;
		DBMS_OUTPUT.PUT_LINE ('There are '||v_total||
			' students for zipcode '||v_zip);
	EXCEPTION
		WHEN VALUE_ERROR OR INVALID_NUMBER THEN
		DBMS_OUTPUT.PUT_LINE ('An error has occurred');
	END;
	DBMS_OUTPUT.PUT_LINE ('Done...');
	DBMS_OUTPUT.PUT_LINE ('--->  Listo...');
END;


REM queries previos
rem probar con 07024

SELECT zip
	FROM zipcode
	WHERE zip = 07024;
	
SELECT distinct zip
	FROM zipcode;
	
	
SELECT distinct zip
	FROM zipcode
	WHERE zip between 07020 and 07054	;


SELECT count(*)
		FROM student
		WHERE zip = 07024;	
		
rem el 07025 no existe
	
SELECT zip
	FROM zipcode
	WHERE zip = 07025;
		


SELECT count(*)
		FROM student
		WHERE zip = 07025;	
		
rem  el 07029 si existe

SELECT zip
	FROM zipcode
	WHERE zip = 07029;
		


SELECT count(*)
		FROM student
		WHERE zip = 07029;		
		
rem ahora probemos el ch9_1.c 
-- ch9_1c.sql, version 3.0
SET SERVEROUTPUT ON
DECLARE
	v_zip VARCHAR2(5) := '&sv_zip';
	v_total NUMBER(1);
-- outer block
BEGIN
	DBMS_OUTPUT.PUT_LINE ('Check if provided zipcode is valid');
	SELECT zip
		INTO v_zip
		FROM zipcode
		WHERE zip = v_zip;
-- inner block
	BEGIN
		SELECT count(*)
		INTO v_total
		FROM student
		WHERE zip = v_zip;
		DBMS_OUTPUT.PUT_LINE ('There are '||v_total||
		' students for zipcode '||v_zip);
	END;
	DBMS_OUTPUT.PUT_LINE ('Done...');
EXCEPTION
	WHEN VALUE_ERROR OR INVALID_NUMBER THEN
	DBMS_OUTPUT.PUT_LINE ('An error has occurred');
	END;
-- --------------------------
rem  [ROSENZWEIG &  RAKHIMOV,2009,193] 
rem In this exercise, you define an exception
rem  that allows you to raise an error 
rem if an instructor teaches ten or
rem  more sections.

-- ch9_2a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
	v_instructor_id NUMBER := &sv_instructor_id;
	v_tot_sections NUMBER;
	v_name VARCHAR2(30);
	e_too_many_sections EXCEPTION;
BEGIN
	SELECT COUNT(*)
		INTO v_tot_sections
	FROM section
	WHERE instructor_id = v_instructor_id;
	IF v_tot_sections >= 10 THEN
		RAISE e_too_many_sections;
	ELSE
		SELECT RTRIM(first_name)||' '||RTRIM(last_name)
			INTO v_name
		FROM instructor
		WHERE instructor_id = v_instructor_id;
		DBMS_OUTPUT.PUT_LINE ('Instructor, '||v_name||', teaches '||
			v_tot_sections||' sections');
	END IF;
EXCEPTION
	WHEN e_too_many_sections THEN
	DBMS_OUTPUT.PUT_LINE ('This instructor teaches too much');
END;

rem How would you change the script 
rem to display an instructor’s name 
rem in the error message as well?
rem  [ROSENZWEIG &  RAKHIMOV,2009,193] 
-- ch9_2b.sql, version 2.0
SET SERVEROUTPUT ON
DECLARE
	v_instructor_id NUMBER := &sv_instructor_id;
	v_tot_sections NUMBER;
	v_name VARCHAR2(30);
	e_too_many_sections EXCEPTION;
BEGIN
	SELECT COUNT(*)
		INTO v_tot_sections
		FROM section
		WHERE instructor_id = v_instructor_id;
	SELECT RTRIM(first_name)||' '||RTRIM(last_name)
		INTO v_name
		FROM instructor
		WHERE instructor_id = v_instructor_id;
	IF v_tot_sections >= 10 THEN
		RAISE e_too_many_sections;
	ELSE
		DBMS_OUTPUT.PUT_LINE (chr(09)||'Instructor, '||v_name||', teaches '||
		v_tot_sections||' sections');
	END IF;
EXCEPTION
	WHEN e_too_many_sections THEN
		DBMS_OUTPUT.PUT_LINE (chr(09)||chr(09)||'Instructor, '||v_name||
		', tiene muchos grupos');
	END;
/

---
rem tercera version
---

/*
In the version of the script shown next, 
the DBMS_OUTPUT.PUT_LINE statement displaying how
many sections are taught by the instructor 
has been moved from the ELSE portion of 
the IF-THEN ELSE statement as well. 
This eliminates the ELSE portion of 
the IF-THEN-ELSE statement. In this
case, the output produced by the script contains
 the number of sections for the instructor even
when the e_too_many_sections exception occurs
*/
rem  [ROSENZWEIG &  RAKHIMOV,2009,193] 
-- ch9_2c.sql, version 3.0
SET SERVEROUTPUT ON
DECLARE
	v_instructor_id NUMBER := &sv_instructor_id;
	v_tot_sections NUMBER;
	v_name VARCHAR2(30);
	e_too_many_sections EXCEPTION;
BEGIN
	SELECT COUNT(*)
		INTO v_tot_sections
		FROM section
		WHERE instructor_id = v_instructor_id;
	SELECT RTRIM(first_name)||' '||RTRIM(last_name)
		INTO v_name
		FROM instructor
		WHERE instructor_id = v_instructor_id;
			DBMS_OUTPUT.PUT_LINE ('Instructor, '||v_name||', teaches '||
				v_tot_sections||' sections');
	IF v_tot_sections >= 10 THEN
		RAISE e_too_many_sections;
	END IF;
EXCEPTION
WHEN e_too_many_sections THEN
DBMS_OUTPUT.PUT_LINE ('Instructor, '||v_name||
', teaches too much');
END;
.
/
REM
REM

--------------
------------



-- ch9_4a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
v_course_no NUMBER := 430;
v_total NUMBER;
e_no_sections EXCEPTION;
BEGIN
BEGIN
SELECT COUNT(*)
INTO v_total
FROM section
WHERE course_no = v_course_no;
IF v_total = 0 THEN
RAISE e_no_sections;
ELSE
DBMS_OUTPUT.PUT_LINE ('Course, '||v_course_no||
' has '||v_total||' sections');
END IF;
EXCEPTION
WHEN e_no_sections THEN
DBMS_OUTPUT.PUT_LINE ('There are no sections for course '||
v_course_no);
END;
DBMS_OUTPUT.PUT_LINE ('Done...');
END;
--
/*
C) Change this script so that the exception e_no_sections is reraised in the outer block.
-- ch9_4b.sql, version 2.0
*/

SET SERVEROUTPUT ON
DECLARE
	v_course_no NUMBER := 430;
	v_total NUMBER;
	e_no_sections EXCEPTION;
BEGIN
BEGIN
	SELECT COUNT(*)
		INTO v_total
		FROM section
		WHERE course_no = v_course_no;
	IF v_total = 0 THEN
		RAISE e_no_sections;
	ELSE
		DBMS_OUTPUT.PUT_LINE ('Course, '||v_course_no||
			' has '||v_total||' sections');
	END IF;
EXCEPTION
	WHEN e_no_sections THEN
		RAISE;
	END;
		DBMS_OUTPUT.PUT_LINE ('Done...');
EXCEPTION
	WHEN e_no_sections THEN
		DBMS_OUTPUT.PUT_LINE ('There are no sections for course '||
		v_course_no);
	END;


