# Delhi Metro Travel Analytics

This project analyzes Delhi Metro travel data to derive insights into passenger behavior, revenue trends, and operational efficiency.

## Project Structure

```
metro-pulse-delhi-analytics/
├── source_data/
│   └── delhi_metro_trips.json
├── cleaned_data/
│   └── delhi_metro_trips.csv
├── sql/
│   ├── schema.sql
│   └── queries.sql
├── src/
│   ├── data_cleaning.py
│   └── import_data.py
├── README.md
├── requirements.txt
└── delhi_metro.db
```

## Setup

1. Clone or download the project.
2. Install dependencies:
   ```
   pip install -r requirements.txt
   ```
3. Run data cleaning:
   ```
   python src/data_cleaning.py
   ```
4. Import data to database:
   ```
   python src/import_data.py
   ```

## Analysis

The SQL queries in `sql/queries.sql` provide 20 analytical insights covering routes, stations, revenue, passengers, and travel patterns.

To run queries, use any SQLite client or Python with sqlite3.

## Insights

- Route with highest traffic
- Revenue generating routes
- Busiest stations
- Ticket type preferences
- Peak hour patterns

## Dataset

Source: https://github.com/dsmentors/MetroPulse/tree/main/Data

Columns: TripID, Date, From_Station, To_Station, Distance_km, Fare, Cost_per_passenger, Passengers, Ticket_Type, Remarks