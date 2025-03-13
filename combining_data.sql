-- Creating a single table combining all 12 monthly bike trip datasets from 2024 (January to December)

CREATE TABLE cyclistic_tripdata.combined_tripdata AS (
 SELECT * FROM `cyclistic-case-study-452522.2024_tripdata.01_tripdata` UNION ALL
 SELECT * FROM `cyclistic-case-study-452522.2024_tripdata.02_tripdata` UNION ALL
 SELECT * FROM `cyclistic-case-study-452522.2024_tripdata.03_tripdata` UNION ALL
 SELECT * FROM `cyclistic-case-study-452522.2024_tripdata.04_tripdata` UNION ALL
 SELECT * FROM `cyclistic-case-study-452522.2024_tripdata.05_tripdata` UNION ALL
 SELECT * FROM `cyclistic-case-study-452522.2024_tripdata.06_tripdata` UNION ALL
 SELECT * FROM `cyclistic-case-study-452522.2024_tripdata.07_tripdata` UNION ALL
 SELECT * FROM `cyclistic-case-study-452522.2024_tripdata.08_tripdata` UNION ALL
 SELECT * FROM `cyclistic-case-study-452522.2024_tripdata.09_tripdata` UNION ALL
 SELECT * FROM `cyclistic-case-study-452522.2024_tripdata.10_tripdata` UNION ALL
 SELECT * FROM `cyclistic-case-study-452522.2024_tripdata.11_tripdata` UNION ALL
 SELECT * FROM `cyclistic-case-study-452522.2024_tripdata.12_tripdata` );

-- There are 5860568 rows of data in the new table
