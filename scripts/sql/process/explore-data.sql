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
PRAGMA table_info(detailed_listings);

-- Count number of observations for listings_wide table
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

-- List column names for reviews_wide table
PRAGMA table_info(detailed_reviews);

-- Count number of observations for reviews_wide table
SELECT COUNT(*)
FROM detailed_reviews;