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

WITH nextEvent AS (
    SELECT
        coalesce(e.event_name, 'No Next Event')
    FROM
        event e
    WHERE
        condition
)
SELECT
    *
FROM
    cte_name;

WITH
SELECT
    SELECT
        e.event_name AS current_event,
    FROM
        event e
    LEFT JOIN event n ON n.start_date > e.start_date
GROUP BY
    current_event;

