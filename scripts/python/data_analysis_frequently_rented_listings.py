import pandas as pd

# Load the calendar data
calendar_processed_df = pd.read_csv("/home/informis/Documents/Code/Projects/vacation-rental-expansion-case-study/data/processed/calendar_processed.csv")

listings_wide_processed_df = pd.read_csv("/home/informis/Documents/Code/Projects/vacation-rental-expansion-case-study/data/processed/listings_wide_processed.csv")

# RENTAL FREQUENCY (12 MONTHS)

# Merge the two datasets on the listings_id column
merged_data = pd.merge(listings_wide_processed_df, calendar_processed_df, left_on='id', right_on='listing_id', how = 'inner')

# Filter for booked or unavailable listings
booked_listings = merged_data[merged_data['available'] == 0]

# Calculate the number of booked nights for each listing
booked_or_unavailable_nights = booked_listings.groupby('id').agg(
    booked_or_unavailable_nights = pd.NamedAgg(column='date', aggfunc='count'),
)

# Filter for available listings
available_listings = merged_data[merged_data['available'] == 1]

# Calculate the number of available_days for each listing
available_days = available_listings.groupby('id').agg(
    available_days = pd.NamedAgg(column='date', aggfunc='count')
)

# Merge the booked_nights data back with the listing
listings = listings_wide_processed_df.merge(booked_or_unavailable_nights, on='id', how='inner')

# Merge the available_days data back with the listings
listings = listings.merge(available_days, on='id', how='inner')

# Filter for data where booked nights and availability_365 should add up 365
listings = listings[listings['available_days'] + listings['booked_or_unavailable_nights'] == 365]

# Compute revenue from booked_nights
listings['revenue_from_booked_nights'] = listings["booked_or_unavailable_nights"] * listings["price"]
# Compute potential revenue from available nights
listings['potential_revenue_from_available_nights'] = listings['available_days'] * listings['price']

# Compute total potential revenue
listings['total_potential_revenue'] = listings['revenue_from_booked_nights'] + listings['potential_revenue_from_available_nights']

# Compute average daily rate for each listing
listings['potential_average_daily_rate'] = listings['total_potential_revenue'] / (listings['booked_or_unavailable_nights'] + listings['available_days'])

# Compute occupancy rate for each listing
listings['occupancy_rate'] = (listings['booked_or_unavailable_nights'] / (listings["available_days"] + listings["booked_or_unavailable_nights"])) * 100

# Select relevant columns
relevant_columns = ['id','name', 'host_id', 'host_name', 'host_neighbourhood', 'latitude', 'longitude', 'property_type', 'room_type', 'available_days', 'booked_or_unavailable_nights', 'total_potential_revenue', 'potential_average_daily_rate', 'occupancy_rate']


# Sort listings data by annual revenue, average daily rate (ADR), and occupancy rate
rental_frequency = listings[relevant_columns].sort_values(by=['total_potential_revenue', 'potential_average_daily_rate', 'occupancy_rate'], ascending=[False, False, False])

print(rental_frequency)


# List revelant columns
#  relevant_columns = ['id', 'booked_nights',  'annual_estimated_revenue', 'host_id', 'host_url', 'host_name', 'host_response_time', 'host_neighbourhood', 'latitude', 'longitude', 'property_type', 'room_type', 'accommodates', 'bathrooms_text', 'bedrooms', 'beds', 'amenities', 'maximum_nights', 'maximum_nights', 'availability_30', 'availability_60', 'availability_90', 'availability_365', 'number_of_reviews', 'number_of_reviews_ltm', 'number_of_reviews_l30d', 'review_scores_rating', 'review_scores_accuracy', 'review_scores_cleanliness', 'review_scores_checkin', 'review_scores_communication', 'review_scores_location', 'review_scores_value', 'reviews_per_month', 'host_is_superhost', 'host_has_profile_pic', 'host_identity_verified', 'bathrooms', 'price', 'has_availability', 'instant_bookable', 'host_response_rate', 'host_acceptance_rate']


#  listings_with_bookings_filtered = listings_with_bookings[relevant_columns].sort_values(by=['annual_estimated_revenue', 'booked_nights'], ascending=[False, False])

#  print(listings_with_bookings)
#  print(listings_with_bookings_filtered)

# Sort listings_with_bookings data by 'booked_nights' in descending order


#  # Group by 'id' and compute booked nights
#  grouped_df = merged_df.groupby('id').size().reset_index(name='booked_nights')
#
#  # Sort the grouped DataFrame by 'booked_nights' in descending order
#  sorted_df = grouped_df.sort_values('booked_nights', ascending=False)
#
#  # Merge the sorted DataFrame with the original listings DataFrame to get all columns
#  rental_frequency_df = pd.merge(sorted_df, listings_wide_processed_df, left_on='id', right_on='id')
#
#  # Print the result
#  print(rental_frequency_df)
