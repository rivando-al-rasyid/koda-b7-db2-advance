-- Create a new table 'TableName' with a primary key and columns
-- Drop an existing table 'TableName'
DROP TABLE event;

CREATE TABLE event(
    id serial PRIMARY KEY,
    event_id int,
    event_name varchar,
    start_date date
);

INSERT INTO event(event_id, event_name, start_date)
VALUES
    (1, 'event A', '2024-01-01'),
(2, 'event B', '2024-01-05'),
(3, 'event C', '2024-01-10');

SELECT
    e.event_name AS current_event,
    coalesce(string_agg(n.event_name, ','), 'No Next Event') AS next_events
FROM
    event e
    LEFT JOIN event n ON n.start_date > e.start_date
GROUP BY
    e.event_name;

-- Drop an existing table 'constumers'
DROP TABLE constumers;

-- Create a new table 'constumers' with a primary key and columns
CREATE TABLE constumers(
    id serial PRIMARY KEY,
    name varchar,
    referred_by int
);

-- Insert data into 'constumers'
INSERT INTO constumers(name, referred_by)
VALUES
    ('alice', NULL),
('bob', NULL),
('charlie', 2),
('david', NULL),
('eva', 3),
('frank', 4),
('rudy', 4);

SELECT
    c.name AS constumers_name,
    r.name AS referred_by
FROM
    constumers c
    LEFT JOIN constumers r ON c.referred_by = r.id;

SELECT
    c.name AS constumers_name
FROM
    constumers c
WHERE
    c.referred_by IS NULL;

SELECT
    r.name AS referred_by,
    count(c.name)
FROM
    constumers r
    LEFT JOIN constumers c ON c.referred_by = r.id
GROUP BY
    r.id;

SELECT
    r.name AS referred_by,
    count(c.name) AS ref
FROM
    constumers r
    JOIN constumers c ON c.referred_by = r.id
GROUP BY
    r.id;

