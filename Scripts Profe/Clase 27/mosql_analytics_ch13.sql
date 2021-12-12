rem mosql
SET COLSEP ' || '
SET LINESIZE 150 
SET PAGESIZE 99
set null s/Datos
rem 
rem [Mishra&Beaulieu,2002,268] 

sELECT o.region_id region_id, SUM(o.tot_sales) tot_sales
FROM orders o
WHERE o.year = 2001
GROUP BY o.region_id;

SELECT o.cust_nbr cust_nbr, o.region_id region_id,
 SUM(o.tot_sales) tot_sales
FROM orders o
WHERE o.year = 2001
GROUP BY o.cust_nbr, o.region_id;


rem [Mishra&Beaulieu,2002,268] 

select cust_nbr, count (*) from orders
group by cust_nbr
order by 1;

select region_id, count (*) from orders
group by region_id
order by 1;

select salesperson_id, count (*) from orders
group by salesperson_id
order by 1;

select year, count (*) from orders
group by year
order by 1;

select month, count (*) from orders
group by month
order by 1;

select tot_orders, count (*) from orders
group by tot_orders
order by 1;

select tot_sales, count (*) from orders
group by tot_sales
order by 1;

select distinct tot_orders from orders
order by 1;

select distinct tot_sales from orders
 order by 1;

rem de nuevo las consultas pag 268

rem [Mishra&Beaulieu,2002,268] 

sELECT o.region_id region_id, SUM(o.tot_sales) tot_sales
FROM orders o
WHERE o.year = 2001
GROUP BY o.region_id;

SELECT o.cust_nbr cust_nbr, o.region_id region_id,
 SUM(o.tot_sales) tot_sales
FROM orders o
WHERE o.year = 2001
GROUP BY o.cust_nbr, o.region_id;


rem By placing each of the two queries in 
rem an inline view and joining them 
rem on region_id,
rem we can locate those customers 
rem whose total sales exceeds
rem  20% of their region, as in:

SELECT cust_sales.cust_nbr cust_nbr, cust_sales.region_id region_id,
 cust_sales.tot_sales cust_sales, region_sales.tot_sales region_sales
FROM
 (SELECT o.region_id region_id, SUM(o.tot_sales) tot_sales
 FROM orders o
 WHERE o.year = 2001
 GROUP BY o.region_id) region_sales,
 (SELECT o.cust_nbr cust_nbr, o.region_id region_id,
 SUM(o.tot_sales) tot_sales
 FROM orders o
 WHERE o.year = 2001
 GROUP BY o.cust_nbr, o.region_id) cust_sales
WHERE cust_sales.region_id = region_sales.region_id
 AND cust_sales.tot_sales > (region_sales.tot_sales * .2);
rem 
rem The final step is to join 
rem the region and customer dimensions 
rem in order to include the
rem customer and region names 
rem in the result set:

sELECT c.name cust_name,
 big_custs.cust_sales cust_sales, r.name region_name,
 100 * ROUND(big_custs.cust_sales /
 big_custs.region_sales, 2) percent_of_region
FROM region r, customer c,
 (SELECT cust_sales.cust_nbr cust_nbr, cust_sales.region_id region_id,
 cust_sales.tot_sales cust_sales,
 region_sales.tot_sales region_sales
 FROM
 (SELECT o.region_id region_id, SUM(o.tot_sales) tot_sales
 FROM orders o
 WHERE o.year = 2001
 GROUP BY o.region_id) region_sales,
 (SELECT o.cust_nbr cust_nbr, o.region_id region_id,
 SUM(o.tot_sales) tot_sales
 FROM orders o
 WHERE o.year = 2001
 GROUP BY o.cust_nbr, o.region_id) cust_sales
 WHERE cust_sales.region_id = region_sales.region_id
 AND cust_sales.tot_sales > (region_sales.tot_sales * .2)) big_custs
WHERE big_custs.cust_nbr = c.cust_nbr
 AND big_custs.region_id = r.region_id;
 
rem Let’s see how we can both simplify the query 
rem and perform the same work in a single
rem pass through the orders 
rem table using one of the 
rem new analytic functions

SELECT o.region_id region_id, o.cust_nbr cust_nbr,
    SUM(o.tot_sales) tot_sales,
    SUM(SUM(o.tot_sales)) OVER (PARTITION BY o.region_id) region_sales
    FROM orders o
    WHERE o.year = 2001
    GROUP BY o.region_id, o.cust_nbr;
	
	
rem  We can then wrap the query 
rem in an inline view,* filter out those
rem customers with less than 20% of 
rem their region’s total sales, 
rem and join the region and
rem customer tables to generate
rem the desired result set:

rem [Mishra&Beaulieu,2002,271] 
SELECT c.name cust_name,
 cust_sales.tot_sales cust_sales,
 r.name region_name,
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

rem ahora comparandola con la pag 270

sELECT c.name cust_name,
 big_custs.cust_sales cust_sales, r.name region_name,
 100 * ROUND(big_custs.cust_sales /
 big_custs.region_sales, 2) percent_of_region
