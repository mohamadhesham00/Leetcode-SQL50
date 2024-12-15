select E0.name
from Employee as E0
inner join Employee as E1
on E0.id = E1.managerId 
group by E0.id, E0.name
having count(E1.managerId) >= 5