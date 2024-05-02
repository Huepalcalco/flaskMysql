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
    

@app.route('/')
def index():
    user_ip = request.cookies.get('user_ip')
    context = {
        'user_ip': user_ip,
        'todos' : todos,
    }

    return render_template('index.html', **context)

@app.route('/getProducts')
def getProducts():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM Products')
    data = cur.fetchall()
    return render_template('product.html', Products=data)

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
        
@app.route('/editProduct/<id>')
def get_Product(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM Products WHERE id ='+(id))
    data = cur.fetchall()
    return render_template('edit-product.html', product = data[0])

@app.route('/updateProduct/<id>', methods= ['POST'])
def update_Product(id):
    if request.method == 'POST':
        product= request.form['product']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE Products SET name='"+str(product)+"' WHERE id ="+(id))
        # (product, phone, email, id))   
        mysql.connection.commit()
        flash('ACTUALIZACION EXITOSA')
        return redirect(url_for('getProducts'))

@app.route('/deleteProduct/<string:id>')
def delete_Product(id):
    cur = mysql.connection.cursor()
    cur.execute(' DELETE  FROM Products WHERE id = {0}'.format(id))
    mysql.connection.commit()
    flash('ELEMENTO ELIMINADO')
    return redirect(url_for('getProducts'))


#tabla autor
@app.route('/autors')
def getAutors():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM autor')
    data = cur.fetchall()
    return render_template('autor.html', Autors=data)

@app.route('/editAutors/<id>')
def get_Autor(id):
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM autor WHERE  AUTOR_ID='{0}'".format(id))
    data = cur.fetchall()
    return render_template('edit-autor.html', autor = data[0])

@app.route('/add_autor', methods=['POST'])
def add_autor():
    if request.method=="POST":
        AUTOR_ID= request.form['AUTOR_ID']
        NOMBRE= request.form['NOMBRE']
        APELLIDO_PAT= request.form['APELLIDO_PAT']
        LAST_UPDATE= request.form['LAST_UPDATE']
        PAIS_ID= request.form['PAIS_ID']
        cur=mysql.connection.cursor()
        cur.execute("INSERT INTO autor (`AUTOR_ID`,`NOMBRE`,`APELLIDO_PAT`,`LAST_UPDATE`,`PAIS_ID`) VALUES ('"+str(AUTOR_ID)+"', '"+str(NOMBRE)+"', '"+str(APELLIDO_PAT)+"','"+str(LAST_UPDATE)+"','"+str(PAIS_ID)+"');")
        flash('AUTOR AGREGADO')
        # mycursor.execute("INSERT INTO `gish_listening_db`.`Media` (`name`, `id_mediaType`, `id_MediaStatus`) VALUES ('"+str(name)+"', '"+str(mediaType)+"', '1');")
        mysql.connection.commit()        
        return redirect(url_for('getAutors'))

@app.route('/updateAutor/<id>', methods= ['POST'])
def update_autor(id):
    if request.method == 'POST':
        AUTOR_ID= request.form['AUTOR_ID']
        NOMBRE= request.form['NOMBRE']
        APELLIDO_PAT= request.form['APELLIDO_PAT']
        LAST_UPDATE= request.form['LAST_UPDATE']
        PAIS_ID= request.form['PAIS_ID']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE autor  SET AUTOR_ID='"+str(AUTOR_ID)+"', NOMBRE='"+str(NOMBRE)+"', APELLIDO_PAT='"+str(APELLIDO_PAT)+"', LAST_UPDATE='"+str(LAST_UPDATE)+"',PAIS_ID='"+str(PAIS_ID)+"' WHERE AUTOR_ID ='"+(AUTOR_ID)+"'")
        mysql.connection.commit()
        flash('ACTUALIZACION EXITOSA')
        return redirect(url_for('getAutors'))

@app.route('/deleteAutor/<string:id>')
def delete_Autor(id):
    cur = mysql.connection.cursor()
    cur.execute("DELETE  FROM autor WHERE AUTOR_ID = '{0}'".format(id))
    mysql.connection.commit()
    flash('AUTOR ELIMINADO')
    return redirect(url_for('getAutors'))


# tabla cliente
@app.route('/cliente')
def getClientes():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM cliente')
    data = cur.fetchall()
    return render_template('cliente.html', Clientes=data)

@app.route('/editCliente/<id>')
def get_Cliente(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM cliente WHERE CLIENTE_ID ='+(id))
    data = cur.fetchall()
    print(data[0])
    return render_template('edit-cliente.html', cliente = data[0])

@app.route('/add_cliente', methods=['POST'])
def add_cliente():
    if request.method=="POST":
        CLIENTE_ID= request.form['CLIENTE_ID']
        NOMBRE= request.form['NOMBRE']
        APELLIDO_PAT= request.form['APELLIDO_PAT']
        APELLIDO_MAT= request.form['APELLIDO_MAT']
        CORREO= request.form['CORREO']
        DIRECCION_ID= request.form['DIRECCION_ID']
        ESCOLARIDAD_ID= request.form['ESCOLARIDAD_ID']
        CREDENCIAL_ID= request.form['CREDENCIAL_ID']
        cur=mysql.connection.cursor()
        cur.execute("INSERT INTO cliente (`CLIENTE_ID`,`NOMBRE`,`APELLIDO_PAT`,`APELLIDO_MAT`,`CORREO`,`DIRECCION_ID`,`ESCOLARIDAD_ID`, `CREDENCIAL_ID`) VALUES ('"+str(CLIENTE_ID)+"', '"+str(NOMBRE)+"', '"+str(APELLIDO_PAT)+"','"+str(APELLIDO_MAT)+"','"+str(CORREO)+"','"+str(DIRECCION_ID)+"','"+str(ESCOLARIDAD_ID)+"','"+str(CREDENCIAL_ID)+"');")
        flash('CLIENTE AGREGADO')
        # mycursor.execute("INSERT INTO `gish_listening_db`.`Media` (`name`, `id_mediaType`, `id_MediaStatus`) VALUES ('"+str(name)+"', '"+str(mediaType)+"', '1');")
        mysql.connection.commit()        
        return redirect(url_for('getClientes'))

@app.route('/updateCliente/<id>', methods= ['POST'])
def update_cliente(id):
    if request.method == 'POST':
        CLIENTE_ID= request.form['CLIENTE_ID']
        NOMBRE= request.form['NOMBRE']
        APELLIDO_PAT= request.form['APELLIDO_PAT']
        APELLIDO_MAT= request.form['APELLIDO_MAT']
        CORREO= request.form['CORREO']
        DIRECCION_ID= request.form['DIRECCION_ID']
        ESCOLARIDAD_ID= request.form['ESCOLARIDAD_ID']
        CREDENCIAL_ID= request.form['CREDENCIAL_ID']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE cliente  SET CLIENTE_ID='"+str(CLIENTE_ID)+"', NOMBRE='"+str(NOMBRE)+"', APELLIDO_PAT='"+str(APELLIDO_PAT)+"', APELLIDO_MAT='"+str(APELLIDO_MAT)+"',CORREO='"+str(CORREO)+"',DIRECCION_ID='"+str(DIRECCION_ID)+"',ESCOLARIDAD_ID='"+str(ESCOLARIDAD_ID)+"', CREDENCIAL_ID='"+str(CREDENCIAL_ID)+"' WHERE CLIENTE_ID ="+(CLIENTE_ID))
        mysql.connection.commit()
        flash('ACTUALIZACION EXITOSA')
        return redirect(url_for('getClientes'))

@app.route('/deleteCliente/<string:id>')
def delete_Cliente(id):
    cur = mysql.connection.cursor()
    cur.execute(' DELETE  FROM cliente WHERE CLIENTE_ID = {0}'.format(id))
    mysql.connection.commit()
    flash('CLIENTE ELIMINADO')
    return redirect(url_for('getClientes'))

#tabla sucursal

@app.route('/sucursal')
def getSucursales():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM sucursal')
    data = cur.fetchall()
    return render_template('sucursal.html', Sucursales=data)

@app.route('/editSucursal/<id>')
def get_Sucursal(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM sucursal WHERE SUCURSAL_ID ='+(id))
    data = cur.fetchall()
    print(data[0])
    return render_template('edit-sucursal.html', sucursal = data[0])

@app.route('/add_sucursal', methods=['POST'])
def add_sucursal():
    if request.method=="POST":
        SUCURSAL_ID= request.form['SUCURSAL_ID']
        NOMBRE= request.form['NOMBRE']
        LADA= request.form['LADA']
        TELEFONO= request.form['TELEFONO']
        EXTENSION= request.form['EXTENSION']
        PAGINA_WEB= request.form['PAGINA_WEB']
        HORA_APERTURA= request.form['HORA_APERTURA']
        HORA_CIERRE= request.form['HORA_CIERRE']
        CORREO= request.form['CORREO']
        DIRECCION_ID= request.form['DIRECCION_ID']
        cur=mysql.connection.cursor()
        cur.execute("INSERT INTO sucursal (`SUCURSAL_ID`,`NOMBRE`,`LADA`,`TELEFONO`,`EXTENSION`,`PAGINA_WEB`,`HORA_APERTURA`, `HORA_CIERRE`, `CORREO`, `DIRECCION_ID`) VALUES ('"+str(SUCURSAL_ID)+"', '"+str(NOMBRE)+"', '"+str(LADA)+"','"+str(TELEFONO)+"','"+str(EXTENSION)+"','"+str(PAGINA_WEB)+"','"+str(HORA_APERTURA)+"','"+str(HORA_CIERRE)+"','"+str(CORREO)+"','"+str(DIRECCION_ID)+"');")
        flash('SUCURSAL AGREGADO')
        # mycursor.execute("INSERT INTO `gish_listening_db`.`Media` (`name`, `id_mediaType`, `id_MediaStatus`) VALUES ('"+str(name)+"', '"+str(mediaType)+"', '1');")
        mysql.connection.commit()        
        return redirect(url_for('getSucursales'))

@app.route('/updateSucursal/<id>', methods= ['POST'])
def update_sucursal(id):
    if request.method == 'POST':
        SUCURSAL_ID= request.form['SUCURSAL_ID']
        NOMBRE= request.form['NOMBRE']
        LADA= request.form['LADA']
        TELEFONO= request.form['TELEFONO']
        EXTENSION= request.form['EXTENSION']
        PAGINA_WEB= request.form['PAGINA_WEB']
        HORA_APERTURA= request.form['HORA_APERTURA']
        HORA_CIERRE= request.form['HORA_CIERRE']
        CORREO= request.form['CORREO']
        DIRECCION_ID= request.form['DIRECCION_ID']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE sucursal  SET SUCURSAL_ID='"+str(SUCURSAL_ID)+"', NOMBRE='"+str(NOMBRE)+"', LADA='"+str(LADA)+"', TELEFONO='"+str(TELEFONO)+"', EXTENSION='"+str(EXTENSION)+"',PAGINA_WEB='"+str(PAGINA_WEB)+"',HORA_APERTURA='"+str(HORA_APERTURA)+"',HORA_CIERRE='"+str(HORA_CIERRE)+"', CORREO='"+str(CORREO)+"', DIRECCION_ID='"+str(DIRECCION_ID)+"' WHERE SUCURSAL_ID ="+(SUCURSAL_ID))
        mysql.connection.commit()
        flash('ACTUALIZACION EXITOSA')
        return redirect(url_for('getSucursales'))

@app.route('/deleteSucursal/<string:id>')
def delete_Sucursal(id):
    cur = mysql.connection.cursor()
    cur.execute(' DELETE  FROM sucursal WHERE SUCURSAL_ID = {0}'.format(id))
    mysql.connection.commit()
    flash('SUCURSAL ELIMINADA')
    return redirect(url_for('getSucursales'))


#tabla idioma

@app.route('/idioma')
def getIdiomas():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM idioma')
    data = cur.fetchall()
    return render_template('idioma.html', Idiomas=data)

@app.route('/editIdioma/<id>')
def get_Idioma(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM idioma WHERE IDIOMA_ID ='+(id))
    data = cur.fetchall()
    return render_template('edit-idioma.html', idioma = data[0])

@app.route('/add_idioma', methods=['POST'])
def add_idioma():
    if request.method=="POST":
        IDIOMA_ID=request.form['IDIOMA_ID']
        IDIOMA=request.form['IDIOMA']
        LAST_UPDATE=request.form['LAST_UPDATE']
        cur=mysql.connection.cursor()
        cur.execute("INSERT INTO idioma (IDIOMA_ID, IDIOMA, LAST_UPDATE) VALUES ('"+str(IDIOMA_ID)+"','"+str(IDIOMA)+"','"+str(LAST_UPDATE)+"');")
        flash('Idioma Agregado')
        mysql.connection.commit()
        return redirect(url_for('getIdiomas'))
        
@app.route('/updateIdioma/<id>', methods= ['POST'])
def update_idioma(id):
    if request.method == 'POST':
        IDIOMA_ID=request.form['IDIOMA_ID']
        IDIOMA=request.form['IDIOMA']
        LAST_UPDATE=request.form['LAST_UPDATE']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE idioma SET IDIOMA_ID='"+str(IDIOMA_ID)+"',IDIOMA='"+str(IDIOMA)+"',LAST_UPDATE='"+str(LAST_UPDATE)+"' WHERE IDIOMA_ID ="+(IDIOMA_ID)) 
        mysql.connection.commit()
        flash('Idioma actualizado')
        return redirect(url_for('getIdiomas'))

@app.route('/deleteIdioma/<string:id>')
def delete_Idioma(id):
    cur = mysql.connection.cursor()
    cur.execute(' DELETE  FROM idioma WHERE IDIOMA_ID = {0}'.format(id))
    mysql.connection.commit()
    flash('Idioma eliminado')
    return redirect(url_for('getIdiomas'))


# tabla genero

@app.route('/genero')
def getGeneros():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM genero')
    data = cur.fetchall()
    return render_template('genero.html', Generos=data)

@app.route('/editGenero/<id>')
def get_Genero(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM genero WHERE GENERO_ID ='+(id))
    data = cur.fetchall()
    print(data[0])
    return render_template('edit-genero.html', genero = data[0])

@app.route('/add_genero', methods=['POST'])
def add_genero():
    if request.method=="POST":
        GENERO_ID= request.form['GENERO_ID']
        GENERO= request.form['GENERO']
        LAST_UPDATE= request.form['LAST_UPDATE']
        cur=mysql.connection.cursor()
        cur.execute("INSERT INTO genero (GENERO_ID, GENERO, LAST_UPDATE) VALUES ('"+str(GENERO_ID)+"', '"+str(GENERO)+"', '"+str(LAST_UPDATE)+"');")
        flash('GENERO AGREGADO')
        # mycursor.execute("INSERT INTO gish_listening_db.Media (name, id_mediaType, id_MediaStatus) VALUES ('"+str(name)+"', '"+str(mediaType)+"', '1');")
        mysql.connection.commit()        
        return redirect(url_for('getGeneros'))

@app.route('/updateGenero/<id>', methods= ['POST'])
def update_genero(id):
    if request.method == 'POST':
        GENERO_ID= request.form['GENERO_ID']
        GENERO= request.form['GENERO']
        LAST_UPDATE= request.form['LAST_UPDATE']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE genero SET GENERO_ID='"+str(GENERO_ID)+"',GENERO='"+str(GENERO)+"',LAST_UPDATE='"+str(LAST_UPDATE)+"' WHERE GENERO_ID ="+(GENERO_ID)) 
        mysql.connection.commit()
        flash('ACTUALIZACION EXITOSA')
        return redirect(url_for('getGeneros'))

@app.route('/deleteGenero/<string:id>')
def delete_Genero(id):
    cur = mysql.connection.cursor()
    cur.execute(' DELETE FROM genero WHERE GENERO_ID = {0}'.format(id))
    mysql.connection.commit()
    flash('GENERO ELIMINADO')
    return redirect(url_for('getGeneros')) 