# Import the sqlite3 library
import sqlite3

dbsrc = 'example_database.db'

# Create an object that represents a connection to the local database
# If the file does not exist, it will be created by this statement
con = sqlite3.connect(dbsrc)

# Create a cursor object
# The statement above created a connection to the database
# The statement below is the object that will query and brose the database
cur = con.cursor()

# When running the setup, we need to drop tables that already exist to create and modify them
cur.execute("""
DROP TABLE IF EXISTS large_monsters
""")

# Execute a sql command
# Create the monsters table
cur.execute('CREATE TABLE large_monsters(name)')

# Fetch the list of tables in the curent schema
# Executing a fetch creates a table-like object that we will further query
# sqlite_master is the defualt master table
res = cur.execute('SELECT name FROM sqlite_master')

# Now we can select a number of results with optional filters to view
# The result will come back as a tuple -> ('large_monsters',)
print(res.fetchone())

# Next, we can insert data into the table
# Use python literals to make formatting SQL a little easier and clearer
cur.execute("""
        INSERT INTO large_monsters VALUES
            ('Chatacabra'),
            ('Quemetrice'),
            ('Lala Barina'),
            ('Congala'),
            ('Balahara'),
            ('Doshaguma')
""")

# Using the INSERT command creates (opens) a transaction
# A transaction is only saved to the database if we commit it
con.commit()

# We should now be able to see our data in the table
res = cur.execute("""
SELECT name FROM large_monsters
""")

# Fetch all will return a list of tuples
# -> [('Chatacabra',), ('Quemetrice',), ('Lala Barina',), ('Congala',), ('Balahara',), ('Doshaguma',)]
print(res.fetchall())

# If we want to insert many values from data we already have, we can use the execute many command
# This will take data and insert it based on position
list2 = [('Nu Udra',), ('Rompopolo',), ('Ray Dau',), ('Nerscylla',), ('Hirubami',), ('Ajakatura',)]

cur.executemany("""
INSERT INTO large_monsters VALUES(?)
""", list2)

# Remember to commit
con.commit()

# Now we view results again
res = cur.execute('SELECT * FROM large_monsters')
print(res.fetchall())

# Finally, close the connection
con.close()

# Open a connection again to make sure it was all written correctly
con = sqlite3.connect(dbsrc)
cur = con.cursor()
res = cur.execute("SELECT * from large_monsters")
print(res.fetchall())