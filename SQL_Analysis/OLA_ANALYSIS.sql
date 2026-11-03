Create database Ola_project;

CREATE TABLE ola_ride (
    ride_date DATE,
    ride_time TIME,
    booking_id VARCHAR(120),
    booking_status VARCHAR(50),
    customer_ID VARCHAR(50),
    vehicle_type VARCHAR(50),
    pickup_location VARCHAR(50),
    drop_location VARCHAR(50),
    avg_VTAT NUMERIC,
    avg_CTAT NUMERIC,
    cancelled_rides_by_customer NUMERIC,
    reason_for_cancelling_by_customer VARCHAR(50),
    cancelled_rides_by_driver NUMERIC,
    driver_cancellation_reason VARCHAR(25),
    incomplete_rides NUMERIC,
    incomplete_rides_reason VARCHAR(250),
    booking_value NUMERIC,
    ride_distance NUMERIC,
    driver_ratings NUMERIC,
    customer_ratings NUMERIC,
    payment_method VARCHAR(250)
);

ALTER TABLE public.ola_ride
ALTER COLUMN driver_cancellation_reason TYPE VARCHAR(100);

select * from ola_ride;

Q1. Find the total number of Ola bookings for each day.
SELECT * FROM Booking_trend
Create View Booking_trend as
select ride_date,
count(booking_id) as total_bookings
from ola_ride
group by ride_date
order by total_bookings DESC;

Q2. Find the total number of Ola bookings for each day of the week and each hour.
SELECT * FROM Booking_day_time
Create view Booking_day_time as
SELECT 
EXTRACT(DOW FROM ride_date) AS day_of_week,
COUNT(booking_id) AS total_bookings
FROM ola_ride
GROUP BY 
EXTRACT(DOW FROM ride_date)
ORDER BY day_of_week;

Q3. Find the number and percentage of Completed, Incomplete, Customer Cancelled, and Driver Cancelled rides for each day.
SELECT * FROM Ride_status_trend
Create View Ride_status_trend as
select ride_date, booking_status,
count(booking_id) as total_rides,
round(count(booking_id) * 100.0 /
sum(count(booking_id)) over (partition by  ride_date),
2 ) as ride_percentage
from Ola_ride
group by ride_date,booking_status
order by ride_date;

Q4. Find the total bookings and completed rides for each pickup location.
SELECT * FROM Location_completion
Create View Location_completion as
SELECT pickup_location,
COUNT(booking_id) AS total_rides,
SUM(CASE 
WHEN booking_status = 'Completed' THEN 1 ELSE 0
END) AS completed_rides,
ROUND(
SUM(CASE 
WHEN booking_status = 'Completed' THEN 1 ELSE 0
END) * 100.0 / COUNT(booking_id), 2
) AS completion_rate
FROM ola_ride
GROUP BY pickup_location;

Q5. Find the total bookings, completed rides, and cancelled rides for each payment method.
SELECT * FROM Payment_analysis
Create View Payment_analysis as
select payment_method,
count(booking_id) as total_bookings,
sum(case when booking_status='Completed' then 1
else 0 end) as completed_rides,
sum(case 
when booking_status LIKE 'Cancel%'
or booking_status='Cancelled by Drivers' then 1 
else 0 end) as Cancelled_rides
from ola_ride
group by payment_method
order by total_bookings DESC;

Q6. Find the total customer cancellations for each pickup location and cancellation reason.
SELECT * FROM Customer_cancel
Create view Customer_cancel as
select pickup_location,reason_for_cancelling_by_customer,
count(booking_id) as total_cancellations
from ola_ride
where booking_status='Cancelled by Customer'
group by pickup_location,reason_for_cancelling_by_customer
order by total_cancellations desc;


Q7. Find the number of customer cancellations and driver cancellations for each vehicle type.
SELECT * FROM Vehicle_cancel
Create View Vehicle_cancel as
select vehicle_type,
sum(case 
when booking_status='Cancelled by Customer' then 1 
else 0 end) 
as Customer_cancellations,
sum(case
when booking_status='Cancelled by Driver' then 1
else 0 end) 
as Driver_cancellations
from Ola_ride
group by vehicle_type;

Q8. Find the average booking value for different ride distances.
SELECT * FROM Distance_value	
Create View Distance_value as
select ride_distance,
count(booking_id) as total_bookings,
round(avg(booking_value),2) as avg_booking_value
from ola_ride
where booking_status='Completed'
group by ride_distance;

