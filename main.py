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
    return render_template('index.html')


@app.route('/create_user', methods=['POST'])
def create_user():
    if request.method == 'POST':
        data = request.get_json()
        with conn.cursor(cursor_factory=RealDictCursor) as cur:
            cur.execute('SELECT EXISTS (SELECT * FROM Users WHERE username=%s);', (data['username'],))
            d = cur.fetchone()
            print(d)
            if d['exists']:
                return jsonify({'exists':1}) # Username in use
            cur.execute('SELECT create_user(%s, %s, %s, %s, %s, %s, %s, %s)',
                    (data['first_name'], data['last_name'], data['username'],
                        data['password'], data['email'], data['skype'],
                        data['is_teacher'], data['grade_level']))
            d = cur.fetchall()
            conn.commit()
            return jsonify({'exists':0})

@app.route('/create_worksheet', methods=['POST'])
def create_worksheet():
    if request.method == 'POST':
        data = request.get_json()
        with conn.cursor(cursor_factory=RealDictCursor) as cur:
            cur.execute('SELECT create_worksheet(%s, %s, %s, %s)',
                    (data['creator_id'], data['grade_level'],
                        data['category'], data['content']))
            conn.commit()
        return ''


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
