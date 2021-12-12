 REM [rISCHERT, 2004,784]
create table MODEL_EXAMPLE
(
  COURSE    VARCHAR2(30),
  GENDER    CHAR(1),
  YEAR      NUMBER,
  ENROLL_NO NUMBER);

insert into MODEL_EXAMPLE (GENDER, YEAR, ENROLL_NO, COURSE)
values ('F', 2004, 37, 'Spanish I');
insert into MODEL_EXAMPLE (GENDER, YEAR, ENROLL_NO, COURSE)
values ('M', 2004, 3, 'Spanish I');
insert into MODEL_EXAMPLE (GENDER, YEAR, ENROLL_NO, COURSE)
values ('F', 2004, 59, 'Spanish II');
insert into MODEL_EXAMPLE (GENDER, YEAR, ENROLL_NO, COURSE)
values ('M', 2004, 35, 'Spanish II');
insert into MODEL_EXAMPLE (GENDER, YEAR, ENROLL_NO, COURSE)
values ('F', 2004, 3, 'Spanish III');
insert into MODEL_EXAMPLE (GENDER, YEAR, ENROLL_NO, COURSE)
values ('M', 2004, 34, 'Spanish III');
commit;

select course, gender,year,enroll_no 
	from model_example;
	
rem  the query 
rem determines the projected enrollment numbers 
rem in the courses Spanish II and Spanish III based on 
rem the previous years enrollment numbers
	
SELECT course, gender, year, s 
 FROM model_example 
 MODEL PARTITION BY (gender) 
 DIMENSION BY (year, course) 
 MEASURES (enroll_no s) 
 ( 
 s[2005,'Spanish II'] = s[2004,'Spanish I'], 
 s[2006,'Spanish III'] = ROUND((s[2005, 'Spanish II'])*0.80) 
 ) 
 ORDER BY year, gender, course;
 
  REM [rISCHERT, 2004,785]
 rem  The calculation ROUND((s [CURRENTV()-1,
 rem 'Spanish II'])*1.1) assumes 
 rem a 10 percent increase each 
 rem subsequent year and is rounded to the nearest 
rem whole number

 SELECT course, gender, year, s 
 FROM model_example 
 WHERE course = 'Spanish II' 
 MODEL PARTITION BY (gender) 
 DIMENSION BY (year, course) 
 MEASURES (enroll_no s) 
 ( 
 s[FOR year FROM 2005 TO 2007 INCREMENT 1, 
 'Spanish II'] 
 = ROUND((s[CURRENTV()-1,'Spanish II'])*1.1) 
 ) 
 ORDER BY year, gender, course; 
 
rem  The ROLLUP Operator
rem instalar la tabla
CREATE TABLE instructor_summary
(
  instructor_id   NUMBER(8) NOT NULL,
  gender          CHAR(1),
  campus          VARCHAR2(11),
  semester_year   VARCHAR2(4) NOT NULL,
  semester_month  VARCHAR2(2) NOT NULL,
  num_of_classes  NUMBER,
  num_of_students NUMBER,
  revenue         NUMBER);

select instructor_id, gender, campus, semester_year
	semester_month, num_of_classes, num_of_students,
	revenue from INSTRUCTOR_SUMMARY;
	
ALTER TABLE instructor_summary
  ADD CONSTRAINT instructor_summary_pk 
  PRIMARY KEY (instructor_id,semester_year,semester_month);

