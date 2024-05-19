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
      - [7.2.3.2 Verify data ranges](#verify-data-ranges)
      - [7.2.3.3 Check mandatory data](#check-mandatory-data)
      - [7.2.3.4 Verify data uniqueness](#verify-data-uniqueness)
      - [7.2.3.5 Validate cross-field conditions](#validate-cross-field-conditions)
- [8. Analyze](#analyze)
  - [8.1 Organize the data](#organize-the-data)
  - [8.2 Format and adjust the data](#format-and-adjust-the-data)
  - [8.3 Get input from others](#get-input-from-others)
  - [8.4 Transform the data](#transform-the-data)
- 9. [References](#references)


<a id='executive-summary'></a>
## **1. Executive summary**



<a id="introduction"></a>
## **1. Introduction**

<a id='background'></a>
### **1.1 Background**



The vacation rentals market in the United Kingdom (UK) is experiencing constant growth and evolution.  A variety of factors influence this,ranging from customer preferences, trends in the market, local special circumstances, and underlying macroeconomic factors. By 2024, it's to projected to achieve a revenue of $US\$19.77$bn, with an estimated amount of $62.57$m users, and it's expected that $79\%$ of the total revenue in this market will be generated through online sales [1].


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

I converted the csv files into tables by using the options provided by sqlitebrowser. Those tables are stored as a database located at `/database/edinburgh-airbnb-data.db`.

<a id="process"></a>
## **7. Process**

To make sure the data we're working with is accurate, I used certain tools and techniques to process it. First, I looked at each piece of data closely to understand its limitations and challenges. Then, I applied processes to clean the data and remove any errors or inconsistencies. By doing this, we can trust that our results are based on accurate information.

<a id="explore-data"></a>
### **7.1 Explore data**



The dataset is cross-sectional because I use a single quarterly update (March 23, 2024) from Inside Airbnb, containing Airbnb listings in a particular city for the following 12 months. Therefore, it only represents data in a single time point, there are no repeated observations over multiple time points, which is a defining characteristic of longitudinal data.


The Airbnb data for Edinburgh contain several files with data recorded on a daily level. One such file, `calendar.csv`, aggregates data about Airbnb listings, including `listing ID`, `date`, `availability`, `price`, `adjusted price`, `minimum nights`, and `maximum nights`, with 1,757,133 observations. The `detailed_listings.csv` file contains information about listings including listing ID, URL, name, description, neighborhood overview, host information, and other details about each listing (75 columns) with 4,812 observations. Additionally, the `detailed_reviews.csv` file stores information related to user's review for a listing  `listing_id`, `id`, `date`, `reviewer_id`, `reviewer_name`, and `comments` (6 columns) with 445,971 observations. The remaining files (`listings.csv`, `reviews.csv`) contain summary information about reviews and listings for visualization. The first one contains 18 columns with 4,814 observations and the second one, 2 columns with 445,971 observations.

The SQL commands to obtain the previous results are the following (`sql/process/explore-data.sql`):
```sql
-- List column names for calendar table
PRAGMA table_info(calendar);

-- Count number of observations for calendar table
SELECT COUNT(*)
FROM calendar;

-- List column names for listings table
PRAGMA table_info(listings);

-- Count number of observations for listings table
SELECT COUNT(*)
FROM listings;

-- List column names for detailed_listings table
PRAGMA table_info(detailed_listings);

-- Count number of observations for detailed_listings table
SELECT COUNT(*)
FROM detailed_listings;

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

-- List column names for detailed_reviews table
PRAGMA table_info(detailed_reviews);

-- Count number of observations for detailed_reviews table
SELECT COUNT(*)
FROM detailed_reviews;
```

<a id="check-data-integrity"></a>
### **7.2 Check data integrity**

Determining data integrity is a critical process in data analytics to ensure that data is accurate, complete, and remains consistent throughout the analysis. In the following sections, I will demonstrate the application of various techniques designed to achieve this goal. These techniques aim to provide a thorough and effective means of managing and controlling the data during the analysis process.

<a id="describe-statistical-measures-associated-with-data-integrity"></a>
#### **7.2.1 Describe statistical measures associated with data integrity**

As previously mentioned, the sample size is unknown so the statistical power, the feasibility to perform hypothesis testing or report a margin of error is not possible. With this in mind I will only report data variability to provide some sense of uncertainty (spread of data, margin of error (indirectly), confidence intervals (indirectly)).

<a id="overcome-the-challenges-of-insufficient-data"></a>
#### **7.2.2 Overcome the challenges of insufficient data**

I decided to work with publicly available data that comes from Inside Airbnb.

<a id="discover-data-constraints"></a>
#### **7.2.3 Discover data constraints and clean data**

Data constraints refers to the limitations that affect the way you gather, clean, analyze, and interpret information. These constraints can be related to data volume, variety, quality, accessibility, timeline, and the overall effectivenes of data-driven insights. In the following sections, I will demonstrate the various methods to overcome these constraints.


<a id="corroborate-data-types"></a>
#### **7.2.3.1 Corroborate data types**

In the process of data cleaning, I checked all features in the dataset to ensure they presented correct data types. When examining the `calendar` table, the `date`, `available`, and `price` features possess incorrect data types (TEXT data type). So, I converted to its appropiate data types. SQLite supports the concept of "type affinity" on columns, with that in mind I converted all columns to NUMERIC data type [2]. The `adjusted_price` column was eliminated due to their high proportion of missing values. Next, I will show the SQL commands to achieve this.

```sql
-- Step 1: Add a new column with the NUMERIC (DATE) data type
ALTER TABLE calendar ADD COLUMN my_new_date NUMERIC;

-- Step 2: Update the new column with the converted values from the old column
UPDATE calendar
SET my_new_date = date(substr(date, 1, 4) || '-' || substr(date, 6, 2) || '-' || substr(date, 9, 2));

-- Step 3: Drop the old column
ALTER TABLE calendar DROP COLUMN date;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE calendar RENAME COLUMN my_new_date TO date;

-- Step 1: Add a new BOOLEAN column
ALTER TABLE calendar ADD COLUMN new_available BOOLEAN;

-- Step 2: Update the new column with the converted values from the old column
UPDATE calendar
SET new_available = (CASE WHEN available = 't' THEN 1 ELSE 0 END);

-- Step 3: Drop the old column
ALTER TABLE calendar DROP COLUMN available;

-- Step 4: Rename the new column to the original column name
ALTER TABLE calendar RENAME COLUMN new_available TO available;

-- Step 1: Add a new REAL column
ALTER TABLE calendar ADD COLUMN new_price REAL;

-- Step 2: Update the new column with the converted values from the old column
-- Assuming the price is in the format '$50.00'
UPDATE calendar
SET new_price = CAST(REPLACE(SUBSTR(price, 2), ',', '') AS REAL);

-- Step 3: Drop the old column
ALTER TABLE calendar DROP COLUMN price;

-- Step 4: Rename the new column to the original column name
ALTER TABLE calendar RENAME COLUMN new_price TO price;


 /* Use a common table expression (CTE) named Counts to
calculate the counts of missing and observed values.*/
WITH Counts AS (
    SELECT
        (SELECT COUNT(*) FROM calendar WHERE adjusted_price IS NULL OR adjusted_price = '') AS MissingCount,
        (SELECT COUNT(*) FROM calendar WHERE adjusted_price IS NOT NULL AND adjusted_price != '') AS ObservedCount
)
/*Then, it uses these counts to calculate the
proportions and percentages of missing and
observed values.*/
SELECT
    MissingCount,
    ObservedCount,
    MissingCount * 1.0 / (MissingCount + ObservedCount) AS MissingProportion,
    ObservedCount * 1.0 / (MissingCount + ObservedCount) AS ObservedProportion,
    MissingCount * 100.0 / (MissingCount + ObservedCount) AS MissingPercentage,
    ObservedCount * 100.0 / (MissingCount + ObservedCount) AS ObservedPercentage
FROM Counts;

-- Drop adjusted_price column
ALTER TABLE calendar DROP COLUMN adjusted_price;
```

When examining the `detailed_listings` table, the features `scrape_id`,  `last_scraped`, `host_response_rate`, `host_acceptance_rate`, `last_scraped`,  `host_is_superhost`, `host_has_profile_pic`, `host_identity_verified`, `bathrooms`, `beds`, `price`, `has_availability`, `instant_bookable`, `first_review`, `last_review`, and `calendar_last_scraped` possess incorrect data types. So, I converted to its appropiate data types. The `calendar_updated`, `neighbourhood`, `neighbourhood_group_cleansed`, `minimum_minumum_nights`, `maximum_maximum_nights`, `minimum_maximum_nights`, `maximum_minumum_nights`, `minimum_nights_avg_ntm`, `maximum_nights_avg_ntm`, and `license` columns were eliminated due to their high proportion of missing values. Next, I will show the SQL commands to achieve this.

```sql
-- Step 1: Add a new column with the INTEGER data type
ALTER TABLE detailed_listings ADD COLUMN new_scrape_id INTEGER;

-- Step 2: Update the new column with the converted values from the old column
UPDATE detailed_listings
SET new_scrape_id = CAST(scrape_id AS INTEGER);

-- Step 3: Drop the old column
ALTER TABLE detailed_listings DROP COLUMN scrape_id;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE detailed_listings RENAME COLUMN new_scrape_id TO scrape_id;

-- Step 1: Add a new column with the REAL data type
ALTER TABLE detailed_listings ADD COLUMN new_host_response_rate REAL;

-- Step 2: Update the new column with the converted values from the old column
UPDATE detailed_listings
SET new_host_response_rate = CAST(REPLACE(host_response_rate, '%', '') AS REAL);

-- Step 3: Drop the old column
ALTER TABLE detailed_listings DROP COLUMN host_response_rate;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE detailed_listings RENAME COLUMN new_host_response_rate TO host_response_rate;

-- Step 1: Add a new column with the REAL data type
ALTER TABLE detailed_listings ADD COLUMN new_host_acceptance_rate REAL;

-- Step 2: Update the new column with the converted values from the old column
UPDATE detailed_listings
SET new_host_acceptance_rate = CAST(REPLACE(host_acceptance_rate, '%', '') AS REAL);

-- Step 3: Drop the old column
ALTER TABLE detailed_listings DROP COLUMN host_acceptance_rate;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE detailed_listings RENAME COLUMN new_host_acceptance_rate TO host_acceptance_rate;

-- Step 1: Add a new column with the NUMERIC (DATE) data type
ALTER TABLE detailed_listings ADD COLUMN new_last_scraped NUMERIC;

-- Step 2: Update the new column with the converted values from the old column
UPDATE detailed_listings
SET new_last_scraped = date(substr(last_scraped, 1, 4) || '-' || substr(last_scraped, 6, 2) || '-' || substr(last_scraped, 9, 2));

-- Step 3: Drop the old column
ALTER TABLE detailed_listings DROP COLUMN last_scraped;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE detailed_listings RENAME COLUMN new_last_scraped TO last_scraped;

-- Step 1: Add a new NUMERIC (BOOLEAN) column
ALTER TABLE detailed_listings ADD COLUMN new_host_is_superhost NUMERIC;

-- Step 2: Update the new column with the converted values from the old column
UPDATE detailed_listings
SET new_host_is_superhost = (CASE WHEN host_is_superhost = 't' THEN 1 ELSE 0 END);

-- Step 3: Drop the old column
ALTER TABLE detailed_listings DROP COLUMN host_is_superhost;

-- Step 4: Rename the new column to the original column name
ALTER TABLE detailed_listings RENAME COLUMN new_host_is_superhost TO host_is_superhost;

-- Step 1: Add a new NUMERIC (BOOLEAN) column
ALTER TABLE detailed_listings ADD COLUMN new_host_has_profile_pic NUMERIC;

-- Step 2: Update the new column with the converted values from the old column
UPDATE detailed_listings
SET new_host_has_profile_pic = (CASE WHEN host_has_profile_pic = 't' THEN 1 ELSE 0 END);

-- Step 3: Drop the old column
ALTER TABLE detailed_listings DROP COLUMN host_has_profile_pic;

-- Step 4: Rename the new column to the original column name
ALTER TABLE detailed_listings RENAME COLUMN new_host_has_profile_pic TO host_has_profile_pic;

-- Step 1: Add a new NUMERIC (BOOLEAN) column
ALTER TABLE detailed_listings ADD COLUMN new_host_identity_verified NUMERIC;

-- Step 2: Update the new column with the converted values from the old column
UPDATE detailed_listings
SET new_host_identity_verified = (CASE WHEN host_identity_verified = 't' THEN 1 ELSE 0 END);

-- Step 3: Drop the old column
ALTER TABLE detailed_listings DROP COLUMN host_identity_verified;

-- Step 4: Rename the new column to the original column name
ALTER TABLE detailed_listings RENAME COLUMN new_host_identity_verified TO host_identity_verified;

-- Step 1: Add a new NUMERIC (BOOLEAN) column
ALTER TABLE detailed_listings ADD COLUMN new_host_identity_verified NUMERIC;

-- Step 2: Update the new column with the converted values from the old column
UPDATE detailed_listings
SET new_host_identity_verified = (CASE WHEN host_identity_verified = 't' THEN 1 ELSE 0 END);

-- Step 3: Drop the old column
ALTER TABLE detailed_listings DROP COLUMN host_identity_verified;

-- Step 4: Rename the new column to the original column name
ALTER TABLE detailed_listings RENAME COLUMN new_host_identity_verified TO host_identity_verified;

-- Step 1: Add a new column with the INTEGER data type
ALTER TABLE detailed_listings ADD COLUMN new_bathrooms INTEGER;

-- Step 2: Update the new column with the converted values from the old column
UPDATE detailed_listings
SET new_bathrooms = CAST(bathrooms AS INTEGER);

-- Step 3: Drop the old column
ALTER TABLE detailed_listings DROP COLUMN bathrooms;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE detailed_listings RENAME COLUMN new_bathrooms TO bathrooms;

-- Step 1: Add a new REAL column
ALTER TABLE detailed_listings ADD COLUMN new_price REAL;

-- Step 2: Update the new column with the converted values from the old column
-- Assuming the price is in the format '$50.00'
UPDATE detailed_listings
SET new_price = CAST(REPLACE(SUBSTR(price, 2), ',', '') AS REAL);

-- Step 3: Drop the old column
ALTER TABLE detailed_listings DROP COLUMN price;

-- Step 4: Rename the new column to the original column name
ALTER TABLE detailed_listings RENAME COLUMN new_price TO price;

-- Step 1: Add a new NUMERIC (BOOLEAN) column
ALTER TABLE detailed_listings ADD COLUMN new_has_availability NUMERIC;

-- Step 2: Update the new column with the converted values from the old column
UPDATE detailed_listings
SET new_has_availability = (CASE WHEN has_availability = 't' THEN 1 ELSE 0 END);

-- Step 3: Drop the old column
ALTER TABLE detailed_listings DROP COLUMN has_availability;

-- Step 4: Rename the new column to the original column name
ALTER TABLE detailed_listings RENAME COLUMN new_has_availability TO has_availability;

-- Step 1: Add a new NUMERIC (BOOLEAN) column
ALTER TABLE detailed_listings ADD COLUMN new_instant_bookable NUMERIC;

-- Step 2: Update the new column with the converted values from the old column
UPDATE detailed_listings
SET new_instant_bookable = (CASE WHEN instant_bookable = 't' THEN 1 ELSE 0 END);

-- Step 3: Drop the old column
ALTER TABLE detailed_listings DROP COLUMN instant_bookable;

-- Step 4: Rename the new column to the original column name
ALTER TABLE detailed_listings RENAME COLUMN new_instant_bookable TO instant_bookable;

-- Step 1: Add a new column with the NUMERIC (DATE) data type
ALTER TABLE detailed_listings ADD COLUMN new_first_review NUMERIC;

-- Step 2: Update the new column with the converted values from the old column
UPDATE detailed_listings
SET new_first_review = date(substr(first_review, 1, 4) || '-' || substr(first_review, 6, 2) || '-' || substr(first_review, 9, 2));

-- Step 3: Drop the old column
ALTER TABLE detailed_listings DROP COLUMN first_review;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE detailed_listings RENAME COLUMN new_first_review TO first_review;

-- Step 1: Add a new column with the NUMERIC (DATE) data type
ALTER TABLE detailed_listings ADD COLUMN new_last_review NUMERIC;

-- Step 2: Update the new column with the converted values from the old column
UPDATE detailed_listings
SET new_last_review = date(substr(last_review, 1, 4) || '-' || substr(last_review, 6, 2) || '-' || substr(last_review, 9, 2));

-- Step 3: Drop the old column
ALTER TABLE detailed_listings DROP COLUMN last_review;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE detailed_listings RENAME COLUMN new_last_review TO last_review;

-- Step 1: Add a new column with the NUMERIC (DATE) data type
ALTER TABLE detailed_listings ADD COLUMN new_calendar_last_scraped NUMERIC;

-- Step 2: Update the new column with the converted values from the old column
UPDATE detailed_listings
SET new_calendar_last_scraped = date(substr(calendar_last_scraped, 1, 4) || '-' || substr(calendar_last_scraped, 6, 2) || '-' || substr(calendar_last_scraped, 9, 2));

-- Step 3: Drop the old column
ALTER TABLE detailed_listings DROP COLUMN calendar_last_scraped;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE detailed_listings RENAME COLUMN new_calendar_last_scraped TO calendar_last_scraped;

/* Use a common table expression (CTE) named Counts to
calculate the counts of missing and observed values.*/
WITH Counts AS (
    SELECT
        (SELECT COUNT(*) FROM detailed_listings WHERE calendar_updated IS NULL OR calendar_updated = '') AS MissingCount,
        (SELECT COUNT(*) FROM detailed_listings WHERE calendar_updated IS NOT NULL AND calendar_updated != '') AS ObservedCount
)
/*Then, it uses these counts to calculate the
proportions and percentages of missing and
observed values.*/
SELECT
    MissingCount,
    ObservedCount,
    MissingCount * 1.0 / (MissingCount + ObservedCount) AS MissingProportion,
    ObservedCount * 1.0 / (MissingCount + ObservedCount) AS ObservedProportion,
    MissingCount * 100.0 / (MissingCount + ObservedCount) AS MissingPercentage,
    ObservedCount * 100.0 / (MissingCount + ObservedCount) AS ObservedPercentage
FROM Counts;

-- Drop calendar_updated column
ALTER TABLE detailed_listings DROP COLUMN calendar_updated;

-- Drop neighbourhood column
ALTER TABLE detailed_listings DROP COLUMN neighbourhood;

-- Drop neighbourhood_group_cleansed column
ALTER TABLE detailed_listings DROP COLUMN neighbourhood_group_cleansed;

-- Drop minimum_minimum_nights column
ALTER TABLE detailed_listings DROP COLUMN minimum_minimum_nights;

-- Drop maximum_minimum_nights column
ALTER TABLE detailed_listings DROP COLUMN maximum_minimum_nights;

-- Drop minimum_maximum_nights column
ALTER TABLE detailed_listings DROP COLUMN minimum_maximum_nights;

-- Drop maximum_maximum_nights column
ALTER TABLE detailed_listings DROP COLUMN maximum_maximum_nights;

-- Drop minimum_nights_avg_ntm column
ALTER TABLE detailed_listings DROP COLUMN minimum_nights_avg_ntm;

-- Drop maximum_nights_avg_ntm column
ALTER TABLE detailed_listings DROP COLUMN maximum_nights_avg_ntm;

-- Drop license column
ALTER TABLE detailed_listings DROP COLUMN license;
```

When examining the `detailed_reviews` table, the column `date` possess incorrect data types. Consequently, I did so. Next, I will show the SQL commands to achieve this.

```sql
-- Step 1: Add a new column with the NUMERIC (DATE) data type
ALTER TABLE detailed_reviews ADD COLUMN new_date NUMERIC;

-- Step 2: Update the new column with the converted values from the old column
UPDATE detailed_reviews
SET new_date = date(substr(date, 1, 4) || '-' || substr(date, 6, 2) || '-' || substr(date, 9, 2));

-- Step 3: Drop the old column
ALTER TABLE detailed_reviews DROP COLUMN date;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE detailed_reviews RENAME COLUMN new_date TO date;
```

When examining the `listings` table, the `price`, `last_review`, and `reviews_per_month` columns, possess incorrect data types. Consequently, I did so. The `neighbourhood_group`, and `license` columns were eliminated due to their high proportion of missing values. Next, I will show the SQL commands to achieve this.

```sql
-- Step 1: Add a new column with the REAL data type
ALTER TABLE listings ADD COLUMN new_price REAL;

-- Step 2: Update the new column with the converted values from the old column
UPDATE listings
SET new_price = CAST(price AS REAL);

-- Step 3: Drop the old column
ALTER TABLE listings DROP COLUMN price;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE listings RENAME COLUMN new_price TO price;

-- Step 1: Add a new column with the NUMERIC (DATE) data type
ALTER TABLE listings ADD COLUMN new_last_review NUMERIC;

-- Step 2: Update the new column with the converted values from the old column
UPDATE listings
SET new_last_review = date(substr(last_review, 1, 4) || '-' || substr(last_review, 6, 2) || '-' || substr(last_review, 9, 2));

-- Step 3: Drop the old column
ALTER TABLE listings DROP COLUMN last_review;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE listings RENAME COLUMN new_last_review TO last_review;

-- Step 1: Add a new column with the INTEGER data type
ALTER TABLE listings ADD COLUMN new_reviews_per_month INTEGER;

-- Step 2: Update the new column with the converted values from the old column
UPDATE listings
SET new_reviews_per_month = CAST(reviews_per_month AS INTEGER);

-- Step 3: Drop the old column
ALTER TABLE listings DROP COLUMN reviews_per_month;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE listings RENAME COLUMN new_reviews_per_month TO reviews_per_month;

-- Drop neighbourhood_group column
ALTER TABLE listings DROP COLUMN neighbourhood_group;

-- Drop license column
ALTER TABLE listings DROP COLUMN license;
```

When examining the `reviews` table, the `date` column, possess incorrect data types. Consequently, I did so. Next, I will show the SQL commands to achieve this.
```sql
-- Step 1: Add a new column with the NUMERIC (DATE data type
ALTER TABLE reviews ADD COLUMN new_date NUMERIC;

-- Step 2: Update the new column with the converted values from the old column
UPDATE reviews
SET new_date = date(substr(date, 1, 4) || '-' || substr(date, 6, 2) || '-' || substr(date, 9, 2));

-- Step 3: Drop the old column
ALTER TABLE reviews DROP COLUMN date;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE reviews RENAME COLUMN new_date TO date;
```


<a id="verify-data-ranges"></a>
#### **7.2.3.2 Verify data ranges**

I performed the data ranges verification process of all columns across all tables. Subsequently, I create several tables containing the observations that met several conditions. Resulting to in some tables with less observations. Specifically, the `listings`, and `detailed_listings` tables were reduced by 39.13% (2930 observations), and 20.86% (3808 observations) respectively. The other ones remain equal.

```sql
-- Filter out data that doesn't meet the following conditions (calendar table)
CREATE TABLE calendar_processed AS
SELECT *
FROM calendar
WHERE (date BETWEEN '2024-03-23' AND '2025-03-23') AND
  (price > 0);

-- Filter out data that doesn't meet the following conditions (detailed_listings table)
CREATE TABLE detailed_listings_processed AS
SELECT *
FROM detailed_listings
WHERE (host_response_time IN ('within an hour', 'within a day', 'within a few hours', 'a few days or more')) AND
  (host_response_rate > 0) AND
  (host_acceptance_rate > 0) AND
  (host_listings_count > 0) AND
  (host_total_listings_count > 0) AND
  (accommodates > 0) AND
  (bedrooms > 0) AND
  (beds > 0) AND
  (has_availability = 1) AND
  (availability_30 BETWEEN 0 AND 30) AND
  (availability_60 BETWEEN 0 AND 60) AND
  (availability_90 BETWEEN 0 AND 90) AND
  (availability_365 BETWEEN 0 AND 365) AND
  (review_scores_rating BETWEEN 0 AND 5) AND
  (review_scores_accuracy BETWEEN 0 AND 5) AND
  (review_scores_cleanliness BETWEEN 0 AND 5) AND
  (review_scores_checkin BETWEEN 0 AND 5) AND
  (review_scores_communication BETWEEN 0 AND 5) AND
  (review_scores_location BETWEEN 0 AND 5) AND
  (review_scores_value BETWEEN 0 AND 5) AND
  (calculated_host_listings_count > 0) AND
  (calculated_host_listings_count_entire_homes >= 0) AND
  (calculated_host_listings_count_private_rooms >= 0) AND
  (calculated_host_listings_count_shared_rooms >= 0) AND
  (reviews_per_month > 0) AND
  (last_scraped IN ('2024-03-24', '2024-03-23')) AND
  (bathrooms > 0) AND
  (price > 0) AND
  (first_review <= '2024-03-24') AND
  (last_review <= '2024-03-24') AND
  (calendar_last_scraped IN ('2024-03-24', '2024-03-23'));

-- Filter out data that doesn't meet the following conditions (detailed_reviews table)
CREATE TABLE detailed_reviews_processed AS
SELECT *
FROM detailed_reviews
WHERE (date <= '2024-03-23');

-- Filter out data that doesn't meet the following conditions (listings table)
CREATE TABLE listings_processed AS
SELECT *
FROM listings
WHERE (number_of_reviews > 0) AND
  (calculated_host_listings_count > 0) AND
  (availability_365 BETWEEN 0 AND 365) AND
  (number_of_reviews_ltm > 0) AND
  (price > 0) AND
  (last_review <= '2024-03-23') AND
  (reviews_per_month > 0);

-- Filter out data that doesn't meet the following conditions (reviews table)
CREATE TABLE reviews_processed AS
SELECT *
FROM reviews
WHERE (date <= '2024-03-23')
```

<a id="check-mandatory-data"></a>
##### **7.2.3.3 Check mandatory data**

The presence of missing values in a dataset is universal. When handling inadequately lead to loss of eficiency and bias. First, The extension of information loss is intrinsically linked to the analysis question. Second, the subsets of complete observations may not be representative of the population under study. Restricting analysis to complete records may then lead to biased interpretations. The extent of such bias depends on the statistical behavior of the missing data. So, a formal framework to describe this behaviour is thus fundamental. I show what methodology was applied in the following sections.

I found missing observations in the `listings_wide` table and remove them. The missing values were present in the `description` (51 missing values or 1.33%), `neighbourhoods_overview` (984 missing values, representing 25.84%), `host_location` (632 missing values, representing 16.59%), `host_about` (1465 missing values, representing 38.47%), `host_neighbourhood` (2277 missing values, representing 59.79%) columns. SQlite possess limitations to handle missing data, therefore, the most appropiate method is complete case analysis (CCA). After applying this method, the amount of observations is 944, representing a reduction of 80.13%. It's important to note that by applying the previously mentioned method, some introduced bias will affect the analysis. Next, I will show the SQL commands to achieve this.

```sql
-- Check mandatory data

-- Determine amount of missing values per column in calendar_processed table
SELECT
    COUNT(*) - COUNT(listing_id) as missing_values_listing_id,
    COUNT(listing_id) as observed_values_listing_id,
    COUNT(*) - COUNT(minimum_nights) as missing_values_minimum_nights,
    COUNT(minimum_nights) as observed_values_minimum_nights,
	COUNT(*) - COUNT(maximum_nights) as missing_values_maximum_nights,
    COUNT(maximum_nights) as observed_values_maximum_nights,
	COUNT(*) - COUNT(date) as missing_values_date,
    COUNT(date) as observed_values_date,
	COUNT(*) - COUNT(available) as missing_values_available,
    COUNT(available) as observed_values_available,
	COUNT(*) - COUNT(maximum_nights) as missing_values_price,
    COUNT(price) as observed_values_price
FROM calendar_processed;

-- Determine amount of missing values per column in listings_processed table
SELECT
    COUNT(*) - COUNT(id) as missing_values_id,
    COUNT(id) as observed_values_id,
    COUNT(*) - COUNT(name) as missing_values_name,
    COUNT(name) as observed_values_name,
	COUNT(*) - COUNT(host_id) as missing_values_host_id,
    COUNT(host_id) as observed_values_host_id,
	COUNT(*) - COUNT(host_name) as missing_values_host_name,
    COUNT(host_name) as observed_values_host_name,
	COUNT(*) - COUNT(neighbourhood) as missing_values_neighbourhood,
    COUNT(neighbourhood) as observed_values_neighbourhood,
	COUNT(*) - COUNT(latitude) as missing_values_latitude,
    COUNT(latitude) as observed_values_latitude,
	COUNT(*) - COUNT(longitude) as missing_values_longitude,
    COUNT(longitude) as observed_values_longitude,
	COUNT(*) - COUNT(room_type) as missing_values_room_type,
    COUNT(room_type) as observed_values_room_type,
	COUNT(*) - COUNT(minimum_nights) as missing_values_minimum_nights,
    COUNT(minimum_nights) as observed_values_minimum_nights,
	COUNT(*) - COUNT(number_of_reviews) as missing_values_number_of_reviews,
    COUNT(number_of_reviews) as observed_values_number_of_reviews,
	COUNT(*) - COUNT(calculated_host_listings_count) as missing_values_calculated_host_listings_count,
    COUNT(calculated_host_listings_count) as observed_values_calculated_host_listings_count,
	COUNT(*) - COUNT(availability_365) as missing_values_availability_365,
    COUNT(availability_365) as observed_values_availability_365,
	COUNT(*) - COUNT(number_of_reviews_ltm) as missing_values_number_of_reviews_ltm,
    COUNT(number_of_reviews_ltm) as observed_values_number_of_reviews_ltm,
	COUNT(*) - COUNT(price) as missing_values_price,
    COUNT(price) as observed_values_price,
	COUNT(*) - COUNT(last_review) as missing_values_last_review,
    COUNT(last_review) as observed_values_last_review,
	COUNT(*) - COUNT(reviews_per_month) as missing_values_reviews_per_month,
    COUNT(reviews_per_month) as observed_values_reviews_per_month
FROM listings_processed;

-- Determine amount of missing values per column in detailed_listings_processed table
SELECT
    COUNT(*) - COUNT(id) as missing_values_id,
    COUNT(id) as observed_values_id,
    COUNT(*) - COUNT(listing_url) as missing_values_listing_url,
    COUNT(listing_url) as observed_values_listing_url,
	COUNT(*) - COUNT(source) as missing_values_source,
    COUNT(source) as observed_values_source,
	COUNT(*) - COUNT(name) as missing_values_name,
    COUNT(name) as observed_values_name,
	COUNT(*) - COUNT(description) as missing_values_description, -- 6
    COUNT(description) as observed_values_description, -- 288
	COUNT(*) - COUNT(neighborhood_overview) as missing_values_neighborhood_overview, -- 106
    COUNT(neighborhood_overview) as observed_values_neighborhood_overview, -- 188
	COUNT(*) - COUNT(picture_url) as missing_values_picture_url,
    COUNT(picture_url) as observed_values_picture_url,
	COUNT(*) - COUNT(host_id) as missing_values_host_id,
    COUNT(host_id) as observed_values_host_id,
	COUNT(*) - COUNT(host_url) as missing_values_host_url,
    COUNT(host_url) as observed_values_host_url,
	COUNT(*) - COUNT(host_name) as missing_values_host_name,
    COUNT(host_name) as observed_values_host_name,
	COUNT(*) - COUNT(host_since) as missing_values_calculated_host_since,
    COUNT(host_since) as observed_values_host_since,
	COUNT(*) - COUNT(host_location) as missing_values_host_location, -- 54
    COUNT(host_location) as observed_values_host_location, -- 240
	COUNT(*) - COUNT(host_about) as missing_values_host_about, -- 132
    COUNT(host_about) as observed_values_host_about, -- 162
	COUNT(*) - COUNT(host_response_time) as missing_values_host_response_time,
    COUNT(host_response_time) as observed_values_host_response_time,
	COUNT(*) - COUNT(host_thumbnail_url) as missing_values_host_thumbnail_url,
    COUNT(host_thumbnail_url) as observed_values_host_thumbnail_url,
	COUNT(*) - COUNT(host_picture_url) as missing_values_host_picture_url,
    COUNT(host_picture_url) as observed_values_host_picture_url,
	COUNT(*) - COUNT(host_neighbourhood) as missing_values_host_neighbourhood, --61
    COUNT(host_neighbourhood) as observed_values_host_neighbourhood, -- 233
	COUNT(*) - COUNT(host_listings_count) as missing_values_host_listings_count,
    COUNT(host_listings_count) as observed_values_host_listings_count,
	COUNT(*) - COUNT(host_total_listings_count) as missing_values_host_total_listings_count,
    COUNT(host_total_listings_count) as observed_values_host_total_listings_count,
	COUNT(*) - COUNT(host_verifications) as missing_values_host_verifications,
    COUNT(host_verifications) as observed_values_host_verifications,
	COUNT(*) - COUNT(neighbourhood_cleansed) as missing_values_neighbourhood_cleansed,
    COUNT(neighbourhood_cleansed) as observed_values_neighbourhood_cleansed,
	COUNT(*) - COUNT(latitude) as missing_values_latitude,
    COUNT(latitude) as observed_values_latitude,
	COUNT(*) - COUNT(longitude) as missing_values_longitude,
    COUNT(longitude) as observed_values_longitude,
	COUNT(*) - COUNT(property_type) as missing_values_property_type,
    COUNT(property_type) as observed_values_property_type,
	COUNT(*) - COUNT(room_type) as missing_values_room_type,
    COUNT(room_type) as observed_values_room_type,
	COUNT(*) - COUNT(accommodates) as missing_values_accommodates,
    COUNT(accommodates) as observed_values_accommodates,
	COUNT(*) - COUNT(bathrooms_text) as missing_values_bathrooms_text,
    COUNT(bathrooms_text) as observed_values_bathrooms_text,
	COUNT(*) - COUNT(bedrooms) as missing_values_bedrooms,
    COUNT(bedrooms) as observed_values_bedrooms,
	COUNT(*) - COUNT(beds) as missing_values_beds,
    COUNT(beds) as observed_values_beds,
	COUNT(*) - COUNT(amenities) as missing_values_amenities,
    COUNT(amenities) as observed_values_amenities,
	COUNT(*) - COUNT(minimum_nights) as missing_values_minimum_nights,
    COUNT(minimum_nights) as observed_values_minimum_nights,
	COUNT(*) - COUNT(maximum_nights) as missing_values_maximum_nights,
    COUNT(maximum_nights) as observed_values_maximum_nights,
	COUNT(*) - COUNT(availability_30) as missing_values_availability_30,
    COUNT(availability_30) as observed_values_availability_30,
	COUNT(*) - COUNT(availability_60) as missing_values_availability_60,
    COUNT(availability_60) as observed_values_availability_60,
	COUNT(*) - COUNT(availability_90) as missing_values_availability_90,
    COUNT(availability_90) as observed_values_availability_90,
	COUNT(*) - COUNT(availability_365) as missing_values_availability_365,
    COUNT(availability_365) as observed_values_availability_365,
	COUNT(*) - COUNT(number_of_reviews) as missing_values_number_of_reviews,
    COUNT(number_of_reviews) as observed_values_number_of_reviews,
	COUNT(*) - COUNT(number_of_reviews_ltm) as missing_values_number_of_reviews_ltm,
    COUNT(number_of_reviews_ltm) as observed_values_number_of_reviews_ltm,
	COUNT(*) - COUNT(number_of_reviews_l30d) as missing_values_number_of_reviews_l30d,
    COUNT(number_of_reviews_l30d) as observed_values_number_of_reviews_l30d,
	COUNT(*) - COUNT(review_scores_rating) as missing_values_review_scores_rating,
    COUNT(review_scores_rating) as observed_values_review_scores_rating,
	COUNT(*) - COUNT(review_scores_accuracy) as missing_values_review_scores_accuracy,
    COUNT(review_scores_accuracy) as observed_values_review_scores_accuracy,
	COUNT(*) - COUNT(review_scores_cleanliness) as missing_values_review_scores_cleanliness,
    COUNT(review_scores_cleanliness) as observed_values_review_scores_cleanliness,
	COUNT(*) - COUNT(review_scores_checkin) as missing_values_review_scores_checkin,
    COUNT(review_scores_checkin) as observed_values_review_scores_checkin,
	COUNT(*) - COUNT(review_scores_communication) as missing_values_review_scores_communication,
    COUNT(review_scores_communication) as observed_values_review_scores_communication,
	COUNT(*) - COUNT(review_scores_location) as missing_values_review_scores_location,
    COUNT(review_scores_location) as observed_values_review_scores_location,
	COUNT(*) - COUNT(review_scores_value) as missing_values_review_scores_value,
    COUNT(review_scores_value) as observed_values_review_scores_value,
	COUNT(*) - COUNT(calculated_host_listings_count) as missing_values_calculated_host_listings_count,
    COUNT(calculated_host_listings_count) as observed_values_calculated_host_listings_count,
	COUNT(*) - COUNT(calculated_host_listings_count_entire_homes) as missing_values_calculated_host_listings_count_entire_homes,
    COUNT(calculated_host_listings_count_entire_homes) as observed_values_calculated_host_listings_count_entire_homes,
	COUNT(*) - COUNT(calculated_host_listings_count_private_rooms) as missing_values_calculated_host_listings_count_private_rooms,
    COUNT(calculated_host_listings_count_private_rooms) as observed_values_calculated_host_listings_count_private_rooms,
	COUNT(*) - COUNT(calculated_host_listings_count_shared_rooms) as missing_values_calculated_host_listings_count_shared_rooms,
    COUNT(calculated_host_listings_count_shared_rooms) as observed_values_calculated_host_listings_count_shared_rooms,
	COUNT(*) - COUNT(reviews_per_month) as missing_values_reviews_per_month,
    COUNT(reviews_per_month) as observed_values_reviews_per_month,
	COUNT(*) - COUNT(scrape_id) as missing_values_scrape_id,
    COUNT(scrape_id) as observed_values_scrape_id,
	COUNT(*) - COUNT(last_scraped) as missing_values_last_scraped,
    COUNT(last_scraped) as observed_values_last_scraped,
	COUNT(*) - COUNT(host_is_superhost) as missing_values_host_is_superhost,
    COUNT(host_is_superhost) as observed_values_host_is_superhost,
	COUNT(*) - COUNT(host_has_profile_pic) as missing_values_host_has_profile_pic,
    COUNT(host_has_profile_pic) as observed_values_host_has_profile_pic,
	COUNT(*) - COUNT(host_identity_verified) as missing_values_host_identity_verified,
    COUNT(host_identity_verified) as observed_values_host_identity_verified,
	COUNT(*) - COUNT(bathrooms) as missing_values_bathrooms,
    COUNT(bathrooms) as observed_values_bathrooms,
	COUNT(*) - COUNT(price) as missing_values_price,
    COUNT(price) as observed_values_price,
	COUNT(*) - COUNT(has_availability) as missing_values_has_availability,
    COUNT(has_availability) as observed_values_has_availability,
	COUNT(*) - COUNT(instant_bookable) as missing_values_instant_bookable,
    COUNT(instant_bookable) as observed_values_instant_bookable,
	COUNT(*) - COUNT(first_review) as missing_values_first_review,
    COUNT(first_review) as observed_values_first_review,
	COUNT(*) - COUNT(last_review) as missing_values_last_review,
    COUNT(last_review) as observed_values_last_review,
	COUNT(*) - COUNT(calendar_last_scraped) as missing_values_calendar_last_scraped,
    COUNT(calendar_last_scraped) as observed_values_calendar_last_scraped,
	COUNT(*) - COUNT(host_response_rate) as missing_values_host_response_rate,
    COUNT(host_response_rate) as observed_values_host_response_rate,
	COUNT(*) - COUNT(host_acceptance_rate) as missing_values_host_acceptance_rate,
    COUNT(host_acceptance_rate) as observed_values_host_acceptance_rate
FROM detailed_listings_processed;

-- Remove missing data from detailed_listings_processed table
DELETE FROM detailed_listings_processed
WHERE description IS NULL
OR neighborhood_overview IS NULL
OR host_location IS NULL
OR host_about IS NULL
OR host_neighbourhood IS NULL;

-- Determine amount of missing values per column in reviews_processed table
SELECT
    COUNT(*) - COUNT(listing_id) as missing_values_listing_id,
    COUNT(listing_id) as observed_values_listing_id,
    COUNT(*) - COUNT(date) as missing_values_date,
    COUNT(date) as observed_values_date
FROM reviews_processed;

-- Determine amount of missing values per column in detailed_reviews__processed table
SELECT
    COUNT(*) - COUNT(listing_id) as missing_values_listing_id,
    COUNT(listing_id) as observed_values_listing_id,
    COUNT(*) - COUNT(id) as missing_values_id,
    COUNT(id) as observed_values_id,
	COUNT(*) - COUNT(reviewer_id) as missing_values_reviewer_id,
    COUNT(reviewer_id) as observed_values_reviewer_id,
	COUNT(*) - COUNT(reviewer_name) as missing_values_reviewer_name,
    COUNT(reviewer_name) as observed_values_reviewer_name,
	COUNT(*) - COUNT(comments) as missing_values_comments,
    COUNT(comments) as observed_values_comments,
	COUNT(*) - COUNT(date) as missing_values_date,
    COUNT(date) as observed_values_date
FROM detailed_reviews_processed;
```
<a id="verify-data-uniqueness></a>
##### **7.2.3.4 Verify data uniqueness**

The data exhibits no duplicate records with an exception in `reviews_processed` table. The exception is due to multiple reviews created at different dates for a listing.

```sql
-- VERIFY DATA UNIQUENESS

-- Verify data uniqueness for calendar_processed table
SELECT COUNT(DISTINCT(listing_id))
FROM calendar_processed;

-- Verify data uniqueness for listings_processed table
SELECT COUNT(DISTINCT(id))
FROM listings_processed;

-- Verify data uniqueness for detailed_listings_processed table
SELECT COUNT(DISTINCT(id))
FROM detailed_listings_processed;

-- Verify data uniqueness for reviews_processed table
SELECT COUNT(DISTINCT(listing_id))
FROM reviews_processed;

-- Verify data uniqueness for detailed_reviews_processed table
SELECT COUNT(DISTINCT(id))
FROM detailed_reviews_processed;
```

<a id="validate-cross-field-conditions></a>
##### **7.2.3.5 Validate cross field conditions**

After validating cross field conditions the data remains the same in all tables.
```sql
-- Validate cross-field conditions

-- Validate cross-field conditions for calendar_processed table
SELECT COUNT(*)
FROM calendar_processed
WHERE minimum_nights <= maximum_nights

-- Validate cross-field conditions for listings_processed table
SELECT COUNT(*)
FROM listings_processed
WHERE number_of_reviews_ltm <= number_of_reviews

-- Validate cross-field conditions for detailed_listings_processed table
SELECT COUNT(*)
FROM detailed_listings_processed
WHERE minimum_nights <= maximum_nights
AND number_of_reviews_ltm <= number_of_reviews
AND number_of_reviews_l30d <= number_of_reviews
AND number_of_reviews_l30d <= number_of_reviews_ltm
AND first_review <= last_review

-- Validate cross-field conditions for reviews_processed table
SELECT COUNT(*)
FROM reviews_processed
WHERE minimum_nights <= maximum_nights
AND number_of_reviews_ltm <= number_of_reviews
AND number_of_reviews_l30d <= number_of_reviews
AND number_of_reviews_l30d <= number_of_reviews_ltm
AND first_review <= last_review
```





<a id="references"></a>
## **9. References**

[1] Statista, “Vacation Rentals - United States | Statista Market Forecast,” Statista. https://www.statista.com/outlook/mmo/travel-tourism/vacation-rentals/united-states (accessed April 8, 2024).

[2] SQLite, “Datatypes In SQLite Version 3,” Sqlite. https://www.sqlite.org/datatype3.html (accessed April 8, 2024).
‌
