
--c) Describe the result of the following SQL statement. Pay particular attention to the
--negative number parameter.
SELECT  SUBSTR('12345' , 3), SUBSTR('123345', 3 , 2),
       SUBSTR('12345', -4 ,3) FROM DUAL;
