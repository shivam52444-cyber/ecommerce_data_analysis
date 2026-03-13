select count(distinct osd.seller_zip_code_prefix    ) as uniquezip
from ecommerce.olist_sellers_dataset osd  ;

select count(distinct osd.seller_city     ) as uniquecity
from ecommerce.olist_sellers_dataset osd  ;

select count(distinct osd.seller_state     ) as uniquestate
from ecommerce.olist_sellers_dataset osd  ;

select count(distinct osd.seller_id     ) as uniqueseller
from ecommerce.olist_sellers_dataset osd  ;

SELECT
    osd.seller_state,
    COUNT(DISTINCT osd.seller_id) AS unique_seller,
    COUNT(DISTINCT osd.seller_city) AS unique_city,
    COUNT(DISTINCT osd.seller_zip_code_prefix) AS unique_zip
FROM ecommerce.olist_sellers_dataset osd
GROUP BY osd.seller_state
ORDER BY COUNT(osd.seller_id) DESC;


SELECT
    osd.seller_state,
    COUNT(DISTINCT osd.seller_id) AS unique_seller
FROM ecommerce.olist_sellers_dataset osd
GROUP BY osd.seller_state
ORDER BY COUNT(osd.seller_id) desc
limit 5;

SELECT
    osd.seller_zip_code_prefix ,
    COUNT(DISTINCT osd.seller_id) AS unique_seller
FROM ecommerce.olist_sellers_dataset osd
GROUP BY osd.seller_zip_code_prefix 
ORDER BY COUNT(osd.seller_id) desc
limit 5;

SELECT
    osd.seller_city ,
    COUNT(DISTINCT osd.seller_id) AS unique_seller
FROM ecommerce.olist_sellers_dataset osd
GROUP BY osd.seller_city 
ORDER BY COUNT(osd.seller_id) desc
limit 5;