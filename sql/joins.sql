-- INNER JOIN: Retrieve valid stock movements with product and warehouse details

SELECT 
    sm.movement_id,
    p.product_name,
    w.warehouse_name,
    sm.movement_type,
    sm.quantity,
    sm.movement_date
FROM stock_movements sm
INNER JOIN products p 
    ON sm.product_id = p.product_id
INNER JOIN warehouses w 
    ON sm.warehouse_id = w.warehouse_id;


-- LEFT JOIN: Identify warehouses with no stock movements

SELECT 
    w.warehouse_id,
    w.warehouse_name
FROM warehouses w
LEFT JOIN stock_movements sm 
    ON w.warehouse_id = sm.warehouse_id
WHERE sm.movement_id IS NULL;


-- RIGHT JOIN: Detect products with no movement activity

SELECT 
    p.product_id,
    p.product_name
FROM stock_movements sm
RIGHT JOIN products p 
    ON sm.product_id = p.product_id
WHERE sm.movement_id IS NULL;


-- FULL OUTER JOIN: Show all products and warehouses even without activity

SELECT 
    w.warehouse_name,
    p.product_name
FROM warehouses w
FULL OUTER JOIN stock_movements sm 
    ON w.warehouse_id = sm.warehouse_id
FULL OUTER JOIN products p 
    ON sm.product_id = p.product_id;


-- SELF JOIN: Compare warehouses within the same region

SELECT 
    w1.warehouse_name AS warehouse_1,
    w2.warehouse_name AS warehouse_2,
    w1.region
FROM warehouses w1
JOIN warehouses w2
    ON w1.region = w2.region
    AND w1.warehouse_id <> w2.warehouse_id;
