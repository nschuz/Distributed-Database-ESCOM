

spool out\scriptcap13pag298.txt
rem Benjamin, R and Elena, S(2009).Chapter 13. Triggers
rem IN Oracle PL SQL by Example(298),USA: prentice hall


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


DROP table statistics;

CREATE TABLE statistics (
	table_name varchar2(30),
	transaction_name varchar2(10),
	transaction_user varchar2(30),
	transaction_date date
);


select * from instructor;
select * from statistics;

CREATE OR REPLACE TRIGGER instructor_aud
AFTER UPDATE OR DELETE OR INSERT ON INSTRUCTOR
DECLARE
v_type VARCHAR2(10);
BEGIN
IF UPDATING THEN
v_type := 'UPDATE';
ELSIF DELETING THEN
v_type := 'DELETE';
ELSIF INSERTING THEN
v_type := 'INSERTED';
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
END;
/

INSERT INTO instructor (instructor_id, salutation, first_name, last_name, street_address, zip, phone, created_by, created_date, modified_by, modified_date)
VALUES (113, 'Mr', 'Miguel', 'Medina', '415 West 102nd', '10035', '212551213', user, SYSDATE, user, SYSDATE );

UPDATE instructor
SET last_name = 'Martinez'
WHERE
	instructor_id = 113;
	
DELETE FROM instructor
WHERE
	instructor_id = 113;

select * from instructor;
select * from statistics;



spool off;

