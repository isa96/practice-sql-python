# 1875. Group Employees of the Same Salary

select *, dense_rank()over(order by salary) as team_id
from Employees
where salary not in (select salary from employees group by salary having count(*) = 1)
order by team_id, employee_id