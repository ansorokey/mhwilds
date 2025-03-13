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
    res = cur.execute(f"SELECT id, name, characteristics, helpfulHints, type FROM large_monsters WHERE id={monsterId};").fetchone()
    if res is None:
        con.close()
        return {'message': 'FAIL'}

    monster = {
        'message': 'OK',
        'id': res[0],
        'name': res[1],
        'characteristics': res[2],
        'helpfulHints':res[3],
        'type':res[4]
    }
    habitats = cur.execute(f"SELECT plains, forest, basin, cliffs, wyveria FROM monster_locales WHERE monsterId={monster['id']}").fetchone()
    cur.close()
    return {
        'html': render_template('guide_details.html',
        name=monster['name'],
        type=monster['type'],
        id=monster['id'],
        characteristics=monster['characteristics'],
        helpfulHints=monster['helpfulHints'],
        habitats=habitats
        )
    }

@app.route('/monsters', methods=['GET'])
def getAllMonsters():
    con = sqlite3.connect(dbsrc)
    cur = con.cursor()
    res = cur.execute("SELECT id, name FROM large_monsters ORDER BY id;")
    data = [{'name': entry[1], 'id': entry[0]} for entry in res.fetchall()]
    cur.close()
    return render_template(
        'large_monsters.html', 
        data = data
    )
