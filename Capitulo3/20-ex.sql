
--What do you observe when you execute the next statement? How would you change
--the statement to achieve the desired result?
--ERROR
SELECT  TRIM('01' FROM  '01230145601') FROM  DUAL;

SELECT  TRANSLATE('555-1212' , '0123456789' , '##########')
FROM  DUAL;
