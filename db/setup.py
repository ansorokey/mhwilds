import sqlite3

dbsrc = 'database.db'

con = sqlite3.connect(dbsrc)
cur = con.cursor()

cur.execute("DROP TABLE IF EXISTS small_monsters")
cur.execute("DROP TABLE IF EXISTS large_monsters")
cur.execute("CREATE TABLE large_monsters(name, type, )")

con.close()