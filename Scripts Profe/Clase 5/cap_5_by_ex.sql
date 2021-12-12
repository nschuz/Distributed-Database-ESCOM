spool C:\Users\ORA_bases\2021_02_24_clase_2\salida\cap_5_clase_5.txt
rem Chapter 5. Aggregate Functions, 
rem  GROUP BY, and HAVING 
rem [Rischert,2004,300]
rem the difference is that COUNT(*) 
rem counts rows that contain null values, 
rem whereas COUNT with a column 
rem excludes rows that contain nulls
set pagesize 99;
set linesize 130;
set colsep '|=|'
set underline =
set null s/Datos
SELECT COUNT(final_grade), COUNT(section_id), COUNT(*) 
 FROM enrollment;
 
 rem probemos con  la entidad COURSE
 SELECT COUNT(COST), COUNT(PREREQUISITE),
	COUNT(*)
	FROM COURSE;

COL DESCRIPTION FORMAT A35
SELECT DESCRIPTION,PREREQUISITE,COST
	FROM COURSE
	order by 2;
	


rem COUNT and DISTINCT 
rem DISTINCT is often used in conjunction with aggregate functions 
rem to determine the number of distinct
SELECT COUNT(DISTINCT section_id) val_distintos,
	COUNT(section_id) secciones
 FROM enrollment;
rem encontrar los valores distintos de seccion_id
SELECT DISTINCT section_id sec_diferen
 FROM enrollment
 order by 1; 
rem  formemos grupos por seccion

SELECT section_id 
 FROM enrollment
 group by section_id
 order by 1;
 
 rem contemos los elementos  por grupo
 SELECT section_id,count(*) 
 FROM enrollment
 group by section_id
 order by 1;
 
  SELECT section_id,count(section_id) 
 FROM enrollment
 group by section_id
 order by 1;
 
 rem The SUM Function 
 rem [Rischert,2004,303]
 SELECT SUM(capacity) tot_Capaci
 FROM section;
 
 rem The AVG Function 
 SELECT AVG(capacity), AVG(NVL(capacity,0)) 
 FROM section;
 rem despleguemos los nulos de capacity
 select capacity 
	from section;
rem no hay nulos
rem
rem The MIN and MAX Functions 
SELECT MIN(capacity) minimo,
	   MAX(capacity) maximo
 FROM section;
 
rem MIN and MAX With Other Datatypes 
SELECT MIN(registration_date) "First",
	   MAX(registration_date) "Last" 
 FROM student;

col min format a32
col max format a32 
 SELECT MIN (description) AS MIN,
        MAX (description) AS MAX 
 FROM course;
 
 rem AGGREGATE Functions and CASE
col avg format $99,990.00 
-- col avg format 99,990.00 
 SELECT AVG(
    CASE WHEN prerequisite IS NOT NULL THEN cost*1.1 
         WHEN prerequisite = 20 THEN cost*1.2 
        ELSE cost 
         END) AS avg 
 FROM course;
 rem [Rischert,2004,308]
 SELECT COUNT(*) nulos
 FROM course 
 WHERE prerequisite IS NULL; 
 
 rem The GROUP BY and HAVING Clauses
 SELECT DISTINCT location 
 FROM section; 
 
rem [Rischert,2004,312]
rem utilizando GROUP BY 
SELECT location 
 FROM section 
 GROUP BY location; 
 
 COL LOCATION FORMAT A10
SELECT location, COUNT(*) 
 FROM section 
 GROUP BY location
 ORDER BY 2;
 
 
 COL MIN FORMAT 99,999.99
 COL MAX FORMAT 99,999.99
 SELECT location, COUNT(*), 
		SUM(capacity) AS sum, 
		MIN(capacity) AS min, 
		MAX(capacity) AS max 
 FROM section 
 GROUP BY location;
 
 rem [Rischert,2004,313]
 col location format a10
 SELECT location, capacity, section_id 
 FROM section 
 WHERE location = 'L211';
 
 rem [Rischert,2004,314]
 SELECT location,
	instructor_id, 
	COUNT(*),
	SUM(capacity) AS sum, 
	MIN(capacity) AS min,
	MAX(capacity) AS max 
 FROM section 
 GROUP BY location, instructor_id;
 
 rem The HAVING Clause 
 rem The HAVING Clause 
 rem The HAVING Clause 
 SELECT location "Location",
		instructor_id, 
		COUNT(location) "Total Locations", 
		SUM(capacity)   "Total Capacity" 
 FROM section 
 GROUP BY location, instructor_id 
 HAVING SUM(capacity) > 50 
  ORDER BY "Total Capacity" DESC;
  
  rem The WHERE and HAVING Clauses
  rem The WHERE and HAVING Clauses
  rem The WHERE and HAVING Clauses
  
 SELECT location "Location",
		instructor_id, 
		COUNT(location) "Total Locations", 
		SUM(capacity) "Total Capacity" 
 FROM section 
	WHERE section_no IN (2, 3) 
	GROUP BY location, instructor_id 
	HAVING SUM(capacity) > 50;

 rem Multiple Conditions 
 rem In The HAVING Clause 
 SELECT location "Location", 
		SUM(capacity) "Total Capacity" 
	FROM section 
	WHERE section_no = 3 
	GROUP BY location 
	HAVING (COUNT(location) > 3 
		AND location LIKE 'L5%');
 
 rem Constants and 
 rem Functions Without Parameters
 SELECT 'Hello', 1, SYSDATE,
		course_no "Course #", 
		COUNT(*) 
	FROM section 
	GROUP BY course_no 
		HAVING COUNT(*) = 5; 
	
rem Nesting Aggregate Functions
 SELECT MAX(COUNT(*)) 
   FROM enrollment 
  GROUP BY section_id;

 SELECT COUNT(*) 
   FROM enrollment 
  GROUP BY section_id
  order by 1; 

rem Taking Aggregate Functions 
rem And Groups To 
rem The Next Level  

NULLS and The GROUP BY Clause 
SELECT prerequisite, COUNT(*) 
 FROM course 
 GROUP BY prerequisite 
 ORDER BY prerequisite NULLS FIRST;
 
rem [Rischert,2004,321]
SELECT course_no "Course #", 
 AVG(capacity) "Avg. Capacity", 
 ROUND(AVG(capacity)) "Rounded Avg. Capacity" 
 FROM section 
 GROUP BY course_no;
 
 rem [Rischert,2004,322]
 SELECT course_no "Course #", 
        AVG(capacity) "Avg. Capacity", 
        ROUND(AVG(capacity)) "Rounded Avg. Capacity" 
   FROM section 
   GROUP BY course_no 
      HAVING COUNT(*) = 2 
 
 rem [Rischert,2004,325]
SELECT section_id, 
		COUNT(*), final_grade 
	FROM enrollment 
	WHERE TRUNC(enroll_date) > 
		TO_DATE('2/16/2003', 'MM/DD/YYYY') 
	GROUP BY section_id, final_grade 
	HAVING COUNT(*) > 5;

spool off



 
 
 