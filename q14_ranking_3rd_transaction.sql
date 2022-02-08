-- table transactions
-- finds 3rd purchase of every user
-- sort by user id asc, if 2 products, lower id

--ranking?

select user_id, product_id, rankdate
FROM(
select 
id, 
user_id, 
product_id, 
rank() over (partition by user_id order by created_at) as rankdate
FROM transactions
group by id, user_id, product_id
) as ranktra

where rankdate=3
order by user_id asc, product_id asc