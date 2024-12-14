select unique_id, name
from Employees as E
left outer join EmployeeUNI as EU
on E.id = EU.id