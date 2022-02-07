-- top 3 departments
-- 10 or more employees
-- rank according percentage of employees > 100.000$

SELECT
dp.name as department_name
, count(ep.id) as employee_no
, sum(case when ep.salary>100000 then 1 else 0)/count(ep.id) as percentage

FROM departments as dp
INNER JOIN employees as ep on dp.id = ep.department_id

HAVING count(ep.id)>=10
GROUP BY dp.name
ORDER BY percentage DESC 