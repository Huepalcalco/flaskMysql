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

@app.route('/edit/<id>')
def get_Autor(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM autor WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-Autor.html', autor = data[0])


@app.route('/autoria')
def getAutoria():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM autoria')
    data = cur.fetchall()
    return render_template('autoria.html', Autoria=data)

@app.route('/edit/<id>')
def get_Atoria(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM autoria WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-autoria.html', autoria = data[0])


@app.route('/cliente')
def getCliente():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM cliente')
    data = cur.fetchall()
    return render_template('cliente.html', Clientes=data)

@app.route('/edit/<id>')
def get_Cliente(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM cliente WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-cliente.html', cliente = data[0])


@app.route('/credencial')
def getCredencial():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM credencial')
    data = cur.fetchall()
    return render_template('credencial.html', Credencial=data)

@app.route('/edit/<id>')
def get_Credencial(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM credencial WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-credencial.html', credencial = data[0])


@app.route('/d_prestamo')
def getD_prestamo():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM detalles_prestamo')
    data = cur.fetchall()
    return render_template('d_prestamo.html', D_prestamo=data)

@app.route('/edit/<id>')
def get_D_presamo(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM detalles_prestamo WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-d_prestamos.html', D_prestamos = data[0])


@app.route('/direccion')
def getDireccion():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM direccion')
    data = cur.fetchall()
    return render_template('direccion.html', Direccion=data)

@app.route('/edit/<id>')
def get_Direccion(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM direccion WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-direccion.html', direccion = data[0])


@app.route('/editorial')
def getEditoail():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM editorial')
    data = cur.fetchall()
    return render_template('editorial.html', Editorial=data)

@app.route('/edit/<id>')
def get_Editorial(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM editorial WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-editorial.html', editorial = data[0])


@app.route('/empleado')
def getEmpleado():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM empleado')
    data = cur.fetchall()
    return render_template('empleado.html', Empleado=data)

@app.route('/edit/<id>')
def get_Empleado(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM empleado WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-empleado.html', empleado = data[0])


@app.route('/escolaridad')
def getEscolaridad():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM escolaridad')
    data = cur.fetchall()
    return render_template('escolaridad.html', Escolaridad=data)

@app.route('/edit/<id>')
def get_Escolaridad(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM escolaridad WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-escolaridad.html', escolaridad = data[0])


@app.route('/estado')
def getEstado():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM estado')
    data = cur.fetchall()
    return render_template('estado.html', Estado=data)

@app.route('/edit/<id>')
def get_Estado(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM estado WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-estado.html', estado = data[0])


@app.route('/genero')
def getGenero():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM genero')
    data = cur.fetchall()
    return render_template('genero.html', Genero=data)

@app.route('/edit/<id>')
def get_Genero(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM genero WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-genero.html', genero = data[0])


@app.route('/idioma')
def getIdioma():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM idiona')
    data = cur.fetchall()
    return render_template('idioma.html', Idioma=data)

@app.route('/edit/<id>')
def get_Idioma(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM idioma WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-idioma.html', idioma = data[0])


@app.route('/libro')
def getLibro():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM libro')
    data = cur.fetchall()
    return render_template('libro.html', Libro=data)

@app.route('/edit/<id>')
def get_Libro(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM libro WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-libro.html', libro = data[0])

@app.route('/pais')
def getPais():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM pais')
    data = cur.fetchall()
    return render_template('pais.html', Pais=data)

@app.route('/edit/<id>')
def get_Pais(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM pais WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-pais.html', pais = data[0])


@app.route('/prestamo')
def getPrestamo():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM prestamo')
    data = cur.fetchall()
    return render_template('prestamo.html', Prestamo=data)

@app.route('/edit/<id>')
def get_Prestamo(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM prestamo WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-prestamo.html', prestamo = data[0])


@app.route('/sucursal')
def getSucursal():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM sucursal')
    data = cur.fetchall()
    return render_template('sucursal.html', Sucursal=data)

@app.route('/edit/<id>')
def get_Sucursal(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM sucursal WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-sucursal.html', sucursal = data[0])



















