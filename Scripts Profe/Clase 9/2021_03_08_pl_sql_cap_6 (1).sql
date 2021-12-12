spool C:\Users\ORA_bases\2021_02_24_clase_2\salida\EJER_CLASE_2021_03_04.txt
rem ROSENZWEIG,B &  RAKHIMOV,E (2009).Oracle® PL/SQL™by Example,Boston,MA,USA:Pearson.

set pagesize 88
set linesize 130
set colsep '| =|';
set sqln on 
set flush on
set echo on

rem [ROSENZWEIG &  RAKHIMOV,2009,118]
-- ch06_1a.sql, version 1.0
rem 
SET SERVEROUTPUT ON
DECLARE
--  VALOR INICIAL VARIABLE DE CONTROL 
	v_counter BINARY_INTEGER := 0;
BEGIN
LOOP
-- INCREMENTO
-- increment loop counter by one
	v_counter := v_counter + 1;
--  PROCESO
	DBMS_OUTPUT.PUT_LINE ('v_counter = '||v_counter);
-- if EXIT condition yields TRUE exit the loop
--  LIMITE 
	IF v_counter = 5 THEN
	EXIT;
	END IF;
END LOOP;
-- control resumes here
-- VALOR DE LA VARIABLE DE CONTROL A LA SALIDA DEL LOOP
DBMS_OUTPUT.PUT_LINE (CHR(10)||CHR(10)||CHR(9)||'A LA SALIDA v_counter = '||v_counter);
DBMS_OUTPUT.PUT_LINE ('Done...');
END;
/
----------------------------------------------------------------------

REM SUMAR LOS NUMERO PARES DEL  0 AL 10
DECLARE
--  VALOR INICIAL VARIABLE DE CONTROL 
	v_control BINARY_INTEGER := 0;
	V_SUMA    NUMBER(5,2)     := 0;
BEGIN
LOOP
-- INCREMENTO
-- increment loop counter by one
	v_control := v_control + 1;
	
--  PROCESO
	v_suma := v_suma + 2;
	DBMS_OUTPUT.PUT_LINE (CHR(9)||'v_control = '||v_control||CHR(10));
	DBMS_OUTPUT.PUT_LINE (CHR(9)||CHR(9)||'v_suma = '||v_suma);
-- if EXIT condition yields TRUE exit the loop
--  LIMITE 

	IF v_control >= 5 THEN
	EXIT;
	END IF;
END LOOP;
-- control resumes here
-- VALOR DE LA VARIABLE DE CONTROL A LA SALIDA DEL LOOP
DBMS_OUTPUT.PUT_LINE (CHR(10)||CHR(10)||CHR(9)||'A LA SALIDA v_control = '||v_control);
DBMS_OUTPUT.PUT_LINE (CHR(10)||CHR(10)||CHR(9)||'A LA SALIDA v_suma    = '||v_suma);
DBMS_OUTPUT.PUT_LINE ('Done...');
END;
/
--------------------------------------------------
REM obtener el factorial de 5!
DECLARE
--  VALOR INICIAL VARIABLE DE CONTROL 
	v_control BINARY_INTEGER := 0;
	V_factorial   NUMBER(5,2)    := 1;
BEGIN
LOOP
-- INCREMENTO
-- increment loop counter by one
	v_control := v_control + 1;
	
--  PROCESO
	v_factorial := v_factorial * v_control;
	DBMS_OUTPUT.PUT_LINE (CHR(9)||'v_control = '||v_control||CHR(10));
	DBMS_OUTPUT.PUT_LINE (CHR(9)||CHR(9)||'v_factorial = '||v_factorial);
-- if EXIT condition yields TRUE exit the loop
--  LIMITE 

	IF v_control >= 10 THEN
	EXIT;
	END IF;
END LOOP;
-- control resumes here
-- VALOR DE LA VARIABLE DE CONTROL A LA SALIDA DEL LOOP
DBMS_OUTPUT.PUT_LINE (CHR(10)||CHR(10)||CHR(9)||'A LA SALIDA v_control = '||v_control);
DBMS_OUTPUT.PUT_LINE (CHR(10)||CHR(10)||CHR(9)||'A LA SALIDA v_factorial  = '||v_factorial);
DBMS_OUTPUT.PUT_LINE ('Done...');
END;
/
--------------------------------------------


----------------------------
---------------------------
-- ===================================
------------------------------------
-- ch06_1_SSL.sql, version 1.0         SSL
rem 
SET SERVEROUTPUT ON
DECLARE
--  VALOR INICIAL VARIABLE DE CONTROL 
	v_counter BINARY_INTEGER := 1;
BEGIN
LOOP
--  LIMITE 
	IF v_counter <= 5 THEN

