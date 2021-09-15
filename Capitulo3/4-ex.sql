--The LTRIM, RTRIM, and TRIM Functions
/*
LTRIM and RTRIM are the opposite of LPAD and RPAD because they trim, or remove, unwanted
characters, symbols, or spaces in strings. In this example, you see the use of the DUAL table to
trim the zero (0) from the left, the right, and both sides. If both the left and right sides of the string
are trimmed, you need to nest the function. The result of one function provides the input for the
other function.
 */

SELECT LTRIM('0001234500', '0') left,
RTRIM('0001234500', '0') right,
LTRIM(RTRIM('0001234500', '0'), '0') both
FROM dual;
