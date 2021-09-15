/*
 The next example shows the use of LEADING, TRAILING, and BOTH (if neither LEADING nor
TRAILING is specified); the result is identical to the previous query:
 */
SELECT TRIM(LEADING '0' FROM '0001234500') leading,
TRIM(TRAILING '0' FROM '0001234500') trailing,
TRIM('0' FROM '0001234500') both
FROM dual;