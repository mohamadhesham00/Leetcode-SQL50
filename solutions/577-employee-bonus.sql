select name, bonus
from Employee as E
left join Bonus as B
on E.empId = B.empId
where isnull(bonus, 0) < 1000