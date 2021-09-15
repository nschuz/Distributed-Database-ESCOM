--THE SOUNDEX FUNCTION
/*
The SOUNDEX function allows you compare differently spelled words that phonetically sound alike.
The next query uses the SOUNDEX function to display students where the last name sounds like
Martin.
*/
SELECT  STUDENT_ID , LAST_NAME FROM STUDENT
WHERE SOUNDEX(LAST_NAME) = SOUNDEX('MARTIN');