-- table bank_transactions, user id, deposit value and date
-- get the total 3 day rolling average for deposits
-- https://www.interviewquery.com/questions/rolling-bank-transactions



SELECT
date_id,
avg(deposit) over (order by date_id rows between 3 preceding and current row) as avg_rolling_3d

FROM
(SELECT 
cast(created_at as date) as date_id,
sum(transaction_value) as deposit
FROM bank_transactions
group by created_at) as deptab

group by date_id
order by date_id desc
