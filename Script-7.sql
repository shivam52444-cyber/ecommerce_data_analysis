

WITH prop8 AS (
    SELECT 
        ood.order_purchase_timestamp AS a,
        ood.order_delivered_customer_date AS b,
        ood.order_status AS c,
        ood.customer_id AS d,
        ooid.order_id AS e,
        ooid.price AS f  
    FROM ecommerce.olist_orders_dataset ood
    LEFT JOIN ecommerce.olist_order_items_dataset ooid 
        ON ood.order_id = ooid.order_id
    WHERE NULLIF(ood.order_delivered_customer_date,'') IS NOT NULL
),
prop9 AS (
    SELECT 
        prop8.a,
        prop8.b,
        prop8.c,
        prop8.d,
        prop8.e,
        prop8.f,
        EXTRACT(YEAR FROM NULLIF(prop8.b,'')::timestamp)  AS year,
        EXTRACT(MONTH FROM NULLIF(prop8.b,'')::timestamp) AS month,
        EXTRACT(DAY FROM NULLIF(prop8.b,'')::timestamp)   AS day
    FROM prop8
)
SELECT 
    SUM(prop9.f) AS total_revenue,
    prop9.year,
    prop9.month,
    prop9.day
FROM prop9
GROUP BY prop9.year, prop9.month, prop9.day
ORDER BY prop9.year, prop9.month, prop9.day;


WITH prop5 AS (
    SELECT 
        ood.order_purchase_timestamp AS a,
        ood.order_delivered_customer_date AS b,
        ood.order_status AS c,
        ood.customer_id AS d,
        ooid.order_id AS e,
        ooid.price AS f  
    FROM ecommerce.olist_orders_dataset ood
    LEFT JOIN ecommerce.olist_order_items_dataset ooid 
    ON ood.order_id = ooid.order_id
),
prop6 AS (
    SELECT 
        prop5.a,
        prop5.b,
        prop5.c,
        prop5.d,
        prop5.e,
        prop5.f,
        EXTRACT(YEAR FROM prop5.a::timestamp)  AS year,
        EXTRACT(MONTH FROM prop5.a::timestamp) AS month,
        EXTRACT(DAY FROM prop5.a::timestamp)   AS day
    FROM prop5
)
SELECT 
    SUM(prop6.f) AS total_revenue,
    prop6.year,
    prop6.month,
    prop6.day
FROM prop6
GROUP BY prop6.year, prop6.month, prop6.day
ORDER BY prop6.year, prop6.month, prop6.day;