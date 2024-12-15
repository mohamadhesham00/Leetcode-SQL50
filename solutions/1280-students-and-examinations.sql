select St.*, Sb.subject_name, count(E.subject_name) as attended_exams 
from Subjects as Sb
cross join Students as St
left join Examinations as E
on St.student_id = E.student_id and Sb.subject_name = E.Subject_name
group by St.student_id, St.student_name, Sb.subject_name
order by St.student_id, Sb.subject_name