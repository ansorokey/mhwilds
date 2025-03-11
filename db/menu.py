import sqlite3

dbsrc = 'database.db'

con = sqlite3.connect(dbsrc)
cur = con.cursor()

def createEntry(table, values):
    cur.execute(f"INSERT INTO {table} VALUES('{','.join(values)}')")
    con.commit()
    res = cur.execute(f'SELECT * FROM {table};')
    print(res.fetchall())

def getEntryData():
    entry = []
    loop = True

    while loop:
        print('Enter a value')
        value = input()
        entry.append(value)

        print('Continue?: (y/n)')
        if input() == 'n':
            loop = False
    return entry
        

def pause():
    print('Continue: ')
    input()

def createFields():
    fields = []
    loop = True
    while loop:
        print('Enter a field: ')
        nextField = input()
        fields.append(nextField)
        print('Continue?: (y/n)')
        if input() == 'n':
            loop = False
    return fields

def createTable(table_name, fields):
    # Check if table already created
    res = cur.execute(f"SELECT name FROM sqlite_master WHERE name='{table_name}'")
    if res.fetchone() is None:
        cur.execute(f"""CREATE TABLE {table_name} ({','.join(fields)})""")
        getAllTables()
    else:
        print('\n')
        print('Table already exists')
        print('\n')

def getAllTables():
    res = cur.execute("""SELECT name FROM sqlite_master""")
    print('\n')
    print('VIEWING ALL TABLES')
    print('\n')

    for entry in res.fetchall():
        print(entry[0])
    
    print('\n')

def selectAllFrom(table_name):
    res = cur.execute(f"SELECT * FROM {table_name}")
    print(res.fetchall())

def getTableFields(table_name):
    res = cur.execute(f"PRAGMA table_info({table_name})")
    print('\n')
    print(f'VIEWING ALL FIELDS FOR {table_name}')
    print('\n')
    for entry in res.fetchall():
        print(entry)
    print('\n')

def closeConnection():
    con.close()

userInput = ''
while userInput != 'q':

    print("What would you like to do?")
    print("""
Options:
          1. IN PROGRESS
          2. Create a table
          3. View Tables
          4. View Table Fields
          5. Add Table Entry
          q. Quit
    """)
    userInput = str(input())
    
    match userInput:
        # Select All Monsters
        case '1':
            getAllTables()
            print('Enter table name')
            userInput = input()

        # Create a table
        case '2':
            print('Enter a table name: ')
            table_name = input()
            fields = createFields()
            createTable(table_name, fields)

        # View Tables
        case '3':
            getAllTables()
            pause()

        # View Table Fields
        case '4':
            print('Enter table to query: ')
            getAllTables()
            userInput = input()
            getTableFields(userInput)

        # Add Table Entry
        case '5':
            print('Select table to add to:')
            getAllTables()
            table = input()
            getTableFields(table)
            values = getEntryData()
            createEntry(table, values)

con.close()
    