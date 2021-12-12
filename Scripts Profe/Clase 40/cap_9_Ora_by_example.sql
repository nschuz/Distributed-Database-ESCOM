set pagesize 99
set linesize 130
set null s/Datos
set colsep '|=|'
SET SQLNUMBER ON

REM [Rischert,2003,446]
SELECT course_no, description, 
 section_id 
 FROM course JOIN section 
 USING (course_no) 
 ORDER BY course_no;
 
SELECT course_no, description, 
 section_id 
 FROM course JOIN section 
 USING (course_no) 
 ORDER BY course_no 
 
rem Some courses are not 
rem included in the result because 
rem there are no matching course numbers in the 
rem SECTION table. To determine those courses
rem  not assigned to any sections, write a NOT EXISTS 
rem subquery, a NOT IN subquery
SELECT course_no, description 
 FROM course c 
 WHERE NOT EXISTS 
 (SELECT 'X' 
 FROM section 
 WHERE c.course_no = course_no);
 
 rem determinemos las materias que tienen asignado grupo(sections)
 SELECT course_no, description 
 FROM course c 
 WHERE  EXISTS 
 (SELECT 'X' 
 FROM section 
 WHERE c.course_no = course_no);
 
  SELECT course_no, description 
 FROM course c; 
 
 
 col description format a35
 rem The ANSI OUTER JOIN
 SELECT c.course_no, c.description, 
 s.section_id, s.course_no 
 FROM course c LEFT OUTER JOIN section s 
 ON c.course_no = s.course_no 
 ORDER BY c.course_no;
 
  SELECT c.course_no, c.description, 
 s.section_id, s.course_no 
 FROM course c LEFT OUTER JOIN section s 
 ON c.course_no = s.course_no 
 ORDER BY 3,c.course_no;
 
 REM [Rischert,2003,448]
 SELECT c.course_no, c.description, 
 s.section_id, s.course_no 
 FROM section s RIGHT OUTER JOIN course c 
 ON c.course_no = s.course_no 
 ORDER BY c.course_no;
 
REM [Rischert,2003,448]
rem You can also write the outer join with 
rem another ANSI join syntax, such as the USING clause. 
SELECT course_no, description, 
 section_id 
 FROM section RIGHT OUTER JOIN course 
 USING (course_no) 
 ORDER BY course_no;
 
 SELECT course_no, description, 
 section_id 
 FROM section RIGHT OUTER JOIN course 
 USING (course_no) 
 ORDER BY 3;
 
rem The Oracle OUTER JOIN Operator (+) 
rem The second way to express an outer join 
rem is with Oracle outer join operator.
REM [Rischert,2003,450]
SELECT c.course_no, c.description, 
 s.section_id, s.course_no 
 FROM course c, section s 
 WHERE c.course_no = s.course_no(+)
 ORDER BY c.course_no;
 
 rem The OUTER JOIN and The UNION ALL Operator 
 rem 
SELECT c1.course_no, c1.description, 
	s.section_id, s.course_no 
 FROM course c1, section s 
 WHERE c1.course_no = s.course_no 
UNION ALL 
SELECT c2.course_no, c2.description, 
	TO_NUMBER(NULL), TO_NUMBER(NULL) 
 FROM course c2 
 WHERE NOT EXISTS 
 (SELECT 'X' 
 FROM section 
 WHERE c2.course_no = course_no);
 
 rem analicemos el query separando los dos selects
 SELECT c1.course_no, c1.description, 
	s.section_id, s.course_no 
 FROM course c1, section s 
 WHERE c1.course_no = s.course_no;
 
 rem segunda parte 
SELECT c2.course_no, c2.description, 
	TO_NUMBER(NULL), TO_NUMBER(NULL) 
 FROM course c2 
 WHERE NOT EXISTS 
 (SELECT 'X' 
 FROM section 
 WHERE c2.course_no = course_no);
 
 delete from t1;
 
  delete from t2;
  
insert into t1 values(1);
insert into t1 values(2);
insert into t1 values(3);

insert into t2 values(2);
insert into t2 values(3);
insert into t2 values(4);
 
 REM [Rischert,2003,450]
 SELECT col1 
 FROM t1;
 
 SELECT col2 
 FROM t2;
 
 SELECT col1, col2 
 FROM t1 RIGHT OUTER JOIN t2 
 ON t1.col1 = t2.col2;
 
  SELECT col1, col2 
 FROM t1 left OUTER JOIN t2 
 ON t1.col1 = t2.col2;
 
   SELECT col1, col2 
 FROM t1 full OUTER JOIN t2 
 ON t1.col1 = t2.col2;
 
insert into t1 values(5);
insert into t1 values(6);
insert into t1 values(7);

 SELECT col1, col2 
 FROM t1 left OUTER JOIN t2 
 ON t1.col1 = t2.col2;
 
