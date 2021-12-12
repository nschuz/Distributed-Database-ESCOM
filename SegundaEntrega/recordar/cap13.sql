/*
SELECT c.name cust_name,
 cust_sales.tot_sales cust_sales, r.name region_name,
100 * ROUND(cust_sales.tot_sales /
 cust_sales.region_sales, 2) percent_of_region
FROM region r, customer c,
 (SELECT o.region_id region_id, o.cust_nbr cust_nbr,
 SUM(o.tot_sales) tot_sales,
 SUM(SUM(o.tot_sales)) OVER (PARTITION BY o.region_id) region_sales
 FROM orders o
 WHERE o.year = 2001
 GROUP BY o.region_id, o.cust_nbr) cust_sales
WHERE cust_sales.tot_sales > (cust_sales.region_sales * .2)
 AND cust_sales.region_id = r.region_id
 AND cust_sales.cust_nbr = c.cust_nbr;
 */

/*
	año 2001, agrupa por id de region y cust_nbr ordenando 
	por la columna 6
*/
SELECT region_id, cust_nbr,
 SUM(tot_sales) cust_sales,
 RANK( ) OVER (ORDER BY SUM(tot_sales) DESC) sales_rank,
 DENSE_RANK( ) OVER (ORDER BY SUM(tot_sales) DESC) sales_dense_rank,
 ROW_NUMBER( ) OVER (ORDER BY SUM(tot_sales) DESC) sales_number
FROM orders
WHERE year = 2001
GROUP BY region_id, cust_nbr
ORDER BY 6;

SELECT region_id, cust_nbr, SUM(tot_sales) cust_sales,
 RANK( ) OVER (ORDER BY SUM(tot_sales) DESC NULLS LAST) sales_rank
FROM orders
WHERE year = 2001
GROUP BY region_id, cust_nbr;

/*
	SELECT MIN devuelve el valor mínimo que se encuentra 
	en una columna.
	SELECT MAX devuelve el valor máximo que se encuentra 
	en una columna.
*/
SELECT
 MIN(region_id)
 KEEP (DENSE_RANK FIRST ORDER BY SUM(tot_sales) DESC) best_region,
 MIN(region_id)
 KEEP (DENSE_RANK LAST ORDER BY SUM(tot_sales) DESC) worst_region
FROM orders
WHERE year = 2001
GROUP BY region_id;

/*
	Ordena en ascendente la columna 4 y en desc la 3
*/SELECT region_id, cust_nbr, SUM(tot_sales) cust_sales,
 NTILE(4) OVER (ORDER BY SUM(tot_sales) DESC) sales_quartile
FROM orders
WHERE year = 2001
GROUP BY region_id, cust_nbr
ORDER BY 4,3 DESC;

/*
	sumas
*/
SELECT region_id, cust_nbr,
 SUM(tot_sales) cust_sales,
 WIDTH_BUCKET(SUM(tot_sales), 1000000, 2000000, 3) sales_buckets
FROM orders
WHERE year = 2001
GROUP BY region_id, cust_nbr
ORDER BY 3;

SELECT region_id, cust_nbr,
 SUM(tot_sales) cust_sales,
 CUME_DIST( ) OVER (ORDER BY SUM(tot_sales) DESC) sales_cume_dist,
 PERCENT_RANK( ) OVER (ORDER BY SUM(tot_sales) DESC) sales_percent_rank
FROM orders
WHERE year = 2001
GROUP BY region_id, cust_nbr
ORDER BY 3 DESC;

SELECT month, SUM(tot_sales) monthly_sales,
 SUM(SUM(tot_sales)) OVER (ORDER BY month
 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) total_sales
FROM orders
WHERE year = 2001
 AND region_id = 6
GROUP BY month
ORDER BY month;

/*
	Over devuelva el valor SOBRE un subconjunto de los 
	registros devueltos de la consulta y PARTICIÓN de 
	ese subconjunto POR la ​​clave externa SalesOrderID.
*/
SELECT month,
 FIRST_VALUE(SUM(tot_sales)) OVER (ORDER BY month
 ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) prev_month,
 SUM(tot_sales) monthly_sales,
 LAST_VALUE(SUM(tot_sales)) OVER (ORDER BY month
 ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) next_month,
 AVG(SUM(tot_sales)) OVER (ORDER BY month
 ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) rolling_avg
FROM orders
WHERE year = 2001
 AND region_id = 6
GROUP BY month
ORDER BY month;

/*
	 LAG permite acceder a los datos de la fila anterior en el
	 mismo conjunto de resultados sin el uso de ninguna
	 combinación
*/
SELECT month, SUM(tot_sales) monthly_sales,
 LAG(SUM(tot_sales), 1) OVER (ORDER BY month) prev_month_sales
FROM orders
WHERE year = 2001
 AND region_id = 6
GROUP BY month
ORDER BY month;