

spool out\scriptcap13pag298.txt
rem Benjamin, R and Elena, S(2009).Chapter 13. Triggers
rem IN Oracle PL SQL by Example(292),USA: prentice hall

-- Los triggers son de suma importancia para ejecutar algun evento cuando Insertamos, Actualizamos, Borramos, Creamos o Alteramos algún registro.
-- Pueden ser ejecutados antes o despues del evento del trigger

-- Existen 2 tipos de triggers los DML que ocurren cuando se hacen queries de tipo (Insert, Update or Delete)
-- y DDL (CREATE or Alter)

-- Tambien eventos cuando se inicia o se apaga una base de datos.
-- Eventos cuando un usuario inicia sesión y cierra su sesión. (Excelente para saber quien entra y quien sale guardando la hora del evento).

--Syntaxis de los triggers

CREATE [OR REPLACE] TRIGGER Ttrigger_name
{BEFORE|AFTER} Triggering_event ON table_name
[FOR EACH ROW] --No le entiendo muy bien
[FOLLOWS another_trigger]
[ENABLE/DISABLE] -- ALTER TRIGGER trigger_name DISABLE;
[WHEN condition]
DECLARE
declaration statements
BEGIN
executable statements
EXCEPTION
exception-handling statements
END;


-- Ejemplo

set colsep '|=|'
set pagesize 300
set linesize 300
col Employer format A15
col STUDENT_ID format 999
col SALUT format A3
col FIRST_NAME format A10
col LAST_NAME format A10
col street_address format A15
col ZIP format 99999
col PHONE format A12
col Registration_date format A8
col created_by format A10

select * from student where last_name = 'Smith';

INSERT INTO student (student_id, first_name, last_name, zip,
registration_date, created_by, created_date, modified_by,
modified_date)
VALUES (STUDENT_ID_SEQ.NEXTVAL, 'John', 'Smith', '00914', SYSDATE,
USER, SYSDATE, USER, SYSDATE);

CREATE OR REPLACE TRIGGER student_bi
BEFORE INSERT ON student
FOR EACH ROW
DECLARE
v_student_id STUDENT.STUDENT_ID%TYPE;
BEGIN
SELECT STUDENT_ID_SEQ.NEXTVAL INTO v_student_id FROM dual;
:NEW.student_id := v_student_id; -- :NEW permite acceder a la fila que actualmente esta siendo procesada.
:NEW.created_by := USER;
:NEW.created_date := SYSDATE;
:NEW.modified_by := USER;
:NEW.modified_date := SYSDATE;
END;
/

INSERT INTO student (first_name, last_name, zip, registration_date)
VALUES ('Prueba', 'Smith', '00914', SYSDATE);



col instructor_id format 999
col salut format A6
col first_name format A10
col last_name format A10
col street_address format A15
col ZIP format 99999
col phone format 9999999999
col created_by format A10
col created_ format A10
col modified_by format A11
col modified format A10


select * from instructor;

CREATE OR REPLACE TRIGGER instructor_aud
AFTER UPDATE OR DELETE ON INSTRUCTOR
DECLARE
v_type VARCHAR2(10);
PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
IF UPDATING THEN
v_type := 'UPDATE';
ELSIF DELETING THEN
v_type := 'DELETE';
END IF;
UPDATE statistics
SET transaction_user = USER,
transaction_date = SYSDATE
WHERE table_name = 'INSTRUCTOR'
AND transaction_name = v_type;
IF SQL%NOTFOUND THEN
INSERT INTO statistics
VALUES ('INSTRUCTOR', v_type, USER, SYSDATE);
END IF;
COMMIT;
END;
/




spool off