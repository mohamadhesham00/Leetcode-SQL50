-- we sum the number of confirmed / number of total and round them to two decimal places.
select S.user_id, 
    round(
        sum(iif (action = 'confirmed', 1.00, 0.00)) / 
        (iif (count(action) = 0, 1, count(action)))
    , 2) as confirmation_rate 
from Signups as S
left join Confirmations as C
on S.user_id = C.user_id
group by S.user_id