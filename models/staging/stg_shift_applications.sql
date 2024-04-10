--
-- Locations from Staging
--

with

shift_applications as (

    select * from {{ ref('shift_applications') }}

),

staging_shift_applications as 
(
select 
shift_id,
shift_application_id,
shift_application_created_at,
shift_application_status,
shift_application_cancellation_reason_description,
from 
shift_applications
)

select * 
from staging_shift_applications