insert into t2 values(8);
insert into t2 values(9);
insert into t2 values(10);

 SELECT col1, col2 
 FROM t1 FULL  OUTER JOIN t2 
 ON t1.col1 = t2.col2;

 REM [Rischert,2003,452]  
REM FULL OUTER JOIN Using The UNION Operator 
SELECT col1, col2 
 FROM t1, t2 
 WHERE t1.col1 = t2.col2(+) 
UNION 
SELECT col1, col2 
 FROM t1, t2 
 WHERE t1.col1(+) = t2.col2;
 
REM EXPLAIN THE ERROR
SELECT c.course_no, s.course_no, s.section_id, 
 c.description, s.start_date_time 
 FROM course c, section s 
 WHERE c.course_no(+) = s.course_no(+);
 
 REM ANSWER 
 SELECT c.course_no, s.course_no, s.section_id, 
 c.description, s.start_date_time 
 FROM course c, section s 
 WHERE c.course_no = s.course_no(+); 
 
  SELECT c.course_no, s.course_no, s.section_id, 
 c.description, s.start_date_time 
 FROM course c, section s 
 WHERE c.course_no (+) = s.course_no;
 
 REM PUEDE USAR EL FULL OUTER JOIN
 SELECT c.course_no, s.course_no, s.section_id, 
 c.description, s.start_date_time 
 FROM course c FULL OUTER JOIN section s 
 ON c.course_no = s.course_no;
 
 
REM  WHERE Conditions and The Oracle OUTER JOIN Operator
SELECT c.course_no cno, s.course_no sno, 
 c.description, 
 c.prerequisite prereq, 
 s.location loc, s.section_id 
 FROM course c, section s 
 WHERE c.course_no = s.course_no(+) 
 AND c.prerequisite = 350;
 
REM 
COL LOC FORMAT A10
SELECT c.course_no cno, s.course_no sno, 
 c.description, 
 c.prerequisite prereq, 
 s.location loc, s.section_id 
 FROM course c, section s 
 WHERE c.course_no = s.course_no(+) 
 AND c.prerequisite = 350 
 AND s.location = 'L507';
 
 
 REM
  REM [Rischert,2003,458]
 SELECT c.course_no cno, s.course_no sno, 
 c.description, 
 c.prerequisite prereq, 
 s.location loc, s.section_id 
 FROM course c, section s 
 WHERE c.course_no = s.course_no(+) 
 AND c.prerequisite = 350 
 AND s.location(+) = 'L507';
 
 REM 
 SELECT c.course_no cno, s.course_no sno, 
 SUBSTR(c.description, 1,20), 
 c.prerequisite prereq, 
 s.location loc, s.section_id 
 FROM course c, section s 
  WHERE c.course_no = s.course_no(+) 
 AND c.prerequisite = 350 
 AND s.location(+) = 'L210';
 
 REM [ Rischert, 2003, 459]
 REM WHERE Conditions and The ANSI OUTER JOINS 
  SELECT c.course_no cno, s.course_no sno, 
 c.description, 
 c.prerequisite prereq, 
 s.location loc, s.section_id 
 FROM course c LEFT OUTER JOIN section s 
 ON c.course_no = s.course_no 
 WHERE c.prerequisite = 350 
 AND location = 'L507';
 
 
 
 
 SELECT c.course_no cno, s.course_no sno, 
 c.description, 
 c.prerequisite prereq, 
 s.location loc, s.section_id 
  FROM course c LEFT OUTER JOIN section s 
 ON (c.course_no = s.course_no 
 AND location = 'L507') 
 WHERE c.prerequisite = 350;
 
 rem quitemos el filtro de where 
  SELECT c.course_no cno, s.course_no sno, 
 c.description, 
 c.prerequisite prereq, 
 s.location loc, s.section_id 
  FROM course c LEFT OUTER JOIN section s 
 ON (c.course_no = s.course_no 
 AND location = 'L507');
 
 
 rem Using Inline Views and Outer Joins 
 
 
 REM [ Rischert, 2003, 460]
 SELECT c.course_no cno, s.course_no sno, 
 c.description, 
 c.prerequisite prereq, 
 s.location loc, s.section_id 
 FROM (SELECT * 
 FROM course 
 WHERE prerequisite = 350) c LEFT OUTER JOIN 
 (SELECT * FROM section 
 WHERE location = 'L507') s 
 ON (c.course_no = s.course_no);
 
 rem  outer join involves three tables: the COURSE, SECTION, and INSTRUCTOR
