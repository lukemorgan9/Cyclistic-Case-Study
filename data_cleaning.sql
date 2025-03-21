-- #1 Removing duplicate ride ids
*/
DELETE 
FROM `cyclistic-case-study-452522.cyclistic_tripdata.combined_tripdata`
WHERE ended_at NOT IN
(
SELECT MAX(ended_at)
        FROM `cyclistic-case-study-452522.cyclistic_tripdata.combined_tripdata`
        GROUP BY [ride_id]
    );
/*
NOTES: 211 rows removed.
__________________________________________________________________________________________________
-- #2 Removing trips shorter than 1 minute or longer than 1 day
*/
DELETE 
FROM `cyclistic-case-study-452522.cyclistic_tripdata.combined_tripdata`
WHERE TIMESTAMP_DIFF(ended_at, started_at, MINUTE) <= 1 OR
      TIMESTAMP_DIFF(ended_at, started_at, MINUTE) >= 1440;
/*
NOTES: 250,227 rows removed.
__________________________________________________________________________________________________
-- #3 Removing classic bike trips with no start or end station
*/
DELETE 
FROM `cyclistic-case-study-452522.cyclistic_tripdata.combined_tripdata` 
WHERE rideable_type = 'classic_bike' AND
      start_station_name IS NULL  -- 0 rows removed

DELETE 
FROM `cyclistic-case-study-452522.cyclistic_tripdata.combined_tripdata` 
WHERE rideable_type = 'classic_bike' AND
      end_station_name IS NULL -- 41 rows removed
/*
NOTES: 41 rows removed overall.
__________________________________________________________________________________________________
-- #4 Removing rows with null values in start and end latitudes and longitudes
*/
DELETE
FROM `cyclistic-case-study-452522.cyclistic_tripdata.combined_tripdata`
WHERE start_lat IS NULL OR
      start_lng IS NULL OR
      end_lat IS NULL OR
      end_lng IS NULL;
/*
NOTES: 0 rows removed.
__________________________________________________________________________________________________
-- #5 Creating new columns for day of week, month and ride length
*/

