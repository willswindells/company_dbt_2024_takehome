--
-- Locations from Staging
--

with

locations as (

    select * from {{ ref('locations') }}

),

staging_locations as 
(
select 
unit_id,
location_id,
location_region_title,
location_region_group_title,
from 
locations
)

select * 
from staging_locations