col location format a10
 SELECT course_no cou, description, cost, 
 location, last_name 
 FROM course LEFT OUTER JOIN section 
 USING (course_no) 
 LEFT OUTER JOIN instructor 
 USING (instructor_id) 
 ORDER BY course_no;
 
 col location format a10
 SELECT course_no cou, description, cost, 
 location, last_name 
 FROM course LEFT OUTER JOIN section 
 USING (course_no) 
 LEFT OUTER JOIN instructor 
 USING (instructor_id) 
 ORDER BY 3,course_no;
 rem   autojoin
 
col prerequisite format 99999
col pre_req_descr format a35
 SELECT c1.course_no, 
 c1.description course_descr, 
 c1.prerequisite, 
 c2.description pre_req_descr 
 FROM course c1 JOIN course c2 
 ON (c1.prerequisite = c2.course_no) 
 ORDER BY 3;
 
 rem The NON-EQUIJOIN
 rem  using BETWEEN 
 SELECT grade_type_code, numeric_grade, letter_grade 
 FROM grade g JOIN grade_conversion c 
 ON (g.numeric_grade BETWEEN c.min_grade AND c.max_grade) 
 WHERE g.student_id = 107 
 ORDER BY 1, 2 DESC;
 
 
 REM
 SELECT DISTINCT a.student_id, a.first_name, a.salutation 
 FROM student a, student b 
 WHERE a.salutation <> b.salutation 
 AND b.first_name = a.first_name 
 AND a.student_id <> b.student_id 
 ORDER BY a.first_name;
 
 SELECT fi.student_id, mt.numeric_grade "Midterm Grade", 
 fi.numeric_grade "Final Grade" 
 FROM grade fi JOIN grade mt 
 ON (fi.section_id = mt.section_id 
 AND fi.student_id = mt.student_id) 
 WHERE fi.grade_type_code = 'FI' 
 AND fi.section_id = 86 
 AND mt.grade_type_code = 'MT' 
 AND fi.numeric_grade < mt.numeric_grade;
 
  REM [ Rischert, 2003, 470]
 SELECT fi.student_id, mt.numeric_grade "Midterm Grade", 
 fi.numeric_grade "Final Grade" 
 FROM grade fi JOIN grade mt 
 ON (fi.section_id = mt.section_id 
 AND fi.student_id = mt.student_id) 
 WHERE fi.grade_type_code = 'FI' 
 AND fi.section_id = 86 
 AND mt.grade_type_code = 'MT' 
 AND fi.numeric_grade < mt.numeric_grade;
 
 
 
  SELECT fi.student_id, mt.numeric_grade "Midterm Grade", 
 fi.numeric_grade "Final Grade" 
 FROM grade fi JOIN grade mt 
 ON (fi.section_id = mt.section_id 
 AND fi.student_id = mt.student_id);
-- WHERE fi.grade_type_code = 'FI' 
-- AND fi.section_id = 86 
--  AND mt.grade_type_code = 'MT' 
-- AND fi.numeric_grade < mt.numeric_grade;
 
 rem apliquemos filtros paso a paso
 
   SELECT fi.student_id, mt.numeric_grade "Midterm Grade", 
 fi.numeric_grade "Final Grade" 
 FROM grade fi JOIN grade mt 
 ON (fi.section_id = mt.section_id 
 AND fi.student_id = mt.student_id)
 WHERE fi.grade_type_code = 'FI';
-- AND fi.section_id = 86 
--  AND mt.grade_type_code = 'MT' 
-- AND fi.numeric_grade < mt.numeric_grade;

   SELECT fi.student_id, mt.numeric_grade "Midterm Grade", 
 fi.numeric_grade "Final Grade" 
 FROM grade fi JOIN grade mt 
 ON (fi.section_id = mt.section_id 
 AND fi.student_id = mt.student_id)
 WHERE fi.grade_type_code = 'FI'
 AND fi.section_id = 86; 
--  AND mt.grade_type_code = 'MT' 
-- AND fi.numeric_grade < mt.numeric_grade;

   SELECT fi.student_id, mt.numeric_grade "Midterm Grade", 
 fi.numeric_grade "Final Grade" 
 FROM grade fi JOIN grade mt 
 ON (fi.section_id = mt.section_id 
 AND fi.student_id = mt.student_id)
 WHERE fi.grade_type_code = 'FI'
 AND fi.section_id = 86 
 AND mt.grade_type_code = 'MT'; 
-- AND fi.numeric_grade < mt.numeric_grade;

   SELECT fi.student_id, mt.numeric_grade "Midterm Grade", 
 fi.numeric_grade "Final Grade" 
 FROM grade fi JOIN grade mt 
 ON (fi.section_id = mt.section_id 
 AND fi.student_id = mt.student_id)
 WHERE fi.grade_type_code = 'FI'
 AND fi.section_id = 86 
 AND mt.grade_type_code = 'MT' 
 AND fi.numeric_grade < mt.numeric_grade;
