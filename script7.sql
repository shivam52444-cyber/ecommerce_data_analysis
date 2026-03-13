WITH prop3 AS (
    SELECT 
        ooid.price as price1,
        ooid.seller_id as  id1,
        osd.seller_state as state1, 
        osd.seller_city as city1
FROM ecommerce.olist_order_items_dataset ooid
LEFT JOIN ecommerce.olist_sellers_dataset osd 
ON ooid.seller_id  = osd.seller_id 
)
select prop3.state1,prop3.city1 , sum(prop3.price1)
from prop3 
group by prop3.state1, prop3.city1  
order by sum(prop3.price1) desc;


WITH prop3 AS (
    SELECT 
        ooid.price as price1,
        ooid.seller_id as  id1,
        osd.seller_state as state1, 
        osd.seller_city as city1
FROM ecommerce.olist_order_items_dataset ooid
LEFT JOIN ecommerce.olist_sellers_dataset osd 
ON ooid.seller_id  = osd.seller_id 
)
select prop3.