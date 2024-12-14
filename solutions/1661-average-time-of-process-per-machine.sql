-- This is not considerd as a good solution but this is what came in my mind when I tried to solve the problem
select distinct A.machine_id, round((S1.SumOfEnd - S0.SumOfStart) / S0.num_of_processes , 3) as processing_time 
from Activity as A
left join (
    select machine_id, count(process_id) as num_of_processes, sum(timestamp) as SumOfStart
    from Activity
    where activity_type = 'start'
    group by machine_id ) as S0
on A.machine_id = S0.machine_id
left join (
    select machine_id, sum(timestamp) as sumOfEnd
    from Activity
    where activity_type = 'end'
    group by machine_id ) as S1
on A.machine_id = S1.machine_id
    
-- This is the best solution I've found but it's not mine
SELECT 
    machine_id,
    ROUND(
        SUM
        (
        CASE WHEN activity_type='start'
            THEN timestamp*-1 
        ELSE timestamp END
        )
    / (SELECT COUNT(DISTINCT process_id)),3) AS processing_time
FROM 
    Activity
GROUP BY machine_id

-- Another good solution but it's not mine also 
SELECT *
FROM Activity a, 
     Activity b
WHERE 
    a.machine_id = b.machine_id
AND 
    a.process_id = b.process_id
AND 
    a.activity_type = 'start'
AND 
    b.activity_type = 'end'