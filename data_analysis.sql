-- #1 Popularity of different rideable types
*/
CREATE TABLE cyclistic_tripdata.rideable_type_popularity AS
SELECT rideable_type, member_casual, COUNT(*) AS number_of_trips
   FROM `cyclistic-case-study-452522.cyclistic_tripdata.date_formatted_tripdata`
   GROUP BY rideable_type, member_casual
   ORDER BY member_casual, number_of_trips DESC;
/*
__________________________________________________________________________________________________
-- #2 Number of trips per month
*/
CREATE TABLE cyclistic_tripdata.trips_per_month AS
SELECT member_casual, month, COUNT(*) AS number_of_trips
   FROM `cyclistic-case-study-452522.cyclistic_tripdata.date_formatted_tripdata`
   GROUP BY member_casual, month;
/*
__________________________________________________________________________________________________
-- #3 Number of trips per day of week
*/
CREATE TABLE cyclistic_tripdata.trips_per_day AS
SELECT member_casual, day_of_week, COUNT(*) AS number_of_trips
   FROM `cyclistic-case-study-452522.cyclistic_tripdata.date_formatted_tripdata`
   GROUP BY member_casual, day_of_week;
/*
__________________________________________________________________________________________________
-- #4 Number of trips per hour
*/
CREATE TABLE cyclistic_tripdata.trips_per_hour AS
SELECT member_casual, EXTRACT(HOUR FROM started_at) AS time_of_day, COUNT(*) AS number_of_trips
   FROM `cyclistic-case-study-452522.cyclistic_tripdata.date_formatted_tripdata`
   GROUP BY member_casual, time_of_day;
/*
__________________________________________________________________________________________________
-- #5 Average trip duration per month
*/
CREATE TABLE cyclistic_tripdata.avg_duration_monthly AS
SELECT member_casual, month, ROUND(AVG(ride_length_minutes), 0) AS avg_trip_duration
   FROM `cyclistic-case-study-452522.cyclistic_tripdata.date_formatted_tripdata`
   GROUP BY member_casual, month
   ORDER BY member_casual;
/*
__________________________________________________________________________________________________
-- #6 Average trip duration per day of week
*/
CREATE TABLE cyclistic_tripdata.avg_duration_day AS
SELECT member_casual, day_of_week, ROUND(AVG(ride_length_minutes), 0) AS avg_trip_duration
   FROM `cyclistic-case-study-452522.cyclistic_tripdata.date_formatted_tripdata`
   GROUP BY member_casual, day_of_week
   ORDER BY member_casual;
/*
__________________________________________________________________________________________________
-- #7 Average trip duration per hour of the day
*/
CREATE TABLE cyclistic_tripdata.avg_duration_hourly AS
SELECT EXTRACT(HOUR FROM started_at) AS hour_of_day, member_casual, AVG(ride_length_minutes) AS avg_trip_duration
   FROM `cyclistic-case-study-452522.cyclistic_tripdata.date_formatted_tripdata`
   GROUP BY member_casual, hour_of_day
   ORDER BY member_casual;
/*
__________________________________________________________________________________________________
-- #8 Start station popularity
*/
CREATE TABLE cyclistic_tripdata.start_station_pop AS
SELECT start_station_name, member_casual,
   ROUND(AVG(start_lat), 4) AS start_lat,
   ROUND(AVG(start_lng), 4) AS start_lng,  
   COUNT(*) AS total_trips
FROM `cyclistic-case-study-452522.cyclistic_tripdata.date_formatted_tripdata`
WHERE start_station_name != 'bike_lock'
   GROUP BY start_station_name, member_casual; 
/*
__________________________________________________________________________________________________
-- #9 End station popularity
*/
CREATE TABLE cyclistic_tripdata.end_station_pop AS
SELECT end_station_name, member_casual,
   ROUND(AVG(end_lat), 4) AS end_lat,
   ROUND(AVG(end_lng), 4) AS end_lng,  
   COUNT(*) AS total_trips
FROM `cyclistic-case-study-452522.cyclistic_tripdata.date_formatted_tripdata`
WHERE end_station_name != 'bike_lock'
   GROUP BY end_station_name, member_casual;
/*
__________________________________________________________________________________________________
