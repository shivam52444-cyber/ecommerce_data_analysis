select  count(*)
from olist_orders_dataset ood ;

select count(distinct ood.order_id )
from olist_orders_dataset ood 

select count(distinct ood.customer_id  )
from olist_orders_dataset ood 

select count( ood.order_status   )
from olist_orders_dataset ood ;

select distinct ood.order_status 
from olist_orders_dataset ood ;

select count(ood.order_id ),ood.order_status 
from olist_orders_dataset ood 
group by ood.order_status 
order by count (ood.order_id) desc;

select count(ood.order_id )
from olist_orders_dataset ood 
where ood.order_delivered_carrier_date is null ;

select count(ood.order_id )
from olist_orders_dataset ood 
where ood.order_delivered_customer_date  is null ;

select count(ood.order_id )
from olist_orders_dataset ood 
where ood.order_delivered_carrier_date = '' ;

select count(ood.order_id )
from olist_orders_dataset ood 
where ood.order_delivered_customer_date  = '' ;

select count(ood.order_id ),ood.order_status 
from olist_orders_dataset ood 
where ood.order_delivered_carrier_date ='' and ood.order_delivered_customer_date =''
group by ood.order_status 
order by count(ood.order_id) desc;

select count(ood.order_id )
from olist_orders_dataset ood 
where ood.order_approved_at   = '' ;

select count(ood.order_id )
from olist_orders_dataset ood 
where ood.order_purchase_timestamp   = '' ;


SELECT 
    ood.order_status,
    AVG(
        CAST(ood.order_approved_at AS TIMESTAMP) 
        - 
        CAST(ood.order_purchase_timestamp AS TIMESTAMP)
    ) AS avg_approval_time
FROM olist_orders_dataset ood
where ood.order_approved_at != ''
GROUP BY ood.order_status
order by avg_approval_time desc;


SELECT 
    ood.order_status,
    AVG(
        CAST(ood.order_delivered_customer_date  AS TIMESTAMP) 
        - 
        CAST(ood.order_delivered_carrier_date  AS TIMESTAMP)
    ) AS avg_cartocust_time
FROM olist_orders_dataset ood
where ood.order_delivered_carrier_date != '' and ood.order_delivered_customer_date != ''
GROUP BY ood.order_status;

SELECT 
    ood.order_status,
    AVG(
        CAST(ood.order_estimated_delivery_date  AS TIMESTAMP) 
        - 
        CAST(ood.order_purchase_timestamp AS TIMESTAMP)
    ) AS avg_estimated_time
    FROM olist_orders_dataset ood
where ood.order_delivered_carrier_date != '' and ood.order_delivered_customer_date != ''
GROUP BY ood.order_status;


SELECT 
    ood.order_status,
    AVG(
        CAST(ood.order_delivered_customer_date   AS TIMESTAMP) 
        - 
        CAST(ood.order_purchase_timestamp AS TIMESTAMP)
    ) AS avg_estimated_time
    FROM olist_orders_dataset ood
where ood.order_delivered_carrier_date != '' and ood.order_delivered_customer_date != ''
GROUP BY ood.order_status;

