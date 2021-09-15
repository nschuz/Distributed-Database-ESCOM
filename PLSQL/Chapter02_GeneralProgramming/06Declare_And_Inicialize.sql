
spool C:\Bases\PLSQL\Chapter02_GeneralProgramming\out\salida06.txt
rem ROSENZWEIG,B &  RAKHIMOV,E (2009).Oracle PL/SQL by example / Benjamin Rosenzweig, Elena Silvestrova Rakhimov

REM EJERCICIO DE LA PAGINA 61

SET SERVEROUTPUT ON
DECLARE
	v_cookies_amt NUMBER := 2;
	v_calories_per_cookie CONSTANT NUMBER := 300;
BEGIN
	DBMS_OUTPUT.PUT_LINE('I ate ' || v_cookies_amt ||
	' cookies with ' || v_cookies_amt *
	v_calories_per_cookie || ' calories.');
	v_cookies_amt := 3;
	DBMS_OUTPUT.PUT_LINE('I really ate ' ||
	v_cookies_amt
	|| ' cookies with ' || v_cookies_amt *
	v_calories_per_cookie || ' calories.');
	v_cookies_amt := v_cookies_amt + 5;
	DBMS_OUTPUT.PUT_LINE('The truth is, I actually ate '
	|| v_cookies_amt || ' cookies with ' ||
	v_cookies_amt * v_calories_per_cookie
	|| ' calories.');
END;
.
/

spool off