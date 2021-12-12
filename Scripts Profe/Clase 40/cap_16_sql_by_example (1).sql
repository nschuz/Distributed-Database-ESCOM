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
 drop table course_revenue;
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


----------------------------------------------------------


select course_no, revenue, 
	course_fee, num_enrolled, num_of_sections
	from course_revenue;

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
 
  SELECT course_no, revenue, rownum,
 NTILE(4) OVER (ORDER BY revenue ) ntile 
 FROM course_revenue;
 
 
 select course_no, revenue, 
	course_fee, num_enrolled, num_of_sections
	from course_revenue
	order by 2;
	
 select course_no, revenue,cr.rownum
	from course_revenue cr;
	order by 2;
	



 drop view vista_revenue;
 create view vista_revenue as 
 select course_no, revenue
	from course_revenue
	order by 2;

select * from vista_revenue;	

DROP TABLE tabla_DOS_revenue purge;

 create table tabla_DOS_revenue as 
 (select course_no, revenue
	from course_revenue)
	order by 2;
	
select COURSE_NO,REVENUE, ROWNUM, ROWID from tabla_DOS_revenue;

 SELECT course_no, revenue, rownum,
 NTILE(4) OVER (ORDER BY revenue ) ntile 
 FROM tabla_DOS_revenue;
 COL TOTAL FORMAT 90.0
  SELECT ROUND(24/4) TOTAL FROM DUAL;
  SELECT (24/4) TOTAL FROM DUAL;
  
  SELECT course_no, revenue, rownum,
 NTILE(5) OVER (ORDER BY revenue ) ntile 
 FROM tabla_DOS_revenue;
 
 SELECT ROUND(24/5) TOTAL FROM DUAL;

 SELECT       (24/5) TOTAL FROM DUAL;
 
   SELECT course_no, revenue, rownum,
 NTILE(10) OVER (ORDER BY revenue ) ntile 
 FROM tabla_DOS_revenue;
 
 SELECT ROUND(24/10) TOTAL FROM DUAL;
 SELECT      (24/10) TOTAL FROM DUAL;
   SELECT course_no, revenue, rownum,
 NTILE(15) OVER (ORDER BY revenue ) ntile 
 FROM tabla_DOS_revenue;
 
 SELECT ROUND(24/15) TOTAL FROM DUAL;
 SELECT       (24/15) TOTAL FROM DUAL;
 
 SELECT course_no, revenue, rownum,
 NTILE(24) OVER (ORDER BY revenue ) ntile 
 FROM tabla_DOS_revenue;
 
 SELECT ROUND(24/24) TOTAL FROM DUAL;
 SELECT       (24/24) TOTAL FROM DUAL;	
 
  SELECT course_no, revenue, rownum,
 NTILE(30) OVER (ORDER BY revenue ) ntile 
 FROM tabla_DOS_revenue;
 
 SELECT ROUND(30/24) TOTAL FROM DUAL;
 SELECT       (30/24) TOTAL FROM DUAL;	
 
 
 
 
 SELECT RANK(20000) WITHIN 
		GROUP (ORDER BY revenue DESC) 
 "Hypothetical Rank" 
 FROM course_revenue;
 
  SELECT RANK(10000) WITHIN 
		GROUP (ORDER BY revenue DESC) 
 "Hypothetical Rank" 
 FROM course_revenue;
 
   SELECT RANK(50000) WITHIN 
		GROUP (ORDER BY revenue DESC) 
 "Hypothetical Rank" 
 FROM course_revenue;
 
   SELECT RANK(60000) WITHIN 
		GROUP (ORDER BY revenue DESC) 
 "Hypothetical Rank" 
 FROM course_revenue;
 
    SELECT RANK(100000) WITHIN 
		GROUP (ORDER BY revenue DESC) 
 "Hypothetical Rank" 
 FROM course_revenue;
 
     SELECT RANK(30000) WITHIN 
		GROUP (ORDER BY revenue DESC) 
 "Hypothetical Rank" 
 FROM course_revenue;
 
    SELECT RANK(53775) WITHIN 
		GROUP (ORDER BY revenue DESC) 
 "Hypothetical Rank" 
 FROM course_revenue;
 
     SELECT RANK(53776) WITHIN 
		GROUP (ORDER BY revenue DESC) 
 "Hypothetical Rank" 
 FROM course_revenue;
 
      SELECT RANK(100) WITHIN 
		GROUP (ORDER BY revenue DESC) 
 "Hypothetical Rank" 
 FROM course_revenue;
 
       SELECT RANK(1) WITHIN 
		GROUP (ORDER BY revenue DESC) 
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
 
 SELECT COUNT(*) FROM GRADE;
 
 SELECT COUNT(*) FROM GRADE
 WHERE SECTION_ID = 99;
  
 SELECT course_no, revenue, 
 NTILE(4) OVER (ORDER BY revenue DESC) ntile 
 FROM course_revenue;
 
 SELECT course_no, revenue, 
 NTILE(4) OVER (ORDER BY revenue ) ntile 
 FROM course_revenue;
 
 SELECT course_no, revenue, 
 NTILE(6) OVER (ORDER BY revenue ) ntile 
 FROM course_revenue;
 
 SELECT course_no, revenue, 
 NTILE(10) OVER (ORDER BY revenue ) ntile 
 FROM course_revenue;
 
 
 SET MARKUP HTML ON
