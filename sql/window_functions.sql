-- Rank products by total movement per warehouse

SELECT *
FROM (
    SELECT 
        w.warehouse_name,
        p.product_name,
        SUM(sm.quantity) AS total_movement,
        RANK() OVER (
            PARTITION BY w.warehouse_name
            ORDER BY SUM(sm.quantity) DESC
        ) AS rank_position
    FROM stock_movements sm
    JOIN products p ON sm.product_id = p.product_id
    JOIN warehouses w ON sm.warehouse_id = w.warehouse_id
    GROUP BY w.warehouse_name, p.product_name
) ranked
WHERE rank_position <= 5;



-- Running total of monthly movement

SELECT 
    month,
    monthly_total,
    SUM(monthly_total) OVER (
        ORDER BY month
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM (
    SELECT 
        DATE_TRUNC('month', movement_date) AS month,
        SUM(quantity) AS monthly_total
    FROM stock_movements
    GROUP BY DATE_TRUNC('month', movement_date)
) monthly_data
ORDER BY month;


-- Month-over-month change in inventory movement

WITH monthly_data AS (
    SELECT 
        DATE_TRUNC('month', movement_date) AS month,
        SUM(quantity) AS total_quantity
    FROM stock_movements
    GROUP BY DATE_TRUNC('month', movement_date)
)

SELECT 
    month,
    total_quantity,
    LAG(total_quantity) OVER (ORDER BY month) AS previous_month,
    total_quantity - LAG(total_quantity) OVER (ORDER BY month) AS change
FROM monthly_data
ORDER BY month;


-- Segment products into quartiles based on total movement

SELECT 
    product_id,
    total_quantity,
    NTILE(4) OVER (ORDER BY total_quantity DESC) AS movement_quartile
FROM (
    SELECT 
        product_id,
        SUM(quantity) AS total_quantity
    FROM stock_movements
    GROUP BY product_id
) product_totals;

