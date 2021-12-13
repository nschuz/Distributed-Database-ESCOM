spool out\salida_pag366-423.txt
rem Rischert, A(2004).Chapter 7. SQL: Subqueries
rem IN Oracle SQL by Example(366-423),USA: prentice hall
SELECT first_name, last_name
  FROM student
 WHERE registration_date =
       (SELECT MIN(registration_date)
          FROM student);
SELECT c.description, s.section_no, c.cost, s.capacity
  FROM course c, section s
 WHERE c.course_no = s.course_no 
   AND s.capacity <=
       (SELECT AVG(capacity)
          FROM section)
   AND c.cost =
       (SELECT MIN(cost)
          FROM course);

SELECT course_no, SUM(capacity)
  FROM section
 GROUP BY course_no
HAVING SUM(capacity) <
       (SELECT AVG(capacity)
          FROM section);

SELECT course_no, description
  FROM course
 WHERE course_no IN
       (SELECT course_no
          FROM section 
         WHERE instructor_id IN
               (SELECT instructor_id
                  FROM instructor
                 WHERE last_name = 'Hanks'
                   AND first_name = 'Fernand'));

SELECT last_name, first_name
  FROM student 
 WHERE student_id NOT IN 
       (SELECT student_id
          FROM enrollment);

SELECT s.student_id, s.last_name, e.final_grade,
       e.section_id
  FROM enrollment e, student s
 WHERE e.student_id = s.student_id
   AND (e.final_grade, e.section_id) IN 
       (SELECT MAX(final_grade), section_id
          FROM enrollment
         GROUP BY section_id);

 
SELECT first_name, last_name, student_id
  FROM student s
 WHERE EXISTS
       (SELECT NULL
          FROM enrollment
         WHERE s.student_id = student_id
         GROUP BY student_id
        HAVING COUNT(*) >= 3);

SELECT first_name, last_name, student_id
  FROM student s
 WHERE EXISTS
       (SELECT NULL
          FROM enrollment
         WHERE s.student_id = student_id
         GROUP BY student_id
        HAVING COUNT(*) > 3);

SELECT first_name, last_name, s.student_id 
  FROM enrollment e, student s
 WHERE e.student_id = s.student_id
 GROUP BY first_name, last_name, s.student_id
HAVING COUNT(*) >= 3;

SELECT first_name, last_name, s.student_id 
  FROM enrollment e, student s
 WHERE e.student_id = s.student_id
 GROUP BY first_name, last_name, s.student_id
HAVING COUNT(*) < 3;

SELECT first_name, last_name, student_id
  FROM student
 WHERE student_id IN
       (SELECT student_id
          FROM enrollment
         GROUP BY student_id
        HAVING COUNT(*) >= 3);

SELECT first_name, last_name, student_id
  FROM student
 WHERE student_id IN
       (SELECT student_id
          FROM enrollment
         GROUP BY student_id
        HAVING COUNT(*) = 3);
 
SELECT g.student_id, section_id, g.numeric_grade,
       gr.average
  FROM grade g JOIN
       (SELECT section_id, AVG(numeric_grade) average
          FROM grade 
         WHERE section_id IN (94, 106)
           AND grade_type_code = 'FI'
         GROUP BY section_id) gr
 USING (section_id)
 WHERE g.grade_type_code = 'FI'
   AND g.numeric_grade > gr.average;

SELECT a.course_no, total_capacity, total_students,
       ROUND(100/total_capacity*total_students, 2)
       "Filled Percentage"
  FROM (SELECT COUNT(*) total_students, s.course_no
          FROM enrollment e, section s
         WHERE e.section_id = s.section_id
         GROUP BY s.course_no) a,
       (SELECT SUM(capacity) total_capacity, course_no
          FROM section 
         GROUP BY course_no) b
 WHERE b.course_no = a.course_no
 ORDER BY "Filled Percentage" DESC;
 
spool off