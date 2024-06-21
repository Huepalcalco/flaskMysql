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
def login():
    cur = mysql.connection.cursor()
    cur.execute('SELECT count(*) FROM empleado where USUARIO = "mhernandez" and CONTRASENA = "martinino";')
    data = cur.fetchone()
    print(data)
    return render_template('login.html')

@app.route('/loginWS', methods=['POST'])
def loginWS():
    print("ww")
    if request.method=="POST":
        user= request.form['user']
        passwd= request.form['password']
        cur = mysql.connection.cursor()
        cur.execute('SELECT * FROM empleado where USUARIO = "'+user+'" AND CONTRASENA = "'+passwd+'"')
        data = cur.fetchall()
        print(passwd)
        print(user)
        print(len(data))
        if len(data)>0:
            
            return redirect(url_for('index'))
        else:
            return render_template('login.html')
    # cur = mysql.connection.cursor()
    # cur.execute('SELECT count(*) FROM empleado where USUARIO = "mhernandez" and CONTRASENA = "martinino";')
    # data = cur.fetchone()
    # print(data)
    # return render_template('login.html')

@app.route('/index')
def index():

    return render_template('index.html')


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

#TABLA EDITORIAL

@app.route('/editorial')
def getEditoriales():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM editorial')
    data = cur.fetchall()
    return render_template('editorial.html', Editoriales=data)

@app.route('/editEditorial/<id>')
def get_Editorial(id):
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM editorial WHERE EDITORIAL_ID ='{0}'".format(id))
    data = cur.fetchall()
    return render_template('edit-editorial.html', editorial= data[0])

@app.route('/add_editorial', methods=['POST'])
def add_editorial():
    if request.method=="POST":
        EDITORIAL_ID=request.form['EDITORIAL_ID']
        EDITORIAL=request.form['EDITORIAL']
        cur=mysql.connection.cursor()
        cur.execute("INSERT INTO editorial (EDITORIAL_ID, EDITORIAL) VALUES ('"+str(EDITORIAL_ID)+"','"+str(EDITORIAL)+"');")
        flash('Editorial Agregado con éxito')
        mysql.connection.commit()
        return redirect(url_for('getEditoriales'))
        
@app.route('/updateEditorial/<id>', methods= ['POST'])
def update_editorial(id):
    if request.method == 'POST':
        EDITORIAL_ID=request.form['EDITORIAL_ID']
        EDITORIAL=request.form['EDITORIAL']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE editorial SET EDITORIAL_ID='"+str(EDITORIAL_ID)+"',EDITORIAL='"+str(EDITORIAL)+"' WHERE EDITORIAL_ID ='"+(EDITORIAL_ID)+"'")
        mysql.connection.commit()
        flash('Editorial actualizado')
        return redirect(url_for('getEditoriales'))

@app.route('/deleteEditorial/<string:id>')
def delete_Editorial(id):
    cur = mysql.connection.cursor()
    cur.execute(" DELETE  FROM editorial WHERE EDITORIAL_ID = '{0}'".format(id))
    mysql.connection.commit()
    flash('Editorial eliminado')
    return redirect(url_for('getEditoriales'))

#TABLA PAIS
@app.route('/Pais')
def getPaises():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM pais')
    data = cur.fetchall()
    return render_template('pais.html', Paises=data)