--  PROCESO
	DBMS_OUTPUT.PUT_LINE ('v_counter = '||v_counter);
-- if EXIT condition yields TRUE exit the loop
-- INCREMENTO
-- increment loop counter by one
	v_counter := v_counter + 1;
	else
		EXIT;
	END IF;
END LOOP;
-- control resumes here
-- VALOR DE LA VARIABLE DE CONTROL A LA SALIDA DEL LOOP
DBMS_OUTPUT.PUT_LINE (CHR(10)||CHR(10)||CHR(9)||'A LA SALIDA v_counter = '||v_counter);
DBMS_OUTPUT.PUT_LINE ('Done...');
END;
/
---------------------------------------------------

rem  obtener la suma de 
REM CON LA ESTRUCTURA VALOR INICIAL LIMITE PROCESO E INCREMENTO
DECLARE
--  VALOR INICIAL VARIABLE DE CONTROL 
	v_control BINARY_INTEGER := 0;
	V_SUMA    NUMBER(5,2)    := 0;
BEGIN
LOOP
--  LIMITE 
		IF v_control >= 5 THEN
-- INCREMENTO
-- increment loop counter by one
	v_control := v_control + 1;
	
--  PROCESO
	v_suma := v_suma + 2;
	DBMS_OUTPUT.PUT_LINE (CHR(9)||'v_control = '||v_control||CHR(10));
	DBMS_OUTPUT.PUT_LINE (CHR(9)||CHR(9)||'v_suma = '||v_suma);
-- if EXIT condition yields TRUE exit the loop
--  LIMITE 

	IF v_control >= 5 THEN
	EXIT;
	END IF;
	
		else
		EXIT;
	END IF;
END LOOP;
-- control resumes here
-- VALOR DE LA VARIABLE DE CONTROL A LA SALIDA DEL LOOP
DBMS_OUTPUT.PUT_LINE (CHR(10)||CHR(10)||CHR(9)||'A LA SALIDA v_control = '||v_control);
DBMS_OUTPUT.PUT_LINE (CHR(10)||CHR(10)||CHR(9)||'A LA SALIDA v_suma    = '||v_suma);
DBMS_OUTPUT.PUT_LINE ('Done...');
END;
/
-- -------------------------------------------
REM obtener el factorial de 5!
REM CON LA ESTRUCTURA VALOR INICIAL LIMITE PROCESO E INCREMENTO
DECLARE
--  VALOR INICIAL VARIABLE DE CONTROL 
	v_control BINARY_INTEGER := 1;
	V_factorial   NUMBER(5,2)    := 1;
BEGIN
LOOP
--  LIMITE 

	IF v_control <= 5 THEN
	
--  PROCESO
	v_factorial := v_factorial * v_control;
	DBMS_OUTPUT.PUT_LINE (CHR(9)||'v_control = '||v_control||CHR(10));
	DBMS_OUTPUT.PUT_LINE (CHR(9)||CHR(9)||'v_factorial = '||v_factorial);
	
-- INCREMENTO
-- increment loop counter by one
	v_control := v_control + 1;
	
-- if EXIT condition yields TRUE exit the loop
	else
	EXIT;
	END IF;
END LOOP;
-- control resumes here
-- VALOR DE LA VARIABLE DE CONTROL A LA SALIDA DEL LOOP
DBMS_OUTPUT.PUT_LINE (CHR(10)||CHR(10)||CHR(9)||'A LA SALIDA v_control = '||v_control);
DBMS_OUTPUT.PUT_LINE (CHR(10)||CHR(10)||CHR(9)||'A LA SALIDA v_factorial  = '||v_factorial);
DBMS_OUTPUT.PUT_LINE ('Done...');
END;
/
--------------------------------
-- ch06_1b.sql, version 2.0
SET SERVEROUTPUT ON
--  VALOR INICIAL VARIABLE DE CONTROL 
DECLARE
v_counter BINARY_INTEGER := 0;
BEGIN
LOOP
-- INCREMENTO
-- increment loop counter by one
v_counter := v_counter + 1;
--  PROCESO
DBMS_OUTPUT.PUT_LINE ('v_counter = '||v_counter);
-- if EXIT WHEN condition yields TRUE exit the loop
--  LIMITE 
EXIT WHEN v_counter = 5;
END LOOP;
-- control resumes here
DBMS_OUTPUT.PUT_LINE ('Done...');
END;
/
----------------------------------------
REM CON LA ESTRUCTURA VALOR INICIAL LIMITE PROCESO E INCREMENTO

