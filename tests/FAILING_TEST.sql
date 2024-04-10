--This test fails
--data is poor
select * 
from 
(
select
(
select count(distinct shift_id)
from `pure-harbor-419918`.`florencetest2`.`stg_shifts`  
)
as shift_ids,
(
select count(distinct shift_id)
from `pure-harbor-419918`.`florencetest2`.`stg_shift_applications`  
) as App_shiftids,
)
where shift_ids <> App_shiftids