
-- CHECK DATA TYPES

-- Step 1: Add a new column with the DATE data type
ALTER TABLE calendar ADD COLUMN my_new_date DATE;

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

-- Step 1: Add a new column with the INTEGER data type
ALTER TABLE listings_wide ADD COLUMN new_scrape_id INTEGER;

-- Step 2: Update the new column with the converted values from the old column
UPDATE listings_wide
SET new_scrape_id = CAST(scrape_id AS INTEGER);

-- Step 3: Drop the old column
ALTER TABLE listings_wide DROP COLUMN scrape_id;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE listings_wide RENAME COLUMN new_scrape_id TO scrape_id;


-- Step 1: Add a new column with the DATE data type
ALTER TABLE listings_wide ADD COLUMN new_last_scraped DATE;

-- Step 2: Update the new column with the converted values from the old column
UPDATE listings_wide
SET new_last_scraped = date(substr(last_scraped, 1, 4) || '-' || substr(last_scraped, 6, 2) || '-' || substr(last_scraped, 9, 2));

-- Step 3: Drop the old column
ALTER TABLE listings_wide DROP COLUMN last_scraped;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE listings_wide RENAME COLUMN new_last_scraped TO last_scraped;

-- Step 1: Add a new BOOLEAN column
ALTER TABLE listings_wide ADD COLUMN new_host_is_superhost BOOLEAN;

-- Step 2: Update the new column with the converted values from the old column
UPDATE listings_wide
SET new_host_is_superhost = (CASE WHEN host_is_superhost = 't' THEN 1 ELSE 0 END);

-- Step 3: Drop the old column
ALTER TABLE listings_wide DROP COLUMN host_is_superhost;

-- Step 4: Rename the new column to the original column name
ALTER TABLE listings_wide RENAME COLUMN new_host_is_superhost TO host_is_superhost;

-- Step 1: Add a new BOOLEAN column
ALTER TABLE listings_wide ADD COLUMN new_host_has_profile_pic BOOLEAN;

-- Step 2: Update the new column with the converted values from the old column
UPDATE listings_wide
SET new_host_has_profile_pic = (CASE WHEN host_has_profile_pic = 't' THEN 1 ELSE 0 END);

-- Step 3: Drop the old column
ALTER TABLE listings_wide DROP COLUMN host_has_profile_pic;

-- Step 4: Rename the new column to the original column name
ALTER TABLE listings_wide RENAME COLUMN new_host_has_profile_pic TO host_has_profile_pic;

-- Step 1: Add a new BOOLEAN column
ALTER TABLE listings_wide ADD COLUMN new_host_identity_verified BOOLEAN;

-- Step 2: Update the new column with the converted values from the old column
UPDATE listings_wide
SET new_host_identity_verified = (CASE WHEN host_identity_verified = 't' THEN 1 ELSE 0 END);

-- Step 3: Drop the old column
ALTER TABLE listings_wide DROP COLUMN host_identity_verified;

-- Step 4: Rename the new column to the original column name
ALTER TABLE listings_wide RENAME COLUMN new_host_identity_verified TO host_identity_verified;

-- Step 1: Add a new BOOLEAN column
ALTER TABLE listings_wide ADD COLUMN new_host_identity_verified BOOLEAN;

-- Step 2: Update the new column with the converted values from the old column
UPDATE listings_wide
SET new_host_identity_verified = (CASE WHEN host_identity_verified = 't' THEN 1 ELSE 0 END);

-- Step 3: Drop the old column
ALTER TABLE listings_wide DROP COLUMN host_identity_verified;

-- Step 4: Rename the new column to the original column name
ALTER TABLE listings_wide RENAME COLUMN new_host_identity_verified TO host_identity_verified;

-- Step 1: Add a new column with the INTEGER data type
ALTER TABLE listings_wide ADD COLUMN new_bathrooms INTEGER;

-- Step 2: Update the new column with the converted values from the old column
UPDATE listings_wide
SET new_bathrooms = CAST(bathrooms AS INTEGER);

-- Step 3: Drop the old column
ALTER TABLE listings_wide DROP COLUMN bathrooms;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE listings_wide RENAME COLUMN new_bathrooms TO bathrooms;

-- Step 1: Add a new REAL column
ALTER TABLE listings_wide ADD COLUMN new_price REAL;

-- Step 2: Update the new column with the converted values from the old column
-- Assuming the price is in the format '$50.00'
UPDATE listings_wide
SET new_price = CAST(REPLACE(SUBSTR(price, 2), ',', '') AS REAL);

-- Step 3: Drop the old column
ALTER TABLE listings_wide DROP COLUMN price;

-- Step 4: Rename the new column to the original column name
ALTER TABLE listings_wide RENAME COLUMN new_price TO price;

