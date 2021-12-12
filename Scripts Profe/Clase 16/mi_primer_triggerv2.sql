SPOOL C:\Users\ORA_bases\2021_02_24_clase_2\salida\mi_primer_trigger.txt

-- set feedback off
set pagesize 99
set linesize 130
set colsep '|=|'
set underline =
set feedback on
/* tablas
	TEMP      (
	temporal
	TEMPORAL2
	TEMPORAL3
*/
REM 
REM Owens, Kevin.
REM  Programming Oracle triggers and stored procedures / Kevin Owens

REM [Owens,2003,section 6.1]
set serveroutput on 

drop table temp;
CREATE TABLE temp (N NUMBER);

CREATE OR REPLACE TRIGGER temp_air
   AFTER INSERT ON TEMP 
   FOR EACH ROW
   BEGIN
 
   dbms_output.put_line(CHR(10)||CHR(9)||'Executing temp_air');
   dbms_output.put_line(CHR(9)||CHR(09)||'         H O L A   ESCOM');
   dbms_output.put_line
		(CHR(09)||CHR(9)||CHR(09)||CHR(9)||'Estoy en clase Remota de ESCOM------------');
  END;
/
INSERT INTO temp VALUES (10); 
INSERT INTO temp VALUES (20); 
INSERT INTO temp VALUES (30); 
INSERT INTO temp VALUES (40); 
INSERT INTO temp VALUES (50); 
INSERT INTO temp VALUES (60); 
INSERT INTO temp VALUES (70); 


desc user_triggers
REM 
REM DESPLEGUEMOS LOS TRIGGERS
REM A PARTIR DE EXPLORAR LAS TABLAS DEL 
REM DICCIONARIO DE DATOS
REM        USER_TRIGGERS
REM   
SELECT TABLE_NAME 
	FROM DICT
	WHERE TABLE_NAME LIKE '%TRIGG%';
REM     
REM           DESPLEGUEMOS  LA TABLE USER_TRIGGERS
col trigger_name format a15
col trigger_type format a20
col triggering_event format A27
col table_owner format A10
col status format A10

select trigger_name,trigger_type,triggering_event,
	table_owner,status
	from user_triggers;
REM 
REM DESPLEGUEMOS LA TABLA DE COLUMNAS DE TRIGGERS
REM
COL TABLE_OWNER FORMAT A10
COL COLUMN_NAME FORMAT A22
COL COLUMN_USAGE FORMAT A15
COL TABLE_NAME  FORMAT  A10
SELECT TRIGGER_NAME,TABLE_OWNER,
	TABLE_NAME, COLUMN_NAME,
	COLUMN_USAGE
	FROM USER_TRIGGER_COLS
	ORDER BY 3;
REM  
REM  DESACTIVEMOS EL TRIGGER     "DISABLE"
REM 
	
alter trigger 	temp_air DISABLE; 

alter trigger 	temp_air ENABLE; 

alter trigger temp_aiur DISABLE;
 
INSERT INTO temp VALUES (80); 
INSERT INTO temp VALUES (90);  

CREATE OR REPLACE TRIGGER temp_air2
   AFTER INSERT ON TEMP
   FOR EACH ROW
  BEGIN
  dbms_output.put_line(CHR(10)||CHR(09)||'Executing temp_air2');
  dbms_output.put_line(CHR(9)||CHR(09)||'         H O L A  ALUMNOS DE DDB --> ESCOM');
  dbms_output.put_line(CHR(9)||CHR(09)||'========================================');
  END;
  /
  
INSERT INTO temp VALUES (150); 
INSERT INTO temp VALUES (160); 
INSERT INTO temp VALUES (170); 

REM 

REM  DESACTIVEMOS LOS TRIGGERS 
alter trigger 	temp_air DISABLE; 
alter trigger 	temp_air2  DISABLE; 

/*

PROBEMOS CON LA TABLE TEMPORAL

*/
-- -------------------------------------------
rem 
rem REM [Owens,2003,section 6.3]
rem 
DROP TABLE TEMPORAL;
CREATE TABLE temporal (N NUMBER DEFAULT 0,
						M NUMBER);

