import sqlite3

dbsrc = 'database.db'

con = sqlite3.connect(dbsrc)
cur = con.cursor()

def getAllTables():
    res = cur.execute("""
        SELECT * FROM sqlite_master
    """)
    print(res.fetchall())

def selectAllFrom(table_name):
    res = cur.execute('SELECT * FROM ' + table_name)
    print(res.fetchall())
    input()


def closeConnection():
    con.close()

userRes = ''
while userRes != 'q':

    print("What would you like to do?")
    print("""
Options:
          1. Select all monsters
          q. Quit
    """)
    userRes = str(input())
    
    match userRes:
        case '1':
            getAllTables()
            print('Enter table name')
            userRes = input()


con.close()
    