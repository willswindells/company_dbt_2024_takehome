-- . Return shift ID and their latest created shift application ID.

with max_apps as 
(select 
shift_id,
shift_application_id,
shift_application_created_at,
ROW_NUMBER() OVER (PARTITION BY shift_id ORDER BY shift_application_created_at desc) AS recent__shift_application_created_at
from  {{ref('stg_shift_applications')}}
)

-- all shifts (more than shift table...) and latest application date
select shift_id, shift_application_id
from max_apps
where recent__shift_application_created_at = 1