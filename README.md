# mhwilds
A little project to recreate the hunter guide from Monster Hunter Wilds

# About
This application acts as a visual interface to interact with a database based on information found in Monster Hunter Wilds.
The backend of the database is managed through python and its native sqlite3 library.
The front end is fullstack html, css, and javascript.

# Quick References
The sqlite3 python library
- https://docs.python.org/3/library/sqlite3.html

# Running the database
## Install sqlite3
`sudo apt install sqlite3`

## Migrating
```
sqlite3 database.db
sqlite3 .read migrate.sql
```

## Seeding
`.read seed.sql`