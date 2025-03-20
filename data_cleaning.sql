-- #1 Removing duplicate ride ids
*/
DELETE FROM `cyclistic-case-study-452522.cyclistic_tripdata.combined_tripdata`
WHERE ended_at NOT IN
(
SELECT MAX(ended_at)
        FROM `cyclistic-case-study-452522.cyclistic_tripdata.combined_tripdata`
        GROUP BY [ride_id]
    );
