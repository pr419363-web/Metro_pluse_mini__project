import sqlite3
import pandas as pd

# Connect to SQLite database (creates if doesn't exist)
conn = sqlite3.connect('delhi_metro.db')
cursor = conn.cursor()

# Run the schema
with open('sql/schema.sql', 'r') as f:
    schema = f.read()
cursor.executescript(schema)

# Load cleaned CSV
df = pd.read_csv('cleaned_data/delhi_metro_trips.csv')

# Insert data
df.to_sql('delhi_metro_trips', conn, if_exists='append', index=False)

# Commit and close
conn.commit()
conn.close()

print("Data imported into SQLite database 'delhi_metro.db'")