Q9. Find the average VTAT, average CTAT, customer rating, and number of cancellations for each vehicle type.
SELECT * FROM Vehicles_performance
Create View Vehicles_performance as
SELECT vehicle_type,
ROUND(AVG(avg_VTAT), 2) AS avg_VTAT,
ROUND(AVG(avg_CTAT), 2) AS avg_CTAT,
ROUND(AVG(customer_ratings), 2) AS avg_customer_rating,
COUNT(CASE
WHEN booking_status IN ('Cancelled by Customer', 'Cancelled by Driver')
THEN 1
END) AS total_cancellations
FROM ola_ride
GROUP BY vehicle_type
ORDER BY vehicle_type;

Q10. Find the total bookings and average customer rating for each pickup location.
SELECT * FROM Location_rating
Create view Location_rating as 
select pickup_location,
count(booking_id) as total_bookings,
round(avg(customer_ratings),2) as Average_customer_ratings
from ola_ride
group by pickup_location;

Q11. Find the vehicle types, payment methods, and pickup locations associated with bookings above the average booking value.
SELECT * FROM High_value_booking
Create View High_value_booking as
SELECT vehicle_type, payment_method, pickup_location,
ROUND(AVG(booking_value), 2) AS Average_booking_value,
COUNT(booking_id) AS total_bookings
FROM ola_ride
GROUP BY vehicle_type, payment_method, pickup_location
HAVING AVG(booking_value) > (
SELECT AVG(booking_value)
FROM ola_ride
)
ORDER BY Average_booking_value DESC;

Q12. Find the vehicle type, pickup location, and hour with the highest number of cancelled and incomplete rides.
SELECT * FROM Problem_area;
Create view Problem_area as
SELECT vehicle_type, pickup_location,
EXTRACT(HOUR FROM ride_time) AS ride_hour,
COUNT(booking_id) AS total_unsuccessful_rides
FROM ola_ride
WHERE booking_status IN ( 'Cancelled by Customer', 'Cancelled by Driver', 'Incomplete'
)
GROUP BY vehicle_type, pickup_location,
EXTRACT(HOUR FROM ride_time)
ORDER BY total_unsuccessful_rides DESC
LIMIT 20;

Q13. Find the pickup locations with high bookings, low customer ratings, and a high number of unsuccessful rides.
SELECT * FROM Location_performance
Create View Location_performance as
SELECT pickup_location,
COUNT(booking_id) AS total_bookings,
ROUND(AVG(customer_ratings), 2) AS average_customer_ratings,
SUM(CASE
WHEN booking_status IN ( 'Cancelled by Customer', 'Cancelled by Driver', 'Incomplete','No Driver Found'
) THEN 1 ELSE 0
END) AS unsuccessful_rides
FROM ola_ride
GROUP BY pickup_location
ORDER BY total_bookings DESC;

Q14. Find the vehicle type and pickup location combinations with high booking value, high ratings, and fewer unsuccessful rides.
SELECT * FROM Vehicle_location_value
Create View Vehicle_location_value as
SELECT vehicle_type, pickup_location,
COUNT(booking_id) AS total_bookings,
ROUND(SUM(booking_value), 2) AS total_booking_value,
ROUND(AVG(customer_ratings), 2) AS average_customer_ratings,
SUM(CASE
WHEN booking_status IN ( 'Cancelled by Customer', 'Cancelled by Driver', 'Incomplete', 'No Driver Found'
) THEN 1 ELSE 0
END) AS unsuccessful_rides
FROM ola_ride
GROUP BY vehicle_type, pickup_location
ORDER BY total_booking_value DESC
LIMIT 20;           

Q15. Find the most common booking problems, customer cancellation reasons, and driver cancellation reasons.
SELECT * FROM Booking_problem_status
Create View Booking_problem_status as
select booking_status,
count(booking_id) as total_bookings
from ola_ride
group by booking_status
order by total_bookings DESC;

SELECT * FROM Customer_cancel_reasons
Create View Customer_cancel_reasons as
select reason_for_cancelling_by_customer,
count(booking_id)as total_cancellations
from ola_ride
where booking_status='Cancelled by Customer'
group by reason_for_cancelling_by_customer;

SELECT * FROM Driver_cancellation_reason;
Create View Driver_cancellation_reason as
select driver_cancellation_reason,
count(booking_id)as total_cancellations
from ola_ride
where booking_status='Cancelled by Driver'
group by driver_cancellation_reason;
