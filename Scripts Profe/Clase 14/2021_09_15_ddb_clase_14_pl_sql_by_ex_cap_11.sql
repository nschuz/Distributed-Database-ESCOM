set colsep '|| '
set linesize 130
set pagesize 99
set null s/Datos
rem BENJAMIN ROSENZWEIG
ELENA SILVESTROVA RAKHIMOV

rem [ROSENZWEIG &  RAKHIMOV, 2009,249]
-- c--Ch11_10a.sql
SET SERVEROUTPUT ON
DECLARE
	v_amount course.cost%TYPE;
	v_instructor_id instructor.instructor_id%TYPE;
CURSOR c_inst IS
	SELECT first_name, last_name, instructor_id
	FROM instructor;
CURSOR c_cost IS
	SELECT c.cost
	FROM course c, section s, enrollment e
	WHERE s.instructor_id = v_instructor_id
		AND c.course_no = s.course_no
		AND s.section_id = e.section_id;
BEGIN
	FOR r_inst IN c_inst
	LOOP
		v_instructor_id := r_inst.instructor_id;
		v_amount := 0;
--		DBMS_OUTPUT.PUT_LINE('Amount generated by instructor ');
		DBMS_OUTPUT.PUT_LINE('Ingresos generados por instructor: ');
		DBMS_OUTPUT.PUT_LINE(CHR(13)||'---> '||CHR(09)||CHR(09)||
							 r_inst.first_name||' '||r_inst.last_name||':');
		FOR r_cost IN c_cost
			LOOP
				v_amount := v_amount + NVL(r_cost.cost, 0);
		END LOOP;
		DBMS_OUTPUT.PUT_LINE
			(CHR(09)||CHR(09)||CHR(09)||CHR(09)||CHR(91)||
			 TO_CHAR(v_amount,'$999,999')||CHR(93));
		DBMS_OUTPUT.PUT_LINE(chr(07)||chr(07));	 
	END LOOP;
END;
---
rem [ROSENZWEIG &  RAKHIMOV, 2009,248]
rem ejemplo 9 
-- ch11_09a.sql
SET SERVEROUTPUT ON
DECLARE
	v_sid student.student_id%TYPE;
CURSOR c_student IS
	SELECT student_id, first_name, last_name
	FROM student
	WHERE student_id < 110;
CURSOR c_course IS
	SELECT c.course_no, c.description
	FROM course c, section s, enrollment e
	WHERE c.course_no = s.course_no
	AND s.section_id = e.section_id
	AND e.student_id = v_sid;
BEGIN
	FOR r_student IN c_student
	LOOP
		v_sid := r_student.student_id;
		DBMS_OUTPUT.PUT_LINE(chr(10));
