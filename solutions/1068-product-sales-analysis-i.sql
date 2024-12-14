select product_name, year, price
from Sales as S 
left join Product as P
on P.product_id = S.Product_id