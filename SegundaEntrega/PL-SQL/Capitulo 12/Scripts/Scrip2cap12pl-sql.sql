spool ..\Salidas\cap12_2byexample.txt
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

REM LAB 12.1.2 Exercises Use Complex Nested Cursors 



-- ch12_1a.sql
SET SERVEROUTPUT ON
 	DECLARE
 		CURSOR c_student IS
 		SELECT first_name, last_name, student_id
 		FROM student
 		WHERE last_name LIKE 'J%';
 		CURSOR c_course
 		(i_student_id IN
		student.student_id%TYPE)
 	IS
 		SELECT c.description, s.section_id sec_id
 		FROM course c, section s, enrollment e
 		WHERE e.student_id = i_student_id
 		AND c.course_no = s.course_no
 		AND s.section_id = e.section_id;
 		CURSOR c_grade(i_section_id IN
						section.section_id%TYPE,
 						i_student_id IN
						student.student_id%TYPE)
 	IS
 		SELECT gt.description grd_desc,
 		TO_CHAR
 		(AVG(g.numeric_grade), '999.99')
						num_grd
 		FROM enrollment e,
 		grade g, grade_type gt
 		WHERE e.section_id = i_section_id
 		AND e.student_id = g.student_id
 		AND e.student_id = i_student_id
 		AND e.section_id = g.section_id
 		AND g.grade_type_code =
		gt.grade_type_code
 		GROUP BY gt.description ;
 		BEGIN
 		FOR r_student IN c_student
 		LOOP
 			DBMS_OUTPUT.PUT_LINE(CHR(10));
 			DBMS_OUTPUT.PUT_LINE(r_student.first_name||
 			' '||r_student.last_name);
 			FOR r_course IN
				c_course(r_student.student_id)
 		LOOP
 			DBMS_OUTPUT.PUT_LINE
			('Grades for course :'||
 				r_course.description);
 			FOR r_grade IN c_grade(r_course.sec_id,
 			r_student.student_id)
 		LOOP
 			DBMS_OUTPUT.PUT_LINE(r_grade.num_grd||
 			' '||r_grade.grd_desc);
 		END LOOP;
 		END LOOP;
 	END LOOP;
 END;

/

SPOOL off