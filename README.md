# Cyclistic Case Study
## Introduction
The following case study on the fictional bike-share company Cyclistic was completed as my capstone project for the Google Data Analytics Professional Certificate on Coursera. For this case study I used [Divvy Trip Data](https://divvy-tripdata.s3.amazonaws.com/index.html) from the period of January 2024-January 2025. As Cyclistic is a fictional company with limited information provided on its operation via Coursera, I also used the Divvy website to aquire additional information about the bike sharing services offered including the types of rideables available, processes regarding using and docking the bikes/scooters and the terms and benefits of membership. For the purposes of my case study I applied this information to the fictional company Cyclistic.

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

My manager Lily Moreno (Director of Marketing) had tasked me with answering the following question:

> How do annual members and casual riders use Cyclistic bikes differently?

As a member of the Cyclistic marketing analytics team it was my responsibility to use historical Cyclistic trip data to analyse and identify trends. I would then report my findings to my stakeholders - Lily Moreno and the Cyclistic executive team, who would use my insights to design digital marketing strategies aimed at converting casual users into annual members.

### Business Task
Identify key differences in how annual members and casual riders use Cyclistic services and use these insights to inform future marketing decisions to convert casual users into members.

## Prepare
At this stage I located and organised the relevant datasets which can be found here: [Divvy Trip Data](https://divvy-tripdata.s3.amazonaws.com/index.html). I downloaded the previous 12 months of trip data (January 2024 to January 2025) as 12 seperate .csv files (each containing all of the trip data for one month) and organised them into a single folder. The data therefore is current. I then verified the reliability and credibility of the data.

The data is publically available first party data collected from a primary data source which indicates that it is both reliable and credible. The [Divvy Data License Agreement](https://divvybikes.com/data-license-agreement) permits the use of the data for non-commercial purposes. As the data is published for public use and contains no personal information, there are no obvious biases. The data is also comprehensive and the formatting is consistent. There are however some null values which will have to be removed during the processing stage. 

Due to laws around privacy there is no way of identifying individual users and therefore no way of knowing if rides in the database were taken by distinct users or if multiple rides were taken by the same users.

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

## Share
During this stage, I created visualisations to convey the results of my analysis using Tableau. The visualisations are available here: [Tableau](https://public.tableau.com/views/CyclisticCaseStudy_17456884326040/RideableType?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

### Rideable Type Distribution
Firstly, I compared the popularity of different rideable types between members and non-members. As can be seen in the visualisation below, there is very minimal difference between which rideable types members and casual users prefer, with casual users favoring electric scooters slightly more than members. <img width="948" alt="Screenshot 2025-05-11 at 15 57 06" src="https://github.com/user-attachments/assets/946d6a31-1a52-430c-8773-f8f10359dc2c" />


I also compared the overall number of member versus casual users. Below we can see that 63.44% of trips are taken by members compared to 36.56 by non-members. While the majority of users are members, there is still a sizeable market share of casual users who can be targeted by the marketing team and hopefully converted into members to maximise profits. 

<img width="516" alt="Screenshot 2025-05-11 at 16 07 03" src="https://github.com/user-attachments/assets/a6b947c5-9c94-4e69-a3ae-9b2831d40243" />

### Number of Trips Taken per Month/Day/Hour
**Per Month of the Year**: 
As shown in the graph below, both casual users and annual members follow a similar trend of using the service less in the winter months and more in the summer months. However, the trend is slightly more pronounced in casual members. There are very few trips taken by casual users from January until March. The number of trips increases quite significantly in April and then continues to increase every month until September. After this, there is a significant decrease in trips in October and usage continues to decline rapidly until the end of the year. The data on annual members shows a less steep decline in usage in October however the rest of the months closely mirror the trends of casual members. The overall number of trips is higher for members as established earlier in the analysis of the rideable distribution. <img width="983" alt="Screenshot 2025-05-11 at 20 44 05" src="https://github.com/user-attachments/assets/f1e9d4b5-c582-4a68-977e-9c5970830f75" />

**Per Day of the Week**: 
The graph below clearly indicates that members take far more trips during weekdays than casual users. The service is much more popular with casual users on weekends with the number of trips taken by casual users almost equalling those taken by members. This suggests that members may be using the Cyclistic service for their daily commute while casual users favor using the rideables for leisure activities. <img width="978" alt="Screenshot 2025-05-11 at 20 51 32" src="https://github.com/user-attachments/assets/bf6adda3-0b0e-4bbf-854a-d75699440e27" />

**Per Hour of the Day**: 
As one might expect, very few trips are taken between 11am and 5am as a lot of people are asleep during that time. The graph shows a large spike around 8am for members, who may be using the bikes and scooters for their morning commute to work. There is also another large spike in use by members at around 5pm. This is likely due to members commuting home from work and/or travelling out to do different activities after they have finished work. The graph for casual users shows a much more steady increase in use from 6am but also peaks at around 5pm. Again, this could reflect use of the service for after work activities. <img width="988" alt="Screenshot 2025-05-11 at 21 05 35" src="https://github.com/user-attachments/assets/34b65515-07bf-4c84-a1d2-61e9b52f2c48" />

### Average Duration of Trips per Month/Day/Hour
**Per Month of the Year**:
Here we can see that casual users are consistently taking longer trips than members. There is also an obvious increase in the average duration of trips taken by casual users during the summer months, a trend which is not existent in members. The average trip duration for members does not change significantly at all throughout the year. This again supports my hypothesis that casual users are using the service more for lesiure activities while members are using the service to commute to work. It could also reflect the fact that day pass users get 3 hours free use with classic bikes and therefore feel the need to get the most out of their free time while members have only 45 minutes free. <img width="987" alt="Screenshot 2025-05-11 at 21 16 05" src="https://github.com/user-attachments/assets/88f0feb2-2208-485f-92f4-e42bdc8ec119" />

**Per Day of the Week**: 
In the case of casual users, there is much more variety in the average trip length throughout the week, with the longest trips being taken on the weekends. The average trip length for members is identical from Monday-Friday. This further suggests that members are using the bikeshare service to commute to work as if they are taking the same journey every day, it should take the same amount of time. For members there is also a similar but not quite as significant increase in trip duration on the weekends, implying that they are perhaps using the service for more non-work related activities. <img width="981" alt="Screenshot 2025-05-13 at 21 31 47" src="https://github.com/user-attachments/assets/0599e953-efcc-4948-9f98-84266f8a34e1" />

**Per Hour of the Day**:
Casual users take their shortest trips in the morning (5-8am). From 8am onwards, the length of trips increases significantly, peaking at 10am and then slowly decreasing throughout the day. The increased length of trips around 10-11am could reflect the use of bikes for leisure activities or generally exploring the city. The graph of annual members shows very little change in average trip duration throughout the day. <img width="982" alt="Screenshot 2025-05-13 at 21 33 29" src="https://github.com/user-attachments/assets/578a07a2-33f1-4868-80bd-44d1f603ca05" />


### Most Popular Start and End Stations
**Members**:
For members, the 5 most popular start stations are identical to the 5 most popular end stations, meaning that users are travelling back and forth to the same places consistently. The most popular start station and end station for members (Kingsbury St & Kinzie St) is situated next to a large corporate office. The majority of the 5 most popular stations are based next to offices or apartment complexes with the exception of the Clark St & Elm St station, which is next to the Chicago Cubs stadium, Wrigley Field. Biking to the stadium is a popular choice to avoid traffic. <img width="993" alt="Screenshot 2025-05-13 at 21 35 07" src="https://github.com/user-attachments/assets/eceef322-ec20-457d-a476-e46bc5919780" />


**Casuals**:
In the case of casual users, all of the most popular stations are near tourist attractions such as parks and museums. The most popular starting station (Streeter Dr & Grand Ave) is very close to the Navy Pier, Polk Bros Park and Chicago Children's Museum. The most popular end station (Dusable Lake Shore Dr & North Blvd) is near Lincoln Park and two more museums. There is no overlap between the most popular stations for members and casual users, further emphasising the difference in how members use Cyclistic for work and casual users are using the service for tourism and recreation. <img width="991" alt="Screenshot 2025-05-13 at 21 36 06" src="https://github.com/user-attachments/assets/20458483-48b5-4263-b38a-8dc82f1f0992" />


### Key Takeaways

1. Both members and casual users take more trips in the warmer months and less trips in the colder months, a trend which is slightly more pronounced in casual users. Additionally, members take more trips on weekdays while casual users take more trips on weekends.
2. Members take shorter trips than casual users on average, especially during the summer and on weekends.
3. Members are most commonly travelling to and from corporate offices and apartment complexes while casual users are more commonly travelling to different tourist attractions.

## Act
These are my recommendations to the marketing team based on the insights gained from my analysis of the past 12 months of trip data:

1. Offer discounted seasonal memberships and/or weekend memberships.
2. Promote the cost benefits of membership for longer journeys.
3. Advertise memberships at tourist sites and encourage users to use Cyclistic for their morning commute by promoting the cost, health and environmental benefits.

Further research into the behaviors of individual riders would yield more useful insights for the marketing team to devise future marketing strategies.

### Thank you for taking the time to read my Case Study.












