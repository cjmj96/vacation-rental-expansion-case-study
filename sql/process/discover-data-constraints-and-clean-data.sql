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