#1867. Orders With Maximum Quantity Above Average

select order_id from OrdersDetails
group by order_id
having max(quantity) > 
(select max(avg_quantity) as max_avg_quantity from (
select order_id, avg(quantity) as avg_quantity
from OrdersDetails
group by order_id
)a)