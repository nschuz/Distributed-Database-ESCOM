REM CREACION Y POBLACION DE LA TABLE EMPLOYEE 
set colsep '|=|'
set linesize 130
set pagesize 99
set feedback on
set null nada

COL PARAMETER FORMAT A25
COL VALUE     FORMAT A25
SELECT PARAMETER,VALUE
	FROM NLS_SESSION_PARAMETERS;

alter session set nls_date_format = 'DD-MON-RR';
alter session set nls_date_LANGUAGE = 'ENGLISH';


drop table EMPLOYEE CASCADE CONSTRAINTS;
CREATE TABLE EMPLOYEE(
    EMP_ID            NUMBER(5)    NOT NULL,
    FNAME             VARCHAR2(20),
    LNAME             VARCHAR2(20),
    DEPT_ID           NUMBER(5)    NOT NULL,
    MANAGER_EMP_ID    NUMBER(5),
    SALARY            NUMBER(5),
    HIRE_DATE         DATE,
    JOB_ID            NUMBER(3),
    CONSTRAINT employee_pk PRIMARY KEY (EMP_ID)
);

insert into employee
(EMP_ID,FNAME,LNAME,DEPT_ID,MANAGER_EMP_ID,SALARY,HIRE_DATE,JOB_ID)
select e.emp_id, e.fname, e.lname, e.dept_id, e.manager_emp_id, e.salary, e.hire_date, e.job_id
from
(
select 7369 emp_id, 'JOHN' fname, 'SMITH' lname, 20 dept_id, 7902 manager_emp_id, 800 salary, '17-DEC-80' hire_date, 667 job_id from dual union all
select 7499 emp_id, 'KEVIN' fname, 'ALLEN' lname, 30 dept_id, 7698 manager_emp_id, 1600 salary, '20-FEB-81' hire_date, 670 job_id from dual union all
select 7521 emp_id, 'CYNTHIA' fname, 'WARD' lname, 30 dept_id, 7698 manager_emp_id, 1250 salary, '22-FEB-81' hire_date, null job_id from dual union all
select 7566 emp_id, 'TERRY' fname, 'JONES' lname, 20 dept_id, 7839 manager_emp_id, 2000 salary, '02-APR-81' hire_date, 671 job_id from dual union all
select 7654 emp_id, 'KENNETH' fname, 'MARTIN' lname, 30 dept_id, 7698 manager_emp_id, 1250 salary, '28-SEP-81' hire_date, 670 job_id from dual union all
select 7698 emp_id, 'MARION' fname, 'BLAKE' lname, 30 dept_id, 7839 manager_emp_id, 2850 salary, '01-MAY-80' hire_date, 671 job_id from dual union all
select 7782 emp_id, 'CAROL' fname, 'CLARK' lname, 10 dept_id, 7839 manager_emp_id, 2450 salary, '09-JUN-81' hire_date, 671 job_id from dual union all
select 7788 emp_id, 'DONALD' fname, 'SCOTT' lname, 20 dept_id, 7566 manager_emp_id, 3000 salary, '19-APR-87' hire_date, 669 job_id from dual union all
select 7839 emp_id, 'FRANCIS' fname, 'KING' lname, 10 dept_id, null manager_emp_id, 5000 salary, '17-NOV-81' hire_date, 672 job_id from dual union all
select 7844 emp_id, 'MARY' fname, 'TURNER' lname, 30 dept_id, 7698 manager_emp_id, 1500 salary, '08-SEP-81' hire_date, 670 job_id from dual union all
select 7876 emp_id, 'DIANE' fname, 'ADAMS' lname, 20 dept_id, 7788 manager_emp_id, 1100 salary, '23-MAY-87' hire_date, null job_id from dual union all
select 7900 emp_id, 'FRED' fname, 'JAMES' lname, 30 dept_id, 7698 manager_emp_id, 950 salary, '03-DEC-81' hire_date, 667 job_id from dual union all
select 7902 emp_id, 'JENNIFER' fname, 'FORD' lname, 20 dept_id, 7566 manager_emp_id, 3000 salary, '03-DEC-81' hire_date, 669 job_id from dual union all
select 7934 emp_id, 'BARBARA' fname, 'MILLER' lname, 10 dept_id, 7782 manager_emp_id, 1300 salary, '23-JAN-82' hire_date, 667 job_id from dual
) e;
commit;

