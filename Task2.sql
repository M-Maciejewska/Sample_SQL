/* Write a single query that accomplishes the following:
Returns the details and bonus amount of all employees in the employees table, excluding the one with an employee ID (id) of 1, based on their tenure (years_in_company) with the company.
The returned table should include the following four columns, in this specific order:

Employee ID (id)
First Name (firstname)
Last Name (lastname)
Bonus Amount (bonus_amount) - should be an INTEGER (no currency symbol included)
Bonus amounts (bonus_amount) for employees should be calculated as follows:
Employees with more than 5 years of service (i.e., more than 5 years, not including 5 years) will receive $5000 for each year (years_in_company) they have worked.
Employees with 3 to 5 years of service (i.e., including both 3 and 5 years) will receive $3000 for each year (years_in_company) they have worked.
Employees with less than 3 years of service (i.e., less than 3 years, not including 3 years) will receive $1000 for each year (years_in_company) they have worked.
The returned table must be ordered in ascending order based on employee IDs (id). */

SELECT
    id,
    firstname,
    lastname,
    CASE 
        WHEN years_in_company > 5                 THEN years_in_company * 5000
        WHEN years_in_company BETWEEN 3 AND 5     THEN years_in_company * 3000
                                                  ELSE years_in_company * 1000
    END AS bonus_amount
FROM 
    employees
WHERE
    id != 1
ORDER BY
    id ASC;
