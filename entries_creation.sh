# rent and sell entry model generating
ruby script/destroy scaffold entry
ruby script/generate scaffold entry type:string rooms_count:integer rent_price:decimal city:string street:string house_number:string flat_number:integer floor_number:integer disctrict:string area_total:integer area_kitchen:integer rent_time:integer contacts:text comment:text user_id:integer