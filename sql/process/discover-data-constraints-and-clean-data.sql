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