--		DBMS_OUTPUT.PUT_LINE(' The Student '||
		DBMS_OUTPUT.PUT_LINE(' El estudiante:'||
		chr(09)||chr(09)||r_student.student_id||' '||
		chr(09)||r_student.first_name||' '||
		r_student.last_name);
--		DBMS_OUTPUT.PUT_LINE(' is enrolled in the '||
		DBMS_OUTPUT.PUT_LINE(' esta inscrito en '||
--		'following courses: ');
		'los siguientes cursos: ');
		FOR r_course IN c_course
			LOOP
			DBMS_OUTPUT.PUT_LINE(chr(09)||chr(09)||chr(91)||r_course.course_no||
			' '||r_course.description||chr(93));
			END LOOP;
	END LOOP;
END;
	
rem  consultas previas
SELECT student_id, first_name, last_name
	FROM student
	WHERE student_id < 110;
	
SELECT student_id, first_name, last_name
	FROM student
	WHERE student_id between 101 and 110;
	
SELECT student_id, first_name, last_name
	FROM student
	WHERE student_id between 150 and 170;
---
	SELECT e.student_id,c.course_no, c.description
	FROM course c, section s, enrollment e
	WHERE c.course_no = s.course_no
	AND s.section_id = e.section_id
	AND e.student_id in (102,103,104);

CURSOR c_course IS
	SELECT e.student_id,c.course_no, c.description
	FROM course c, section s, enrollment e
	WHERE c.course_no = s.course_no
	AND s.section_id = e.section_id
	AND e.student_id between 101 and 110;


-----------------
-------------------
rem probemos con otros alumnos 
rem del 150 al 170
rem [ROSENZWEIG &  RAKHIMOV, 2009,248]
rem ejemplo 9 
-- ch11_09a.sql
SET SERVEROUTPUT ON
DECLARE
	v_sid student.student_id%TYPE;
CURSOR c_student IS
	SELECT student_id, first_name, last_name
	FROM student
	WHERE student_id between 150 and 170;
CURSOR c_course IS
	SELECT c.course_no, c.description
	FROM course c, section s, enrollment e
	WHERE c.course_no = s.course_no
	AND s.section_id = e.section_id
	AND e.student_id = v_sid;
BEGIN
	FOR r_student IN c_student
	LOOP
		v_sid := r_student.student_id;
		DBMS_OUTPUT.PUT_LINE(chr(10));
--		DBMS_OUTPUT.PUT_LINE(' The Student '||
		DBMS_OUTPUT.PUT_LINE(' El estudiante:'||
		chr(09)||chr(09)||r_student.student_id||' '||
		chr(09)||r_student.first_name||' '||
		r_student.last_name);
--		DBMS_OUTPUT.PUT_LINE(' is enrolled in the '||
		DBMS_OUTPUT.PUT_LINE(' esta inscrito en '||
--		'following courses: ');
		'los siguientes cursos: ');
		FOR r_course IN c_course
			LOOP
			DBMS_OUTPUT.PUT_LINE(chr(09)||chr(09)||chr(91)||r_course.course_no||
			' '||r_course.description||chr(93));
			END LOOP;
	END LOOP;
END;

----

rem [ROSENZWEIG &  RAKHIMOV, 2009,247]
rem 
sET SERVEROUTPUT ON
-- ch11_8a.sql
 DECLARE
	v_zip zipcode.zip%TYPE;
	v_student_flag CHAR;
 CURSOR c_zip IS
	SELECT zip, city, state
		FROM zipcode
		WHERE state = 'CT';
 CURSOR c_student IS
	SELECT first_name, last_name
		FROM student
		WHERE zip = v_zip;
 BEGIN
	FOR r_zip IN c_zip
	LOOP
		v_student_flag := 'N';
		v_zip := r_zip.zip;
		DBMS_OUTPUT.PUT_LINE(CHR(10));
		DBMS_OUTPUT.PUT_LINE('Students living in '||
		r_zip.city);
	FOR r_student in c_student
	LOOP
		DBMS_OUTPUT.PUT_LINE(
		r_student.first_name||
		' '||r_student.last_name);
		v_student_flag := 'Y';
	END LOOP;
		IF v_student_flag = 'N'
		THEN
			DBMS_OUTPUT.PUT_LINE
				('No Students for this zipcode');
		END IF;
	END LOOP;
 END;
--

rem consultas previas


SELECT zip, city, state
	FROM zipcode
	WHERE state = 'CT';
	
CURSOR c_student IS
	SELECT zip, first_name, last_name
		FROM student
		WHERE zip between 6401 and 6907;




rem crear  la tabla para bitacora (log)
rem [ROSENZWEIG &  RAKHIMOV, 2009,246]
---
drop table table_log;
create table table_log
(description VARCHAR2(250));
--
-- ch11_7a.sql
DECLARE
CURSOR c_student IS
	SELECT student_id, last_name, first_name
	FROM student
	WHERE student_id < 110;
BEGIN
	FOR r_student IN c_student
	LOOP
		INSERT INTO table_log
		VALUES(r_student.last_name);
	END LOOP;
END;


col bitacora format a15
select description bitacora from table_log;

----------------
------------
rem [ROSENZWEIG &  RAKHIMOV, 2009,247]

-- ch11_7b.sql
DECLARE
CURSOR c_group_discount IS
	SELECT DISTINCT s.course_no
	FROM section s, enrollment e
	WHERE s.section_id = e.section_id
	GROUP BY s.course_no, e.section_id, s.section_id
	HAVING COUNT(*) >= 8;
BEGIN
	FOR r_group_discount IN c_group_discount
	LOOP
		UPDATE course
			SET cost = cost * .95
			WHERE course_no = r_group_discount.course_no;
	END LOOP;
	COMMIT;
END;

rem  consultas previas
col course_no format 9999
col description format a35
col cost        format $9,999.00
select course_no,description, COST
	from course
	order by 3;

SELECT DISTINCT s.course_no
	FROM section s, enrollment e
	WHERE s.section_id = e.section_id
	GROUP BY s.course_no, e.section_id, s.section_id
	HAVING COUNT(*) >= 8;
	
select course_no,description, COST
	from course
	where course_no in (25,120,230,240,140,122)
	order by 3;

