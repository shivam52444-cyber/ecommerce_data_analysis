with prop as(
select ooid.order_id ,ooid.product_id ,ooid.price ,ooid.seller_id ,ood.order_status 
from ecommerce.olist_order_items_dataset ooid left join ecommerce.olist_orders_dataset ood 
on ooid.order_id = ood.order_id
)
select sum(prop.price  ), prop.order_status
from prop 
group by prop.order_status
order by sum(prop.price) desc ;

select * from ecommerce.olist_order_items_dataset ooid 
where ooid.order_id = '' or ooid.order_id is null ; 

select * from ecommerce.olist_orders_dataset ood 
where ood.order_id='' or ood.order_id is null; 

WITH prop AS (
    SELECT 
        ooid.order_id,
        ooid.product_id,
        ooid.price,
        ooid.seller_id,
        ood.order_status
    FROM ecommerce.olist_order_items_dataset ooid
    LEFT JOIN ecommerce.olist_orders_dataset ood
    ON ooid.order_id = ood.order_id
),
prop2 AS (
    SELECT 
        opd.product_category_name,
        prop.price,
        prop.product_id
    FROM prop
    LEFT JOIN ecommerce.olist_products_dataset opd
    ON prop.product_id = opd.product_id
)
SELECT 
    prop2.product_category_name,
    SUM(prop2.price) AS total_revenue
FROM prop2
GROUP BY prop2.product_category_name
ORDER BY SUM(prop2.price);