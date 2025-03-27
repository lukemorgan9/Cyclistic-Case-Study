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
-- #5 Average ride length per month
*/
CREATE TABLE cyclistic_tripdata.avg_duration_monthly AS
SELECT member_casual, month, ROUND(AVG(ride_length_minutes), 0) AS avg_trip_duration
   FROM `cyclistic-case-study-452522.cyclistic_tripdata.date_formatted_tripdata`
   GROUP BY member_casual, month
   ORDER BY member_casual;

