/*
#1 Veryifing that all values in ride_id column are unique
*/

SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM `cyclistic-case-study-452522.cyclistic_tripdata.combined_tripdata` 

/*
NOTES: There are 211 duplicate rows which will need to be removed during cleaning



