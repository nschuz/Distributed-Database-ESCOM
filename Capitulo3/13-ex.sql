--The result set is difficult to read without spaces between cities and states. The CONCAT function
--takes only two parameters. By using the || operator, you can easily concatenate several strings:

SELECT   CITY || STATE  || ZIP  FROM  ZIPCODE;

SELECT  CITY || ', ' || STATE || ' '  || ZIP  FROM ZIPCODE;


--- REPLACE FUNCTION PAG 175;
SELECT REPLACE('My had is asleep' , 'had' , 'foot') from DUAL;
