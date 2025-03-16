-- #1 Veryifing that all values in ride_id column are unique
*/
SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM `cyclistic-case-study-452522.cyclistic_tripdata.combined_tripdata`; 
/*
NOTES: There are 211 duplicate rows which will need to be removed during cleaning.

-- #2 Verifying that all ride_id strings are 16 characters long
*/
SELECT LENGTH(ride_id) AS ride_id_length, COUNT(*) AS number
FROM `cyclistic-case-study-452522.cyclistic_tripdata.combined_tripdata`
GROUP BY LENGTH(ride_id);
/*
NOTES: All ride_id strings are in fact 16 characters long.

-- #3 Checking rideable_types
*/ 
SELECT DISTINCT rideable_type
FROM `cyclistic-case-study-452522.cyclistic_tripdata.combined_tripdata`;
/*
NOTES: There are three different rideable types: electric_bike, electric_scooter, classic_bike.

-- #4 Identifying trips shorter than 1 minute or longer than 1 day
*/
SELECT *
FROM `cyclistic-case-study-452522.cyclistic_tripdata.combined_tripdata`
WHERE TIMESTAMP_DIFF(ended_at, started_at, MINUTE) <= 1 OR
      TIMESTAMP_DIFF(ended_at, started_at, MINUTE) >= 1440;
/*
NOTES: There are 250270 such trips which will need to be removed during cleaning.

-- #5 Checking start_station_name/start_station_id and end_station_name/end_station_id columns for NULL values and inconsistencies
*/
SELECT start_station_name, COUNT(*) AS occurences
FROM `cyclistic-case-study-452522.cyclistic_tripdata.combined_tripdata`
GROUP BY start_station_name
ORDER BY occurences DESC;  
-- NULL is most common with 1073951 occurences

SELECT COUNT(DISTINCT(start_station_name)) AS unique_start_name,          -- 1808 unique start station names
       COUNT(DISTINCT(start_station_id)) AS unique_start_id,              -- 1763 unique start station ids
FROM `cyclistic-case-study-452522.cyclistic_tripdata.combined_tripdata`;

SELECT end_station_name, COUNT(*) AS occurences
FROM `cyclistic-case-study-452522.cyclistic_tripdata.combined_tripdata`
GROUP BY end_station_name
ORDER BY occurences DESC;
-- NULL is most common with 1104653 occurences

SELECT COUNT(DISTINCT(end_station_name)) AS unique_end_name,
       COUNT(DISTINCT(end_station_id)) AS unique_end_id,                   -- 1815 unique end station names
FROM `cyclistic-case-study-452522.cyclistic_tripdata.combined_tripdata`;   -- 1768 unique end station ids
/*
NOTES: Due to the high number of nulls, errors and inconsistencies, I will ignore the station names and ids and use lat and long instead.

-- #6 Checking for null values in start and end latitude and longitude columns
*/ 
SELECT *
FROM `cyclistic-case-study-452522.cyclistic_tripdata.combined_tripdata`
WHERE start_lat IS NULL OR
      start_lng IS NULL OR
      end_lat IS NULL OR
      end_lng IS NULL;
/*
NOTES: There are 7232 of these rows which will need to be removed during cleaning.

-#7 Verifying that there are only 2 member types
*/ 
SELECT DISTINCT member_casual, COUNT(member_casual) AS trips
FROM `cyclistic-case-study-452522.cyclistic_tripdata.combined_tripdata`
GROUP BY member_casual;
/*
NOTES: 'member' and 'casual' are the only 2 values that occur in this column.