@app.route('/editPais/<id>')
def get_Pais(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM pais WHERE PAIS_ID ='+(id))
    data = cur.fetchall()
    return render_template('edit-pais.html', pais= data[0])

@app.route('/add_pais', methods=['POST'])
def add_pais():
    if request.method=="POST":
        PAIS_ID= request.form['PAIS_ID']
        PAIS= request.form['PAIS']
        LAST_UPDATE= request.form['LAST_UPDATE']
        cur=mysql.connection.cursor()
        cur.execute("INSERT INTO pais (PAIS_ID,PAIS,LAST_UPDATE) VALUES ('"+str(PAIS_ID)+"','"+str(PAIS)+"','"+str(LAST_UPDATE)+"');")
        flash('Pais Agregado con éxito')
        mysql.connection.commit()
        return redirect(url_for('getPaises'))
        
@app.route('/updatePais/<id>', methods= ['POST'])
def update_pais(id):
    if request.method == 'POST':
        PAIS_ID= request.form['PAIS_ID']
        PAIS= request.form['PAIS']
        LAST_UPDATE= request.form['LAST_UPDATE']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE pais SET PAIS_ID='"+str(PAIS_ID)+"',PAIS='"+str(PAIS)+"',LAST_UPDATE='"+str(LAST_UPDATE)+"' WHERE PAIS_ID ="+(PAIS_ID)) 
        mysql.connection.commit()
        flash('Pais actualizado')
        return redirect(url_for('getPaises'))

@app.route('/deletePais/<string:id>')
def delete_Pais(id):
    cur = mysql.connection.cursor()
    cur.execute(' DELETE  FROM pais WHERE PAIS_ID = {0}'.format(id))
    mysql.connection.commit()
    flash('Pais eliminado')
    return redirect(url_for('getPaises'))

#TABLA ESTADO

@app.route('/estado')
def getEstados():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM estado')
    data = cur.fetchall()
    return render_template('estado.html', Estados=data)

@app.route('/editEstado/<id>')
def get_Estado(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM estado WHERE ESTADO_ID ='+(id))
    data = cur.fetchall()
    return render_template('edit-estado.html', estado= data[0])

@app.route('/add_estado', methods=['POST'])
def add_estado():
    if request.method=="POST":
        ESTADO_ID= request.form['ESTADO_ID']
        ESTADO= request.form['ESTADO']
        PAIS_ID= request.form['PAIS_ID']
        cur=mysql.connection.cursor()
        cur.execute("INSERT INTO estado (ESTADO_ID,ESTADO,PAIS_ID) VALUES ('"+str(ESTADO_ID)+"','"+str(ESTADO)+"','"+str(PAIS_ID)+"')")
        flash('Estado Agregado con éxito')
        mysql.connection.commit()        
        return redirect(url_for('getEstados'))
        
@app.route('/updateEstado/<id>', methods= ['POST'])
def update_estado(id):
    if request.method == 'POST':
        ESTADO_ID= request.form['ESTADO_ID']
        ESTADO= request.form['ESTADO']
        PAIS_ID= request.form['PAIS_ID']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE estado SET ESTADO_ID='"+str(ESTADO_ID)+"',ESTADO='"+str(ESTADO)+"',PAIS_ID='"+str(PAIS_ID)+"' WHERE ESTADO_ID ="+(ESTADO_ID)) 
        mysql.connection.commit()
        flash('Estado actualizado')
        return redirect(url_for('getEstados'))

@app.route('/deleteEstado/<string:id>')
def delete_Estado(id):
    cur = mysql.connection.cursor()
    cur.execute(' DELETE  FROM estado WHERE ESTADO_ID = {0}'.format(id))
    mysql.connection.commit()
    flash('Estado eliminado')
    return redirect(url_for('getEstados'))

#TABLA DIRECCIÓN

@app.route('/direccion')
def getDirecciones():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM direccion')
    data = cur.fetchall()
    return render_template('direccion.html', Direcciones=data)

@app.route('/editDireccion/<id>')
def get_Direccion(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM direccion WHERE DIRECCION_ID ='+(id))
    data = cur.fetchall()
    return render_template('edit-direccion.html', direccion= data[0])

@app.route('/add_direccion', methods=['POST'])
def add_direccion():
    if request.method=="POST":        
        DIRECCION_ID= request.form['DIRECCION_ID']
        ALCALDIA= request.form['ALCALDIA']
        CP= request.form['CP']
        CALLE= request.form['CALLE']
        EXTERIOR= request.form['EXTERIOR']
        INTERIOR= request.form['INTERIOR']
        ESTADO_ID= request.form['ESTADO_ID']
        cur=mysql.connection.cursor()
        cur.execute("INSERT INTO direccion (DIRECCION_ID,ALCALDIA,CP,CALLE,EXTERIOR,INTERIOR,ESTADO_ID) VALUES ('"+str(DIRECCION_ID)+"','"+str(ALCALDIA)+"','"+str(CP)+"','"+str(CALLE)+"','"+str(EXTERIOR)+"','"+str(INTERIOR)+"','"+str(ESTADO_ID)+"')")
        flash('Direccion Agregado con éxito')
        mysql.connection.commit()
        return redirect(url_for('getDirecciones'))
        
@app.route('/updateDireccion/<id>', methods= ['POST'])
def update_direccion(id):
    if request.method == 'POST':
        DIRECCION_ID= request.form['DIRECCION_ID']
        ALCALDIA= request.form['ALCALDIA']
        CP= request.form['CP']
        CALLE= request.form['CALLE']
        EXTERIOR= request.form['EXTERIOR']
        INTERIOR= request.form['INTERIOR']
        ESTADO_ID= request.form['ESTADO_ID']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE direccion SET DIRECCION_ID='"+str(DIRECCION_ID)+"',ALCALDIA='"+str(ALCALDIA)+"',CP='"+str(CP)+"', CALLE='"+str(CALLE)+"', EXTERIOR='"+str(EXTERIOR)+"', INTERIOR='"+str(INTERIOR)+"', ESTADO_ID='"+str(ESTADO_ID)+"'  WHERE DIRECCION_ID ="+(DIRECCION_ID))
        mysql.connection.commit()
        flash('Direccion actualizado')
        return redirect(url_for('getDirecciones'))

@app.route('/deleteDireccion/<string:id>')
def delete_Direccion(id):
    cur = mysql.connection.cursor()
    cur.execute(' DELETE  FROM direccion WHERE DIRECCION_ID = {0}'.format(id))
    mysql.connection.commit()
    flash('Direccion eliminado')
    return redirect(url_for('getDirecciones'))

#TABLA EMPLEADO 

@app.route('/empleado')
def getEmpleados():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM empleado')
    data = cur.fetchall()
    return render_template('empleado.html', Empleados=data)

@app.route('/editEmpleado/<id>')
def get_Empleado(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM empleado WHERE EMPLEADO_ID ='+(id))
    data = cur.fetchall()
    return render_template('edit-empleado.html', empleado= data[0])

@app.route('/add_empleado', methods=['POST'])
def add_empleado():
    if request.method=="POST":
        EMPLEADO_ID= request.form['EMPLEADO_ID']
        NOMBRE= request.form['NOMBRE']
        APELLIDO_PAT= request.form['APELLIDO_PAT']
        APELLIDO_MAT= request.form['APELLIDO_MAT']
        HORA_ENTRADA= request.form['HORA_ENTRADA']
        HORA_SALIDA= request.form['HORA_SALIDA']
        GENERO= request.form['GENERO']
        RFC= request.form['RFC']
        FECHA_NACIMIENTO= request.form['FECHA_NACIMIENTO']
        CORREO= request.form['CORREO']
        USUARIO= request.form['USUARIO']
        CONTRASENA= request.form['CONTRASENA']
        SUCURSAL_ID= request.form['SUCURSAL_ID']
        DIRECCION_ID= request.form['DIRECCION_ID']
        cur=mysql.connection.cursor()
        cur.execute("INSERT INTO empleado (EMPLEADO_ID,NOMBRE,APELLIDO_PAT,APELLIDO_MAT,HORA_ENTRADA,HORA_SALIDA,GENERO,RFC,FECHA_NACIMIENTO,CORREO,USUARIO,CONTRASENA,SUCURSAL_ID,DIRECCION_ID) VALUES ('"+str(EMPLEADO_ID)+"','"+str(NOMBRE)+"','"+str(APELLIDO_PAT)+"','"+str(APELLIDO_MAT)+"','"+str(HORA_ENTRADA)+"','"+str(HORA_SALIDA)+"','"+str(GENERO)+"','"+str(RFC)+"','"+str(FECHA_NACIMIENTO)+"','"+str(CORREO)+"','"+str(USUARIO)+"','"+str(CONTRASENA)+"','"+str(SUCURSAL_ID)+"','"+str(DIRECCION_ID)+"');")
        flash(' Agregado con éxito')
        mysql.connection.commit()
        return redirect(url_for('getEmpleados'))
        
@app.route('/updateEmpleado/<id>', methods= ['POST'])
def update_empleado(id):
    if request.method == 'POST':
        EMPLEADO_ID= request.form['EMPLEADO_ID']
        NOMBRE= request.form['NOMBRE']
        APELLIDO_PAT= request.form['APELLIDO_PAT']
        APELLIDO_MAT= request.form['APELLIDO_MAT']
        HORA_ENTRADA= request.form['HORA_ENTRADA']
        HORA_SALIDA= request.form['HORA_SALIDA']
        GENERO= request.form['GENERO']
        RFC= request.form['RFC']
        FECHA_NACIMIENTO= request.form['FECHA_NACIMIENTO']
        CORREO= request.form['CORREO']
        USUARIO= request.form['USUARIO']
        CONTRASENA= request.form['CONTRASENA']
        SUCURSAL_ID= request.form['SUCURSAL_ID']
        DIRECCION_ID= request.form['DIRECCION_ID']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE empleado SET EMPLEADO_ID='"+str(EMPLEADO_ID)+"',NOMBRE='"+str(NOMBRE)+"',APELLIDO_PAT='"+str(APELLIDO_PAT)+"',APELLIDO_MAT='"+str(APELLIDO_MAT)+"',HORA_ENTRADA='"+str(HORA_ENTRADA)+"',HORA_SALIDA='"+str(HORA_SALIDA)+"',GENERO='"+str(GENERO)+"',RFC='"+str(RFC)+"',FECHA_NACIMIENTO='"+str(FECHA_NACIMIENTO)+"',CORREO='"+str(CORREO)+"',USUARIO='"+str(USUARIO)+"',CONTRASENA='"+str(CONTRASENA)+"',SUCURSAL_ID='"+str(SUCURSAL_ID)+"',DIRECCION_ID='"+str(DIRECCION_ID)+"' WHERE EMPLEADO_ID ="+(EMPLEADO_ID))
        mysql.connection.commit()
        flash(' Empleado actualizado')
        return redirect(url_for('getEmpleados'))

@app.route('/deleteEmpleado/<string:id>')
def delete_Empleado(id):
    cur = mysql.connection.cursor()
    cur.execute(' DELETE  FROM empleado WHERE EMPLEADO_ID = {0}'.format(id))
    mysql.connection.commit()
    flash(' eliminado')
    return redirect(url_for('getEmpleados'))

#TABLA PRESTAMO

@app.route('/prestamo')
def getPrestamos():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM prestamo')
    data = cur.fetchall()
    return render_template('prestamo.html', Prestamos=data)

@app.route('/editPrestamo/<id>')
def get_Prestamo(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM prestamo WHERE PRESTAMO_ID ='+(id))
    data = cur.fetchall()
    return render_template('edit-prestamo.html', prestamo= data[0])

@app.route('/add_prestamo', methods=['POST'])
def add_prestamo():
    if request.method=="POST":
        PRESTAMO_ID= request.form['PRESTAMO_ID']
        FECHA_PRESTAMO= request.form['FECHA_PRESTAMO']
        FECHA_ENTREGA= request.form['FECHA_ENTREGA']
        CLIENTE_ID= request.form['CLIENTE_ID']
        EMPLEADO_ID= request.form['EMPLEADO_ID']
        cur=mysql.connection.cursor()
        cur.execute("INSERT INTO prestamo (PRESTAMO_ID,FECHA_PRESTAMO,FECHA_ENTREGA,CLIENTE_ID,EMPLEADO_ID) VALUES ('"+str(PRESTAMO_ID)+"','"+str(FECHA_PRESTAMO)+"','"+str(FECHA_ENTREGA)+"','"+str(CLIENTE_ID)+"','"+str(EMPLEADO_ID)+"');")
        flash(' Agregado con éxito')
        mysql.connection.commit()
        return redirect(url_for('getPrestamos'))
        
@app.route('/updatePrestamo/<id>', methods= ['POST'])
def update_Prestamo(id):
    if request.method == 'POST':
        PRESTAMO_ID= request.form['PRESTAMO_ID']
        FECHA_PRESTAMO= request.form['FECHA_PRESTAMO']
        FECHA_ENTREGA= request.form['FECHA_ENTREGA']
        CLIENTE_ID= request.form['CLIENTE_ID']
        EMPLEADO_ID= request.form['EMPLEADO_ID']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE prestamo SET PRESTAMO_ID='"+str(PRESTAMO_ID)+"',FECHA_PRESTAMO='"+str(FECHA_PRESTAMO)+"',FECHA_ENTREGA='"+str(FECHA_ENTREGA)+"',CLIENTE_ID='"+str(CLIENTE_ID)+"',EMPLEADO_ID='"+str(EMPLEADO_ID)+"' WHERE PRESTAMO_ID ="+(PRESTAMO_ID)) 
        mysql.connection.commit()
        flash(' actualizado')
        return redirect(url_for('getPrestamos'))
        
@app.route('/deletePrestamo/<string:id>')
def delete_Prestamo(id):
    cur = mysql.connection.cursor()
    cur.execute(' DELETE  FROM prestamo WHERE PRESTAMO_ID = {0}'.format(id))
    mysql.connection.commit()
    flash(' eliminado')
    return redirect(url_for('getPrestamos'))

#TABLA ESCOLARIDAD

@app.route('/escolaridad')
def getEscolaridades():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM escolaridad')
    data = cur.fetchall()
    return render_template('escolaridad.html', Escolaridades=data)

@app.route('/editEscolaridad/<id>')
def get_Escolaridad(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM escolaridad WHERE ESCOLARIDAD_ID ='+(id))
    data = cur.fetchall()
    return render_template('edit-escolaridad.html', escolaridad= data[0])

@app.route('/add_escolaridad', methods=['POST'])
def add_escolaridad():
    if request.method=="POST":
        
        ESCOLARIDAD_ID= request.form['ESCOLARIDAD_ID']
        NIVEL= request.form['NIVEL']
        cur=mysql.connection.cursor()
        cur.execute("INSERT INTO escolaridad (ESCOLARIDAD_ID,NIVEL) VALUES ('"+str(ESCOLARIDAD_ID)+"','"+str(NIVEL)+"')")
        flash(' Agregado con éxito')
        mysql.connection.commit()
        return redirect(url_for('getEscolaridades'))
        
@app.route('/updateEscolaridad/<id>', methods= ['POST'])
def update_escolaridad(id):
    if request.method == 'POST':
        ESCOLARIDAD_ID= request.form['ESCOLARIDAD_ID']
        NIVEL= request.form['NIVEL']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE escolaridad SET ESCOLARIDAD_ID='"+str(ESCOLARIDAD_ID)+"',NIVEL='"+str(NIVEL)+"' WHERE ESCOLARIDAD_ID ="+(ESCOLARIDAD_ID))
        mysql.connection.commit()
        flash(' actualizado')
        return redirect(url_for('getEscolaridades'))
        
@app.route('/deleteEscolaridad/<string:id>')
def delete_escolaridad(id):
    cur = mysql.connection.cursor()
    cur.execute(' DELETE  FROM escolaridad WHERE ESCOLARIDAD_ID = {0}'.format(id))
    mysql.connection.commit()
    flash(' eliminado')
    return redirect(url_for('getEscolaridades'))
 
#TABLA CREDENCIAL
@app.route('/credencial')
def getCredenciales():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM credencial')
    data = cur.fetchall()
    return render_template('credencial.html', Credenciales=data)

@app.route('/editCredencial/<id>')
def get_Credencial(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM credencial WHERE CREDENCIAL_ID ='+(id))
    data = cur.fetchall()
    return render_template('edit-credencial.html', credencial= data[0])

@app.route('/add_credencial', methods=['POST'])
def add_credencial():
    if request.method=="POST":
        CREDENCIAL_ID= request.form['CREDENCIAL_ID']
        FECHA_RENOVACION= request.form['FECHA_RENOVACION']
        cur=mysql.connection.cursor()
        cur.execute("INSERT INTO credencial (CREDENCIAL_ID,FECHA_RENOVACION) VALUES ('"+str(CREDENCIAL_ID)+"','"+str(FECHA_RENOVACION)+"')")
        flash(' Agregado con éxito')
        mysql.connection.commit()        
        return redirect(url_for('getCredenciales'))
        
@app.route('/updateCredencial/<id>', methods= ['POST'])
def update_credencial(id):

    if request.method == 'POST':
        CREDENCIAL_ID= request.form['CREDENCIAL_ID']
        FECHA_RENOVACION= request.form['FECHA_RENOVACION']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE credencial SET CREDENCIAL_ID='"+str(CREDENCIAL_ID)+"',FECHA_RENOVACION='"+str(FECHA_RENOVACION)+"' WHERE CREDENCIAL_ID ="+(CREDENCIAL_ID)) 
        mysql.connection.commit()
        flash(' actualizado')
        return redirect(url_for('getCredenciales'))
        
@app.route('/deleteCredencial/<string:id>')
def delete_Credencial(id):
    cur = mysql.connection.cursor()
    cur.execute(' DELETE  FROM credencial WHERE CREDENCIAL_ID = {0}'.format(id))
    mysql.connection.commit()
    flash(' eliminado')
    return redirect(url_for('getCredenciales'))
  
# tabla libro

@app.route('/libro')
def getLibros():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM libro')
    data = cur.fetchall()
    return render_template('libro.html', Libros=data)

@app.route('/editLibro/<id>')
def get_Libro(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM libro WHERE LIBRO_ID ='+(id))
    data = cur.fetchall()
    print(data[0])
    return render_template('edit-libro.html', libro = data[0])

@app.route('/add_libro', methods=['POST'])
def add_libro():
    if request.method=="POST":
        LIBRO_ID= request.form['LIBRO_ID']
        TITULO= request.form['TITULO']
        EDICION= request.form['EDICION']
        ANIO= request.form['ANIO']
        NUM_PAGINAS= request.form['NUM_PAGINAS']
        IDIOMA_ID= request.form['IDIOMA_ID']
        GENERO_ID= request.form['GENERO_ID']
        PAIS_ID= request.form['PAIS_ID']
        EDITORIAL_ID= request.form['EDITORIAL_ID']
        cur=mysql.connection.cursor()
        cur.execute("INSERT INTO libro (LIBRO_ID,TITULO,EDICION,ANIO,NUM_PAGINAS,IDIOMA_ID,GENERO_ID,PAIS_ID, EDITORIAL_ID) VALUES ('"+str(LIBRO_ID)+"', '"+str(TITULO)+"', '"+str(EDICION)+"','"+str(ANIO)+"','"+str(NUM_PAGINAS)+"','"+str(IDIOMA_ID)+"','"+str(GENERO_ID)+"','"+str(PAIS_ID)+"','"+str(EDITORIAL_ID)+"');")
        flash('LIBRO AGREGADO')
        # mycursor.execute("INSERT INTO gish_listening_db.Media (name, id_mediaType, id_MediaStatus) VALUES ('"+str(name)+"', '"+str(mediaType)+"', '1');")
        mysql.connection.commit()        
        return redirect(url_for('getLibros'))

@app.route('/updateLibro/<id>', methods= ['POST'])
def update_libro(id):
    if request.method == 'POST':
        LIBRO_ID= request.form['LIBRO_ID']
        TITULO= request.form['TITULO']
        EDICION= request.form['EDICION']
        ANIO= request.form['ANIO']
        NUM_PAGINAS= request.form['NUM_PAGINAS']
        IDIOMA_ID= request.form['IDIOMA_ID']
        GENERO_ID= request.form['GENERO_ID']
        PAIS_ID= request.form['PAIS_ID']
        EDITORIAL_ID= request.form['EDITORIAL_ID']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE libro  SET LIBRO_ID='"+str(LIBRO_ID)+"', TITULO='"+str(TITULO)+"', EDICION='"+str(EDICION)+"', ANIO='"+str(ANIO)+"',NUM_PAGINAS='"+str(NUM_PAGINAS)+"',IDIOMA_ID='"+str(IDIOMA_ID)+"',GENERO_ID='"+str(GENERO_ID)+"',PAIS_ID='"+str(PAIS_ID)+"', EDITORIAL_ID='"+str(EDITORIAL_ID)+"' WHERE LIBRO_ID ="+(LIBRO_ID))
        mysql.connection.commit()
        flash('ACTUALIZACION EXITOSA')
        return redirect(url_for('getLibros'))

@app.route('/deleteLibro/<string:id>')
def delete_Libro(id):
    cur = mysql.connection.cursor()
    cur.execute(' DELETE  FROM libro WHERE LIBRO_ID = {0}'.format(id))
    mysql.connection.commit()
    flash('LIBRO ELIMINADO')
    return redirect(url_for('getLibros'))

