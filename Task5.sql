/* You have to work with both the businesses table:

CREATE TABLE businesses (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name VARCHAR(40),
	employee_count INTEGER,
	industry_type VARCHAR(30),
	email VARCHAR(30)
);
and the projects table:

CREATE TABLE projects (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	business_id INTEGER,
	project_type VARCHAR(20),
	payment INTEGER,
	status VARCHAR(20),
	depends_on_project_id INTEGER,
	priority VARCHAR(10)
);

Your Task:
Write a query to find the highest-paying (payment) project for each business in the businesses table, that is in the 'Information Technology' industry (industry_type).
Retrieve the following columns for each of these projects, in this exact order:

business_id
project_type
payment
status

Finally, sort the output by the business_id column in ascending order. */


SELECT 
	business_id, 
	project_type, 
	payment, 
	status
FROM projects p1
WHERE 
	payment = (
	    SELECT 
		MAX(p2.payment)
	    FROM projects p2
	    WHERE 
		p2.business_id = p1.business_id
		)
AND 
    	business_id IN (
	    SELECT 
		id
	    FROM businesses
	    WHERE 
		industry_type = 'Information Technology'
			)
 ORDER BY 
	business_id ASC;
