# mhwilds
A little project to recreate the hunter guide from Monster Hunter Wilds

# About
This application acts as a visual interface to interact with a database based on information found in Monster Hunter Wilds.
The backend of the database is managed through python and its native sqlite3 library.
The front end is fullstack html, css, and javascript.

# Quick References
The sqlite3 python library
- https://docs.python.org/3/library/sqlite3.html

Flask documentation
- https://flask.palletsprojects.com/en/stable/quickstart/

Jinja2 Formatting
- https://jinja.palletsprojects.com/en/stable/templates/

SQLAlchemy
- https://flask-sqlalchemy.readthedocs.io/en/stable/quickstart/

# Running the Application
## Install python virtual environment
`sudo apt install python3.10-venv`

## Install sqlite3
`sudo apt install sqlite3`

## Migrating
```
sqlite3 database.db
sqlite3 .read migrate.sql
```

## Seeding
`sqlite3 .read seed.sql`

## Querying

## Running flask
flask--app app run

## Install SQLAlchemy
`pip install -U Flask-SQLAlchemy`