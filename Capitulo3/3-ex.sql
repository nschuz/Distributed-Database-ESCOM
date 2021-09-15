
--The LPAD and RPAD Functions
SELECT RPAD(city, 20, '*') "City Name",
LPAD(state, 10, '-') "State Name"
FROM zipcode;

SELECT LPAD (city, 20) AS "City Name"
FROM zipcode;