-- Step 1: Add a new BOOLEAN column
ALTER TABLE listings_wide ADD COLUMN new_has_availability BOOLEAN;

-- Step 2: Update the new column with the converted values from the old column
UPDATE listings_wide
SET new_has_availability = (CASE WHEN has_availability = 't' THEN 1 ELSE 0 END);

-- Step 3: Drop the old column
ALTER TABLE listings_wide DROP COLUMN has_availability;

-- Step 4: Rename the new column to the original column name
ALTER TABLE listings_wide RENAME COLUMN new_has_availability TO has_availability;

-- Step 1: Add a new BOOLEAN column
ALTER TABLE listings_wide ADD COLUMN new_instant_bookable BOOLEAN;

-- Step 2: Update the new column with the converted values from the old column
UPDATE listings_wide
SET new_instant_bookable = (CASE WHEN instant_bookable = 't' THEN 1 ELSE 0 END);

-- Step 3: Drop the old column
ALTER TABLE listings_wide DROP COLUMN instant_bookable;

-- Step 4: Rename the new column to the original column name
ALTER TABLE listings_wide RENAME COLUMN new_instant_bookable TO instant_bookable;

-- Step 1: Add a new column with the DATE data type
ALTER TABLE listings_wide ADD COLUMN new_first_review DATE;

-- Step 2: Update the new column with the converted values from the old column
UPDATE listings_wide
SET new_first_review = date(substr(first_review, 1, 4) || '-' || substr(first_review, 6, 2) || '-' || substr(first_review, 9, 2));

-- Step 3: Drop the old column
ALTER TABLE listings_wide DROP COLUMN first_review;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE listings_wide RENAME COLUMN new_first_review TO first_review;

-- Step 1: Add a new column with the DATE data type
ALTER TABLE listings_wide ADD COLUMN new_last_review DATE;

-- Step 2: Update the new column with the converted values from the old column
UPDATE listings_wide
SET new_last_review = date(substr(last_review, 1, 4) || '-' || substr(last_review, 6, 2) || '-' || substr(last_review, 9, 2));

-- Step 3: Drop the old column
ALTER TABLE listings_wide DROP COLUMN last_review;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE listings_wide RENAME COLUMN new_last_review TO last_review;

-- Step 1: Add a new column with the DATE data type
ALTER TABLE listings_wide ADD COLUMN new_calendar_last_scraped DATE;

-- Step 2: Update the new column with the converted values from the old column
UPDATE listings_wide
SET new_calendar_last_scraped = date(substr(calendar_last_scraped, 1, 4) || '-' || substr(calendar_last_scraped, 6, 2) || '-' || substr(calendar_last_scraped, 9, 2));

-- Step 3: Drop the old column
ALTER TABLE listings_wide DROP COLUMN calendar_last_scraped;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE listings_wide RENAME COLUMN new_calendar_last_scraped TO calendar_last_scraped;

