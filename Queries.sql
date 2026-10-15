/* -- Top 5 countries by total revenue

SELECT country, SUM(total_amount)
FROM online_retail
GROUP BY country
ORDER BY SUM(total_amount) DESC
LIMIT 5 
*/

/* -- Monthly Sales Trend

SELECT year_month, SUM(total_amount) AS total_revenue
FROM online_retail
GROUP BY year_month
ORDER BY total_revenue 
*/

/* -- Top 5 Customers by Revenue

SELECT customer_id, SUM(total_amount) AS total_revenue
FROM online_retail
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 5;
*/