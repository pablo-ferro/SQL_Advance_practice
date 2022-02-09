-- table transactions, products
-- month over month change in revenue in 2019
-- round 2 decimals


with reveL as
(
select month(created_at) as monthdate,
quantity*price as revenue
FROM transactions as tr 
INNER JOIN products as pr on tr.product_id = pr.id
where year(created_at)='2019'
group by monthdate
) 

select
reveC.monthdate,
sum(reveC.revenue) as revenue,
sum(reveC.revenue) over (order by reveC.monthdate rows between 2 preceding and current row) as Test_Rolling_2mom,
sum(reveL.revenue) as LM_revenue,
round(sum(reveC.revenue)-sum(reveL.revenue) /sum(reveC.revenue),2) as reveGrowth

FROM
(
select month(created_at) as monthdate, quantity*price as revenue
FROM transactions as tr 
INNER JOIN products as pr on tr.product_id = pr.id
where year(created_at)='2019'
group by monthdate
) as reveC
INNER JOIN reveL on reveC.monthdate=reveL.monthdate+1

group by monthdate
order by monthdate



-- OUTPUT

revenue	Test_Rolling_2mom	LM_revenue	reveGrowth
2	18.48	18.48	132.81	11.29
3	148.14000000000001	166.62	18.48	148.02
4	11.38	178	148.14000000000001	-1.64
