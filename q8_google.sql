-- subcription table start and end date, user_id too
-- True or False output if overlapping

with 
overlapping as 
	(select s1.user_id as first_user ,s2.user_id AS second_user, s1.start_date,s1.end_date,s2.start_date,s2.end_date 
      from subscriptions s1
      CROSS join subscriptions s2 
      WHERE s1.user_id != s2.user_id
      and ((s2.start_date<s1.end_date AND s2.start_date > s1.start_date) OR (s2.end_date < s1.end_date AND s2.end_date>s1.start_date))
      ), 
distinct_users AS
    (select first_user  From overlapping
    union 
    select second_user from overlapping
     )

Select user_id,case when user_id = first_user then true else false end AS overlap
FROm subscriptions 
LEFT JOIN distinct_users
ON user_id = first_user