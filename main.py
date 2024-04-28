from flask import Flask, request, make_response, redirect, render_template, url_for
from flask_mysqldb import MySQL

app = Flask (__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '1234'
app.config['MYSQL_DB'] = 'Escuela'
mysql=MySQL(app) 

todos = ['Comprar','Solicitud', 'entrega']

@app.errorhandler(404)
def not_found(error):
    return render_template('404.html', error=error)
    
@app.route('/')
def index():
    user_ip = request.remote_addr

    response = make_response(redirect('/hello'))
    response.set_cookie('user_ip', user_ip)

    return render_template('index.html')

@app.route('/hello')
def hello():
    user_ip = request.cookies.get('user_ip')
    context = {
        'user_ip': user_ip,
        'todos' : todos,
    }

    return render_template('hello.html', **context)

@app.route('/add_contact', methods=['POST'])
def add_contact():
    if request.method=="POST":
        fullname= request.form['fullname']
        phone= request.form['phone']
        email= request.form['email']
        print(fullname)
        cur=mysql.connection.cursor()
        cur.execute("INSERT INTO Products (`name`) VALUES ('"+str(fullname)+"');")
        # mycursor.execute("INSERT INTO `gish_listening_db`.`Media` (`name`, `id_mediaType`, `id_MediaStatus`) VALUES ('"+str(name)+"', '"+str(mediaType)+"', '1');")
        mysql.connection.commit()
        
        return redirect(url_for('index'))
        
    

@app.route('/edit_contact')
def edit_contact():
    return "editar contacto"

@app.route('/delete_contact')
def delete_contact():
    return "delete contacto"

