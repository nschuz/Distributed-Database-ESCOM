spool C:\Users\ORA_bases\2021_02_24_clase_2\salida\clase_2

desc  nls_session_parameters;

set pagesize 99
set linesize 130
set colsep '|=| '
set sqlnumber on


col parameter format a25
col value     foRmat a30
SELECT * FROM NLS_SESSION_PARAMETERS;


desc dict
REM CONTEMOS EL NUMERO DE TUPLAS (TABLAS )
REM     DEL DICCIONARIO DE DATOS

SELECT COUNT (*) FROM DICT;

REM DESPLEGUEMOS LAS TABLAS 
REM REFERENTES A OBJETOS DEL DBMS

select table_name, comments
FROM DICT
WHERE TABLE_NAME LIKE '%OBJECTS%';



select table_name
FROM DICT
WHERE TABLE_NAME LIKE '%OBJECTS%';

REM DESPLEGUEMOS LA ESTRUCTURA DE USER_OBJECTS
DESC USER_OBJECTS

SELECT DISTINCT OBJECT_TYPE
	FROM USER_OBJECTS;
	
COL OBJECT_NAME FORMAT A22
COL OBJECT_TYPE FORMAT A15
COL STATUS      FORMAT A10
 	
REM DESPLEGUEMOS LOS OBJETOS ORDENADOS POR TIPO	
SELECT OBJECT_NAME, OBJECT_TYPE, STATUS
		FROM USER_OBJECTS
		ORDER BY 2;
		
REM FILTREMOS LAS TABLAS
REM ORDENADAS POR NOMBRE
SELECT OBJECT_NAME, OBJECT_TYPE, STATUS
		FROM USER_OBJECTS
		WHERE OBJECT_TYPE = 'TABLE'
		ORDER BY 1;
		
REM DESPLEGUEMOS TABLAS DE TRIGGERS
select table_name
FROM DICT
WHERE TABLE_NAME LIKE '%TRIGGER%';

rem ejecutemos en SYS    sysdba
REM DESPLEGUEMOS LA ESTRUCTURA DE USER_TRIGGERS
	DESC USER_TRIGGERS
REM DESPLEGUEMOS ATRIBUTOS
col trigger_name     format a22
col trigger_type     format a12
col triggering_event format a28
col table_owner      format a14
col status           format a12
SELECT TRIGGER_NAME, TRIGGER_TYPE,TRIGGERING_EVENT,
	TABLE_OWNER, STATUS
	FROM USER_TRIGGERS
	order by 4,2,1;
	
	
	
REM DESPLEGUEMOS LA ESTRUCTURA DE USER_TRIGGER_COLS	
DESC USER_TRIGGER_COLS

rem despleguemos 
col trigger_name format a22
col table_owner format a15
col table_name format a15
col column_name format a14
SELECT TRIGGER_NAME,TABLE_OWNER,
	TABLE_NAME,COLUMN_NAME
	FROM USER_TRIGGER_COLS
	order by 3,2;

spool off 
