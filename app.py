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

@app.route('/monsters/<int:monsterId>', methods=['GET'])
def getMonster(monsterId):
    con = sqlite3.connect(dbsrc)
    cur = con.cursor()
    res = cur.execute(f"SELECT id, name, characteristics, helpfulHints FROM large_monsters WHERE id={monsterId};").fetchone()
    if res is None:
        con.close()
        return {'message': 'FAIL'}

    monster = {
        'message': 'OK',
        'id': res[0],
        'name': res[1],
        'characteristics': res[2],
        'helpfulHints':res[3]
    }
    cur.close()
    return {
        'html': render_template('guide_details.html',
        name=monster['name'],
        id=monster['id'],
        characteristic=monster['characteristics'],
        helpfulHints=monster['helpfulHints']
        )
    }

@app.route('/monsters', methods=['GET'])
def getAllMonsters():
    con = sqlite3.connect(dbsrc)
    cur = con.cursor()
    res = cur.execute("SELECT id, name FROM large_monsters;")
    data = [{'name': entry[1], 'id': entry[0]} for entry in res.fetchall()]
    cur.close()
    return render_template(
        'large_monsters.html', 
        data = data
    )
