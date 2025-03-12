# SQLITE3 SYNTAX

## Tables
CREATE TABLE table_name (
    field1 INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    field2,
    field3
);
<!-- NO TRAILING COMMAS -->

## Insert Data
INSERT INTO table_name VALUES
(value1, value2, value3),
(value1, value2, value3);

## REMOVE DATA
DELETE FROM table_name; <!-- Deletes all data -->
DELETE FROM table_name WHERE field = value; <!-- Deletes specific record(s) -->

## Querying
SELECT * FROM table_name;
SELECT field FROM table_name;