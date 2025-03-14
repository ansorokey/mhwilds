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

@app.route('/monsters/<int:monsterId>/1', methods=['GET'])
def getMonster1(monsterId):
    con = sqlite3.connect(dbsrc)
    cur = con.cursor()
    res = cur.execute(f"SELECT id, name, characteristics, type FROM large_monsters WHERE id={monsterId};").fetchone()
    if res is None:
        con.close()
        return {'message': 'FAIL'}

    monster = {
        'message': 'OK',
        'id': res[0],
        'name': res[1],
        'characteristics': res[2],
        'type':res[3]
    }
    habitats = cur.execute(f"SELECT plains, forest, basin, cliffs, wyveria FROM monster_locales WHERE monsterId={monster['id']}").fetchone()
    cur.close()
    return {
        'html': render_template('page1.html',
        name=monster['name'],
        type=monster['type'],
        id=monster['id'],
        characteristics=monster['characteristics'],
        habitats=habitats
        )
    }

@app.route('/monsters/<int:monsterId>/2', methods=['GET'])
def getMonster2(monsterId):
    con = sqlite3.connect(dbsrc)
    cur = con.cursor()
    monster = cur.execute(f'SELECT name, helpfulHints FROM large_monsters WHERE id={monsterId}').fetchone()
    hidePartsList = cur.execute(f'SELECT * from hide_weaknesses WHERE monsterId={monsterId} ORDER BY id').fetchall()
    hideParts = [{
        'name':part[1],
        'blunt':part[2],
        'sharp':part[3],
        'ranged':part[4],
        'fire':part[5],
        'water':part[6],
        'thunder':part[7],
        'ice':part[8],
        'dragon':part[9]
    } for part in hidePartsList]
    return {
        'html':render_template('page2.html',
        name=monster[0],
        helpfulHints=monster[1],
        hideParts=hideParts
    )}

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
