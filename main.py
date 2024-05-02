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
    return render_template('Autoria.html', Autoria=data)

@app.route('/edit/<id>')
def get_Atoria(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM autoria WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-Autoria.html', autoria = data[0])


@app.route('/cliente')
def getCliente():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM cliente')
    data = cur.fetchall()
    return render_template('Cliente.html', Cliente=data)

@app.route('/edit/<id>')
def get_Cliente(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM cliente WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-Cliente.html', cliente = data[0])


@app.route('/credencial')
def getCredencial():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM credencial')
    data = cur.fetchall()
    return render_template('Credencial.html', Credencial=data)

@app.route('/edit/<id>')
def get_Credencial(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM credencial WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-Credencial.html', credencial = data[0])


@app.route('/d_prestamo')
def getD_prestamo():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM detalles_prestamo')
    data = cur.fetchall()
    return render_template('D_prestamo.html', D_prestamo=data)

@app.route('/edit/<id>')
def get_D_presamo(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM detalles_prestamo WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-D_prestamos.html', D_prestamos = data[0])


@app.route('/direccion')
def getDireccion():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM direccion')
    data = cur.fetchall()
    return render_template('Direccion.html', Direccion=data)

@app.route('/edit/<id>')
def get_Direccion(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM direccion WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-Direccion.html', direccion = data[0])


@app.route('/editorial')
def getEditoail():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM editorial')
    data = cur.fetchall()
    return render_template('Editorial.html', Editorial=data)

@app.route('/edit/<id>')
def get_Editorial(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM editorial WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-Editorial.html', editorial = data[0])


@app.route('/empleado')
def getEmpleado():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM empleado')
    data = cur.fetchall()
    return render_template('Empleado.html', Empleado=data)

@app.route('/edit/<id>')
def get_Empleado(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM empleado WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-Empleado.html', empleado = data[0])


@app.route('/escolaridad')
def getEscolaridad():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM escolaridad')
    data = cur.fetchall()
    return render_template('Escolaridad.html', Escolaridad=data)

@app.route('/edit/<id>')
def get_Escolaridad(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM escolaridad WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-Escolaridad.html', escolaridad = data[0])


@app.route('/estado')
def getEstado():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM estado')
    data = cur.fetchall()
    return render_template('Estado.html', Estado=data)

@app.route('/edit/<id>')
def get_Estado(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM estado WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-Estado.html', estado = data[0])


@app.route('/genero')
def getGenero():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM genero')
    data = cur.fetchall()
    return render_template('Genero.html', Genero=data)

@app.route('/edit/<id>')
def get_Genero(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM genero WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-Genero.html', genero = data[0])


@app.route('/idioma')
def getIdioma():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM idiona')
    data = cur.fetchall()
    return render_template('Idioma.html', Idioma=data)

@app.route('/edit/<id>')
def get_Idioma(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM idioma WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-Idioma.html', idioma = data[0])


@app.route('/libro')
def getLibro():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM libro')
    data = cur.fetchall()
    return render_template('Libro.html', Libro=data)

@app.route('/edit/<id>')
def get_Libro(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM libro WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-Libro.html', libro = data[0])

@app.route('/pais')
def getPais():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM pais')
    data = cur.fetchall()
    return render_template('Pais.html', Pais=data)

@app.route('/edit/<id>')
def get_Pais(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM pais WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-Pais.html', pais = data[0])


@app.route('/prestamo')
def getPrestamo():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM prestamo')
    data = cur.fetchall()
    return render_template('Prestamo.html', Prestamo=data)

@app.route('/edit/<id>')
def get_Prestamo(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM prestamo WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-Prestamo.html', prestamo = data[0])


@app.route('/sucursal')
def getSucursal():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM sucursal')
    data = cur.fetchall()
    return render_template('Sucursal.html', Sucursal=data)

@app.route('/edit/<id>')
def get_Sucursal(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM sucursal WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-Sucursal.html', sucursal = data[0])



















