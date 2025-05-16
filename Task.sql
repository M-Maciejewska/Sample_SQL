/* Write three separate queries, in the following order, to accomplish the tasks listed below:
Insert a new project into the projects table with the following details:

Business ID (business_id): 2
Project type (project_type): 'Software'
Payment sum (payment): 150000
Status (status): 'WAITING'
No dependence on any other project (depends_on_project_id): NULL
Priority (priority): 'LOW'
Update the status column of the project entry in the projects table with the project ID (id) of 4 to be 'IN PROGRESS'.
Return all data from the projects table, ensuring that rows with NULL in the depends_on_project_id column explicitly indicate 'N/A' instead.
The returned results should consist of the following seven columns, in this exact order:

id
business_id
project_type
payment
status
depends_on_project_id — Replace NULL values with 'N/A'
priority

The returned results should also be ordered by the id column in ascending order. */

-- first query
INSERT INTO 
    projects (
            business_id
            ,project_type
            ,payment
            ,status
            ,depends_on_project_id
            ,priority
             )
    VALUES (
        2
        ,'Software'
        ,150000
        ,'WAITING'
        ,NULL
        ,'LOW'
            );

-- second query
UPDATE projects 
SET 
    status = 'IN PROGRESS' 
WHERE 
    id = 4;

-- third query
SELECT 
    id
    ,business_id
    ,project_type
    ,payment
    ,status
    ,COALESCE(depends_on_project_id, 'N/A') AS depends_on_project_id, 
    priority
FROM projects
ORDER BY id ASC;