FROM region r, customer c,
 (SELECT cust_sales.cust_nbr cust_nbr, cust_sales.region_id region_id,
 cust_sales.tot_sales cust_sales,
 region_sales.tot_sales region_sales
 FROM
 (SELECT o.region_id region_id, SUM(o.tot_sales) tot_sales
 FROM orders o
 WHERE o.year = 2001
 GROUP BY o.region_id) region_sales,
 (SELECT o.cust_nbr cust_nbr, o.region_id region_id,
 SUM(o.tot_sales) tot_sales
 FROM orders o
 WHERE o.year = 2001
 GROUP BY o.cust_nbr, o.region_id) cust_sales
 WHERE cust_sales.region_id = region_sales.region_id
 AND cust_sales.tot_sales > (region_sales.tot_sales * .2)) big_custs
WHERE big_custs.cust_nbr = c.cust_nbr
 AND big_custs.region_id = r.region_id;
 
 
 rem Ranking Functions
 
 rem 
 SELECT region_id, cust_nbr, SUM(tot_sales) cust_sales
	FROM orders
	WHERE year = 2001
	GROUP BY region_id, cust_nbr
	ORDER BY region_id, cust_nbr;

rem To illustrate the differences, we generate rankings 
rem for each customer according to
rem their total yearly sales. 
rem Here is the query to 
rem generate the sales data 
rem for the year 2001:

SELECT region_id, cust_nbr, SUM(tot_sales) cust_sales
	FROM orders
	WHERE year = 2001
	GROUP BY region_id, cust_nbr
	ORDER BY region_id, cust_nbr;
	

rem 
rem Notice that three of the customers
rem  (2, 23, and 24) have the same 
rem value for total sales
rem ($1,224,992). 
rem In the next query, we will add 
rem three function calls to generate 
rem rankings for each customer across 
rem all regions, and we will order 
rem the result set by the
rem ROW_NUMBER function to make 
rem the difference in 
rem rankings easier to observe:
set numwidth 9
col region_id format 999
col cust_nbr  format 999
col cust_sales format $9,999,999
col sales_rank format 999
col s_dense_rank format 999
col sales_number format 999 
SELECT region_id, cust_nbr,
 SUM(tot_sales) cust_sales,
 RANK( ) OVER (ORDER BY SUM(tot_sales) DESC) sales_rank,
 DENSE_RANK( ) OVER (ORDER BY SUM(tot_sales) DESC) s_dense_rank,
 ROW_NUMBER( ) OVER (ORDER BY SUM(tot_sales) DESC) sales_number
FROM orders
WHERE year = 2001
GROUP BY region_id, cust_nbr
ORDER BY 6;

rem filtrar los cust 2, 23, 24
set numwidth 9
col region_id format 999
col cust_nbr  format 999
col cust_sales format $9,999,999
col sales_rank format 999
col s_dense_rank format 999
col sales_number format 999 
SELECT region_id, cust_nbr,
 SUM(tot_sales) cust_sales,
 RANK( ) OVER (ORDER BY SUM(tot_sales) DESC) sales_rank,
 DENSE_RANK( ) OVER (ORDER BY SUM(tot_sales) DESC) s_dense_rank,
 ROW_NUMBER( ) OVER (ORDER BY SUM(tot_sales) DESC) sales_number
FROM orders
WHERE year = 2001 and cust_nbr in (2,23,24)
GROUP BY region_id, cust_nbr
ORDER BY 6;

/*
The difference between the RANK and DENSE_RANK functions manifests itself in the ranking assigned to the next-lowest sales total; the RANK
function leaves a gap in the ranking sequence and assigns a rank of 15 to customer
number 30, while the DENSE_RANK function continues the sequence with a ranking
of 13
*/

SELECT region_id, cust_nbr, SUM(tot_sales) cust_sales,
 RANK( ) OVER (PARTITION BY region_id
 ORDER BY SUM(tot_sales) DESC) sales_rank,
 DENSE_RANK( ) OVER (PARTITION BY region_id
 ORDER BY SUM(tot_sales) DESC) sales_dense_rank,
 ROW_NUMBER( ) OVER (PARTITION BY region_id
 ORDER BY SUM(tot_sales) DESC) sales_number
FROM orders
WHERE year = 2001
GROUP BY region_id, cust_nbr
ORDER BY 1,6;
 
rem filtremos la region   9

SELECT region_id, cust_nbr, SUM(tot_sales) cust_sales,
 RANK( ) OVER (PARTITION BY region_id
 ORDER BY SUM(tot_sales) DESC) sales_rank,
 DENSE_RANK( ) OVER (PARTITION BY region_id
 ORDER BY SUM(tot_sales) DESC) sales_dense_rank,
 ROW_NUMBER( ) OVER (PARTITION BY region_id
 ORDER BY SUM(tot_sales) DESC) sales_number
FROM orders
WHERE year = 2001 and region_id = 9
GROUP BY region_id, cust_nbr
ORDER BY 1,6;