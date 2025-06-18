# Write your MySQL query statement below
WITH fetch_id AS (
    SELECT managerId FROM Employee
    GROUP BY managerId
    HAVING COUNT(id) > 4
)
SELECT name FROM Employee 
WHERE id IN (SELECT managerId FROM fetch_id);