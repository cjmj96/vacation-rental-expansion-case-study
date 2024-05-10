-- CHECK DATA TYPES

-- Step 1: Add a new column with the NUMERIC (DATE) data type
ALTER TABLE calendar ADD COLUMN my_new_date NUMERIC;

-- Step 2: Update the new column with the converted values from the old column
UPDATE calendar
SET my_new_date = date(substr(date, 1, 4) || '-' || substr(date, 6, 2) || '-' || substr(date, 9, 2));

-- Step 3: Drop the old column
ALTER TABLE calendar DROP COLUMN date;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE calendar RENAME COLUMN my_new_date TO date;

-- Step 1: Add a new NUMERIC (BOOLEAN) column
ALTER TABLE calendar ADD COLUMN new_available NUMERIC;

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

-- Step 1: Add a new column with the NUMERIC (DATE) data type
ALTER TABLE detailed_reviews ADD COLUMN new_date NUMERIC;

-- Step 2: Update the new column with the converted values from the old column
UPDATE detailed_reviews
SET new_date = date(substr(date, 1, 4) || '-' || substr(date, 6, 2) || '-' || substr(date, 9, 2));

-- Step 3: Drop the old column
ALTER TABLE detailed_reviews DROP COLUMN date;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE detailed_reviews RENAME COLUMN new_date TO date;

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

-- Step 1: Add a new column with the NUMERIC (DATE data type
ALTER TABLE reviews ADD COLUMN new_date NUMERIC;

-- Step 2: Update the new column with the converted values from the old column
UPDATE reviews
SET new_date = date(substr(date, 1, 4) || '-' || substr(date, 6, 2) || '-' || substr(date, 9, 2));

-- Step 3: Drop the old column
ALTER TABLE reviews DROP COLUMN date;

-- Step 4: Rename the new column to the old column's name
ALTER TABLE reviews RENAME COLUMN new_date TO date;

-- VERIFY DATA RANGES

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
	COUNT(*) - COUNT(description) as missing_values_description,
    COUNT(description) as observed_values_description,
	COUNT(*) - COUNT(neighborhood_overview) as missing_values_neighborhood_overview,
    COUNT(neighborhood_overview) as observed_values_neighborhood_overview,
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
	COUNT(*) - COUNT(host_location) as missing_values_host_location,
    COUNT(host_location) as observed_values_host_location,
	COUNT(*) - COUNT(host_about) as missing_values_host_about,
    COUNT(host_about) as observed_values_host_about,
	COUNT(*) - COUNT(host_response_time) as missing_values_host_response_time,
    COUNT(host_response_time) as observed_values_host_response_time,
	COUNT(*) - COUNT(host_thumbnail_url) as missing_values_host_thumbnail_url,
    COUNT(host_thumbnail_url) as observed_values_host_thumbnail_url,
	COUNT(*) - COUNT(host_picture_url) as missing_values_host_picture_url,
    COUNT(host_picture_url) as observed_values_host_picture_url,
	COUNT(*) - COUNT(host_neighbourhood) as missing_values_host_neighbourhood,
    COUNT(host_neighbourhood) as observed_values_host_neighbourhood,
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

-- Determine amount of missing values per column in detailed_reviews_processed table
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
