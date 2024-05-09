import pandas as pd
import numpy as np
from scipy.stats import kurtosis

# Load data
calendar_processed_df = pd.read_csv("/home/informis/Documents/Code/Projects/vacation-rental-expansion-case-study/data/processed/calendar_processed.csv")

listings_wide_processed_df = pd.read_csv("/home/informis/Documents/Code/Projects/vacation-rental-expansion-case-study/data/processed/listings_wide_processed.csv")

# PRICE DETERMINANTS

# 1. High-demand neighbourhoods (12 months)

# Merge the two datasets on the listings_id column
merged_data = pd.merge(listings_wide_processed_df, calendar_processed_df, left_on='id', right_on='listing_id', how='inner')

# Filter for unavailable (booked) listings
booked_listings = merged_data[merged_data['available'] == 0]

#  merged_df = merged_df[merged_df['available'] == 0]

# Calculate the number of booked nights for each listing
booked_nights = booked_listings.groupby('id')['date'].count().reset_index()

# Merge the booked_nights data back with the listing data
listings_with_bookings = listings_wide_processed_df.merge(booked_nights, on='id', how='left').fillna(0)


# Define a custom skewness function that handles division by zero
def safe_skewness(x):
    if np.isclose(x.std(), 0):
        return np.nan
    else:
        return x.skew()

# Define a custom kurtosis function that handles division by zero
def safe_kurtosis(x):
    if np.isclose(x.std(), 0):
        return np.nan
    else:
        return kurtosis(x, fisher=False)

# Group by 'host_neighbourhood' and calculate the count, min, mode, avg, median, std, kurtosis, skewness, and max of 'price'
high_demand_neighbourhoods_df = listings_with_bookings.groupby('host_neighbourhood').agg(
    rental_count = pd.NamedAgg(column='price_y', aggfunc='count'),
    min_price = pd.NamedAgg(column='price_y', aggfunc='min'),
    mode_price = pd.NamedAgg(column='price_y', aggfunc=lambda x: x.mode().values[0] if not x.mode().empty else np.nan),
    avg_price = pd.NamedAgg(column='price_y', aggfunc='mean'),
    median_price = pd.NamedAgg(column='price_y', aggfunc='median'),
    std_price = pd.NamedAgg(column='price_y', aggfunc='std'),
    kurt_price = pd.NamedAgg(column='price_y', aggfunc=safe_kurtosis),
    skewness_price = pd.NamedAgg(column='price_y', aggfunc=safe_skewness),
    max_price = pd.NamedAgg(column='price_y', aggfunc='max')
).reset_index()

print(high_demand_neighbourhoods_df.shape[0])

#  # Sort the result by 'rental_count' in descending order
high_demand_neighbourhoods_df = high_demand_neighbourhoods_df.sort_values('rental_count', ascending=False)

# Print the result
print(high_demand_neighbourhoods_df)

# 2. Compare price distribution by property type

# Merge the two DataFrames based on the 'id' column
merged_df = pd.merge(listings_wide_processed_df, calendar_processed_df, left_on='id', right_on='listing_id')

# Filter out the rows where 'available' is not 0
merged_df = merged_df[merged_df['available'] == 0]

# Group by 'property_type' and calculate the count, min, mode, avg, median, std, kurtosis, skewness, and max of 'price'
price_distribution_by_property_type_df = merged_df.groupby('property_type').agg(
    rental_count = pd.NamedAgg(column='price_y', aggfunc='count'),
    min_price = pd.NamedAgg(column='price_y', aggfunc='min'),
    mode_price = pd.NamedAgg(column='price_y', aggfunc=lambda x: x.mode().values[0] if not x.mode().empty else np.nan),
    avg_price = pd.NamedAgg(column='price_y', aggfunc='mean'),
    median_price = pd.NamedAgg(column='price_y', aggfunc='median'),
    std_price = pd.NamedAgg(column='price_y', aggfunc='std'),
    kurt_price = pd.NamedAgg(column='price_y', aggfunc=safe_kurtosis),
    skewness_price = pd.NamedAgg(column='price_y', aggfunc=safe_skewness),
    max_price = pd.NamedAgg(column='price_y', aggfunc='max')
).reset_index()

#  # Sort the result by 'rental_count' in descending order
price_distribution_by_property_type_df = price_distribution_by_property_type_df.sort_values('rental_count', ascending=False)

print(price_distribution_by_property_type_df)

# RENTAL FREQUENCY (12 MONTHS)

# Merge the two DataFrames based on the 'id' column
merged_df = pd.merge(listings_wide_processed_df, calendar_processed_df, left_on='id', right_on='listing_id', how = 'left')

# Filter out the rows where 'available' is not 0
merged_df = merged_df[merged_df['available'] == 0]

# Group by 'id' and compute booked nights
grouped_df = merged_df.groupby('id').size().reset_index(name='booked_nights')

# Sort the grouped DataFrame by 'booked_nights' in descending order
sorted_df = grouped_df.sort_values('booked_nights', ascending=False)

# Merge the sorted DataFrame with the original listings DataFrame to get all columns
rental_frequency_df = pd.merge(sorted_df, listings_wide_processed_df, left_on='id', right_on='id')

# Print the result
print(rental_frequency_df)

# SUPERHOST DISTRIBUTION (12 MONTHS)




# Group by 'host_neighbourhood' and 'property_type' and calculate the count of superhosts and total listings
grouped_df = listings_wide_processed_df.groupby(['host_neighbourhood', 'property_type']).agg(
    superhost_count=('host_is_superhost', lambda x: (x == 1).sum()),
    total_count=('host_is_superhost', 'count')
).reset_index()

# Calculate the superhost percentage
grouped_df['superhost_percentage'] = grouped_df['superhost_count'] * 100.0 / grouped_df['total_count']

# Sort the result by 'superhost_count', 'total_count', and 'superhost_percentage' in descending order
superhost_distribution_df = grouped_df.sort_values(by=['superhost_count', 'total_count', 'superhost_percentage'], ascending=[False, False, False])

# Print the result
print(superhost_distribution_df)
