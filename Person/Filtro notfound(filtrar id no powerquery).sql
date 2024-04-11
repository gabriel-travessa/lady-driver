select 
COALESCE (ro.ride_origin_id ,r.id) as id,
r.passenger_id ,
r.driver_id,
r.status ,
case
when r.canceled_by_id = r.passenger_id then "pax"
when r.canceled_by_id = r.driver_id then "moto"
end as "cancelado",
r.created_at ,
case
when r.payment_methods_id = 1 then "crédito" 
when r.payment_methods_id = 2 then "débito"
when r.payment_methods_id = 3 then "dinheiro"
end as "meio de pagamento",
r.distance ,
r.duration ,
r.driver_distance ,
r.driver_duration ,
r.value ,
r.discount ,
r.get_in_latitude ,
get_in_longitude ,
r.city_id 
from ride r 
left join ride_origin ro on r.id = ro.ride_id 
inner join city c on c.id = r.city_id 
left join charging_schedule cs on cs.ride_id = r.id
where 1 = 1 
and cs.id is null
and r.created_at > '2024-01-01'