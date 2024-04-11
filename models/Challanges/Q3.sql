-- Which are the top 3 regions by shift fill rate (shifts with approved
-- shift application / total shifts) for shifts posted with worker type
-- equal to carer ?

select 
locs.location_region_title, 
--location_region_group_title,
sum(case when shift_application_status = 'Approved' then 1 else 0 end)
    /
count(distinct apps.shift_id) 
as Shift_fill_rate
from {{ref('stg_shift_applications')}} apps  
left join 
  {{ref('int_shifts')}}shifts on apps.shift_id = shifts.shift_id
left join
  {{ref('stg_locations')}}  locs on shifts.unit_id = locs.unit_id
where 
  shifts.shift_worker_type = 'carer'
--  and shift_cancelled <> 'Yes'
group by 1
order by Shift_fill_rate desc
limit 3