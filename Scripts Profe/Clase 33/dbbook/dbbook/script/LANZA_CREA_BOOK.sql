spool %ORA_ARG_SAL%\sal_creaBook.txt 
@@C:\Users\ORA_bases\dbbook\script\CREABOOK.SQL
spool off

REM VARIABLES DE ENTORNO Y POBLADO DE TABLAS 

host




/*
C:\Users\ORA_bases\dbbook\bitacora
C:\Users\ORA_bases\dbbook\bitacora

C:\Users\ORA_bases\dbbook\control

C:\Users\ORA_bases\dbbook

C:\Users\ORA_bases\dbbook\control
-- --------------------------------------
DEFINIR LAS VARIABLES DE ENTORNO 

VENTANA Q, PANEL DE CONTROL, SISTEMAS Y SEGURIDAD, SISTEMA, CONFIGURACIÓN AVANZADA

VARIABLES DE ENTORNO YA SEA :  CREAR O EDITAR UNA VARIABLE.

CREAR LAS SIGUIENTES VARIABLES DE ENTORNO
CON SUS NOMBRES Y PARA ACCEDER A ELLO CON %NOMBRE_DE_VARIABLE%


C:\Users\ORA_bases\dbbook\bitacora --> %ORA_LOG%

C:\Users\ORA_bases\dbbook\bad     -->   %ORA_BAD%

C:\Users\ORA_bases\dbbook\control -->   %ORA_CONTROL%


C:\Users\ORA_bases\dbbook\data    -->   %ORA_DATA%

C:\Users\ORA_bases\dbbook\discard -->   %ORA_DISCARD%

C:\Users\ORA_bases\dbbook\salida  -->   %ORA_SALIDA%

C:\Users\ORA_bases\dbbook\script  -->   %ORA_SCRIPTS%\faculty


*/
%ORA_HOME%\	bin\
HOST 
sqlldr sergionava/sergionava control=  %ORA_CONTROL%\faculty.ctl  log=%ORA_LOG%\faculty.log bad =     %ORA_BAD%\facilty.txt   discard=%ORA_DISCARD%\faculty.txt
rem ahora poblemos las otras tablas

sqlldr sergionava/sergionava control=  %ORA_CONTROL%\faculty.ctl   log=%ORA_LOG%\faculty.log       bad=%ORA_BAD%\faculty.bad     discard=%ORA_DISCARD%\faculty.txt
sqlldr sergionava/sergionava control=  %ORA_CONTROL%\student.ctl   log=%ORA_LOG%\student.log       bad=%ORA_BAD%\student.bad     discard=%ORA_DISCARD%\student.txt
sqlldr sergionava/sergionava control=  %ORA_CONTROL%\class.ctl     log=%ORA_LOG%\class.log        bad=%ORA_BAD%\class.bad       discard=%ORA_DISCARD%\class.txt
sqlldr sergionava/sergionava control=  %ORA_CONTROL%\enrolled.ctl  log=%ORA_LOG%\enrolled.log      bad=%ORA_BAD%\enrolled.bad    discard=%ORA_DISCARD%\enrolled.txt
sqlldr sergionava/sergionava control=  %ORA_CONTROL%\emp.ctl       log=%ORA_LOG%\emp.log           bad=%ORA_BAD%\emp.bad         discard=%ORA_DISCARD%\emp.txt
sqlldr sergionava/sergionava control=  %ORA_CONTROL%\dept.ctl      log=%ORA_LOG%\dept.log          bad=%ORA_BAD%\dept.bad        discard=%ORA_DISCARD%\dept.txt
sqlldr sergionava/sergionava control=  %ORA_CONTROL%\works.ctl     log=%ORA_LOG%\works.log         bad=%ORA_BAD%\works.bad       discard=%ORA_DISCARD%\works.txt
sqlldr sergionava/sergionava control=  %ORA_CONTROL%\parts.ctl     log=%ORA_LOG%\parts.log         bad=%ORA_BAD%\parts.bad       discard=%ORA_DISCARD%\parts.txt
sqlldr sergionava/sergionava control=  %ORA_CONTROL%\suppliers.ctl log=%ORA_LOG%\suppliers.log     bad=%ORA_BAD%\suppliers.bad   discard=%ORA_DISCARD%\suppliers.txt
sqlldr sergionava/sergionava control=  %ORA_CONTROL%\catalog.ctl   log=%ORA_LOG%\catalog.log      bad=%ORA_BAD%\catalog.bad    discard=%ORA_DISCARD%\catalog.txt
sqlldr sergionava/sergionava control=  %ORA_CONTROL%\aircraft.ctl  log=%ORA_LOG%\aircraft.log      bad=%ORA_BAD%\aircraft.bad    discard=%ORA_DISCARD%\aircraft.txt
sqlldr sergionava/sergionava control=  %ORA_CONTROL%\employees.ctl log=%ORA_LOG%\employees.log     bad=%ORA_BAD%\employees.bad   discard=%ORA_DISCARD%\employees.txt
sqlldr sergionava/sergionava control=  %ORA_CONTROL%\flights.ctl   log=%ORA_LOG%\flights.log       bad=%ORA_BAD%\flights.bad     discard=%ORA_DISCARD%\flights.txt
sqlldr sergionava/sergionava control=  %ORA_CONTROL%\certified.ctl log=%ORA_LOG%\certified.log     bad=%ORA_BAD%\certified.bad   discard=%ORA_DISCARD%\certified.txt
sqlldr sergionava/sergionava control=  %ORA_CONTROL%\sailors.ctl   log=%ORA_LOG%\sailors.log       bad=%ORA_BAD%\sailors.bad     discard=%ORA_DISCARD%\sailors.txt

EXIT

REM  DESPLIEGA CIFRAS

@@C:\Users\ORA_bases\dbbook\script\CIFRAS.SQL 


REM  DESPLIEGA TUPLAS

SET COLSEP '|=|'

@@C:\Users\ORA_bases\dbbook\script\DESPLIEGA_ATRIB.SQL



