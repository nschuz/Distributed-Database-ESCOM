SELECT c.course_no, c.description,
s.section_id, s.course_no
FROM course c LEFT OUTER JOIN section s
ON c.course_no = s.course_no
ORDER BY c.course_no;

SELECT c.course_no, c.description,
s.section_id, s.course_no
FROM course c RIGHT OUTER JOIN section s
ON c.course_no = s.course_no
ORDER BY c.course_no;

SELECT c.course_no cno, s.course_no sno,
c.description,
c.prerequisite prereq,
s.location loc, s.section_id
FROM course c LEFT OUTER JOIN section s
ON c.course_no = s.course_no
WHERE c.prerequisite = 350;

SELECT c.course_no cno, s.course_no sno,
c.description,
c.prerequisite prereq,
s.location loc, s.section_id
FROM course c LEFT OUTER JOIN section s
ON (c.course_no = s.course_no
AND location = 'L507');

SELECT c.course_no cno, s.course_no sno,
c.description,
c.prerequisite prereq,
s.location loc, s.section_id
FROM (SELECT *
FROM course
WHERE prerequisite = 350) c RIGHT OUTER JOIN
(SELECT * FROM section
WHERE location = 'L507') s
ON (c.course_no = s.course_no);

col course_descr format a33
col pre_req_descr format a33
col prerequisite format 9999
SELECT c1.course_no,
c1.description course_descr,
c1.prerequisite,
c2.description pre_req_descr
FROM course c1 JOIN course c2
ON (c1.prerequisite = c2.course_no)
ORDER BY 3;
