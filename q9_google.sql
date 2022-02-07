-- output: 2 students with closest test scores & score diff
-- if many, name combination higher in alphabet
-- scores table: id, student, score

-- compare each combination
-- closest combination

select one_student, other_student, score_diff
FROM(
SELECT s1.student as student1, s2.student as student2, s1.score, s2.score, abs(s1.score-s2.score) as diff,
min(abs(a.score - b.score)) over(partition by "a") as min_score
FROM scores as s1
INNER JOIN scores as s2 on s1.student != s2.student
ORDER BY diff asc
) boo
where score_diff = min_score




select
    s1.student as one_student
    , s2.student as other_student
    , abs(s1.score - s2.score) as score_diff
from scores s1
cross join scores s2
where s1.id < s2.id
order by 3,1,2
limit 1





select student1, student2, diff
FROM(
SELECT s1.student as student1, s2.student as student2, s1.score, s2.score, abs(s1.score-s2.score) as diff,
min(abs(s1.score - s2.score)) over(partition by "a") as min_score
FROM scores as s1
INNER JOIN scores as s2 on s1.student != s2.student
ORDER BY diff asc
) boo
where diff = min_score






select one_student, other_student, score_diff
from (
select a.student one_student, b.student other_student,
        abs(a.score - b.score) as score_diff,
        min(abs(a.score - b.score)) over(partition by "a") as min_score
from scores a, scores b
where a.id < b.id
order by a.student, b.student, abs(a.score - b.score)
) a
where score_diff = min_score