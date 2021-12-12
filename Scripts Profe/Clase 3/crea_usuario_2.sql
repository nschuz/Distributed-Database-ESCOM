rem primero crea usuario 
rem otorgale privilegios 
drop user sergio cascade;

create user sergio identified by sergio
default tablespace users
temporary tablespace temp;

grant connect, resource  to sergio;

rem cambia de usuario
 
SET PAGESIZE 99;
SET LINESIZE 150;
SET COLSEP '||';

rem cambia el idioma de fechas

alter session set nls_date_language = 'ENGLISH';
@@C:\Users\ORA_bases\O11\createStudent.sql

rem hagamos una consulta a la tabla instructor
col instructor_id format 9999
col first_name    format a13
col last_name     format a12
select instructor_id,first_name,last_name
	from instructor;
rem contemos el numero de tuplas
select count(*) from instructor;

rem contemos el num tuplas de student
select count (*) from student;

rem despleguemos algunos atributos de student
select student_id,first_name,last_name
      FROM STUDENT;
	  
REM LISTEMOS SOLO 25 RENGLONES

select student_id,first_name,last_name
      FROM STUDENT
	  WHERE ROWNUM <= 25;
	  
REM ORDENEMOS POR FIRST_NAME
select student_id,first_name,last_name
      FROM STUDENT
	  WHERE ROWNUM <= 25
	  ORDER BY 2;
	