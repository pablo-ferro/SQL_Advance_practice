-- table transactions, users, products
-- Avg order value by gender
-- round two decimals



SELECT
sex,
round(avg(order_value),2) as avg_value

FROM
(

SELECT 
user_id,
sex,
quantity*price as order_value
FROM transactions as tr 
INNER join products as pr on tr.product_id=pr.id 
LEFT join users as usd on tr.user_id=usd.id 
GROUP BY user_id, sex

) as orderta
Group by sex