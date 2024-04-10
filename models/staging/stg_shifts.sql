--
-- Locations from Staging
--

with

shifts as (

    select * from {{ ref('shifts') }}

),

staging_shifts as 
(
select 
shift_id,
unit_id,
--PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%E*S ', left(shift_start_date,19)) 
shift_start_date,
shift_worker_type,
shift_status,
shift_cancelled,
from 
shifts
)

select * 
from staging_shifts

