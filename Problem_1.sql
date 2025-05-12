-- PROBLEM 1)  MINIMIZING THE PRODUCT WASTAGES AND STOCK OUTAGES.

select * from products;

select * from inventory;


SELECT 
    *
FROM
    inventory i
        JOIN
    products p ON p.product_id = i.product_id;

SELECT 
    i.date,
    i.product_id,
    p.product_name,
    p.category,
    p.brand,
    p.shelf_life_days,
    i.stock_received,
    i.damaged_stock,
    p.min_stock_level,
    p.max_stock_level
FROM
    inventory i
        JOIN
    products p ON p.product_id = i.product_id
WHERE
    i.stock_received != 0;
    
-- CALCULATING AMOUNT AND PERCENTAGE OF DAMAGED STOCK RECIEVED IN INVENTORY.
WITH products_data AS (
SELECT 
    i.date,
    i.product_id,
    p.product_name,
    p.category,
    p.brand,
    p.shelf_life_days,
    i.stock_received,
    i.damaged_stock,
    p.min_stock_level,
    p.max_stock_level
FROM
    inventory i
        JOIN
    products p ON p.product_id = i.product_id where i.stock_received != 0)    
SELECT 
    product_id,
    product_name,
    category,
    brand,
    SUM(stock_received) AS total_stock_received,
    SUM(damaged_stock) AS total_damaged_stock,
    ROUND(((sum(damaged_stock) / sum(stock_received)) * 100),
            2) AS damaged_percentage
FROM
    products_data
GROUP BY product_id , product_name , category , brand
HAVING damaged_percentage >10
ORDER BY damaged_percentage DESC;

-- CALCULATING WASTAGES BASED ON PRODUCTS SHELF LIFE

SELECT 
    product_id, product_name, category, shelf_life_days
FROM
    products;

SELECT 
    category, ROUND(AVG(shelf_life_days)) AS avg_shelf_life
FROM
    products
GROUP BY category
ORDER BY avg_shelf_life ASC;

