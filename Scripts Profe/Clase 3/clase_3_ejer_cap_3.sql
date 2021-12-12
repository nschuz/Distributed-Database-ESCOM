spool C:\Users\ORA_bases\2021_02_24_clase_2\salida\cap_3.txt
set pagesize 99
set linesize 130
set colsep '|=|'
set underline =
set feedback on
set describe linenum on
set null sinDatos
set numwidth 7
rem pag 166
SELECT state, LOWER(state), LOWER('State')
 FROM zipcode
 where rownum <= 15;
rem pag 167 
 SELECT city,UPPER(city) CITY , state, INITCAP(state)
 FROM zipcode
 WHERE zip = '10035';
 
 REM PAG 169
 SELECT RPAD(city, 20, '*') "City Name",
 LPAD(state, 10, '-') "State Name"
 FROM zipcode 
 WHERE ROWNUM <= 15;
 
  SELECT RPAD(city, 20, '*_') "City Name",
 LPAD(state, 10, '->') "State Name"
 FROM zipcode 
 WHERE ROWNUM <= 15;
 
 REM PAG 167
 COL "City Name" FORMAT A55
 COL "State Name" FORMAT A30
  SELECT RPAD(city, 40, '*_') "City Name",
 LPAD(state, 20, '->') "State Name"
 FROM zipcode 
 WHERE ROWNUM <= 15;
 
 REM PAG 169
 SELECT LTRIM('0001234500', '0') left,
		RTRIM('0001234500', '0') right,
		LTRIM(RTRIM('0001234500', '0'), '0') both
 FROM dual ;
 
  SELECT LTRIM('00000000001234500', '0') left,
		RTRIM('000123450000000000', '0') right,
		LTRIM(RTRIM('0001234500', '0'), '0') both
 FROM dual ;
 
   SELECT LTRIM('0007700000001234500', '0') left,
		RTRIM('00012345000000077000', '0') right,
		LTRIM(RTRIM('0001234500', '0'), '0') both
 FROM dual ;
 
 REM PAG 
 COL LNAME1 FORMAT A20
 COL LNAME2 ForMAT A25
 SELECT last_name,
		SUBSTR(last_name, 1, 5) LNAME1,
		SUBSTR(last_name, 6)  LNAME2
	FROM student 
	WHERE ROWNUM <= 15;
	
 COL LNAME1 FORMAT A20
 COL LNAME2 ForMAT A25
 SELECT last_name,
		SUBSTR(last_name, 2, 5) LNAME1,
		SUBSTR(last_name, 6)  LNAME2
	FROM student 
	WHERE ROWNUM <= 15;
remarks pag 171
SELECT description, INSTR(description, 'er') subcadena
 FROM course; 
 -------------------------------------------------------------------------- 
rem pag 180
col "Description" format a20
col "Initcap Description" format a20 
SELECT description "Description",
 INITCAP(description) "Initcap Description"
 FROM course
 WHERE description LIKE '%SQL%';
 rem pag 180
SELECT last_name
 FROM instructor
 WHERE LENGTH(last_name) >= 6; 
 
SELECT last_name
 FROM instructor
 WHERE LENGTH(last_name) < 6; 
 
rem pag 184
SELECT student_id, last_name
 FROM student
 WHERE INSTR(last_name, 'o', 1, 3) > 0 ;
 
 SELECT student_id, last_name
 FROM student
 WHERE INSTR(last_name, 'o', 1, 2) > 0 ;

 SELECT student_id, last_name
 FROM student
 WHERE INSTR(last_name, 'o', 1, 1) > 0 ;
rem pag 185
SELECT last_name||', '||first_name
 FROM instructor;

SELECT last_name||', --->  '||first_name
 FROM instructor; 
 
 SELECT last_name||', --->  '||chr(9)||first_name
 FROM instructor; 
 
 
  SELECT last_name||', -->  '||chr(9)||chr(9)||first_name
 FROM instructor;
 
   SELECT last_name||', -->  '
	||chr(9)||chr(9)||first_name
	||chr(7)||chr(7)
 FROM instructor;
 
 rem pag 190
 set numwidth 5
 
 SELECT 'El valor absoluto de  -29 is -->  '
	||ABS(-29) absoluto
 FROM dual;
 
 SELECT -14, SIGN(-14), SIGN(14), SIGN(0), ABS(-14)
 FROM dual; 

set numwidth 7
 SELECT 222.34501,
	ROUND(222.34501, 2) round,
	TRUNC(222.34501, 2) trunc
 FROM dual;
 
 set numwidth 7
 SELECT 222.34501,
	ROUND(222.34501, 1) round,
	TRUNC(222.34501, 1) trunc
 FROM dual;
 
 SELECT 222.34501,
	ROUND(222.34501, 0) round,
	TRUNC(222.34501, 0) trunc
 FROM dual;
 
  SELECT 222.34501,
	ROUND(222.34501, -1) round,
	TRUNC(222.34501, -1) trunc
 FROM dual;
 
   SELECT 222.34501,
	ROUND(222.34501, -2) round,
	TRUNC(222.34501, -2) trunc
 FROM dual;
 
    SELECT 222.34501,
	ROUND(272.34501, -2) round,
	TRUNC(262.34501, -2) trunc
 FROM dual;
 
 rem page 195
 SELECT DISTINCT cost, cost + 10,
 cost - 10, cost * 10, cost / 10
 FROM course;

rem page 198

 SELECT DISTINCT numeric_grade, ROUND(numeric_grade / 2)
 FROM grade
	where rownum <= 15;

 
 
spool off