SET SERVEROUTPUT ON
--  VALOR INICIAL VARIABLE DE CONTROL 
DECLARE
v_counter BINARY_INTEGER := 0;
BEGIN
LOOP
-- if EXIT WHEN condition yields TRUE exit the loop
--  LIMITE 
EXIT WHEN v_counter > 5;

--  PROCESO
DBMS_OUTPUT.PUT_LINE ('v_counter = '||v_counter);
-- INCREMENTO
-- increment loop counter by one
v_counter := v_counter + 1;

END LOOP;
-- control resumes here
DBMS_OUTPUT.PUT_LINE ('Done...');
END;
/
-----------------------------------------------------
REM CON LA ESTRUCTURA VALOR INICIAL LIMITE PROCESO E INCREMENTO
rem suma de los numeros pares del 0 al 10
DECLARE
--  VALOR INICIAL VARIABLE DE CONTROL 
	v_control BINARY_INTEGER := 1;
	V_SUMA    NUMBER(5,2)    := 0;
BEGIN
LOOP
--  LIMITE 
		EXIT WHEN v_control > 5;
--  PROCESO
	v_suma := v_suma + 2;
	DBMS_OUTPUT.PUT_LINE (CHR(9)||'v_control = '||v_control||CHR(10));
	DBMS_OUTPUT.PUT_LINE (CHR(9)||CHR(9)||'v_suma = '||v_suma);
-- INCREMENTO
-- increment loop counter by one
	v_control := v_control + 1;
END LOOP;
-- control resumes here
-- VALOR DE LA VARIABLE DE CONTROL A LA SALIDA DEL LOOP
DBMS_OUTPUT.PUT_LINE (CHR(10)||CHR(10)||CHR(9)||'A LA SALIDA v_control = '||v_control);
DBMS_OUTPUT.PUT_LINE (CHR(10)||CHR(10)||CHR(9)||'A LA SALIDA v_suma    = '||v_suma);
DBMS_OUTPUT.PUT_LINE ('Done...');
END;
/
--------------------------------------------------------------
REM obtener el factorial de 5!
REM CON LA ESTRUCTURA VALOR INICIAL LIMITE PROCESO E INCREMENTO
DECLARE
--  VALOR INICIAL VARIABLE DE CONTROL 
	v_control BINARY_INTEGER := 1;
	V_factorial   NUMBER(5,2)    := 1;
BEGIN
LOOP
--  LIMITE 
	EXIT WHEN v_control > 5;
	
--  PROCESO
	v_factorial := v_factorial * v_control;
	DBMS_OUTPUT.PUT_LINE (CHR(9)||'v_control = '||v_control||CHR(10));
	DBMS_OUTPUT.PUT_LINE (CHR(9)||CHR(9)||'v_factorial = '||v_factorial);
	
-- INCREMENTO
-- increment loop counter by one
	v_control := v_control + 1;
END LOOP;
-- control resumes here
-- VALOR DE LA VARIABLE DE CONTROL A LA SALIDA DEL LOOP
DBMS_OUTPUT.PUT_LINE (CHR(10)||CHR(10)||CHR(9)||'A LA SALIDA v_control = '||v_control);
DBMS_OUTPUT.PUT_LINE (CHR(10)||CHR(10)||CHR(9)||'A LA SALIDA v_factorial  = '||v_factorial);
DBMS_OUTPUT.PUT_LINE ('Done...');
END;
/
---------------------------------------------------
-- ch06_2a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
--  VALOR INICIAL VARIABLE DE CONTROL 
v_course course.course_no%type := 435;
v_instructor_id instructor.instructor_id%type := 102;
v_sec_num section.section_no%type := 0;
BEGIN
LOOP
-- INCREMENTO
-- increment section number by one
v_sec_num := v_sec_num + 1;
--  PROCESO
INSERT INTO section
(section_id, course_no, section_no, instructor_id,
created_date, created_by, modified_date,
modified_by)
VALUES
(section_id_seq.nextval, v_course, v_sec_num,
v_instructor_id, SYSDATE, USER, SYSDATE, USER);
-- if number of sections added is four exit the loop
--  LIMITE 
EXIT WHEN v_sec_num = 4;
END LOOP;
-- control resumes here
COMMIT;
END;
/

REM CONSULTAS PREVIAS
SELECT course_no, instructor_id FROM section ORDER BY 1,2;

---------------------------------------------
-- ch06_2b.sql, version 2.0
DECLARE
v_course course.course_no%type := 430;
v_instructor_id instructor.instructor_id%type := 102;
v_sec_num section.section_no%type := 0;
BEGIN
LOOP
-- increment section number by one
v_sec_num := v_sec_num + 1;
INSERT INTO section
(section_id, course_no, section_no, instructor_id,
created_date, created_by, modified_date,
modified_by)
VALUES
(section_id_seq.nextval, v_course, v_sec_num,
v_instructor_id, SYSDATE, USER, SYSDATE, USER);
-- if number of sections added is ten exit the loop
EXIT WHEN v_sec_num = 10;
END LOOP;
-- control resumes here
COMMIT;
END;
/

