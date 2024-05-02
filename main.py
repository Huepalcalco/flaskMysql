from flask import Flask, request, make_response, redirect, render_template, url_for, flash
from flask_mysqldb import MySQL

app = Flask (__name__)

#mysql connection
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '1234'
app.config['MYSQL_DB'] = 'Biblioteca'
mysql=MySQL(app) 

#setting
app.secret_key = 'mysecretkey'

todos = ['Comprar','Solicitud', 'entrega']

@app.errorhandler(404)
def not_found(error):
    return render_template('404.html', error=error)
    
@app.route('/getProducts')
def getProducts():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM Products')
    data = cur.fetchall()
    return render_template('product.html', Products=data)

@app.route('/')
def index():
    user_ip = request.cookies.get('user_ip')
    context = {
        'user_ip': user_ip,
        'todos' : todos,
    }

    return render_template('index.html', **context)

@app.route('/add_product', methods=['POST'])
def add_product():
    if request.method=="POST":
        product= request.form['product']
        print(product)
        cur=mysql.connection.cursor()
        cur.execute("INSERT INTO Products (`name`) VALUES ('"+str(product)+"');")
        flash('ELEMENTO AGREGADO')
        # mycursor.execute("INSERT INTO `gish_listening_db`.`Media` (`name`, `id_mediaType`, `id_MediaStatus`) VALUES ('"+str(name)+"', '"+str(mediaType)+"', '1');")
        mysql.connection.commit()        
        return redirect(url_for('product'))
        

@app.route('/edit/<id>')
def get_Product(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM Products WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-product.html', product = data[0])

@app.route('/update/<id>', methods= ['POST'])
def update_Product(id):
    if request.method == 'POST':
        product= request.form['product']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE Products SET name='"+str(product)+"' WHERE id ="+(id))
        # (product, phone, email, id))   
        mysql.connection.commit()
        flash('ACTUALIZACION EXITOSA')
        return redirect(url_for('product'))

@app.route('/delete/<string:id>')
def delete_Product(id):
    cur = mysql.connection.cursor()
    cur.execute(' DELETE  FROM Products WHERE id = {0}'.format(id))
    mysql.connection.commit()
    flash('ELEMENTO ELIMINADO')
    return redirect(url_for('product'))

@app.route('/autors')
def getAutors():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM autor')
    data = cur.fetchall()
    return render_template('autor.html', Autors=data)
