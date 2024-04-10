select * 
from {{ref('int_shifts')}}  
where shift_status not in (0,1,3)