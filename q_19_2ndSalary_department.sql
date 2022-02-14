
-- 2nd highest salary
-- engineering dep
-- if 2, next salary



select 
em.salary
from employees as em 
inner join departments as dp on em.department_id=dp.id 
where dp.name = 'Engineering'
group by em.salary
having count(distinct em.id) = 1
order by salary desc 
limit 1 offset 1


-- other way to solve it

select salary
from(

select 
department_id,
salary,
dense_rank() over (partition by department_id order by salary desc) as rank_num
from employees as em 
inner join departments as dp on em.department_id=dp.id 
where dp.name = 'Engineering')
as foo

where rank_num=2