rem borrelos los table space desde SYS
DROP TABLESPACE TBS_ESIME
   INCLUDING CONTENTS AND DATAFILES;
   
DROP TABLESPACE TBS_orders_1999
   INCLUDING CONTENTS AND DATAFILES;
   
DROP TABLESPACE TBS_orders_2000
   INCLUDING CONTENTS AND DATAFILES;
   
DROP TABLESPACE TBS_orders_2001
   INCLUDING CONTENTS AND DATAFILES;


rem   crea los TABLESPACES


CREATE TABLESPACE TBS_orders_1999
	DATAFILE 'C:\Users\ORA_bases\orders_1999.BDF'
	SIZE 5M;
CREATE TABLESPACE TBS_orders_2000
	DATAFILE 'C:\Users\ORA_bases\orders_2000.BDF'
	SIZE 5M;
CREATE TABLESPACE TBS_orders_2001
	DATAFILE 'C:\Users\ORA_bases\orders_2000.BDF'
	SIZE 5M

	