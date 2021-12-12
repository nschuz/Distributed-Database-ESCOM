spool out\salida_pag349_1.txt
rem (Rischert,A(2004). Chapter 6. EquiJoins 
rem IN Oracle SQL by Example(326-363),USA: Prentice Hall 

set pagesize 99
set linesize 130
set colsep '|=|'
SET SQLNUMBER ON
col curse_no format 9999
col section_no format 9999
col instructor_id format 9999
col description format a15
col location format a8

/* MULTI COLUMNS JOINS*/

SELECT student_id, section_id, grade_type_code type, 
grade_code_occurrence no, 
numeric_grade indiv_gr 
FROM grade 
WHERE student_id = 220 
AND section_id = 119;

SELECT g.student_id, g.section_id, 
 g.grade_type_code type, 
 g.grade_code_occurrence no, 
 g.numeric_grade indiv_gr,
 TO_CHAR(e.enroll_date, 'MM/DD/YY') enrolldt
 FROM grade g, enrollment e
 WHERE g.student_id = 220 
 AND g.section_id = 119 
 AND g.student_id = e.student_id
 AND g.section_id = e.section_id;


/* ANSI JOIN */
SELECT g.student_id, g.section_id, 
 g.grade_type_code type, 
 g.grade_code_occurrence no, 
 g.numeric_grade indiv_gr, 
 TO_CHAR(e.enroll_date, 'MM/DD/YY') enrolldt 
 FROM grade g JOIN enrollment e 
 ON (g.student_id = e.student_id 
 AND g.section_id = e.section_id) 
 WHERE g.student_id = 220 
 AND g.section_id = 119;


 /* USING join*/
 SELECT student_id, section_id, 
 grade_type_code type, 
 grade_code_occurrence no, 
 numeric_grade indiv_gr, 
 TO_CHAR(enroll_date, 'MM/DD/YY') enrolldt 
 FROM grade JOIN enrollment 
 USING (student_id, section_id) 
 WHERE student_id = 220 
 AND section_id = 119;





spool off

