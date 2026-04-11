-- Delhi Metro Travel Analytics Queries

-- Route Analysis
-- 1. Which metro routes have the highest passenger traffic?
SELECT From_Station || ' to ' || To_Station AS Route, SUM(Passengers) AS Total_Passengers
FROM delhi_metro_trips
GROUP BY From_Station, To_Station
ORDER BY Total_Passengers DESC
LIMIT 10;

-- 2. Which routes generate the highest total revenue?
SELECT From_Station || ' to ' || To_Station AS Route, SUM(Fare) AS Total_Revenue
FROM delhi_metro_trips
GROUP BY From_Station, To_Station
ORDER BY Total_Revenue DESC
LIMIT 10;

-- 3. What is the average fare for each route?
SELECT From_Station || ' to ' || To_Station AS Route, AVG(Fare) AS Avg_Fare
FROM delhi_metro_trips
GROUP BY From_Station, To_Station
ORDER BY Avg_Fare DESC;

-- 4. Which routes have the longest travel distances?
SELECT From_Station || ' to ' || To_Station AS Route, MAX(Distance_km) AS Max_Distance
FROM delhi_metro_trips
GROUP BY From_Station, To_Station
ORDER BY Max_Distance DESC
LIMIT 10;

-- Station Analysis
-- 5. Which stations have the highest number of trip departures?
SELECT From_Station, COUNT(*) AS Departure_Count
FROM delhi_metro_trips
GROUP BY From_Station
ORDER BY Departure_Count DESC
LIMIT 10;

-- 6. Which stations receive the highest number of passengers?
SELECT To_Station, SUM(Passengers) AS Total_Passengers_Arriving
FROM delhi_metro_trips
GROUP BY To_Station
ORDER BY Total_Passengers_Arriving DESC
LIMIT 10;

-- 7. What are the top 10 most frequently used metro stations?
SELECT Station, Total_Trips
FROM (
    SELECT From_Station AS Station, COUNT(*) AS Total_Trips
    FROM delhi_metro_trips
    GROUP BY From_Station
    UNION ALL
    SELECT To_Station AS Station, COUNT(*) AS Total_Trips
    FROM delhi_metro_trips
    GROUP BY To_Station
)
GROUP BY Station
ORDER BY SUM(Total_Trips) DESC
LIMIT 10;

-- 8. Which station pairs are most frequently used for travel?
SELECT From_Station || ' to ' || To_Station AS Station_Pair, COUNT(*) AS Frequency
FROM delhi_metro_trips
GROUP BY From_Station, To_Station
ORDER BY Frequency DESC
LIMIT 10;

-- Revenue Analysis
-- 9. What is the total revenue generated from all trips?
SELECT SUM(Fare) AS Total_Revenue
FROM delhi_metro_trips;

-- 10. What is the average fare per trip?
SELECT AVG(Fare) AS Avg_Fare_Per_Trip
FROM delhi_metro_trips;

-- 11. Which routes generate the highest revenue per kilometer?
SELECT From_Station || ' to ' || To_Station AS Route, SUM(Fare) / SUM(Distance_km) AS Revenue_Per_Km
FROM delhi_metro_trips
WHERE Distance_km > 0
GROUP BY From_Station, To_Station
ORDER BY Revenue_Per_Km DESC
LIMIT 10;

-- 12. Which ticket type generates the highest revenue?
SELECT Ticket_Type, SUM(Fare) AS Total_Revenue
FROM delhi_metro_trips
GROUP BY Ticket_Type
ORDER BY Total_Revenue DESC;

-- Passenger Analysis
-- 13. What is the average number of passengers per trip?
SELECT AVG(Passengers) AS Avg_Passengers_Per_Trip
FROM delhi_metro_trips;

-- 14. Which trips recorded the highest passenger counts?
SELECT TripID, Passengers
FROM delhi_metro_trips
ORDER BY Passengers DESC
LIMIT 10;

-- 15. What is the passenger distribution by ticket type?
SELECT Ticket_Type, SUM(Passengers) AS Total_Passengers
FROM delhi_metro_trips
GROUP BY Ticket_Type
ORDER BY Total_Passengers DESC;

-- 16. What is the total passenger count for each station?
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
-- 17. How many trips occur during peak, off-peak, festival, and weekend conditions?
SELECT Remarks, COUNT(*) AS Trip_Count
FROM delhi_metro_trips
GROUP BY Remarks
ORDER BY Trip_Count DESC;

-- 18. Which travel condition generates the highest revenue?
SELECT Remarks, SUM(Fare) AS Total_Revenue
FROM delhi_metro_trips
GROUP BY Remarks
ORDER BY Total_Revenue DESC
LIMIT 1;

-- 19. What is the monthly passenger trend across the dataset?
SELECT strftime('%Y-%m', Date) AS Month, SUM(Passengers) AS Total_Passengers
FROM delhi_metro_trips
WHERE Date IS NOT NULL
GROUP BY Month
ORDER BY Month;

-- 20. Which travel condition has the highest average passenger count per trip?
SELECT Remarks, AVG(Passengers) AS Avg_Passengers
FROM delhi_metro_trips
GROUP BY Remarks
ORDER BY Avg_Passengers DESC
LIMIT 1;