INSERT INTO INSTRUCTOR_SUMMARY (INSTRUCTOR_ID, GENDER, CAMPUS, SEMESTER_YEAR, SEMESTER_MONTH, NUM_OF_CLASSES, NUM_OF_STUDENTS, REVENUE)
VALUES (101, 'M', 'LIBERTY', '2003', '06', 9, 45, 51380);
INSERT INTO instructor_summary (instructor_id, gender, campus, semester_year, semester_month, num_of_classes, num_of_students, revenue)
VALUES (102, 'M', 'MORNINGSIDE', '2003', '07', 10, 21, 28580);
INSERT INTO INSTRUCTOR_SUMMARY (INSTRUCTOR_ID, GENDER, CAMPUS, SEMESTER_YEAR, SEMESTER_MONTH, NUM_OF_CLASSES, NUM_OF_STUDENTS, REVENUE)
VALUES (103, 'F', 'MORNINGSIDE', '2004', '07', 10, 37, 44215);
INSERT INTO INSTRUCTOR_SUMMARY (INSTRUCTOR_ID, GENDER, CAMPUS, SEMESTER_YEAR, SEMESTER_MONTH, NUM_OF_CLASSES, NUM_OF_STUDENTS, REVENUE)
VALUES (104, 'M', null, '2003', '07', 10, 25, 29675);
INSERT INTO INSTRUCTOR_SUMMARY (INSTRUCTOR_ID, GENDER, CAMPUS, SEMESTER_YEAR, SEMESTER_MONTH, NUM_OF_CLASSES, NUM_OF_STUDENTS, REVENUE)
VALUES (105, 'F', 'LIBERTY', '2003', '06', 10, 16, 23800);
INSERT INTO INSTRUCTOR_SUMMARY (INSTRUCTOR_ID, GENDER, CAMPUS, SEMESTER_YEAR, SEMESTER_MONTH, NUM_OF_CLASSES, NUM_OF_STUDENTS, REVENUE)
VALUES (106, 'U', 'MORNINGSIDE', '2003', '07', 10, 18, 24995);
INSERT INTO INSTRUCTOR_SUMMARY (INSTRUCTOR_ID, GENDER, CAMPUS, SEMESTER_YEAR, SEMESTER_MONTH, NUM_OF_CLASSES, NUM_OF_STUDENTS, REVENUE)
VALUES (107, 'U', 'DOWNTOWN', '2003', '07', 10, 31, 38135);
INSERT INTO INSTRUCTOR_SUMMARY (INSTRUCTOR_ID, GENDER, CAMPUS, SEMESTER_YEAR, SEMESTER_MONTH, NUM_OF_CLASSES, NUM_OF_STUDENTS, REVENUE)
VALUES (108, 'M', 'MORNINGSIDE', '2003', '07', 9, 33, 41625);
INSERT INTO INSTRUCTOR_SUMMARY (INSTRUCTOR_ID, GENDER, CAMPUS, SEMESTER_YEAR, SEMESTER_MONTH, NUM_OF_CLASSES, NUM_OF_STUDENTS, REVENUE)
VALUES (109, 'U', 'LIBERTY', '2003', '05', 0, 0, 0);
INSERT INTO INSTRUCTOR_SUMMARY (INSTRUCTOR_ID, GENDER, CAMPUS, SEMESTER_YEAR, SEMESTER_MONTH, NUM_OF_CLASSES, NUM_OF_STUDENTS, REVENUE)
VALUES (110, 'F', null, '2003', '05', 0, 0, 0);
COMMIT;
 
 
 select instructor_id, gender, campus, semester_year
	semester_month, num_of_classes, num_of_students,
	revenue from INSTRUCTOR_SUMMARY;
	
 rem using group by clause
 SELECT gender, semester_year AS year, 
 semester_month AS month, 
 SUM(num_of_students) AS total 
 FROM instructor_summary 
 GROUP BY gender, semester_year, semester_month;
 
rem query uses the ROLLUP operator. You will discover 
rem the formation of subtotals for each of the groups. 
col total format 99,990.00
SELECT gender, semester_year AS year, 
 semester_month AS month, 
 SUM(num_of_students) AS total 
 FROM instructor_summary 
 GROUP BY ROLLUP(gender, semester_year, semester_month); 

REM [rISCHERT, 2004,802] 
rem  This query represents the different individual 
rem  rows grouped by the columns GENDER, 
rem SEMESTER_YEAR, and SEMESTER_MONTH.
 SELECT gender, semester_year AS year, 
 semester_month AS month, 
 SUM(num_of_students) AS total 
 FROM instructor_summary  
 GROUP BY gender, semester_year, semester_month;

rem The second query lists the GENDER and 
rem SEMESTER_YEAR columns and computes the respective 
rem summary data. 

SELECT gender, semester_year AS year, 
 SUM(num_of_students) AS total 
 FROM instructor_summary 
 GROUP BY gender, semester_year;
 
rem The third query is a listing 
rem grouped to give you a subtotal for the gender.
SELECT gender, SUM(num_of_students) AS total 
 FROM instructor_summary 
 GROUP BY gender;
 
 rem and the last query is the grand total for all the rows. 
SELECT SUM(num_of_students) AS total 
 FROM instructor_summary; 


rem The CUBE Operator 
SELECT gender, semester_year AS year, 
 semester_month AS month, 
 SUM(num_of_students) AS total 
 FROM instructor_summary 
 GROUP BY CUBE(gender, semester_year, semester_month);
 
 rem Grouping Sets 
 REM [RISCHERT, 2004,806] 
 SELECT gender, semester_year AS YEAR, 
 semester_month AS month, 
 SUM(num_of_students) AS total 
 FROM instructor_summary 
 GROUP BY GROUPING SETS 
 ((gender, semester_year), -- 1st Group 
 (semester_month),         -- 2nd Group 
 ())                       -- 3rd Group ;
 
  REM [RISCHERT, 2004,808] 
 SELECT semester_year AS year, campus, 
 SUM(num_of_classes) AS num_of_classes 
 FROM instructor_summary 
 GROUP BY CUBE (semester_year, campus) 
 ORDER BY 1;
 
 SELECT semester_year AS year, campus, 
 SUM(num_of_classes) AS num_of_classes, 
 GROUPING (semester_year) GP_YEAR, 
 GROUPING (campus) GP_CAMPUS 
 FROM instructor_summary 
 GROUP BY CUBE (semester_year, campus) 
 ORDER BY 1;