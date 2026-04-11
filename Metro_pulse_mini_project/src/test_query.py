import sqlite3

conn = sqlite3.connect('delhi_metro.db')
cursor = conn.cursor()

# Run query 9: Total revenue
cursor.execute("SELECT SUM(Fare) AS Total_Revenue FROM delhi_metro_trips;")
result = cursor.fetchone()
print(f"Total Revenue: {result[0]}")

conn.close()