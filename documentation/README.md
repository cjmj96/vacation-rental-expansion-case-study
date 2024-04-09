# **Case Study: Expand the vacation rental market**

![airbnb-logo](https://i.ibb.co/h9RwFNk/airbnb.png)

<a href="https://www.flaticon.com/free-icons/airbnb" title="airbnb icons">Airbnb icons created by riajulislam - Flaticon</a>


## **Table of content**

- [1. Introduction](#introduction)
- [2. Scenario](#scenario)
- [3. Background](#background)
- [4. Business task](#business-task)
- [5. Ask](#ask)
- [6. Prepare](#prepare)
  - [6.1 Describe data](#describe-data)
  - [6.2 Check data credibility](#check-data-credibility)
  - [6.3 Understand data limitations](#understand-data-limitation)
  - [6.4 Format data](#format-data)
- [7. Process](#process)
  - [7.1 Explore the data](#explore-the-data)
  - [7.2 Check data integrity](#check-data-integrity)
    - [7.2.1 Describe statistical measures associated with data integrity](#describe-statistical-measures-associated-with-data-integrity)
    - [7.2.2 Overcome the challenges of insufficient data](#overcome-the-challenges-of-insufficient-data)
    - [7.2.3 Discover data constraints and clean data](#discover-data-constraints-and-clean-data)
      - [7.2.3.1 Corroborate data types](#corroborate-data-types)
      - [7.2.3.2 Check data range](#check-data-range)
      - [7.2.3.3 Check mandatory data](#check-mandatory-data)
      - [7.2.3.4 Check unique data](#check-unique-data)
      - [7.2.3.5 Check for regular expression (regex) patterns](#check-for-regular-expressions)
      - [7.2.3.6 Check for cross-field validation](#check-for-cross-field-validation)
      - [7.2.3.7 Check for primary-key](#check-for-primary-key)
      - [7.2.3.8 Check for set-membership](#check-for-set-membership)
      - [7.2.3.9 Check for foreign-key](#check-for-foreign-key)
      - [7.2.3.10 Check for accuracy](#check-for-accuracy)
      - [7.2.3.11 Check completeness](#check-completeness)
      - [7.2.3.12 Check for consistency](#check-for-consistency)
      - [7.2.3.13 Check for misspelled words](#check-for-misspelled-words)
      - [7.2.3.14 Check for mistyped numbers](#check-for-mistyped-numbers)
      - [7.2.3.15 Check for extra spaces and characters](#check-for-extra-spaces-and-characters)
      - [7.2.3.16 Check for misleading variable labels (columns)](#check-for-misleading-variable-labels)
    - [7.2.4 Review the goal of your project](#review-the-goal-of-your-project)
      - [7.2.4.1 Confirm the business problem](#confirm-the-business-problem)
      - [7.2.4.2 Confirm the goal of the project](#confirm-the-goal-of-the-project)
      - [7.2.4.3 Verify that data can solve the problem and is aligned to the goal](#verify-that-data-can-solve-the-problem-and-is-aligned-to-the-goal)
- [8. Analyze](#analyze)
  - [8.1 Organize the data](#organize-the-data)
  - [8.2 Format and adjust the data](#format-and-adjust-the-data)
  - [8.3 Get input from others](#get-input-from-others)
  - [8.4 Transform the data](#transform-the-data)
- 9. [References](#references)


<a id="introduction"></a>
## **1. Introduction**

The vacation rentals market in the United States is experiencing constant growth and evolution.  A variety of factors influence this,ranging from customer preferences, trends in the market, local special circumstances, and underlying macroeconomic factors. By 2024, it's to projected to achieve a revenue of $US\$19.77$bn, with an estimated amount of $62.57$m users, and it's expected that $79\%$ of the total revenue in this market will be generated through online sales [1].


<a id="scenario"></a>
## **2. Scenario**

You are a junior data analyst working for a business intelligence consultant. You have been at your job for six months, and your boss
feels you are ready for more responsibility. He has asked you to lead a project for a brand new client — this will involve everything
from defining the business task all the way through presenting your data-driven recommendations. You will choose the topic, ask
the right questions, identify a fresh dataset and ensure its integrity, conduct analysis, create compelling data visualizations, and
prepare a presentation.


<a id="background"></a>
## **3. Background**

Spire Property Group (fictional company) is a real state management company that doesn't just manage properties, it cultivates communities. Founded by a passionate team with a combined century of experience, Spire elevates the real estate experience for both owners and residents.

Spire Property Group caters to a diverse clientele, offering a range of services for:

- Vacation Rentals: Transforming dream getaways into reality with meticulous management and exceptional guest experiences.
- Residential Properties: Providing stress-free living with responsive maintenance, streamlined rent payments, and exclusive resident events.
- Commercial Properties: Partnering with businesses to create thriving workspaces, offering expert property management and fostering a sense of community within the tenant base.



<a id="business-task"></a>
## **4. Business task**

Develop a comprehensive market analysis and investment strategy to guide Spire Property Group's expansion into the vacation rental market of Albany.

<a id="ask"></a>
## **5. Ask**

The Spire property group ask you to analyze public data from Airbnb to answer questions about the vacation rental market in Albany. These questions will guide the analysis:

- How neighborhoods or amenities influence Airbnb prices?
- What listing are rented most frequently?
- Where super hosts are located?


<a id="prepare"></a>
## **6. Prepare**

In this phase, I gather the data, describe it, ensure it has the correct format, credibility, and understand its limitations. I use the historical listing data from Airbnb of Albany. The data was in csv format, which has reading and writing performance limitations. With that in mind, I create a database, containing tables representing each file. The data is credible, so the insights obtained will be of a prescriptive nature.

<a id="describe-data"></a>
### **6.1 Describe data**

The Airbnb data contain publicly available data from Airbnb listing of Albany in the New York state. The data was obtained from the Inside Airbnb platform. This data doesn't include private information about renters or hosts, but focuses on details about the listings themselves. It contains data about listing information (entire apartment, private room, etc.), data, pricing, availability, and review data.

The data provided cover listings starting on March. 10, 2024 to March 9, 2025 (almost a year), not representative of the entire listing history. Therefore, this data is a sample. So, the insights derived from this data can only be functional under the specific circumstances of the proposed business task.

<a id="check-data-credibility"></a>
### **6.2 Check data credibility**

The credibility of our data can be determined using the ROCCC system:

The data is reliable because it was collected by Airbnb. The data is original, because it was collected by Airbnb. The data is comprehensive because it contains all information needed to answers the guiding questions to produce insights that it could drive the decision making of the stakeholders. The data is current, because the data has a timeframe that covers the most up-to-date data. The data is cited because the data was obtained from the original source.

<a id="understand-data-limitations"></a>
### **6.3 Understand data limitations**

The data possess one main limitation, unknown sample size and generalizability, making it difficult to draw conclusions about the entire population. However, the data still holds value for gaining insights under the specific circumstances imposed by the business task.

<a id="format-data"></a>
### **6.4 Format data**

I converted the csv files into tables by using the options provided by sqlitebrowser. Those tables are stored as a database located at `/database/albany-ny-airbnb-data.db`.


## **7. Process**

To make sure the data we're working with is accurate, I used certain tools and techniques to process it. First, I looked at each piece of data closely to understand its limitations and challenges. Then, I applied processes to clean the data and remove any errors or inconsistencies. By doing this, we can trust that our results are based on accurate information.

<a id="explore-data"></a>
### **7.1 Explore data**



The dataset is cross-sectional because I use a single quarterly update (March 10, 2024) from Inside Airbnb, containing Airbnb listings in a particular city for the following 12 months. Therefore, it only represents data in a single time point, there are no repeated observations over multiple time points, which is a defining characteristic of longitudinal data.


The Airbnb data for Albany contain several files with data recorded on a daily level. One such file, `calendar.csv`, aggregates data about Airbnb listings, including `listing ID`, `date`, `availability`, `price`, `adjusted price`, `minimum nights`, and `maximum nights`, with 147,466 observations. The `listings_wide.csv` file contains information about listings including listing ID, URL, name, description, neighborhood overview, host information, and other details about each listing (75 columns) with 404 observations. Additionally, the `reviews_wide.csv` file stores information related to user's review for a listing  `listing_id`, `id`, `date`, `reviewer_id`, `reviewer_name`, and `comments` (6 columns) with 22,112 observations. The remaining files (`listings.csv`, `reviews.csv`) contain summary information about reviews and listings for visualization. The first one contains 18 columns with 404 observations and the second one, 2 columns with 22,112 observations.

The SQL commands to obtain the previous results are the following (`sql/process/explore-data.sql`):
```sql
-- List column names for calendar table
PRAGMA table_info(calendar);

-- Count number of observations for calendar table
SELECT COUNT(*)
FROM calendar;

-- List column names for calendar table
PRAGMA table_info(listings);

-- Count number of observations for listings table
SELECT COUNT(*)
FROM listings;

-- List column names for listings_wide table
PRAGMA table_info(listings_wide);

-- Count number of observations for listings_wide table
SELECT COUNT(*)
FROM listings_wide;

-- List column names for neighbourhoods table
PRAGMA table_info(neighbourhoods);

-- Count number of observations for neighbourhoods table
SELECT COUNT(*)
FROM neighbourhoods;

-- List column names for reviews table
PRAGMA table_info(reviews);

-- Count number of observations for reviews table
SELECT COUNT(*)
FROM reviews;

-- List column names for reviews_wide table
PRAGMA table_info(reviews_wide);

-- Count number of observations for reviews_wide table
SELECT COUNT(*)
FROM reviews_wide;
```

<a id="check-data-integrity"></a>
### **7.2 Check data integrity**

Determining data integrity is a critical process in data analytics to ensure that data is accurate, complete, and remains consistent throughout the analysis. In the following sections, I will demonstrate the application of various techniques designed to achieve this goal. These techniques aim to provide a thorough and effective means of managing and controlling the data during the analysis process.

<a id="describe-statistical-measures-associated-with-data-integrity"
#### 7.2.1 Describe statistical measures associated with data integrity

As previously mentioned, the sample size is unknown so the statistical power, the feasibility to perform hypothesis testing or report a margin of error is not possible. With this in mind I will only report data variability to provide some sense of uncertainty (spread of data, margin of error (indirectly), confidence intervals (indirectly)).

<a id="overcome-the-challenges-of-insufficient-data"
#### 7.2.2 Overcome the challenges of insufficient data

I decided to work with publicly available data that comes from Inside Airbnb.

<a id="discover-data-constraints"></a>
#### 7.2.3 Discover data constraints and clean data

Data constraints refers to the limitations that affect the way you gather, clean, analyze, and interpret information. These constraints can be related to data volume, variety, quality, accessibility, timeline, and the overall effectivenes of data-driven insights. In the following sections, I will demonstrate the various methods to overcome these constraints.


<a id="corroborate-data-types"></a>
#### 7.2.3.1 Corroborate data types

In the process of data cleaning, I checked all features in the dataset to ensure they presented the correct data types. When examining the `calendar` table, the `date` and `price` features possess incorrect data types (TEXT data type). So, I converted to its appropiate data types, being TIMESTAMP and FLOAT respectively. The `adjusted_price` column was eliminated due to being full of missing values.`

<a id="references"></a>
## **9. References**

[1] Statista, “Vacation Rentals - United States | Statista Market Forecast,” Statista. https://www.statista.com/outlook/mmo/travel-tourism/vacation-rentals/united-states (accessed April 8, 2024).
