-- table transaction, table products
-- return p_id, p_price, avg transaction price of p with price > avg trans price

-- first calculate avg trans price, then use this value in the having



SELECT 
product_id, 
price, 
avg(price*quantity), 
avg_total,
case when avg(price*quantity)>avg_total then 1 else 0 end as resulted
FROM transactions as tr
inner join products as pd on tr.product_id = pd.id
join (SELECT avg(price*quantity) as avg_total
FROM transactions as tr
inner join products as pd on tr.product_id = pd.id) as avg_pri
GROUP BY product_id, price