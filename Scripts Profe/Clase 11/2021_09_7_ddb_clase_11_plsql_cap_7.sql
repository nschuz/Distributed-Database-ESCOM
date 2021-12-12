rem revision del ejercio 
rem rem [ROSENZWEIG &  RAKHIMOV,2009,153] 
-- ch07_2a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
	v_sum NUMBER := 0;
BEGIN
	FOR v_counter in 1..10 LOOP
-- if v_counter is odd, pass control to the top of the loop
	CONTINUE WHEN mod(v_counter, 2) != 0;
	v_sum := v_sum + v_counter;	
	DBMS_OUTPUT.PUT_LINE ('Current sum is: '||v_sum);
END LOOP;
-- control resumes here
DBMS_OUTPUT.PUT_LINE ('Final sum is: '||v_sum);
END;
/

DECLARE
	v_sum NUMBER := 0;
BEGIN
	FOR v_counter in 1..10 
LOOP
-- if v_counter is odd, pass control to the top of the loop
--	CONTINUE WHEN mod(v_counter, 2) != 0;
	v_sum := v_sum + v_counter;	
	DBMS_OUTPUT.PUT_LINE ('La suma actual '||v_sum);
END LOOP;
-- control resumes here
DBMS_OUTPUT.PUT_LINE ('Suma FINAL is: '||v_sum);
END;
/


DECLARE
	v_sum NUMBER := 0;
BEGIN
	FOR v_counter in 1..10 
LOOP
-- if v_counter is odd, pass control to the top of the loop
--	CONTINUE WHEN mod(v_counter, 2) != 0;
	v_sum := v_sum + v_counter;	
	DBMS_OUTPUT.PUT_LINE ('La suma actual '||v_sum||
	' ==> par ->0<- non ->1<- '||'  ===>'|| mod(v_counter,2)	);
END LOOP;
-- control resumes here
DBMS_OUTPUT.PUT_LINE ('Suma FINAL is: '||v_sum);
END;
/

DECLARE
	v_sum NUMBER := 0;
BEGIN
	FOR v_counter in 1..10 
LOOP
-- if v_counter is odd, pass control to the top of the loop
--  eliminemos lo spares del   LOOP 
	CONTINUE WHEN mod(v_counter, 2) != 0;
	v_sum := v_sum + v_counter;	
	DBMS_OUTPUT.PUT_LINE ('La suma actual '||v_sum||
	' ==> par ->0<- non ->1<- '||'  ===>'|| mod(v_counter,2)	);
END LOOP;
-- control resumes here
DBMS_OUTPUT.PUT_LINE ('Suma FINAL is: '||v_sum);
END;
/

