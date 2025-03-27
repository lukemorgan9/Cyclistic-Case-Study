-- #1 Popularity of different rideable types
*/
CREATE TABLE cyclistic_tripdata.rideable_type_popularity AS
SELECT rideable_type, member_casual, COUNT(*) AS number_of_trips
   FROM `cyclistic-case-study-452522.cyclistic_tripdata.combined_tripdata`
   GROUP BY rideable_type, member_casual
   ORDER BY member_casual, number_of_trips DESC;
/*
__________________________________________________________________________________________________
-- #2 Number of trips per month
*/


