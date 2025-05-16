/* Write two separate queries in the exact order listed below to achieve the following tasks:
First, write a query that returns the project details along with the details of the employee 
assigned to each project (identified by the current_project_id in the employees table) 
for all projects that are 'IN PROGRESS' (status) in the projects table.
The returned table should have the following six columns, in this specific order:

Project ID (id) - Labeled as project_id
Project Type (project_type)
Project Priority (priority)
Employee ID (id) - Labeled as employee_id
First Name (firstname)
Last Name (lastname)

The returned table should include ongoing projects ('IN PROGRESS') that do not have any employees assigned to them 
(i.e., projects with IDs not present in any employees table current_project_id columns).
The returned table should be ordered by project priority (priority) in the following order: 
'HIGH', 'MEDIUM', then 'LOW' and then any other priorities, if present, are placed after these.
Hint: Use a CASE statement in the ORDER BY clause to map the string values to INTEGER values for sorting purposes.

Then, write a second query that returns the contact details from the employees table for employees 
assigned to projects for all projects that are 'IN PROGRESS' (status) in the projects table.
The returned table should have the following five columns, in this exact order:

Business ID (business_id)
Project ID (id) - Labeled as project_id
Employee Email (email)
First Name (firstname)
Last Name (lastname)

The returned table should not include contact details for projects in the projects table that do not have 
any employees assigned to them (i.e., only include projects with IDs (id) that are present in the employees 
table under the current_project_id column). The returned table should be ordered by business ID (business_id) in ascending order. */

--first query
SELECT 
    p.id AS project_id,
    p.project_type,
    p.priority,
    e.id AS employee_id,
    e.firstname,
    e.lastname
FROM 
    projects p
LEFT JOIN 
    employees e
ON 
    p.id = e.current_project_id
WHERE
    status = 'IN PROGRESS'
ORDER BY
    CASE 
    WHEN p.priority = 'HIGH' THEN 1
    WHEN p.priority = 'MEDIUM' THEN 2
    WHEN p.priority = 'LOW' THEN 3
    ELSE 4
    END ASC;

--second query
SELECT 
    p.business_id,
    p.id AS project_id,
    e.email,
    e.firstname,
    e.lastname
FROM 
    projects p
INNER JOIN
    employees e 
ON 
    p.id = e.current_project_id
WHERE    
    p.status = 'IN PROGRESS'
ORDER BY
    p.business_id ASC;
