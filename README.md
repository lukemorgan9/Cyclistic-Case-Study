# Cyclistic Case Study
## Introduction
The following case study on the fictional bike-share company Cyclistic was completed as my capstone project for the Google Data Analytics Professional Certificate on Coursera. For this case study I used [Divvy Trip Data](https://divvy-tripdata.s3.amazonaws.com/index.html) from the period of January 2024-January 2025. As Cyclistic is a fictional company with limited information provided on its operation via Coursera, I also used the Divvy website to aquire additional information about the bike sharing services offered including the types of rideables available, processes regarding using and docking the rideables and the terms of membership. For the purposes of my case study I applied this information to the fictional company Cyclistic.

Throughout my case study I will follow the six step data analysis process of: 
- Ask
- Prepare
- Process
- Analyse
- Share
- Act

### Scenario
I am a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve my recommendations, so they must be backed up with compelling data insights and professional data visualizations.


### Useful Links

During the case study I used SQL to process the data and Tableau to create compelling visualisations. I also created a presentation on Microsoft PowerPoint to convey my findings to stakeholders. The links to all of these are available below.

Link to SQL queries:

[Combining Data](combining_data.sql)

[Data Exploration](data_exploration.sql)

[Data Cleaning](data_cleaning.sql)

[Data Analysis](data_analysis.sql)

Link to visualisations: 
[Tableau](https://public.tableau.com/views/CyclisticCaseStudy_17456884326040/RideableType?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

Link to PowerPoint presentation:
[Presentation]

## Ask
This first stage of the process involved clarifying my objectives and considering my key stakeholders in order to deliver a clear statement of the business task. 

Lily Moreno, the director of marketing and my manager had tasked me with answering the following question:

> How do annual members and casual riders use Cyclistic bikes differently?

As a member of the Cyclistic marketing analytics team it was my responsibility to use historical Cyclistic trip data to analyse and identify trends. I would then report my findings to my stakeholders, Lily Moreno and the Cyclistic executive team, who would use my insights to design digital marketing strategies aimed at converting casual users into annual members.

### Business Task
Identify key differences in how annual members and casual riders use Cyclistic services and use these insights to inform future marketing decisions to convert casual users into members.

## Prepare
At this stage I located and organised the relevant datasets which can be found here: [Divvy Trip Data](https://divvy-tripdata.s3.amazonaws.com/index.html). I downloaded the previous 12 months of trip data (January 2024 to January 2025) as 12 seperate .csv files (each containing all of the trip data for one month) and organised them into a single folder. The data therefore is current. I then verified the reliability and credibility of the data.

The data is publically available first party data collected from a primary data source which indicates that it is both reliable and credible. The [Divvy Data License Agreement](https://divvybikes.com/data-license-agreement) permits the use of the data for non-commercial purposes. As the data is published for public use and contains no personal information, there are no obvious biases. The data is also comprehensive and the formatting is consistent. There are however some null values which will have to be removed during the processing stage. 

## Process
Due to the size of the dataset exceeding the limitations of Excel or Sheets, I decided to use BigQuery (SQL) to process my data. 

### Combining Data
Firstly, I combined the 12 months of trip data into one table named 'combined_tripdata' using the query linked here: [Combining Data](combining_data.sql). 
Below is an image displaying the column names and data types of the newly created table:
<img width="464" alt="Screenshot 2025-05-07 at 10 41 36" src="https://github.com/user-attachments/assets/5096f936-646e-413b-8d92-8daf82ce917a" />

### Data Exploration
Once the data had been combined I did some further exploration of my dataset to better understand the data and how it would need to be processed using the queries linked here: [Data Exploration](data_exploration.sql).

Outlined below are the steps I took:

1. Firstly, I verified that all ride_id values (the primary key) were unique. I discovered 211 duplicate rows. After further exploration I learned that these duplicates were caused by trips that began on the last day of one month and ran into the first day of the next month being recorded under both months. These duplicate values would need to be removed during the cleaning process.
2. Next, I verified that all ride ids were 16 characters long.
3. I then explored the rideable_type column to ensure there were only 3 values: electric_bike, classic_bike and electric_scooter.
4. Next, I identified trips shorter than 1 minute or longer than 1 day. There were 250,270 of these trips which were likely caused by docking errors and would need to be removed during cleaning.
5. I also explored the start and end station name and id columns looking for null values and inconsistent naming conventions. According to the Divvy website, electric bikes and scooters do not need to be docked in an official docking station and can be left elsewhere on the bike lock. This would explain the null values in the start and end station columns. During cleaning, these null values would be renamed as 'bike_lock' to reflect this. Classic bikes however, must be docked in a station and therefore null values for these rideables would need to be removed during cleaning. The station id columns contained a number of inconsistencies and would therefore be ignored.
6. I checked for null values in start and end latitude and longitude columns. There were 7232 rows with null values overall. All of these rows would need to be removed as all trips need geographical coordinates.
7. Lastly, I verified that the member_casual column only contained either one of 2 values: 'member' and 'casual'.

### Data Cleaning
Once I had explored and better understood my dataset, I began the process of cleaning the data using the queries linked here: [Data Cleaning](data_cleaning.sql).

Outlined below are the steps I took:

1. Firstly, I removed the duplicate ride ids. This removed 211 rows.
2. Secondly, I removed all trips shorter than 1 minute or longer than 1 day. This removed 250,227 rows.
3. I removed all classic bike trips with no start or end station name.
4. I also removed all entries with missing latitude or longitude values.
5. I then converted my dataset into a new table (date_formatted_tripdata) with the date column reformatted and separated into new columns for the day of the week (day_of_week) and the month (month). I also used the timestamp difference between started_at and ended_at to create a new ride length column (ride_length_minutes).
6. For any remaining rows with null values in the start station name and end station name columns, I replaced the nulls with 'bike_lock' to indicate that for these trips, the bikes had been locked up outside of official docking stations.

By the end of the cleaning process, I had a new table named date_formatted_tripdata with the dates reformatted and 250,479 fewer rows which were removed because of duplicates or nulls. The data was now clean and ready for analysis.

## Analyse
During the analyse stage I created seperate tables in BigQuery (using the following queries: [Data Analysis](data_analysis.sql)) to calculate various metrics and compare the behaviors of casual users to annual members including:

1. The popularity of different rideable types
2. The number of trips taken per month of the year
3. The number of trips taken per day day of the week
4. The number of trips taken per hour of the day
5. The average duration of trips per month of the year
6. The average duration of trips per day of the week
7. The average duration of trips per hour of the day
8. The popularity of different start stations
9. The popularity of different end stations








