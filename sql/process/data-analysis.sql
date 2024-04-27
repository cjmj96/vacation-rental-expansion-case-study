-- PRICE DETERMINANTS

-- High-demand neighbourhoods (12 months)
SELECT l.host_neighbourhood,
    COUNT(*) AS rental_count,
	MIN(l.price) AS min_price,
	AVG(l.price) AS avg_price,
	MAX(l.price) AS max_price
FROM 
    listings_wide_processed l
JOIN 
    calendar_processed c ON l.id = c.listing_id
	AND c.available = 0
GROUP BY l.host_neighbourhood
ORDER BY rental_count DESC;

/* Correlation analysis between price and property_type. Due to
SQL limitations I only select the relevant data and export it to csv.
Then, I performed the one-hot encoding process and correlation 
coefficient computation using Python*/
SELECT
  l.price, 
  l.property_type
FROM listings_wide_processed l
JOIN calendar_processed c ON l.id = c.listing_id
WHERE c.available = 0

/* Correlation analysis between price and amenities. Due to
SQL limitations I only select the relevant data and export it to csv.
Then, I performed the one-hot encoding process and correlation 
coefficient computation using Python*/
SELECT
  l.price, 
  l.amenities
FROM listings_wide_processed l
JOIN calendar_processed c ON l.id = c.listing_id
WHERE c.available = 0  
  
  
  
  
   
SELECT l.property_type,
  MIN(c.price) AS min_price,
  AVG(c.price) AS average_price,
  median(c.price) AS median_price,
  MAX(c.price) AS max_price
FROM listings_wide_processed l
JOIN calendar_processed c ON l.id = c.listing_id
WHERE c.available = 0
GROUP BY l.property_type;
       


-- RENTAL FREQUENCY (12 MONTHS)
SELECT l.*,
    COUNT(*) AS rental_count
FROM 
    listings_wide_processed l
JOIN 
    calendar_processed c ON l.id = c.listing_id
	AND c.available = 0
GROUP BY l.id 
ORDER BY rental_count DESC;

-- SUPERHOST DISTRIBUTION (12 months)
SELECT 
    host_neighbourhood, 
    property_type,
    latitude,
    longitude,	
    COUNT(CASE WHEN host_is_superhost = 1 THEN 1 END) as superhost_count,
    COUNT(*) as total_count,
    (COUNT(CASE WHEN host_is_superhost = 1 THEN 1 END) * 100.0 / COUNT(*)) as superhost_percentage
FROM 
    listings_wide_processed
GROUP BY 
    host_neighbourhood, 
    property_type
ORDER BY 
    superhost_count DESC,
	total_count DESC,
	superhost_percentage DESC