DELETE FROM section
WHERE course_no = 430
AND section_no <= 10;
COMMIT;

-- ch06_2c.sql, version 3.0
SET SERVEROUTPUT ON
DECLARE
v_course course.course_no%type := 430;
v_instructor_id instructor.instructor_id%type := 102;
v_sec_num section.section_no%type := 0;
BEGIN
LOOP
-- increment section number by two
v_sec_num := v_sec_num + 2;
INSERT INTO section
(section_id, course_no, section_no, instructor_id,
created_date, created_by, modified_date,
modified_by)
VALUES
(section_id_seq.nextval, v_course, v_sec_num,
v_instructor_id, SYSDATE, USER, SYSDATE, USER);
-- if number of sections added is ten exit the loop
EXIT WHEN v_sec_num = 10;
END LOOP;
-- control resumes here
COMMIT;
END;
/

SELECT course_no, instructor_id FROM section ORDER BY 1,2;

----------------
REM WHILE LOOP
-- ch06_3a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
v_counter BINARY_INTEGER := 1;
v_sum NUMBER := 0;
BEGIN
WHILE v_counter <= 10 LOOP
v_sum := v_sum + v_counter;
DBMS_OUTPUT.PUT_LINE ('Current sum is: '||v_sum);
-- increment loop counter by one
v_counter := v_counter + 1;
END LOOP;
-- control resumes here
DBMS_OUTPUT.PUT_LINE ('The sum of integers between 1 '||
'and 10 is: '||v_sum);
END;
/
-------------------------
-- ch06_3b.sql, version 2.0
SET SERVEROUTPUT ON
DECLARE
v_counter BINARY_INTEGER := 2;
v_sum NUMBER := 0;
BEGIN
WHILE v_counter <= 100 LOOP
v_sum := v_sum + v_counter;
DBMS_OUTPUT.PUT_LINE ('Current sum is: '||v_sum);
-- increment loop counter by two
v_counter := v_counter + 2;
END LOOP;
-- control resumes here
DBMS_OUTPUT.PUT_LINE ('The sum of even integers between '||
'1 and 100 is: '||v_sum);
END;
/
----------------------------------
rem for
rem 10!
-- ch06_4a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
v_factorial NUMBER := 1;
BEGIN
FOR v_counter IN 1..10 LOOP
v_factorial := v_factorial * v_counter;
END LOOP;
-- control resumes here
DBMS_OUTPUT.PUT_LINE
('Factorial of ten is: '||v_factorial);
END;
/

rem 5!
SET SERVEROUTPUT ON
DECLARE
v_factorial NUMBER := 1;
BEGIN
FOR v_counter IN 1..5 LOOP
v_factorial := v_factorial * v_counter;
END LOOP;
-- control resumes here
DBMS_OUTPUT.PUT_LINE
('Factorial of ten is: '||v_factorial);
END;
/
rem reverse
-- ch06_5a.sql, version 1.0
SET SERVEROUTPUT ON
BEGIN
FOR v_counter IN REVERSE 0..10 LOOP
-- if v_counter is even, display its value on the
-- screen
IF MOD(v_counter, 2) = 0 THEN
DBMS_OUTPUT.PUT_LINE ('v_counter = '||v_counter);
END IF;
END LOOP;
-- control resumes here
DBMS_OUTPUT.PUT_LINE ('Done...');
END;
/

rem conteo de menor a mayor de 2 en 2
-- ch06_5b.sql, version 2.0
SET SERVEROUTPUT ON
BEGIN
FOR v_counter IN 0..10 LOOP
-- if v_counter is even, display its value on the
-- screen
IF MOD(v_counter, 2) = 0 THEN
DBMS_OUTPUT.PUT_LINE ('v_counter = '||v_counter);
END IF;
END LOOP;
-- control resumes here
DBMS_OUTPUT.PUT_LINE ('Done...');
END;
/

-- ch06_5c.sql, version 3.0
SET SERVEROUTPUT ON
BEGIN
FOR v_counter IN REVERSE 0..10 LOOP
-- if v_counter is odd, display its value on the
-- screen
IF MOD(v_counter, 2) != 0 THEN
DBMS_OUTPUT.PUT_LINE ('v_counter = '||v_counter);
END IF;
END LOOP;
-- control resumes here
DBMS_OUTPUT.PUT_LINE ('Done...');
END;
/

spool off