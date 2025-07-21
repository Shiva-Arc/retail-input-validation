-- =========================================
-- Basic to Intermediate SQL Interview Questions
-- =========================================

-- 1. Combining Tables
-- Retrieve full name of each employee along with their department name.
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    d.department_name
FROM 
    employees e
INNER JOIN 
    departments d ON e.department_id = d.department_id;

-- 2. Retrieving Filtered Data
-- List all employees who earn more than ₹75,000 and were hired in the last 2 years.
SELECT 
    *
FROM 
    employees
WHERE 
    salary > 75000
    AND hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- 3. Using Aggregate Functions
-- Return each department and the number of employees in it.
SELECT 
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM 
    departments d
LEFT JOIN 
    employees e ON d.department_id = e.department_id
GROUP BY 
    d.department_name;

-- 4. Mass Update
-- Give everyone in the Sales department a 10% raise.
UPDATE 
    employees
SET 
    salary = salary * 1.10
WHERE 
    department_id = (
        SELECT department_id FROM departments WHERE department_name = 'Sales'
    );

-- 5. JOIN with Conditions
-- Combine employees with performance_reviews from last year.
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    pr.review_date,
    pr.rating
FROM 
    employees e
INNER JOIN 
    performance_reviews pr ON e.employee_id = pr.employee_id
WHERE 
    pr.review_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- 6. Data Cleanup
-- Replace all NULL department entries with 'Unassigned'.
UPDATE 
    employees
SET 
    department_id = (
        SELECT department_id FROM departments WHERE department_name = 'Unassigned'
    )
WHERE 
    department_id IS NULL;

-- 7. Nested Queries
-- Find employees who earn more than the average salary.
SELECT 
    * 
FROM 
    employees
WHERE 
    salary > (
        SELECT AVG(salary) FROM employees
    );

-- 8. Delete Based on Condition
-- Remove all employees whose salary is less than ₹30,000.
DELETE FROM 
    employees
WHERE 
    salary < 30000;

-- 9. Using CASE in SQL
-- Tag each employee as 'High Earner' or 'Regular'.
SELECT 
    employee_id,
    first_name,
    last_name,
    salary,
    CASE 
        WHEN salary > 90000 THEN 'High Earner'
        ELSE 'Regular'
    END AS salary_category
FROM 
    employees;

-- 10. Indexing for Performance
-- Index suggestions for queries on department and salary.
CREATE INDEX idx_department_salary ON employees(department_id, salary);
