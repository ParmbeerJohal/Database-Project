import os
import json

import psycopg2
from psycopg2.extras import RealDictCursor
from flask import Flask, jsonify, render_template, request

conn = psycopg2.connect(host='localhost', dbname='db', user='370admin', password='password')

app = Flask(__name__)
app.secret_key=os.urandom(24)

@app.route('/', methods=['GET'])
def main():
    pass # TODO
    # return render_template('index.html')


@app.route('/create', methods=['GET','POST'])
def create():
    if request.method == 'GET':
        return render_template('create.html')
    if request.method == 'POST':
        print(request.get_json())
        with conn.cursor(cursor_factory=RealDictCursor) as cur:
            cur.execute('SELECT * FROM Users;') # TODO
            data = cur.fetchall()
            conn.commit()
        return jsonify(data) # TODO

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
