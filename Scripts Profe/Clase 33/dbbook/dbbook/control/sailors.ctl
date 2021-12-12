load data
infile '%ORA_DATA%\sailors.txt'
replace
into table sailors
fields terminated by ','
(sid,sname,rating,age)