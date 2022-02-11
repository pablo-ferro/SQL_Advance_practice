-- table events with phases of post writing
-- action: enter, submit, canceled
-- post success rate for each day in January 2020



SELECT 
date_id as date_id,
(count_submit/count_enter)*100 as post_success_rate,
sum(count_cancel),sum(count_submit),sum(count_enter)
FROM
(
SELECT
user_id,
cast(created_at as date) as date_id,
case when action='post_enter' then 1 else 0 end as count_enter,
case when action='post_cancel' then 1 else 0 end as count_cancel,
case when action='post_submit' then 1 else 0 end as count_submit
FROM events
WHERE month(created_at)=1 and year(created_at)=2020
group by user_id, created_at
having sum(case when action='post_enter' then 1 else 0 end)>0
) as postlist
group by date_id