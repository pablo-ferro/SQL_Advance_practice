-- users table w datetime
-- cumulative new users
-- reset every month


SELECT 
sum(users_count) over (PARTITION BY month_date ORDER BY datet ROWS UNBOUNDED PRECEDING) as Montly_cumulative,
month_date,
datet

FROM (

SELECT
created_at as datet,
month(created_at) as month_date,
sum(id) as users_count
FROM users
GROUP BY created_at, month(created_at)

) as foo
GROUP BY month_date, datet
ORDER BY month_date, datet ASC







--SUBQUERY:

SELECT
created_at as date,
count(id) as users_count
FROM users
GROUP BY created_at
ORDER BY created_at ASC