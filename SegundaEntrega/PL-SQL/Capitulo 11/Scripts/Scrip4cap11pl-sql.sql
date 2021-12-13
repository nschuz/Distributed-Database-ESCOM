spool ..\Salidas\cap11_4byexample.txt
set colsep '|=|'
set pagesize 99
set linesize 130
set feedback on
set underline =


set feedback off
SHOW user
SELECT systimestamp from dual;
set feedback on


REM TRY IT YOURSELF
REM Write a nested cursor in which the parent cursor SELECTs information about each section of a
REM course. The child cursor counts the enrollment. The only output is one line for each course, with
REM the course name, section number, and total enrollment.


SET SERVEROUTPUT ON
DECLARE
	CURSOR c_course IS
		SELECT course_no, description
		FROM course
		WHERE course_no < 120;
	CURSOR c_enrollment(p_course_no IN course.course_no%TYPE)
	IS
		SELECT s.section_no section_no, count(*) count
		FROM section s, enrollment e
		WHERE s.course_no = p_course_no
		AND s.section_id = e.section_id
		GROUP BY s.section_no;
BEGIN
	FOR r_course IN c_course LOOP
		DBMS_OUTPUT.PUT_LINE
		(r_course.course_no||' '|| r_course.description);
		FOR r_enroll IN c_enrollment(r_course.course_no) LOOP
			DBMS_OUTPUT.PUT_LINE
			(Chr(9)||'Section: '||r_enroll.section_no||
			' has an enrollment of: '||r_enroll.count);
		END LOOP;
	END LOOP;
END;

/

SPOOL off