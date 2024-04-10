--Who are the top 2 most common shift worker types based on
-- posted shifts, and what’s their share of the total posted shifts?

select 
shift_worker_type,
count(distinct shift_id) as total_shifts,
from `shifts`
group by 1
order by count(distinct shift_id) desc
limit 2

select 
sum(case when shift_worker_type in ('carer','nurse') then 1 else 0 end) /
count(distinct shift_id)  as pct_top_two
--83%
from `shifts`