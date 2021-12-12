set pagesize 99
set linesize 130
set null s/Datos
set colsep '|=|'
SET SQLNUMBER ON

rem [Rischert, 2003,637]
col table_name format a28
col comments   format a70
SELECT table_name, comments 
 FROM dict 
 WHERE table_name LIKE '%SEQ%';
 
 desc seq
 
 select sequence_name from seq;
 
 SELECT column_name, comments 
 FROM dict_columns 
 WHERE table_name = 'USER_SEQUENCES';
 
 SELECT DBMS_METADATA.GET_DDL('SEQUENCE',sequence_name) 
 FROM user_sequences;
 
 SELECT DBMS_METADATA.GET_DDL('SEQUENCE',sequence_name) 
 FROM user_sequences;
rem [Rischert, 2003,642] 
 CREATE OR REPLACE VIEW my_test AS 
SELECT first_name, instructor_id 
 FROM instructor;
 
 desc user_views
 
SELECT object_name, created, last_ddl_time, status 
 FROM user_objects
SELECT view_name, text 
 FROM user_views 
 WHERE view_name = 'MY_TEST';
 
 
 SELECT username 
 FROM all_users; 
rem [Rischert, 2003,644]
col segment_name format a20
col segment_type format a20
COL TAMANIO      FORMAT 99999
SELECT segment_name, segment_type, bytes/1024 TAMANIO 
 FROM user_segments 
 WHERE segment_name = 'ZIPCODE' 
 AND segment_type = 'TABLE';
 
 rem [Rischert, 2003,644]
 SELECT object_name, created, last_ddl_time, status 
 FROM user_objects;
 
 rem [Rischert, 2003,642]
 COL OBJECT_NAME FORMAT A30
 COL CREATED     FORMAT A15
 COL last_ddl_time  format a15
 col status         format a10
 SELECT object_name, created, last_ddl_time, status 
 FROM user_objects; 

 rem [Rischert, 2003,645]
 col column_name format a18
 col comments    format a80
SELECT column_name, comments 
 FROM dict_columns 
 WHERE table_name = 'USER_OBJECTS' 
 AND column_name IN ('STATUS', 'LAST_DDL_TIME', 
 'CREATED');
 
 