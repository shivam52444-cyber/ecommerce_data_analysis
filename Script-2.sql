select count(distinct opd2.product_id ) as unique_id,
count(distinct opd2.product_category_name) as unique_category 
from ecommerce.olist_products_dataset opd2;

SELECT COUNT(*)
FROM ecommerce.olist_products_dataset
WHERE product_category_name = '';






SELECT 
    opd.product_category_name,
    COUNT(DISTINCT opd.product_id) AS unique_products
FROM ecommerce.olist_products_dataset opd
GROUP BY opd.product_category_name
limit 2;

SELECT 
    pcnt.product_category_name_english,
    alpha2.max_weight
FROM (
    SELECT 
        opd.product_category_name,
        MAX(opd.product_weight_g) AS max_weight
    FROM ecommerce.olist_products_dataset opd
    GROUP BY opd.product_category_name
    ORDER BY max_weight DESC
    LIMIT 5
) alpha2
LEFT JOIN product_category_name_translation pcnt
ON alpha2.product_category_name = pcnt.product_category_name;

select distinct opd.product_id 
from ecommerce.olist_products_dataset opd 
where opd.product_category_name is null  ;

SELECT MAX(alpha.unique_products)
FROM (
    SELECT 
        opd.product_category_name,
        COUNT(DISTINCT opd.product_id) AS unique_products
    FROM ecommerce.olist_products_dataset opd
    GROUP BY opd.product_category_name
) alpha
WHERE alpha.product_category_name IS NULL;

SELECT COUNT(*)
FROM ecommerce.olist_products_dataset
WHERE product_category_name IS NULL;