rem declaremos el trigger
REM EL TRIGGER SOLO APLICA A INSERT y UPDATE
REM 
CREATE OR REPLACE TRIGGER temp_aiur
AFTER INSERT OR UPDATE ON TEMPORAL
FOR EACH ROW
BEGIN
    CASE
    WHEN inserting THEN
        dbms_output.put_line
            (CHR(10)||CHR(9)||'executing temp_aiur - insert');
	    dbms_output.put_line
            (CHR(9)||'executando temp_aiur - al insertar insert'||CHR(10));
    WHEN updating THEN
        dbms_output.put_line
            (CHR(10)||CHR(9)||'executing temp_aiur - al actualizar update');
		dbms_output.put_line
            (CHR(9)||'executando temp_aiur - al actualizar update '||CHR(10));
    END CASE;
END;
/
INSERT INTO TEMPORAL (M) VALUES (30);
INSERT INTO TEMPORAL (M) VALUES (40);
INSERT INTO TEMPORAL (M) VALUES (50);
INSERT INTO TEMPORAL (M) VALUES (60);
INSERT INTO TEMPORAL (M) VALUES (70);

DELETE FROM TEMPORAL
WHERE M IN (30,40);

UPDATE TEMPORAL SET m=2 WHERE M IN(50,60,70);
/*  

PROBEMOS OTRO TRIGGER QUE AL ACTUALIZAR 
NOS PROPORCIONE LOS VALORES
ACTUALES Y NUEVOS
AHORA CON LA TABLA TEMPORAL 2

OLD  & NEW 

*/
alter trigger 	temp_aiur  DISABLE; 
-- ---------------------------------------------------
REM 
REM REM [Owens,2003,section 6.4]
REM 6.4 Trigger Body
REM 
alter trigger temp_aiur DISABLE;

DROP TABLE TEMPORAL2;
CREATE TABLE TEMPORAL2 (N NUMBER, M NUMBER DEFAULT 5);

CREATE OR REPLACE TRIGGER temp_bur
BEFORE UPDATE ON TEMPORAL2
FOR EACH ROW
BEGIN
    dbms_output.put_line(CHR(10)||CHR(9)||'BUR old N:'||:old.n|| ' M:'||:old.M);
    dbms_output.put_line(CHR(10)||CHR(9)||'BUR new N:'||:new.n|| ' M:'||:new.M);
END;
/

INSERT INTO TEMPORAL2 (N) VALUES (300);
INSERT INTO TEMPORAL2 (N) VALUES (400);
INSERT INTO TEMPORAL2 (N) VALUES (500);
INSERT INTO TEMPORAL2 (N) VALUES (600);
INSERT INTO TEMPORAL2 (N) VALUES (700);
INSERT INTO TEMPORAL2 (N) VALUES (800);

/*
  */
SELECT * FROM TEMPORAL2;
UPDATE TEMPORAL2 SET m=2000 WHERE N IN(300,400,500.600);

CREATE OR REPLACE TRIGGER temp_aur
AFTER UPDATE ON TEMPORAL2
FOR EACH ROW
BEGIN
    dbms_output.put_line(CHR(10)||CHR(9)||'AUR old N:'||:old.n|| ' M:'||:old.M);
    dbms_output.put_line(CHR(10)||CHR(9)||'AUR new N:'||:new.n|| ' M:'||:new.M);
END;
/
--- =================================
 
 
 REM [Owens,2003,section 6.4]
drop table temporal3;
CREATE TABLE TEMPORAL3(x NUMBER, y NUMBER DEFAULT 5,z number);

CREATE OR REPLACE TRIGGER tempo_adr
AFTER DELETE ON TEMPORAL3
FOR EACH ROW
BEGIN
    dbms_output.put_line
       (:old.x||' '||:old.y||' '||:old.z);
END;
/
--- =============================================

INSERT INTO TEMPORAL3 (x,z) values (10,1000);
INSERT INTO TEMPORAL3 (x,z) values (20,2000);
INSERT INTO TEMPORAL3 (x,z) values (30,3000);
INSERT INTO TEMPORAL3 (x,z) values (40,4000);
INSERT INTO TEMPORAL3 (x,z) values (50,5000);

delete from temporal3
where x in (10,20,30);

REM


REM




REM BORRAR TRIGGERS
rem 
DROP TRIGGER temp_air;
DROP TRIGGER temp_aur;
DROP TRIGGER temp_bur;
DROP TRIGGER temp_aiur;
DROP TRIGGER temp_air2;
drop trigger temp_adr;
DROP TRIGGER tempo_adr;

spool off 




