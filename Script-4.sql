select count(*) as total, count(ocd.customer_id )as no_Of_customer, count(distinct ocd.customer_id ) as unique_customer,
count(ocd.customer_unique_id ) as unique, count(distinct ocd.customer_state ) as unique_state,
count(distinct ocd.customer_zip_code_prefix ) as unique_zip,
count(distinct ocd.customer_city ) as unique_city
from olist_customers_dataset ocd ;

select count(distinct ocd.customer_unique_id ), ocd.customer_state   
from olist_customers_dataset ocd 
where ocd.customer_state  is not null or ocd.customer_state !=''
group by ocd.customer_state  
order by count(ocd.customer_unique_id ) desc 
limit 5;

select count(distinct ocd.customer_unique_id ) as unique_customer , ocd.customer_city    
from olist_customers_dataset ocd 
where ocd.customer_city   is not null or ocd.customer_city  !=''
group by ocd.customer_city  
order by count(ocd.customer_unique_id ) desc 
limit 5;

select count(distinct ocd.customer_unique_id ), ocd.customer_zip_code_prefix    
from olist_customers_dataset ocd 
where ocd.customer_zip_code_prefix   is not null 
group by ocd.customer_zip_code_prefix   
order by count(ocd.customer_unique_id ) desc 
limit 5;

