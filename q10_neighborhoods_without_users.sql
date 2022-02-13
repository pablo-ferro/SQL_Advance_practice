-- table users, table neighborhoods
-- neighborhood w zero users


select
ne.name neighborhoodname,
coalesce(sum(us.id),0) as nousers
from
neighborhoods as ne 
left join users as us on ne.id=us.neighborhood_id
group by neighborhoodname
having nousers = 0
order by sum(us.id) asc