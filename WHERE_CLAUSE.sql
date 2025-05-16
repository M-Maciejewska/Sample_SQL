SELECT 
	shipping_mode
	,count(order_id) 					AS order_count		
	,count(DISTINCT customer_id)		AS nr_of_unique_customer
FROM orders
WHERE 
	order_id <> 384
GROUP BY 1
ORDER BY shipping_mode DESC;
