spool C:\Users\ORA_bases\2021_02_24_clase_2\salida\cap_4_clase_4.txt
-- alter session set nls_date_language = 'SPANISH';
CLEAR SCREEN
SET PAGESIZE 99;
SET LINESIZE 150;
SET COLSEP '||';
SET NULL s/Datos

COL PARAMETER FORMAT A34;
COL VALUE     FORMAT A34;

SELECT PARAMETER, VALUE FROM 
    NLS_SESSION_PARAMETERS
     ORDER BY 1;
	 
rem [Rischert, 2004, 224]
SELECT last_name, registration_date 
 FROM student 
 WHERE student_id IN (123, 161, 190);
 
 rem [Rischert, 2004, 224]
 rem despleguemos utilizando un formato diferente
 SELECT last_name, registration_date, 
 TO_CHAR(registration_date, 'MM/DD/YYYY') 
 AS "Formatted" 
 FROM student 
 WHERE student_id IN (123, 161, 190);
 
 rem incluyamos el día
 COL last_name format a13
 col "Formatted" format a28
 col registration_date format a18
  SELECT last_name, registration_date, 
 TO_CHAR(registration_date, 'DAY  MM/DD/YYYY') 
 AS "Formatted" 
 FROM student 
 WHERE student_id IN (123, 161, 190);
 
  rem incluyamos el día en minuscula
   SELECT last_name, registration_date, 
 TO_CHAR(registration_date, 'Day  MM/DD/YYYY') 
 AS "Formatted" 
 FROM student 
 WHERE student_id IN (123, 161, 190);
 
   rem incluyamos el mes con letras
    col "Formatted" format a31
   SELECT last_name, registration_date, 
 TO_CHAR(registration_date, 'Day  Month/DD/YYYY') 
 AS "Formatted" 
 FROM student 
 WHERE student_id IN (123, 161, 190);
 
 
rem incluyamos el mes con letras minusculas
col "Formatted" format a31
   SELECT last_name, registration_date, 
 TO_CHAR(registration_date, 'Day  month/DD/YYYY') 
 AS "Formatted" 
 FROM student 
 WHERE student_id IN (123, 161, 190);
 
  rem [Rischert, 2004, 226]
 col "1.Day" format a12
 col "2.Day" format a12
 col "Look at the Month" format a22
 col "Time"   format a16
 SELECT last_name, 
 TO_CHAR(registration_date, 'Dy') AS "1.Day", 
 TO_CHAR(registration_date, 'DY') AS "2.Day", 
 TO_CHAR(registration_date, 'Month DD, YYYY') 
 AS "Look at the Month", 
 TO_CHAR(registration_date, 'HH:MI pm') AS "Time" 
 FROM student 
 WHERE student_id IN (123, 161, 190);
 
 
 REM
 col "Eliminating Spaces" format a26
 col "Spelled out"        format a30
 SELECT last_name, 
 TO_CHAR(registration_date, 'fmMonth ddth, YYYY') 
 "Eliminating Spaces", 
 TO_CHAR(registration_date, 'Ddspth "of" fmMonth') 
 "Spelled out" 
 FROM student 
 WHERE student_id IN (123, 161, 190);
 
 rem How To Perform A DATE Search 
 SELECT last_name, registration_date 
 FROM student 
 WHERE registration_date = 
		TO_DATE('22-JAN-2003', 'DD-MON-YYYY') ;
 rem cambiemos el idioma en el formato 
  SELECT last_name, registration_date 
 FROM student 
 WHERE registration_date = 
		TO_DATE('22-ENE-2003', 'DD-MON-YYYY') ;
 
 
 REM Implicit Conversion and Default DATE Format
 SELECT last_name, registration_date 
 FROM student 
 WHERE registration_date = '22-ENE-2003';
 
 
 REM This special RR format mask interprets the two-digit year from 50
REM    until 99 as the prior century,

REM DESPLEGUEMOS EL FORMATO
COL FORMATO_FECHA FORMAT A30
SELECT SYS_CONTEXT 
		('USERENV', 'NLS_DATE_FORMAT') FORMATO_FECHA
 FROM dual;
 
 REM REVISEMOS EL FORMATO RR
 SELECT TO_CHAR(TO_DATE('17-OCT-67','DD-MON-RR'),'YYYY') "1900", 
 TO_CHAR(TO_DATE('17-OCT-17','DD-MON-RR'),'YYYY') "2000" 
 FROM dual;
 
 
 REM Dont Forget About The Time
  rem [Rischert, 2004, 230]
  
  SELECT last_name, 
		TO_CHAR(registration_date,
		'DD-MON-YYYY HH24:MI:SS') 
 FROM student 
		WHERE registration_date = 
			TO_DATE('22-ENE-2003', 'DD-MON-YYYY');
			
SELECT student_id, 
		TO_CHAR(enroll_date, 'DD-MON-YYYY HH24:MI:SS') 
 FROM enrollment 
		WHERE TRUNC(enroll_date) =
		TO_DATE('07-FEB-2003', 'DD-MON-YYYY');

REM The ANSI DATE and ANSI TIMESTAMP 
REM Formats	

rem [Rischert, 2004, 231]
  
  
REM  This format contains no time portion 
REM   and must be listed exactly in the 
REM   format YYYY-MM-DD
REM    with the DATE keyword prefix. 
col fecha2  format a30
SELECT student_id, 
		TO_CHAR(enroll_date, 'DD-MON-YYYY HH24:MI:SS') fecha2
 FROM enrollment 
 WHERE enroll_date >= DATE '2003-02-07' 
 AND enroll_date < DATE '2003-02-08';


REM Use the fill mode (fm) with the 
REM  format mask to suppress the extra blanks: 
col fecha3  format a30
SELECT course_no, section_id, 
 TO_CHAR(start_date_time, 'Day DD-Mon-YYYY') fecha3
 FROM section 
 WHERE TO_CHAR(start_date_time, 'fmDay') = 'Jueves';
 
 REM  [Rischert, 2004, 241]
 
 col "Start"  format a35
 SELECT 'Section '||section_id||' begins on '|| 
 TO_CHAR(start_date_time, 'fmDay')||'.' AS "Start" 
 FROM section 
 WHERE section_id IN (146, 127, 121, 155, 110, 85, 148) 
 ORDER BY TO_CHAR(start_date_time, 'D');
 
 spool off 


	