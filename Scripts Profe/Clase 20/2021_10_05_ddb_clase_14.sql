spool C:\Users\ORA_bases\2021_02_24_clase_2\salida\FRAG_HOR_primaria_2.txt
set linesize 150 
set pagesize 99
set colsep '||'	
set colsep '| = |'
set underline =
set null s/Dato

drop table emp;
create table emp(
	eno varchar2(2),
	ename varchar2(10),
	title varchar2(12));

insert into EMP values('E1','J. Doe',     'Elect. Eng');
insert into EMP values('E2','M. Smith',   'Syst. Anal.');
insert into EMP values('E3','A. Lee,',    'Mech. Eng.');
insert into EMP values('E4','J. Miller',  'Programmer');
insert into EMP values('E5','B. Casey',   'Syst. Anal.');
insert into EMP values('E6','L. Chu',     'Elect. Eng.');
insert into EMP values('E7','R. Davis',   'Mech. Eng.');
insert into EMP values('E8','J. Jones',   'Syst. Anal');

drop table asg;
create table asg(
	eno varchar2(2),
	pno varchar2(10),
	resp varchar2(12),
	dur number(3));

insert into asg values('E1','P1','Manager',12);
insert into asg values('E2','P1','Analyst', 24);
insert into asg values('E2','P2','Analyst', 6);
insert into asg values('E3','P3','Consultant', 10);
insert into asg values('E3','P4','Engineer', 48);
insert into asg values('E4','P2','Programmer', 18);
insert into asg values('E5','P2','Manager', 24);
insert into asg values('E6','P4','Manager', 48);
insert into asg values('E7','P3','Engineer', 36);
insert into asg values('E8','P3','Manager', 40);

drop table proj;
create table proj(
	pno varchar2(2),
	pname varchar2(19),
	budget number(7),
	loc varchar2(12));
	
insert into proj values('P1','Instrumentation',   150000,'Montreal');
insert into proj values('P2','Database Develop.', 135000,'New York');
insert into proj values('P3','CAD/CAM',           250000,'New York');
insert into proj values('P4','Maintenance',       310000, 'Paris');

drop table pay;
create table pay(
	title varchar2(15),
	sal number(6));
	
insert into pay values('Elect. Eng.', 40000);
insert into pay values('Syst. Anal.', 34000);
insert into pay values('Mech. Eng.',  27000);
insert into pay values('Programmer',  24000);

select count(*) from emp;
select count(*) from asg;
select count(*) from proj;
select count(*) from pay;

select * from emp;
select * from asg;
select * from proj;
select * from pay;



rem  [Ozsu,2011,p 48]
rem    ejem 2.4

select eno,ename,title
	FROM EMP
	WHERE TITLE = 'Elect. Eng.';

rem  [Ozsu,2011,p 48]
rem    ejem 2.5	
select pno,budget
	from proj;
	
rem  [Ozsu,2011,p 49]
rem    ejem 2.5	

select * from emp,proj;

rem  [Ozsu,2011,p 53]
rem    ejem 2.5	
rem semijoin 
select eno,ename,emp.title
	from emp,pay
	where emp.title = pay.title;
	
rem  [Ozsu,2011,p 75]	
rem ejem de particionamiento HORIZONAL

SELECT PNO,PNAME,BUDGET,LOC
	FROM PROJ
	WHERE PNO = 'P1'
	OR PNO = 'P2';
	
SELECT PNO,PNAME,BUDGET,LOC
	FROM PROJ
	WHERE PNO = 'P3'
	OR PNO = 'P4';

rem  [Ozsu,2011,p 78]	
rem ejem de particionamiento VERTICAL

SELECT PNO,BUDGET
FROM PROJ;

SELECT PNO,PNAME,LOC
	FROM PROJ;
	
	
PROMPT CREAREMOS VISTAS PARA CADA FRAGMENTACIÓN
PROMPT  PRIMERO LAS FRAGMENTACIONES HORIZONTALES
DROP VIEW PROJ1H;
CREATE VIEW PROJ1H AS 
SELECT PNO,PNAME,BUDGET,LOC
	FROM PROJ
	WHERE PNO = 'P1'
	OR PNO = 'P2';
SELECT * FROM PROJ1H;

DROP VIEW PROJ2H;
CREATE VIEW PROJ2H AS 
SELECT PNO,PNAME,BUDGET,LOC
	FROM PROJ
	WHERE PNO = 'P3'
	OR PNO = 'P4';
SELECT * FROM PROJ2H;

PROMPT  LUEGO LAS FRAGMENTACIONES VERTICALES
DROP VIEW PROJ1V;
CREATE VIEW PROJ1V AS 
SELECT PNO,BUDGET
FROM PROJ;
SELECT * FROM PROJ1V;

DROP VIEW PROJ2V;
CREATE VIEW PROJ2V AS 
SELECT PNO,PNAME,LOC
	FROM PROJ;
SELECT * FROM PROJ2V;	