/* Use a common table expression (CTE) named Counts to
calculate the counts of missing and observed values.*/
WITH Counts AS (
    SELECT
        (SELECT COUNT(*) FROM listings_wide WHERE calendar_updated IS NULL OR calendar_updated = '') AS MissingCount,
        (SELECT COUNT(*) FROM listings_wide WHERE calendar_updated IS NOT NULL AND calendar_updated != '') AS ObservedCount
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
ALTER TABLE listings_wide DROP COLUMN calendar_updated;

-- Drop neighbourhood column
ALTER TABLE listings_wide DROP COLUMN neighbourhood;

-- Drop neighbourhood_group_cleansed column
ALTER TABLE listings_wide DROP COLUMN neighbourhood_group_cleansed;

-- Drop minimum_minimum_nights column
ALTER TABLE listings_wide DROP COLUMN minimum_minimum_nights;

-- Drop maximum_minimum_nights column
ALTER TABLE listings_wide DROP COLUMN maximum_minimum_nights;

-- Drop minimum_maximum_nights column
ALTER TABLE listings_wide DROP COLUMN minimum_maximum_nights;

-- Drop maximum_maximum_nights column
ALTER TABLE listings_wide DROP COLUMN maximum_maximum_nights;

-- Drop minimum_nights_avg_ntm column
ALTER TABLE listings_wide DROP COLUMN minimum_nights_avg_ntm;

-- Drop maximum_nights_avg_ntm column
ALTER TABLE listings_wide DROP COLUMN maximum_nights_avg_ntm;

-- Drop license column
ALTER TABLE listings_wide DROP COLUMN license;

-- Step 1: Add a new column with the DATE data type
ALTER TABLE reviews_wide ADD COLUMN new_date DATE;

-- Step 2: Update the new column with the converted values from the old column
UPDATE reviews_wide
SET new_date = date(substr(date, 1, 4) || '-' || substr(date, 6, 2) || '-' || substr(date, 9, 2));

-- Step 3: Drop the old column
ALTER TABLE reviews_wide DROP COLUMN date;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE reviews_wide RENAME COLUMN new_date TO date;

-- Drop new_last_review column
ALTER TABLE reviews_wide DROP COLUMN new_last_review;

-- Step 1: Add a new column with the REAL data type
ALTER TABLE listings ADD COLUMN new_price REAL;

-- Step 2: Update the new column with the converted values from the old column
UPDATE listings
SET new_price = CAST(price AS REAL);

-- Step 3: Drop the old column
ALTER TABLE listings DROP COLUMN price;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE listings RENAME COLUMN new_price TO price;

-- Step 1: Add a new column with the DATE data type
ALTER TABLE listings ADD COLUMN new_last_review DATE;

-- Step 2: Update the new column with the converted values from the old column
UPDATE listings
SET new_last_review = date(substr(last_review, 1, 4) || '-' || substr(last_review, 6, 2) || '-' || substr(last_review, 9, 2));

-- Step 3: Drop the old column
ALTER TABLE listings DROP COLUMN last_review;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE listings RENAME COLUMN new_last_review TO last_review;

-- Step 1: Add a new column with the REAL data type
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

-- Step 1: Add a new column with the DATE data type
ALTER TABLE reviews ADD COLUMN new_date DATE;

-- Step 2: Update the new column with the converted values from the old column
UPDATE reviews
SET new_date = date(substr(date, 1, 4) || '-' || substr(date, 6, 2) || '-' || substr(date, 9, 2));

-- Step 3: Drop the old column
ALTER TABLE reviews DROP COLUMN date;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE reviews RENAME COLUMN new_date TO date;

-- VERIFY DATA RANGE 

-- Filter out data that doesn't meet the following conditions (calendar table)
SELECT * 
FROM calendar
WHERE (minimum_nights BETWEEN 1 AND 365) AND (maximum_nights BETWEEN 1 AND 1125) AND (date BETWEEN '2024-03-10' AND '2025-03-10') AND (available IN (0, 1)) AND (price > 0)

-- Filter out data that doesn't meet the following conditions (listings_wide table)
SELECT * 
FROM listings_wide
WHERE (source IN (SELECT DISTINCT source FROM listings_wide)) AND
  (host_response_time IN ('within an hour', 'within a day', 'within a few hours', 'a few days or more')) AND
  (host_response_rate > 0) AND
  (host_acceptance_rate > 0) AND
  (host_listings_count > 0) AND
  (host_total_listings_count > 0) AND 
  (property_type IN (SELECT DISTINCT property_type FROM listings_wide)) AND
  (room_type IN (SELECT DISTINCT room_type FROM listings_wide)) AND
  (accommodates > 0) AND
  (bedrooms > 0) AND
  (beds > 0) AND
  (minimum_nights BETWEEN 1 AND 365) AND
  (maximum_nights BETWEEN 1 AND 1125) AND
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
  (last_scraped IN (SELECT DISTINCT last_scraped FROM listings_wide)) AND
  (host_is_superhost IN (SELECT DISTINCT host_is_superhost FROM listings_wide)) AND
  (host_has_profile_pic IN (SELECT DISTINCT host_has_profile_pic FROM listings_wide)) AND
  (host_identity_verified IN (SELECT DISTINCT host_identity_verified FROM listings_wide)) AND
  (bathrooms > 0) AND
  (price > 0) AND
  (has_availability IN (SELECT DISTINCT has_availability FROM listings_wide)) AND
  (instant_bookable IN (SELECT DISTINCT instant_bookable FROM listings_wide)) AND
  (first_review <= '2024-03-11') AND
  (last_review <= '2024-03-11') AND
  (calendar_last_scraped IN (SELECT DISTINCT calendar_last_scraped FROM listings_wide));
  
-- Filter out data that doesn't meet the following conditions (reviews_wide table) 
SELECT * 
FROM reviews_wide
WHERE (date <= '2024-03-10'); 

-- Filter out data that doesn't meet the following conditions (listings table) 
SELECT * 
FROM listings
WHERE (room_type IN (SELECT DISTINCT room_type FROM listings)) AND
  (minimum_nights BETWEEN 1 AND 365) AND
  (number_of_reviews > 0) AND
  (calculated_host_listings_count > 0) AND
  (availability_365 BETWEEN 0 AND 365) AND
  (number_of_reviews_ltm > 0) AND
  (price > 0) AND
  (last_review <= '2024-03-10') AND
  (reviews_per_month > 0);
  
-- Filter out data that doesn't meet the following conditions (reviews table) 
SELECT * 
FROM reviews
WHERE date <= '2024-03-10`;
  
  