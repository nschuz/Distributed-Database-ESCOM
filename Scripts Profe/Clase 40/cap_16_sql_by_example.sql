SELECT numeric_grade, 
 DENSE_RANK() OVER (ORDER BY numeric_grade) AS rank 
 FROM grade 
 WHERE student_id = 254 
 AND section_id = 87;
 
 rem [Rischert, 2003,764]
rem  find out the three lowest grades of the student, 
rem rather than all the grades, you can modify the 
rem query by using the ranking function 
rem and an inline view as follows: 
SELECT * 
 FROM (SELECT numeric_grade, 
 DENSE_RANK() OVER (ORDER BY numeric_grade) 
 AS rank 
 FROM grade 
 WHERE student_id = 254 
 AND section_id = 87) 
 WHERE rank <= 3;

rem DENSE_RANK function, the 
rem ROWNUM pseudocolumn does not 
rem distinguish between grades 
rem that share the same values

SELECT * 
 FROM (SELECT numeric_grade 
 FROM grade 
 WHERE student_id = 254 
 AND section_id = 87 
 ORDER BY numeric_grade) 
 WHERE rownum <=3;
 
 CREATE TABLE course_revenue
(
  course_no       NUMBER(8) NOT NULL,
  revenue         NUMBER,
  course_fee      NUMBER(9,2),
  num_enrolled    NUMBER,
  num_of_sections NUMBER);
  
 INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (10, 1195, 1195, 1, 1);
INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (20, 10755, 1195, 9, 4);
INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (25, 53775, 1195, 45, 8);
INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (100, 15535, 1195, 13, 5);
INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (120, 27485, 1195, 23, 6);
INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (122, 28680, 1195, 24, 5);
INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (124, 9560, 1195, 8, 3);
INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (125, 9560, 1195, 8, 4);
INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (130, 9560, 1195, 8, 3);
INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (132, 2390, 1195, 2, 1);
INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (134, 2390, 1195, 2, 2);
INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (135, 4380, 1095, 4, 3);
INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (140, 17925, 1195, 15, 2);
INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (142, 8365, 1195, 7, 2);
INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (145, 2390, 1195, 2, 1);
INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (146, 3585, 1195, 3, 2);
INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (147, 5975, 1195, 5, 1);
INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (204, 1195, 1195, 1, 1);
INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (230, 15330, 1095, 14, 2);
INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (240, 14235, 1095, 13, 2);
INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (310, 4780, 1195, 4, 1);
INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (330, 3585, 1195, 3, 1);
INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (350, 10755, 1195, 9, 2);
INSERT INTO course_revenue (course_no, revenue, course_fee, num_enrolled, num_of_sections)
VALUES (420, 2390, 1195, 2, 1);
COMMIT;


SELECT course_no, revenue, 
 RANK() OVER (ORDER BY revenue DESC) 
 rev_rank, 
 DENSE_RANK() OVER (ORDER BY revenue DESC) 
 rev_dense_rank, 
 ROW_NUMBER() OVER (ORDER BY revenue DESC) 
 row_number 
 FROM course_revenue;

 rem [Rischert, 2003,767]
SELECT course_no, course_fee fee, revenue, 
 RANK() OVER (PARTITION BY course_fee 
 ORDER BY revenue DESC) rev_rank, 
 DENSE_RANK() OVER (PARTITION BY course_fee 
 ORDER BY revenue DESC) rev_dense_rank, 
 ROW_NUMBER() OVER (PARTITION BY course_fee 
 ORDER BY revenue DESC) row_number 
 FROM course_revenue; 
 
 rem   ntile 
  rem [Rischert, 2003,767]
 SELECT course_no, revenue, 
 NTILE(4) OVER (ORDER BY revenue DESC) ntile 
 FROM course_revenue;
 
 
 SELECT RANK(20000) WITHIN GROUP (ORDER BY revenue DESC) 
 "Hypothetical Rank" 
 FROM course_revenue;
 
 
rem  The next query displays for the GRADE table 
rem and SECTION_ID 99 a count of the number of rows 
rem with the highest and the lowest grades. 
SELECT COUNT(*), 
 MIN(numeric_grade) min, MAX(numeric_grade) max, 
 COUNT(*) KEEP (DENSE_RANK FIRST ORDER BY numeric_grade) 
 lowest, 
 COUNT(*) KEEP (DENSE_RANK LAST ORDER BY numeric_grade) 
 highest 
 FROM grade g 
 WHERE section_id = 99; 