
CREATE TABLE appointments_1971_2020 AS
SELECT *
FROM appointments
WHERE YEAR(TimeQueued) <= 2020;

CREATE TABLE appointments_2021 AS
SELECT *
FROM appointments
WHERE YEAR(TimeQueued) = 2021;

CREATE TABLE appointments_2022 AS
SELECT *
FROM appointments
WHERE YEAR(TimeQueued) = 2022;

CREATE TABLE appointments_2023_present AS
SELECT *
FROM appointments
WHERE YEAR(TimeQueued) >= 2023;

