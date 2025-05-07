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

Firstly, I combined the 12 months of trip data into one table named 'combined_tripdata' using the query linked here: [Combining Data](combining_data.sql). 
Below is an image displaying the column names and data types of the newly created table:
<img width="468" alt="Screenshot 2025-05-07 at 10 41 36" src="https://github.com/user-attachments/assets/43cac5b5-06ba-4057-a87b-aca7e2fed504" />

Once the data had been combined I did some further exploration of my dataset to better understand the data and how it would need to be processed using the queries linked here:[Data Exploration](data_exploration.sql)  






