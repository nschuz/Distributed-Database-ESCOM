--
-- Oracle Bulk Loader Contol File
--
-- 	This is used to instruct oracle to bulk load data. It is 
-- automatically run by the installation script.
--
-- Version 0.1.0.0 2002/04/06 by: David Warden.
-- Copyright (C) 2002 McGraw-Hill Companies Inc. All Rights Reserved.
--
load data
infile '%ORA_DATA%\flights.txt'
replace
into table flights
fields terminated by ','
(flno,origin,destination,distance,departs DATE 'YYYY/MM/DD HH24:MI',arrives DATE 'YYYY/MM/DD HH24:MI',price)