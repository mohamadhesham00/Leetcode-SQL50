select W0.id as Id  
from Weather as W0
left join Weather as W1
on W0.recordDate = DATEADD(DAY, 1, W1.recordDate)
where W1.temperature is not null and W0.temperature > W1.temperature