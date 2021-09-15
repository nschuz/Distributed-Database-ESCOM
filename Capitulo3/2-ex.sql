-- The Upper And Initcap Functions
SELECT UPPER(city), state, INITCAP(state)
FROM zipcode
WHERE zip = '10035';
