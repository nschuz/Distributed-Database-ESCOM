-- 3.1 Exercises
--Execute the following SQL statement. Based on the result, what is the purpose of the
--INITCAP function?

SELECT  DESCRIPTION "Description", INITCAP(DESCRIPTION) "Initcap Description"
FROM COURSE WHERE  DESCRIPTION LIKE  '%SQL%';
