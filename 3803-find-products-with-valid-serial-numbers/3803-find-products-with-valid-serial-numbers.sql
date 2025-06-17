# Write your MySQL query statement below
SELECT product_id, product_name,description
FROM products
WHERE description REGEXP '(^|[^A-Za-z])SN[0-9]{4}-[0-9]{4}( |$)'
ORDER BY product_id