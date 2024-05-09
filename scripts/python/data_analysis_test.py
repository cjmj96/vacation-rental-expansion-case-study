import pandas as pd
import numpy as np
from scipy.stats import kurtosis

# Load data
calendar_processed_df = pd.read_csv("/home/informis/Documents/Code/Projects/vacation-rental-expansion-case-study/data/processed/calendar_processed.csv")

listings_wide_processed_df = pd.read_csv("/home/informis/Documents/Code/Projects/vacation-rental-expansion-case-study/data/processed/listings_wide_processed.csv")

# Merge the two datasets on the listing_id column
merged_data = listings_wide_processed_df.merge(calendar_processed_df, left_on='id', right_on='listing_id', how='inner')

# Filter for unavailable (booked) listings
booked_listings = merged_data[merged_data['available'] == 0]

# Calculate the number of booked nights for each listing
booked_nights = booked_listings.groupby('id')['date'].count().reset_index()

# Merge the booked_nights data back with the listings data
listings_with_bookings = listings_wide_processed_df.merge(booked_nights, on='id', how='left').fillna(0)

# Identify high-demand neighborhoods based on the total booked nights
high_demand_neighborhoods = listings_with_bookings.groupby('host_neighbourhood')['date'].sum().reset_index()
high_demand_neighborhoods = high_demand_neighborhoods.sort_values('date', ascending=False)
top_neighborhoods = high_demand_neighborhoods['host_neighbourhood'].head(10).tolist()

print(high_demand_neighborhoods)


# SUPER DISTRIBUTION (12 MONTHS)
superhost_distribution_df = listings_with_bookings.groupby(['host_is_superhost']).apply(lambda x: x, include_groups = False)

print(superhost_distribution_df)
