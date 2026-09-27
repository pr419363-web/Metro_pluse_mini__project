# Metro Pulse: Delhi Metro Analytics

An exploratory analysis of Delhi Metro trip records using Python, SQLite, and SQL. The project cleans the provided JSON data, loads it into a local database, and includes reusable queries for route, station, passenger, fare, and travel-pattern analysis.

## Project Structure

```text
metro-pulse-delhi-analytics/
├── source_data/delhi_metro_trips.json
├── cleaned_data/delhi_metro_trips.csv
├── sql/schema.sql
├── sql/queries.sql
├── src/data_cleaning.py
├── src/import_data.py
├── src/test_query.py
├── screenshots/top_routes_by_passengers.png
├── requirements.txt
└── .gitignore
```

## Setup and Run

Use Python 3.9 or newer. From the project root:

```bash
python -m pip install -r requirements.txt
python src/data_cleaning.py
python src/import_data.py
```

The import step creates `delhi_metro.db`. To try the included total-revenue check:

```bash
python src/test_query.py
```

Queries in `sql/queries.sql` can be run against the `delhi_metro_trips` table in that database.

## Results

The included cleaned dataset contains 10,000 records dated from January 2022 through December 2024. Results below are aggregates across those records, not daily ridership estimates:

- Rajiv Chowk → Chandni Chowk has the highest summed passenger count among recorded station pairs: 1,758 passengers across 88 records.
- Smart Card fares total 259,083.70, or 24.82% of the dataset's 1,043,861.32 in recorded fare revenue. Tourist Card is the largest category at 48.55%.
- The 10,000 records contain 198,378 passengers in total.

### Top Routes by Recorded Passenger Volume

The chart shows the ten station pairs with the highest sum of the `Passengers` field.

![Top ten Delhi Metro routes by recorded passenger volume](screenshots/top_routes_by_passengers.png)

## Repository Layout

The repository keeps source and cleaned data, SQL, and Python scripts in separate folders. The SQLite database is generated locally and excluded from version control; Python dependencies are listed in `requirements.txt`.