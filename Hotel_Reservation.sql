use hotel_reservation;
show tables;
select * from hotel_data;
select Booking_ID from hotel_data;
select count(Booking_id) from hotel_data;
SELECT type_of_meal_plan, COUNT(*) AS plan_count
FROM hotel_data
GROUP BY type_of_meal_plan
ORDER BY plan_count DESC
LIMIT 1;
select avg(avg_price_per_room) from hotel_data where no_of_children != 0;
select arrival_date from hotel_data;
-- Convert MM/DD/YYYY format to YYYY-MM-DD
UPDATE hotel_data
SET arrival_date = CONCAT(SUBSTRING_INDEX(arrival_date, '/', -1), '-',
                          SUBSTRING_INDEX(SUBSTRING_INDEX(arrival_date, '/', 1), '/', -1), '-',
                          SUBSTRING_INDEX(arrival_date, '/', 1))
WHERE arrival_date LIKE '%/%/%';

-- Convert DD-MM-YYYY format to YYYY-MM-DD
UPDATE hotel_data
SET arrival_date = CONCAT(SUBSTRING_INDEX(arrival_date, '-', -1), '-',
                          SUBSTRING_INDEX(SUBSTRING_INDEX(arrival_date, '-', 2), '-', -1), '-',
                          SUBSTRING_INDEX(arrival_date, '-', 1))
WHERE arrival_date LIKE '%-%-%';
select arrival_date from hotel_data;
#FOR YEAR 2017
SELECT COUNT(*) AS reservation_count
FROM hotel_data
WHERE YEAR(arrival_date) = '2017';
#FOR YEAR 2018
SELECT COUNT(*) AS reservation_count
FROM hotel_data
WHERE YEAR(arrival_date) = '2018';

SELECT room_type_reserved, COUNT(*) AS room_count
FROM hotel_data
GROUP BY room_type_reserved
ORDER BY room_count DESC
LIMIT 1;

select count(no_of_weekend_nights) as reservation_on_weekend from hotel_data where no_of_weekend_nights >0; 
select max(lead_time) as highest_lead_time, min(lead_time) as lowest_lead_time from hotel_data;

SELECT market_segment_type, COUNT(*) AS common_market
FROM hotel_data
GROUP BY market_segment_type
ORDER BY common_market DESC
LIMIT 1;

select count(booking_status) as confirmed_booking from hotel_data where booking_status="Not_Canceled";

select room_type_reserved,sum(no_of_adults) as total_adults, sum(no_of_children) as total_children
from hotel_data group by room_type_reserved order by room_type_reserved asc;
select no_of_week_nights,sum(no_of_adults) as total_adults, sum(no_of_children) as total_children
from hotel_data group by no_of_week_nights order by no_of_week_nights asc;
select no_of_weekend_nights,sum(no_of_adults) as total_adults, sum(no_of_children) as total_children
from hotel_data group by no_of_weekend_nights order by no_of_weekend_nights asc;

select avg(no_of_weekend_nights) as avg_weekend_nights_with_children from hotel_data where no_of_children > 0;

select month(arrival_date)as reservation_month, COUNT(*) as reservation_count
from hotel_data group by reservation_month order by reservation_month;

select room_type_reserved,avg(no_of_week_nights) as avg_week_nights,avg(no_of_weekend_nights) as avg_weekend_nights
from hotel_data group by room_type_reserved;

SELECT room_type_reserved, avg(avg_price_per_room)
FROM hotel_data WHERE no_of_children > 0
GROUP BY room_type_reserved, avg_price_per_room
ORDER BY room_type_reserved DESC
LIMIT 1;

select market_segment_type from hotel_data where (select max(avg_price_per_room)) 
group by market_segment_type order by market_segment_type desc
limit 1;

