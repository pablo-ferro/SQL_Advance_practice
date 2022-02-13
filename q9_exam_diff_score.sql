-- output: 2 students with closest test scores & score diff
-- if many, name combination higher in alphabet
-- scores table: id, student, score

-- compare each combination
-- closest combination

select
s1.student as stu1, 
s2.student as stu2, 
s1.score,s2.score,
abs(s1.score-s2.score) as diff_score
from scores s1
cross join scores s2
where (s1.student != s2.student)
order by abs(s1.score-s2.score) asc