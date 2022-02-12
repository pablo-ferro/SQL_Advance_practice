-- table users, comments
-- histogram  no comments per user Jan 2020



with commenttotal_users as(

Select us.id, coalesce(count(com.user_id),0) as comment_user
from users as us 
left join comments as com on us.id=com.user_id
where year(com.created_at)='2020' and month(com.created_at)='01'
group by us.id
)

Select distinct
comment_user,
count(us.id) as frequency
from commenttotal_users
group by comment_user
order by comment_user