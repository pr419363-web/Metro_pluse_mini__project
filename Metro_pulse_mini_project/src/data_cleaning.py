import pandas as pd
import json

# Load the JSON data
with open('source_data/delhi_metro_trips.json', 'r') as f:
    data = json.load(f)

# Convert to DataFrame
df = pd.DataFrame(data)

# Data cleaning steps
# Remove extra spaces in station names
df['From_Station'] = df['From_Station'].str.strip()
df['To_Station'] = df['To_Station'].str.strip()

# Standardize station naming conventions (assuming title case)
df['From_Station'] = df['From_Station'].str.title()
df['To_Station'] = df['To_Station'].str.title()

# Handle missing values in ticket types (fill with 'Unknown')
df['Ticket_Type'] = df['Ticket_Type'].fillna('Unknown')

# Convert date columns into datetime format
df['Date'] = pd.to_datetime(df['Date'], errors='coerce')

# Ensure numeric columns are correctly formatted
numeric_cols = ['Distance_km', 'Fare', 'Cost_per_passenger', 'Passengers']
for col in numeric_cols:
    df[col] = pd.to_numeric(df[col], errors='coerce')

# Save cleaned data to CSV
df.to_csv('cleaned_data/delhi_metro_trips.csv', index=False)

print("Data cleaning completed. Cleaned data saved to cleaned_data/delhi_metro_trips.csv")