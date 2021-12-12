DROP TABLE STATISTICS;
CREATE TABLE STATISTICS(
TABLE_NAME VARCHAR2(30),
TRANSACTION_NAME VARCHAR2(10),
TRANSACTION_USER VARCHAR2(30),
TRANSACTION_DATE   DATE);




CREATE OR REPLACE TRIGGER student_bi
BEFORE INSERT ON student
FOR EACH ROW
DECLARE
v_student_id STUDENT.STUDENT_ID%TYPE;
BEGIN
SELECT STUDENT_ID_SEQ.NEXTVAL
INTO v_student_id
FROM dual;
:NEW.student_id := v_student_id;
:NEW.created_by := USER;
:NEW.created_date := SYSDATE;
:NEW.modified_by := USER;
:NEW.modified_date := SYSDATE;
END;
.
rem insertemos una tupla nueva



INSERT INTO student (student_id, first_name, last_name, zip,
registration_date, created_by, created_date, modified_by,
modified_date)
VALUES (STUDENT_ID_SEQ.NEXTVAL, 'John', 'Smith', '00914', SYSDATE,
USER, SYSDATE, USER, SYSDATE);

rem [Rosenzweig&Rakhimov,2009,271]

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

UPDATE instructor
SET phone = '7181234567'
WHERE instructor_id = 101;

ROLLBACK;
SELECT *
FROM statistics;


--- ===================
rem [Rosenzweig&Rakhimov,2009,274]
-- ch13_1a.sql, version 1.0
CREATE OR REPLACE TRIGGER instructor_bi
BEFORE INSERT ON INSTRUCTOR
FOR EACH ROW
DECLARE
v_work_zip CHAR(1);
BEGIN
:NEW.CREATED_BY := USER;
:NEW.CREATED_DATE := SYSDATE;
:NEW.MODIFIED_BY := USER;
:NEW.MODIFIED_DATE := SYSDATE;
SELECT 'Y'
INTO v_work_zip
FROM zipcode
WHERE zip = :NEW.ZIP;
EXCEPTION
WHEN NO_DATA_FOUND THEN
RAISE_APPLICATION_ERROR (-20001, 'Zip code is not valid!');
END;



select table_name from dict 
where table_name like '%STATISTICS%';



CREATE OR REPLACE TRIGGER instructor_bi
BEFORE INSERT ON INSTRUCTOR
FOR EACH ROW
DECLARE
v_work_zip CHAR(1);
v_instructor_id INSTRUCTOR.INSTRUCTOR_ID%TYPE;
BEGIN
:NEW.CREATED_BY := USER;
:NEW.CREATED_DATE := SYSDATE;
:NEW.MODIFIED_BY := USER;
:NEW.MODIFIED_DATE := SYSDATE;
SELECT 'Y'
INTO v_work_zip
FROM zipcode
WHERE zip = :NEW.ZIP;
SELECT INSTRUCTOR_ID_SEQ.NEXTVAL
INTO v_instructor_id
FROM dual;
:NEW.INSTRUCTOR_ID := v_instructor_id;
EXCEPTION
WHEN NO_DATA_FOUND THEN
RAISE_APPLICATION_ERROR (-20001, 'Zip code is not valid!');
END;

rem 
rem [Rosenzweig&Rakhimov,2009,274]
rem
CREATE OR REPLACE TRIGGER instructor_biud
BEFORE INSERT OR UPDATE OR DELETE ON INSTRUCTOR
DECLARE
v_day VARCHAR2(10);
BEGIN
v_day := RTRIM(TO_CHAR(SYSDATE, 'DAY'));
IF v_day LIKE ('M%') THEN
RAISE_APPLICATION_ERROR
(-20000, 'A table cannot be modified during off hours');
END IF;
END;

UPDATE instructor
SET zip = 10035
WHERE zip = 10025;


select RTRIM(TO_CHAR(SYSDATE, 'DAY')) from dual;
