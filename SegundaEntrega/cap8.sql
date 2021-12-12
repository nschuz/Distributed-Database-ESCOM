/*
	Imprime los nombre que tengan el mismo id en las diferentes
	tablas seleccionadas
*/
SELECT E.LNAME "Employee", M.LNAME "Manager"
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER_EMP_ID = M.EMP_ID;

/*
	Funciona como un minus, ya que entrega la seleccion de 
	arriba que no este en la seleccion en parentesis
*/
SELECT EMP_ID, LNAME, DEPT_ID, MANAGER_EMP_ID, SALARY, HIRE_DATE
FROM EMPLOYEE E
WHERE EMP_ID NOT IN
(SELECT MANAGER_EMP_ID FROM EMPLOYEE
WHERE MANAGER_EMP_ID IS NOT NULL);

/*
	Muestra la seleccion con las condiciones de que
	manager_id de e_top es nula y que los id sean 
	iguales respetando el "right outer join" en ambas tablas
*/
SELECT E_TOP.LNAME, E_2.LNAME, E_3.LNAME, E_4.LNAME
FROM EMPLOYEE E_TOP, EMPLOYEE E_2, EMPLOYEE E_3, EMPLOYEE E_4;

WHERE E_TOP.MANAGER_EMP_ID IS NULL
AND E_TOP.EMP_ID = E_2.MANAGER_EMP_ID (+)
AND E_2.EMP_ID = E_3.MANAGER_EMP_ID (+)
AND E_3.EMP_ID = E_4.MANAGER_EMP_ID (+);

/*
	Con START WITH identificamos el registro inicial, 
	el lugar desde el que empieza nuestro árbol, y 
	con CONNECT BY PRIOR, indicamos las columnas entre 
	las que establece la relación registro padre - hijo.
*/
SELECT LNAME, EMP_ID, MANAGER_EMP_ID
FROM EMPLOYEE
START WITH MANAGER_EMP_ID IS NULL
CONNECT BY PRIOR EMP_ID = MANAGER_EMP_ID;

/*
	 calcula el número de valores no NULL diferentes de level
	 con la jerarquia señalada	
*/
SELECT COUNT(DISTINCT LEVEL)
FROM EMPLOYEE
START WITH MANAGER_EMP_ID IS NULL
CONNECT BY PRIOR EMP_ID = MANAGER_EMP_ID;

/*

COL "EMPLOYEE" FORMAT A12
SELECT LEVEL, LPAD(' ',2*(LEVEL - 1)) || LNAME "EMPLOYEE",
 EMP_ID, MANAGER_EMP_ID
FROM EMPLOYEE
START WITH MANAGER_EMP_ID IS NULL
CONNECT BY PRIOR EMP_ID = MANAGER_EMP_ID;
*/

/*
	selecciona las columna con la jerarquia señalada
	siempre y cuando haya desigualdad siendo PRIOR el 
	que marca en que dirección se recorre el arbol
*/
SELECT EMP_ID, LNAME, DEPT_ID, MANAGER_EMP_ID, SALARY, HIRE_DATE
FROM EMPLOYEE
START WITH MANAGER_EMP_ID IS NULL
CONNECT BY MANAGER_EMP_ID = PRIOR EMP_ID
AND DEPT_ID != PRIOR DEPT_ID;