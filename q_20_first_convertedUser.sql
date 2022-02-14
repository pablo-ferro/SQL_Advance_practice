
-- attribution, users_sessions table


with converted_users as (
select distinct user_id
from attribution as at 
inner join users_sessions as us on at.session_id=us.session_id
where at.conversion=TRUE
)

select
us.user_id,
us. channel
from 
(
select
u.user_id,
row_number() over (partition by user_id order by created_at) as touch_order,
channel
from 
users_sessions as us
inner join converted_users as conv on at.user_id=conv.user_id
left join attribution as at on at.session_id=conv.session_id
) t 
where touch_order=1