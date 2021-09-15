-- THE TRANSLATE FUNCTION
/*
Unlike REPLACE, which replaces an entire string, the TRANSLATE function provides a one-for-one
character substitution. For instance, it allows you to determine if all the phone numbers in the
STUDENT table follow the same format. In the next query, TRANSLATE substitutes the '#' character
for every character from '0' to '9'. Then the values are checked against the '###-###-####'
format.
*/
SELECT  PHONE FROM STUDENT WHERE TRANSLATE(PHONE , '0123456789' , '##########') <>
'###-###-####';
