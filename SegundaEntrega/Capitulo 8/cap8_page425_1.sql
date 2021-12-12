
spool out\salida_pag425_1.txt
rem (Rischert,A(2004). Chapter 8. Set Operators
rem IN Oracle SQL by Example(424-444),USA: Prentice Hall 

set pagesize 130
set linesize 130
set colsep '|=|'
set feedback on
set null s/Dato


/*
    El operador UNION es probablemente el operador de conjuntos más utilizado. Combina dos o más conjuntos de datos para producir un único conjunto de datos.
	Imprime los datos seleccionados de ambas tablas en el orden
	como si fueran una misma tabla
*/
SELECT first_name, last_name, phone 
 FROM instructor 
 UNION 
SELECT first_name, last_name, phone 
 FROM student;

/*
	Lo mismo que el anterior pero al no poner los datos en el 
	mismo orden, se imprimen y las tablas ya no coinciden
*/
SELECT first_name, phone,  last_name
 FROM instructor 
 UNION 
SELECT first_name, last_name, phone 
 FROM student;

 
spool off