SET TERMOUT OFF
SET FEEDBACK OFF
SPOOL current_employees.xls
SELECT employee_id,
       employee_billing_rate
       employee_hire_date,
       employee_name
FROM employee
WHERE employee_termination_date IS NULL;
SPOOL OFF
EXIT


SELECT COUNT(*), 
 MIN(numeric_grade) min, MAX(numeric_grade) max, 
 COUNT(*) KEEP (DENSE_RANK  FIRST ORDER BY numeric_grade) 
 lowest, 
 COUNT(*) KEEP (DENSE_RANK  LAST ORDER BY numeric_grade) 
 highest 
 FROM grade g 
 WHERE section_id = 99; 
 
 REM QUERY EQUIVALENTE
 
REM The equivalent statement to determine 
REM the result of the FIRST and LAST ranking functions would 
REM be this query, which makes 
REM multiple passes through the SECTION table.
 
SELECT numeric_grade, COUNT(*) 
 FROM grade 
	WHERE section_id = 99 
		AND (numeric_grade IN (SELECT MAX(numeric_grade) 
								FROM grade 
								WHERE section_id = 99) 
		OR 
			numeric_grade IN (SELECT MIN(numeric_grade) 
								FROM grade 
								WHERE section_id = 99)) 
	GROUP BY numeric_grade;
 
 REM ANALICEMOS EL QUERY
 
 SELECT MAX(numeric_grade) 
	FROM grade 
	WHERE section_id = 99;


SELECT MIN(numeric_grade) 
	FROM grade 
	WHERE section_id = 99;
								
REM  MEDIAN 
REM The analytical MEDIAN 
REM function returns the median or middle value	
SELECT grade_type_code, numeric_grade, 
 MEDIAN(numeric_grade) OVER (PARTITION BY grade_type_code) 
 AS median 
 FROM grade 
 WHERE section_id = 150;	

REM QUITEMOS EL FILTRO "WHERE"
SELECT grade_type_code, numeric_grade, 
 MEDIAN(numeric_grade) OVER (PARTITION BY grade_type_code) 
 AS median 
 FROM grade; 
 
 SELECT grade_type_code, MEDIAN(numeric_grade) 
 FROM grade 
 GROUP BY grade_type_code;

REM  The next statement illustrates 
REM the use of this function; it returns 
REM the value that occurs with the greatest frequency.

SELECT STATS_MODE(cost) 
 FROM course;
 REM FORMEMOS GRUPOS POR EL ATRIBUTO COST
 COL COST FORMAT 9,990.00
 SELECT COST, COUNT(*)
 FROM COURSE
 GROUP BY COST;
 
 REM  lists the individual grades 
 REM for each grade type for STUDENT_ID 254 
 REM enrolled in SECTION_ID 87.
 
 SELECT numeric_grade, grade_type_code, 
 AVG(numeric_grade) 
 OVER(PARTITION BY grade_type_code) AS avg 
 FROM grade 
 WHERE student_id = 254 
 AND section_id = 87;
 
