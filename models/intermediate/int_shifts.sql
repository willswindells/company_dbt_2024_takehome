--
--
--

select 
shift_id,
unit_id,
--change to YYYY-MMDD format 
-- I know i am doing this twice, but i wanted to show off.
format_date('%Y-%m-%d',
PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%E*S ', left(shift_start_date,19)) 
)as shift_start_date,
shift_worker_type,
shift_status,
shift_cancelled,

case when shift_status = 0 then true else false end
as 
shift_filled,
-- Add a boolean column titled shift_filled to the shifts table. Hint: If
-- shift_status equals 0, mark it as yes otherwise no.

from {{ref('stg_shifts')}}