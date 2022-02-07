-- table users, table neighborhoods
-- neighborhood w zero users


SELECT
ne.name
FROM neighborhoods as ne 
LEFT JOIN users as us on us.neighborhood_id = ne.id
group by ne.name
having count(us.id)=0