REM If you omit the partition as indicated
REM with the empty set of parentheses, 
REM the aggregate is computed 
REM for all the rows of the 
REM result set as you see in the next query.

SELECT numeric_grade, grade_type_code, 
 AVG(numeric_grade) OVER() AS avg 
 FROM grade 
 WHERE student_id = 254 
 AND section_id = 87;
 
REM  RATIO_TO_REPORT 
REM The RATIO_TO_REPORT function is 
REM another reporting function; 
REM it computes the ratio of a value to 
REM the sum of a set of values
 
 SELECT course_no, revenue, 
 RATIO_TO_REPORT(revenue) OVER () AS ratio 
 FROM course_revenue;
 
 
 SELECT SUM(REVENUE)
	FROM COURSE_REVENUE;
COL TOTAL2 FORMAT 99.9999999999	
SELECT 1195/265775 TOTAL2 FROM DUAL;
SELECT 10755/265775 TOTAL2 FROM DUAL;
SELECT 2390/265775 TOTAL2 FROM DUAL;
SELECT 14235/265775 TOTAL2 FROM DUAL;

REM  The CumAvg column shows the 
REM  cumulative average and 
REM the CumSum column the cumulative sum
COL "CumAvg" FORMAT 99,990.0000
COL "CumSum" FORMAT 999,999
COL REVENUE  FORMAT 999,999
SELECT course_no, revenue, 
 AVG(revenue) OVER (ORDER BY course_no 
 ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
 "CumAvg", 
 SUM(revenue) OVER (ORDER BY course_no 
 ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
 "CumSum" 
 FROM course_revenue;
 
 
 SELECT course_no, revenue, 
 AVG(revenue) OVER (ORDER BY course_no 
 ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) 
 "CentAvg", 
 AVG(revenue) OVER (ORDER BY course_no 
 ROWS 1 PRECEDING) 
 "MovAvg" 
 FROM course_revenue;
 
 REM The column is labeled CentAvg. 
 REM A moving average takes 
REM the current row and the previous 
REM row and the result is shown in the MovAvg column.
COL "CentAvg" FORMAT 999,999.00
COL "MovAvg"  FORMAT 999,999.00
SELECT course_no, revenue, 
 AVG(revenue) OVER (ORDER BY course_no 
 ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) 
 "CentAvg", 
 AVG(revenue) OVER (ORDER BY course_no 
 ROWS 1 PRECEDING) 
 "MovAvg" 
 FROM course_revenue;
 
 
WITH 
revenue_per_instructor AS 
(SELECT instructor_id, SUM(cost) AS revenue 
 FROM section s, course c, enrollment e 
 WHERE s.section_id = e.section_id 
 AND c.course_no = s.course_no 
 GROUP BY instructor_id) 
SELECT * 
 FROM revenue_per_instructor 
 WHERE revenue > (SELECT AVG(revenue) 
 FROM revenue_per_instructor);

SELECT instructor_id, cost, s.section_id, student_id 
 FROM section s, course c, enrollment e 
 WHERE s.section_id = e.section_id 
 AND c.course_no = s.course_no 
 ORDER BY instructor_id;

REM [rISCHERT, 2004,782]
SELECT instructor_id, SUM(cost) 
 FROM section s, course c, enrollment e 
 WHERE s.section_id = e.section_id 
 AND c.course_no = s.course_no 
 GROUP BY instructor_id;
 
 
 
 




 SET MARKUP HTML ON
 SET TERMOUT OFF
SET FEEDBACK OFF
SPOOL C:\Users\ORA_bases\2021_02_24_clase_2\salida\ntile.xls
 SELECT course_no, revenue, 
 NTILE(6) OVER (ORDER BY revenue ) ntile 
 FROM course_revenue;
SPOOL OFF


