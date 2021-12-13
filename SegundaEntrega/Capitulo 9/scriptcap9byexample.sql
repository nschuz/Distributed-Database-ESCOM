spool out\cap9byexample.txt
rem Rischert, A(2004).Chapter 9. SQL: Complex Joins
rem IN Oracle SQL by Example(446-476),USA: prentice hall
SELECT course_no, description
  FROM course
 WHERE prerequisite = 350;

SELECT c.course_no cno, s.course_no sno,
       c.description,
       c.prerequisite prereq,
       s.location loc, s.section_id
  FROM course c LEFT OUTER JOIN section s
    ON c.course_no = s.course_no
 WHERE c.prerequisite = 350;

SELECT course_no cno,
       description,
       prerequisite prereq,
       location loc, section_id
  FROM course LEFT OUTER JOIN section
 USING (course_no)
 WHERE prerequisite = 350;

 
SELECT c.course_no, c.description
  FROM course c, section s
 WHERE c.course_no = s.course_no(+)
   AND s.course_no IS NULL;

SELECT city, state, z.zip AS zzip, s.zip AS szip,
       COUNT(s.zip) AS student_count,
       COUNT(z.zip) AS wrong_value
  FROM zipcode z LEFT OUTER JOIN student s
    ON (z.zip = s.zip)
 WHERE state = 'CT'
 GROUP BY city, state, z.zip, s.zip;

SELECT course_no cou, description, cost,
       location, last_name
  FROM course LEFT OUTER JOIN section
 USING (course_no)
  LEFT OUTER JOIN instructor
 USING (instructor_id)
 ORDER BY course_no;

SELECT student_id, section_id, grade_type_code,
       numeric_grade
  FROM student LEFT OUTER JOIN enrollment 
 USING (student_id) 
  LEFT OUTER JOIN grade
 USING (student_id, section_id)
 WHERE student_id IN (102, 301);

SELECT DISTINCT a.student_id, a.first_name, a.salutation
  FROM student a, student b
 WHERE a.salutation <> b.salutation
   AND b.first_name = a.first_name
   AND a.student_id <> b.student_id
 ORDER BY a.first_name; 
 
SELECT DISTINCT a.student_id, a.last_name,
       a.street_address
  FROM student a, student b
 WHERE a.street_address = b.street_address
   AND a.zip = b.zip
   AND a.student_id <> b.student_id
 ORDER BY a.street_address;

SELECT DISTINCT b.student_id id, b.last_name,
       b.street_address ||' '|| city || ', '
       || state address
  FROM student a, student b, zipcode z
 WHERE a.street_address = b.street_address
   AND a.zip = b.zip
   AND a.student_id <> b.student_id
   AND z.zip = b.zip
 ORDER BY address;

SELECT DISTINCT student_id id, last_name,
       street_address ||' '|| city || ', '
       || state address
  FROM student s, zipcode z
 WHERE s.zip = z.zip
   AND (street_address, s.zip) IN
       (SELECT street_address, zip
          FROM student
         GROUP BY street_address, zip
        HAVING COUNT(*) > 1)
 ORDER BY address;

spool off




