-- Create the delhi_metro_trips table
CREATE TABLE delhi_metro_trips (
    TripID INTEGER PRIMARY KEY,
    Date DATE,
    From_Station TEXT,
    To_Station TEXT,
    Distance_km REAL,
    Fare REAL,
    Cost_per_passenger REAL,
    Passengers INTEGER,
    Ticket_Type TEXT,
    Remarks TEXT
);

-- Create indexes for faster queries
CREATE INDEX idx_from_station ON delhi_metro_trips (From_Station);
CREATE INDEX idx_to_station ON delhi_metro_trips (To_Station);
CREATE INDEX idx_date ON delhi_metro_trips (Date);
CREATE INDEX idx_ticket_type ON delhi_metro_trips (Ticket_Type);
CREATE INDEX idx_remarks ON delhi_metro_trips (Remarks);