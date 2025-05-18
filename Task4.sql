/* Write a query that changes all missing values ( NULL ) 
to 'WAITING', then craft a second query to return all columns 
of all rows that have the new status. Order them ascending, by the column id */

UPDATE 
	projects 
SET 
	status = 'WAITING' 
WHERE 
	status IS NULL;

SELECT * 
FROM projects 
WHERE 
	status = 'WAITING' 
ORDER BY 
	id ASC;
