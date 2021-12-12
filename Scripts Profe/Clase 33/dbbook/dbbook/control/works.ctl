--
-- Oracle Bulk Loader Contol File
--
-- 	This is used to instruct oracle to bulk load data. It is 
-- automatically run by the installation script.
--
-- Version 0.1.0.0 2002/04/06 by: David Warden.
-- Copyright (C) 2002 McGraw-Hill Companies Inc. All Rights Reserved.
-- MODIFICADO EL 17 DE DIC DE 2020
load data
infile '%ORA_DATA%\works.txt'
BADFILE '%ORA_BAD%\works.bad'
discardfile '%ORA_DISCARD%\works.dsc%'
replace
into table Works
fields terminated by ','
(eid,did,pct_time)