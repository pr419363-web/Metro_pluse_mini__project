-- Delhi Metro Travel Analytics Queries

-- Route Analysis
-- Top 10 station pairs by summed recorded passenger count.
SELECT From_Station || ' to ' || To_Station AS Route, SUM(Passengers) AS Total_Passengers
FROM delhi_metro_trips
GROUP BY From_Station, To_Station
ORDER BY Total_Passengers DESC
LIMIT 10;

-- Top 10 station pairs by total recorded fare revenue.
SELECT From_Station || ' to ' || To_Station AS Route, SUM(Fare) AS Total_Revenue
FROM delhi_metro_trips
GROUP BY From_Station, To_Station
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Average recorded fare for each station pair.
SELECT From_Station || ' to ' || To_Station AS Route, AVG(Fare) AS Avg_Fare
FROM delhi_metro_trips
GROUP BY From_Station, To_Station
ORDER BY Avg_Fare DESC;

-- Top 10 station pairs by maximum recorded travel distance.
SELECT From_Station || ' to ' || To_Station AS Route, MAX(Distance_km) AS Max_Distance
FROM delhi_metro_trips
GROUP BY From_Station, To_Station
ORDER BY Max_Distance DESC
LIMIT 10;

-- Station Analysis
-- Top 10 departure stations by number of records.
SELECT From_Station, COUNT(*) AS Departure_Count
FROM delhi_metro_trips
GROUP BY From_Station
ORDER BY Departure_Count DESC
LIMIT 10;

-- Top 10 destination stations by summed recorded passenger count.
SELECT To_Station, SUM(Passengers) AS Total_Passengers_Arriving
FROM delhi_metro_trips
GROUP BY To_Station
ORDER BY Total_Passengers_Arriving DESC
LIMIT 10;

-- Top 10 stations by combined recorded arrivals and departures.
SELECT Station, COUNT(*) AS Total_Trips
FROM (
    SELECT From_Station AS Station FROM delhi_metro_trips
    UNION ALL
    SELECT To_Station AS Station FROM delhi_metro_trips
)
GROUP BY Station
ORDER BY Total_Trips DESC
LIMIT 10;

-- Top 10 station pairs by number of records.
SELECT From_Station || ' to ' || To_Station AS Station_Pair, COUNT(*) AS Frequency
FROM delhi_metro_trips
GROUP BY From_Station, To_Station
ORDER BY Frequency DESC
LIMIT 10;

-- Revenue Analysis
-- Total recorded fare revenue across all rows.
SELECT SUM(Fare) AS Total_Revenue
FROM delhi_metro_trips;

-- Average recorded fare per row.
SELECT AVG(Fare) AS Avg_Fare_Per_Trip
FROM delhi_metro_trips;

-- Top 10 station pairs by recorded revenue per kilometer.
SELECT From_Station || ' to ' || To_Station AS Route, SUM(Fare) / SUM(Distance_km) AS Revenue_Per_Km
FROM delhi_metro_trips
WHERE Distance_km > 0
GROUP BY From_Station, To_Station
ORDER BY Revenue_Per_Km DESC
LIMIT 10;

-- Total recorded fare revenue by ticket type.
SELECT Ticket_Type, SUM(Fare) AS Total_Revenue
FROM delhi_metro_trips
GROUP BY Ticket_Type
ORDER BY Total_Revenue DESC;

-- Passenger Analysis
-- Average recorded passenger count per row.
SELECT AVG(Passengers) AS Avg_Passengers_Per_Trip
FROM delhi_metro_trips;

-- Ten records with the highest passenger counts.
SELECT TripID, Passengers
FROM delhi_metro_trips
ORDER BY Passengers DESC
LIMIT 10;

-- Summed recorded passenger count by ticket type.
SELECT Ticket_Type, SUM(Passengers) AS Total_Passengers
FROM delhi_metro_trips
GROUP BY Ticket_Type
ORDER BY Total_Passengers DESC;

-- Summed passenger counts for records touching each station.
SELECT Station, SUM(Passengers) AS Total_Passengers
FROM (
    SELECT From_Station AS Station, Passengers
    FROM delhi_metro_trips
    UNION ALL
    SELECT To_Station AS Station, Passengers
    FROM delhi_metro_trips
)
GROUP BY Station
ORDER BY Total_Passengers DESC;

-- Travel Pattern Analysis
-- Number of records by travel condition.
SELECT Remarks, COUNT(*) AS Trip_Count
FROM delhi_metro_trips
GROUP BY Remarks
ORDER BY Trip_Count DESC;

-- Travel condition with the highest total recorded fare revenue.
SELECT Remarks, SUM(Fare) AS Total_Revenue
FROM delhi_metro_trips
GROUP BY Remarks
ORDER BY Total_Revenue DESC
LIMIT 1;

-- Monthly summed passenger counts for rows with valid dates.
SELECT strftime('%Y-%m', Date) AS Month, SUM(Passengers) AS Total_Passengers
FROM delhi_metro_trips
WHERE Date IS NOT NULL
GROUP BY Month
ORDER BY Month;

-- Travel condition with the highest average recorded passenger count per row.
SELECT Remarks, AVG(Passengers) AS Avg_Passengers
FROM delhi_metro_trips
GROUP BY Remarks
ORDER BY Avg_Passengers DESC
LIMIT 1;