from flask import Flask, render_template
import sqlite3
dbsrc = './db/database.db'

app = Flask(__name__)

@app.route('/')    
def homeRoute():
    return render_template('index.html')

@app.route('/test')
def testRoute():
    return '<p>Test success</p>'

@app.route('/data')
def returnData():
    return {
        "data": {
            "options": ['Large Monsters', 'Endemic Life', 'Aquatic Life']
        }
    }

@app.route('/monsters', methods=['GET'])
def getAllMonsters():
    con = sqlite3.connect(dbsrc)
    cur = con.cursor()
    res = cur.execute("SELECT name FROM large_monsters;")
    data = [{'name': entry[0]} for entry in res]
    cur.close()
    return render_template(
        'large_monsters.html', 
        data = data
    )

@app.route('/monsters/<int:monsterId>', methods=['GET'])
def getMonster(monsterId):
    return f'<p>Fetch monster with id {monsterId}'