rem [Ozsu & Valduriez,2011,85]
---------------------------------------------
-------------------------------------------
rem ejemplo 3.7
---------------------------------------------

select pno,pname,budget, loc
	from proj
	where budget <= 200000;
	
select pno,pname,budget, loc
	from proj
	where budget > 200000;
rem creamos vistas para cada fragmento
rem fragmento 1
------------------
drop view proj1fh;
create view proj1fh as
select pno,pname,budget, loc
	from proj
	where budget <= 200000;
	
select pno,pname,budget, loc
	from proj1fh;
	
---------------------------	
rem fragmento 2
drop view proj2fh;
create view proj2fh as
select pno,pname,budget, loc
	from proj
	where budget > 200000
	and budget <= 400000;
	
select pno,pname,budget, loc
	from proj2fh;
	
--------------------------------	
rem insertemos una nueva tupla

insert into proj values('P5','Database',600000, 'Montreal');
rem borramos tupla 

delete from proj where pname = 'Database'; 
select pno,pname,budget, loc
	from proj
	where budget > 400000;

	
select * from proj;	

rem fragmento 3
drop view proj3fh;
create view proj3fh as
select pno,pname,budget, loc
	from proj
	where budget > 400000;
	
select pno,pname,budget, loc
	from proj3fh;
	
rem desplegar todos los fragmentos


select pno,pname,budget, loc
	from proj1fh;

select pno,pname,budget, loc
	from proj2fh;

select pno,pname,budget, loc
	from proj3fh;
/*	
drop view proj1gh;	
drop view proj2gh;
drop view proj3gh;
*/

rem [Ozsu & Valduriez,2011,85]
---------------------------------------------
-------------------------------------------
rem ejemplo 3.7
---------------------------------------------

rem miniterminos
/*
m1: (LOC = “Montreal”) ∧ (BUDGET ≤ 200000)
m2: (LOC = “Montreal”) ∧ (BUDGET > 200000)
m3: (LOC = “New York”) ∧ (BUDGET ≤ 200000)
m4: (LOC = “New York”) ∧ (BUDGET > 200000)
m5: (LOC = “Paris”) ∧ (BUDGET ≤ 200000)
m6: (LOC = “Paris”) ∧ (BUDGET > 200000)
 */
 rem borramos tupla
 delete from proj where pname = 'Database'; 
 rem desplegamos tuplas
 select * from proj;
 prompt  ====>>>> m1
 
 select pno,pname,budget, loc
	from proj
	where loc ='Montreal'
	and    budget <= 200000;
 prompt  ====>>>> m2 SIN TUPLAS
 
 select pno,pname,budget, loc
	from proj
	where loc ='Montreal'
	and    budget > 200000;
 prompt  ====>>>> m3
 
 select pno,pname,budget, loc
	from proj
	where loc ='New York'
	and    budget <= 200000;
 prompt  ====>>>> m4
 
 select pno,pname,budget, loc
	from proj
	where loc ='New York'
	and    budget > 200000;
 prompt  ====>>>> m5 SIN TUPLAS
 
 select pno,pname,budget, loc
	from proj
	where loc ='Paris'
	and    budget <= 200000;
 prompt  ====>>>> m6	
 select pno,pname,budget, loc
	from proj
	where loc ='Paris'
	and    budget > 200000;
	

REM AHORA GENERAREMOS LAS VISTAS
 prompt  ====>>>> m1 vista
drop view projm1fh;
create view projm1fh as
 select pno,pname,budget, loc
	from proj
	where loc ='Montreal'
	and    budget <= 200000;
 prompt  ====>>>> m2 SIN TUPLAS vista
 drop view projm2fh;
create view projm2fh as
 select pno,pname,budget, loc
	from proj
	where loc ='Montreal'
	and    budget > 200000;
 prompt  ====>>>> m3  vista
drop view projm3fh;
create view projm3fh as 
 select pno,pname,budget, loc
	from proj
	where loc ='New York'
	and    budget <= 200000;
 prompt  ====>>>> m4   vista
drop view projm4fh;
create view projm4fh as 
 select pno,pname,budget, loc
	from proj
	where loc ='New York'
	and    budget > 200000;
 prompt  ====>>>> m5 SIN TUPLAS  vista
 drop view projm5fh;
create view projm5fh as
 select pno,pname,budget, loc
	from proj
	where loc ='Paris'
	and    budget <= 200000;
 prompt  ====>>>> m6	vista 
 drop view projm6fh;
create view projm6fh as
select pno,pname,budget, loc
	from proj
	where loc ='Paris'
	and    budget > 200000;
-------------------
promp despleguemos las vistas

select pno,pname,budget, loc
	from projm1fh;

select pno,pname,budget, loc
	from projm2fh;
	
select pno,pname,budget, loc
	from projm3fh;

select pno,pname,budget, loc
	from projm4fh;

select pno,pname,budget, loc
	from projm5fh;
	
select pno,pname,budget, loc
	from projm6fh;


SPOOL OFF

	
