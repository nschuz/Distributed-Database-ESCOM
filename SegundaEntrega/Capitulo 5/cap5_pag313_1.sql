
spool out\salida_pag313.txt
rem (Rischert,A(2004). Chapter 5. Aggregate Functions, GROUP BY, and HAVING  
rem IN Oracle SQL by Example(223-325),USA: Prentice Hall 

col location format A5;
col min format 999;
col MAX format 999;

/* 
La sentencia GROUP BY identifica una columna seleccionada para utilizarla para agrupar resultados. Divide los datos en grupos por los valores de la columna especificada, y devuelve una fila de resultados para cada grupo.
*/

SELECT location, COUNT(*), SUM(capacity) AS sum, 
 MIN(capacity) AS min, MAX(capacity) AS max 
 FROM section 
 GROUP BY location;
 
spool off

 /* 
 
Cómo desea agrupar las filas (GROUP BY)
Una condición que las filas, como grupo, deben cumplir (HAVING)
El orden en que desea que se devuelvan las filas (ORDER BY)
 */