rem [Mishra&Beaulieu,2002,160]
col lname format a13
col dept_id format 99999
col manager_emp_id format 9999
sELECT EMP_ID, LNAME, DEPT_ID, MANAGER_EMP_ID, SALARY, HIRE_DATE
FROM EMPLOYEE
WHERE MANAGER_EMP_ID IS NULL;

rem [Mishra&Beaulieu,2002,160]
sELECT E.LNAME "Employee", M.LNAME "Manager"
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER_EMP_ID = M.EMP_ID;

rem [Mishra&Beaulieu,2002,161]
SELECT E.LNAME "Employee", M.LNAME "Manager"
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER_EMP_ID = M.EMP_ID (+);

rem [Mishra&Beaulieu,2002,162]     
SELECT EMP_ID, LNAME, DEPT_ID, MANAGER_EMP_ID, SALARY, HIRE_DATE
FROM EMPLOYEE E
WHERE EMP_ID NOT IN
(SELECT MANAGER_EMP_ID FROM EMPLOYEE
WHERE MANAGER_EMP_ID IS NOT NULL);

SELECT MANAGER_EMP_ID FROM EMPLOYEE
WHERE MANAGER_EMP_ID IS NOT NULL;


sELECT EMP_ID, LNAME, DEPT_ID, MANAGER_EMP_ID, SALARY, HIRE_DATE
FROM EMPLOYEE E
WHERE NOT EXISTS
(SELECT EMP_ID FROM EMPLOYEE E1 WHERE E.EMP_ID = E1.MANAGER_EMP_ID);

rem [Mishra&Beaulieu,2002,163] 
SELECT E_TOP.LNAME, E_2.LNAME, E_3.LNAME, E_4.LNAME
FROM EMPLOYEE E_TOP, EMPLOYEE E_2, EMPLOYEE E_3, EMPLOYEE E_4
WHERE E_TOP.MANAGER_EMP_ID IS NULL
AND E_TOP.EMP_ID = E_2.MANAGER_EMP_ID (+)
AND E_2.EMP_ID = E_3.MANAGER_EMP_ID (+)
AND E_3.EMP_ID = E_4.MANAGER_EMP_ID (+);

rem calculemos el numero de tuplas del producto cartesiano

select count(*) from employee;

SELECT count(*) 
FROM EMPLOYEE E_TOP, EMPLOYEE E_2, EMPLOYEE E_3, EMPLOYEE E_4;

SELECT count(*) 
FROM EMPLOYEE E_TOP, EMPLOYEE E_2, EMPLOYEE E_3, EMPLOYEE E_4
WHERE E_TOP.MANAGER_EMP_ID is null;

SELECT count(*) 
FROM EMPLOYEE E_TOP, EMPLOYEE E_2, EMPLOYEE E_3, EMPLOYEE E_4
WHERE E_TOP.MANAGER_EMP_ID IS NULL
AND E_TOP.EMP_ID = E_2.MANAGER_EMP_ID (+)
AND E_2.EMP_ID = E_3.MANAGER_EMP_ID (+)
AND E_3.EMP_ID = E_4.MANAGER_EMP_ID (+);

rem [Mishra&Beaulieu,2002,166]  

sELECT * FROM ASSEMBLY
START WITH PARENT_ASSEMBLY_TYPE IS NULL
AND PARENT_ASSEMBLY_ID IS NULL
CONNECT BY PARENT_ASSEMBLY_TYPE = PRIOR ASSEMBLY_TYPE
AND PARENT_ASSEMBLY_ID = PRIOR ASSEMBLY_ID;





