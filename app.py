from flask import Flask, request, render_template, redirect, url_for
from mysql import connector
from werkzeug.utils import secure_filename
import uuid
from datetime import datetime
import pathlib

app = Flask(__name__)

app.config['UPLOAD_FOLDER'] = '/assets/img'

# open connection
db = connector.connect(
    host = 'localhost',
    user = 'root',
    passwd = '',
    database = 'db_temuan'
)

if db.is_connected():
    print('open connection success')

def get_data():
    cur = db.cursor()
    cur.execute('SELECT * FROM items')
    res = cur.fetchall()
    cur.close()
    return res

@app.route('/', methods=['GET'])
def index():  
    if request.args.get('search'):
        search = '%'+request.args.get('search')+'%'
        cur = db.cursor()
        cur.execute("SELECT * FROM items WHERE title LIKE %s OR description LIKE %s OR location LIKE %s OR type LIKE %s", (search,search,search,search,))
        res = cur.fetchall()
        cur.close()
        return render_template('index.html', items = res)
    data = get_data()
    return render_template('index.html', items = data)

@app.route('/<id>')
def search(id):
    cur = db.cursor()
    cur.execute("SELECT * FROM items WHERE id = %s", (id,))
    res = cur.fetchone()
    cur.close()
    return render_template('detail.html', item = res)

@app.route('/add')
def add():
    return render_template('add.html')

@app.route('/add_process', methods=['POST'])
def add_process():
    # process image
    f = request.files['file'] 
    extension = pathlib.Path(f.filename).suffix
    filename = secure_filename(f'{str(uuid.uuid4())}{datetime.now()}{extension}')
    f.save(f'./static/img/{filename}') 

    # data
    title       = request.form['title']
    description = request.form['description']
    location    = request.form['location']
    type        = request.form['type']
    date        = request.form['date']
    phone       = request.form['phone']
    img         = filename

    # upload data
    cur = db.cursor()
    cur.execute('INSERT INTO items (title, description, location, type, date,phone, img) VALUES (%s,%s,%s,%s,%s,%s,%s)', (title, description, location, type, date,phone, img))
    db.commit()

    return redirect(url_for('index'))

@app.route('/admin', methods=['GET'])
def admin():
    if request.args.get('search'):
        search = '%'+request.args.get('search')+'%'
        cur = db.cursor()
        cur.execute("SELECT * FROM items WHERE title LIKE %s OR description LIKE %s OR location LIKE %s OR type LIKE %s", (search,search,search,search,))
        res = cur.fetchall()
        cur.close()
        return render_template('admin.html', items = res)
    data = get_data()
    return render_template('admin.html', items = data)

@app.route('/update/<id>')
def update(id):
    cur = db.cursor()
    cur.execute('SELECT * FROM items WHERE id=%s', (id,))
    res = cur.fetchall()
    cur.close()
    return render_template('update.html', item = res[0])

@app.route('/update_process', methods=['POST'])
def update_process():
    # data
    title       = request.form['title']
    description = request.form['description']
    location    = request.form['location']
    type        = request.form['type']
    date        = request.form['date']
    id          = request.form['id']

    if request.files['file']:
        # process image
        f = request.files['file'] 
        extension = pathlib.Path(f.filename).suffix
        filename = secure_filename(f'{str(uuid.uuid4())}{datetime.now()}{extension}')
        f.save(f'./static/img/{filename}') 
        img = filename
        cur = db.cursor()
        cur.execute('UPDATE items SET title=%s, description=%s, location=%s, type=%s, date=%s, img=%s  WHERE id=%s', (title, description, location, type, date, img, id))
        db.commit()
        return redirect(url_for('admin'))

    cur = db.cursor()
    cur.execute('UPDATE items SET title=%s, description=%s, location=%s, type=%s, date=%s  WHERE id=%s', (title, description, location, type, date, id))
    db.commit()
    return redirect(url_for('admin'))

@app.route('/delete/<id>')
def delete(id):
    cur = db.cursor()
    cur.execute('DELETE FROM items WHERE id=%s', (id,))
    db.commit()
    return redirect(url_for('admin'))

if __name__ == "__main__":
    app.run()