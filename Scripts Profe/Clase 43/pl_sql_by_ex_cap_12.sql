spool C:\Users\ORA_bases\2021_02_24_clase_2\salida\cap_12_cursores.txt
rem one cursor could loop through zip codes
rem ested cursor would loop through students who
rem    live in that zip code.

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
	FROM enrollment e,grade g, grade_type gt
		WHERE e.section_id = i_section_id
			AND e.student_id = g.student_id
			AND e.student_id = i_student_id
			AND e.section_id = g.section_id
			AND g.grade_type_code = gt.grade_type_code
		GROUP BY gt.description ;
 BEGIN
 FOR r_student IN c_student
 LOOP
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	DBMS_OUTPUT.PUT_LINE(CHR(10)||'Hola Escom    ');
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
 rem procedimiento de prueba
  rem procedimiento de prueba
   rem procedimiento de prueba
   
 	SELECT first_name, last_name, student_id
		FROM student
		WHERE last_name LIKE 'J%';
		
rem segundo cursor 

 SELECT c.description, s.section_id sec_id
	FROM course c, section s, enrollment e
		WHERE e.student_id in (157,166,167,310,335,193,232,282)
		AND c.course_no = s.course_no
		AND s.section_id = e.section_id;
		
rem tercer cursor 
 SELECT gt.description grd_desc,
	TO_CHAR
			(AVG(g.numeric_grade), '999.99')
            num_grd
	FROM enrollment e,grade g, grade_type gt
		WHERE e.section_id in (147,88,119,91,147,149,99,101)
			AND e.student_id = g.student_id
			AND e.student_id in (157,166,167,310,335,193,232,282)
			AND e.section_id = g.section_id
			AND g.grade_type_code = gt.grade_type_code
		GROUP BY gt.description ;
		
		
rem resultados de calculo en EXCEL 
rem final	midterm 	HW	participation 	quiz	project 
/*
77	92	82.75	83.25	90.5	99
84	77	80.5	90	    91.5	83
76	85	86.75	91	    80.5	
91	76	80.5	87.92		
		83.5			
					
					
328	330	414	   352.17	262.5	182
4	  4	  5	     4	      3	      2
82 82.5	82.8   88.0425   87.5	 91
*/









		
 ------------------
 -------------------
 -- ch12_2a.sql
DECLARE
CURSOR c_course IS
	SELECT course_no, cost
		FROM course FOR UPDATE;
BEGIN
		dbms_output.put_line('Hola ESCOM');
		dbms_output.put_line('actualizando con ch12_2a.sql');
	FOR r_course IN c_course
	LOOP
		IF r_course.cost < 2500
		THEN
			UPDATE course
				SET cost = r_course.cost + 10
				WHERE course_no = r_course.course_no;
		END IF;
	END LOOP;
END;
/
 rem procedimiento de prueba
select course_no, description, cost, prerequisite
		from course;
--------------------------------

-- ch12_3a.sql
DECLARE
CURSOR c_grade(
i_student_id IN enrollment.student_id%TYPE,
i_section_id IN enrollment.section_id%TYPE)
IS
SELECT final_grade
	FROM enrollment
	WHERE student_id = i_student_id
		AND section_id = i_section_id
FOR UPDATE;
CURSOR c_enrollment IS
	SELECT e.student_id, e.section_id
	FROM enrollment e, section s
	WHERE s.course_no = 135
		AND e.section_id = s.section_id;
BEGIN
	dbms_output.put_line('Hola ESCOM estamos actualizando calificaciones');
	dbms_output.put_line('Hola ESCOM estamos actualizando con ch12_3a.sql');
	FOR r_enroll IN c_enrollment
	LOOP
		FOR r_grade IN c_grade(r_enroll.student_id,
			r_enroll.section_id)
		LOOP
			UPDATE enrollment
			SET final_grade = 89
		WHERE student_id = r_enroll.student_id
			AND section_id = r_enroll.section_id;
		END LOOP;
	END LOOP;
END;
/
----

rem procedimiento de prueba
rem procedimiento de prueba
  

	SELECT e.student_id, e.section_id
	FROM enrollment e, section s
	WHERE s.course_no = 135
		AND e.section_id = s.section_id;
		
	select student_id, section_id,final_grade
		from enrollment
		where student_id in (129,135,176,233)
		     and section_id in (113,112,115,112);
		
------------------
rem : The phone numbers of students living 
rem in Brooklyn are being updated to change the
rem area code to 718. The cursor declaration 
rem only locks the phone column of the student table
-- ch12_4a.sql
DECLARE
CURSOR c_stud_zip IS
	SELECT s.student_id, z.city
		FROM student s, zipcode z
		WHERE z.city = 'Brooklyn'
			AND s.zip = z.zip
	FOR UPDATE OF phone;
BEGIN
	dbms_output.put_line('Hola ESCOM estamos actualizando calificaciones');
	dbms_output.put_line('Hola ESCOM estamos actualizando con ch12_4a.sql');
	FOR r_stud_zip IN c_stud_zip
		LOOP
	UPDATE student
		SET phone = '718'||SUBSTR(phone,4)
		WHERE student_id = r_stud_zip.student_id;
	END LOOP;
END;
/
---------------

-------------
-- ch12_5a.sql
DECLARE
CURSOR c_stud_zip IS
	SELECT s.student_id, z.city
		FROM student s, zipcode z
		WHERE z.city = 'Brooklyn'
			AND s.zip = z.zip
	FOR UPDATE OF phone;
BEGIN
		dbms_output.put_line('Hola ESCOM estamos actualizando con ch12_5a.sql');
	FOR r_stud_zip IN c_stud_zip
		LOOP
		DBMS_OUTPUT.PUT_LINE('estudiante ===> '||r_stud_zip.student_id);
		UPDATE student
		SET phone = '788'||SUBSTR(phone,4)
		WHERE CURRENT OF c_stud_zip;
	END LOOP;
END;
/
rem procedimiento de verificacion 
SELECT s.student_id, z.city, phone 
		FROM student s, zipcode z
		WHERE z.city = 'Brooklyn'
			AND s.zip = z.zip;
			
spool off 			

			