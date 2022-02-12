-- subcription table start and end date, user_id too
-- True or False output if overlapping


with 
overlapping as (
  select su1.user_id as user1, su2.user_id as user2,
  su1.start_date,su2.start_date,su1.end_date,su2.end_date
  from subscriptions as su1
  cross join subscriptions as su2
  where (su1.user_id != su2.user_id)
  and (
    (su1.start_date<su2.end_date AND su1.start_date>su2.start_date)
    OR
    (su1.end_date<su2.end_date AND su1.end_date>su2.start_date)
    )
  ),

distinct_users as(
select user1 as user1 from overlapping
union
select user2 as user1 from overlapping
)

select
user_id,
case when user_id = user1 then True else False end as overlap
from subscriptions
left join distinct_users on user_id=user1