rem [Mishra&Beaulieu,2002,166] 

SELECT LNAME, EMP_ID, MANAGER_EMP_ID
FROM EMPLOYEE
START WITH MANAGER_EMP_ID IS NULL
CONNECT BY PRIOR EMP_ID = MANAGER_EMP_ID;

SELECT LNAME, EMP_ID, MANAGER_EMP_ID
FROM EMPLOYEE
START WITH MANAGER_EMP_ID = 7566
CONNECT BY PRIOR EMP_ID = MANAGER_EMP_ID;

REM DESPLEGAR EL NOMBRE DEL EMPLEADO 7566

select lNAme, emp_id,MANAGER_EMP_ID 
FROM EMPLOYEE 
WHERE EMP_ID = 7566;


SELECT LNAME, EMP_ID, MANAGER_EMP_ID
FROM EMPLOYEE
START WITH MANAGER_EMP_ID = 7566
CONNECT BY PRIOR EMP_ID = MANAGER_EMP_ID;




COL TOT_SALES FORMAT 999,999,999
SELECT o.cust_nbr cust_nbr, o.region_id region_id,
 SUM(o.tot_sales) tot_sales
FROM orders O
WHERE o.year = 2001
GROUP BY o.cust_nbr, o.region_id;


sELECT LNAME, EMP_ID, MANAGER_EMP_ID
FROM EMPLOYEE
START WITH MANAGER_EMP_ID IS NULL
CONNECT BY MANAGER_EMP_ID = PRIOR EMP_ID;


SELECT LEVEL, LNAME, EMP_ID, MANAGER_EMP_ID
FROM EMPLOYEE
START WITH MANAGER_EMP_ID IS NULL
CONNECT BY MANAGER_EMP_ID = PRIOR EMP_ID;



col "EMPLOYEE" format a15
sELECT LEVEL, LPAD(' ',2*(LEVEL - 1)) || LNAME "EMPLOYEE",
 EMP_ID, MANAGER_EMP_ID
FROM EMPLOYEE
START WITH MANAGER_EMP_ID IS NULL
CONNECT BY PRIOR EMP_ID = MANAGER_EMP_ID;


col "EMPLOYEE" format a15
sELECT LEVEL, LPAD('--->',2*(LEVEL - 1)) || LNAME "EMPLOYEE",
 EMP_ID, MANAGER_EMP_ID
FROM EMPLOYEE
START WITH MANAGER_EMP_ID IS NULL
CONNECT BY PRIOR EMP_ID = MANAGER_EMP_ID;

col "EMPLOYEE" format a15
sELECT LEVEL, LPAD('      >',2*(LEVEL - 1)) || LNAME "EMPLOYEE",
 EMP_ID, MANAGER_EMP_ID
FROM EMPLOYEE
START WITH MANAGER_EMP_ID IS NULL
CONNECT BY PRIOR EMP_ID = MANAGER_EMP_ID;



SELECT LEVEL, LPAD('   ',4*(LEVEL - 1)) || LNAME "EMPLOYEE",
 EMP_ID, MANAGER_EMP_ID, SALARY
FROM EMPLOYEE
START WITH LNAME = 'JONES'
CONNECT BY MANAGER_EMP_ID = PRIOR EMP_ID;

col "EMPLOYEE" format a35
SELECT LEVEL, LPAD('   ',8*(LEVEL - 1)) || LNAME "EMPLOYEE",
 EMP_ID, MANAGER_EMP_ID, SALARY
FROM EMPLOYEE
START WITH LNAME = 'JONES'
CONNECT BY MANAGER_EMP_ID = PRIOR EMP_ID;


SELECT LNAME, SALARY,
(SELECT SUM(SALARY) FROM EMPLOYEE T1
START WITH LNAME = T2.LNAME
CONNECT BY MANAGER_EMP_ID = PRIOR EMP_ID) SUM_SALARY
FROM EMPLOYEE T2;
