# 1907. Count Salary Categories

with cte as
(select
    account_id,
    case
        when income < 20000 then 'Low Salary'
        when income between 20000 and 50000 then 'Average Salary'
        else 'High Salary'
    end as category
from Accounts
),
cte_c as
(select 'Low Salary' as category
 union
 select 'Average Salary' as category
 union
 select 'High Salary' as category
)

select cte_c.category, count(account_id) as accounts_count
from cte_c
left join cte
on cte_c.category = cte.category
group by cte_c.category