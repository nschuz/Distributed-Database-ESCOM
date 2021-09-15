--D) Based on the result of the following SQL statement, describe the purpose of the LTRIM
--and RTRIM functions.
SELECT  ZIP , LTRIM(ZIP , 'O') , RTRIM(ZIP , '4') FROM ZIPCODE
ORDER BY  ZIP;
