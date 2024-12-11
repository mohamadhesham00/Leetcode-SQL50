-- I used ISNULL function for handling null values and convert them to zero 
-- I could have used COALESCE for handling null values
select name
from Customer
where isnull(referee_id, 0) != 2