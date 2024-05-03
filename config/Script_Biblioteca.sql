CREATE TABLE CREDENCIAL (
CREDENCIAL_ID SMALLINT,
FECHA_RENOVACION DATE,
CONSTRAINT PK_CREDENCIAL_ID PRIMARY KEY (CREDENCIAL_ID));

CREATE TABLE IDIOMA (
IDIOMA_ID SMALLINT,
IDIOMA VARCHAR2(50),
LAST_UPDATE DATE,
CONSTRAINT PK_IDIOMA_ID PRIMARY KEY (IDIOMA_ID));

CREATE TABLE GENERO(
GENERO_ID SMALLINT,
GENERO VARCHAR2(25),
LAST_UPDATE DATE,
CONSTRAINT PK_GENERO_ID PRIMARY KEY (GENERO_ID));

CREATE TABLE EDITORIAL(
EDITORIAL_ID VARCHAR2(4),
EDITORIAL VARCHAR2(80),
CONSTRAINT PK_EDITORIAL_ID PRIMARY KEY (EDITORIAL_ID));

CREATE TABLE ESCOLARIDAD(
ESCOLARIDAD_ID SMALLINT,
NIVEL VARCHAR2(25),
CONSTRAINT PK_ESCOLARIDAD_ID PRIMARY KEY (ESCOLARIDAD_ID));

CREATE TABLE PAIS(
PAIS_ID SMALLINT,
PAIS VARCHAR2(50),
LAST_UPDATE DATE,
CONSTRAINT PK_PAIS_ID PRIMARY KEY (PAIS_ID));

CREATE TABLE ESTADO(
ESTADO_ID SMALLINT,
ESTADO VARCHAR2(50),
PAIS_ID SMALLINT,
CONSTRAINT PK_ESTADO_ID PRIMARY KEY (ESTADO_ID),
CONSTRAINT FK_PAIS_ID FOREIGN KEY (PAIS_ID)
REFERENCES PAIS (PAIS_ID));


CREATE TABLE DIRECCION (
DIRECCION_ID VARCHAR2 (10),
ALCALDIA VARCHAR2 (50),
CP VARCHAR2 (10),
CALLE VARCHAR2 (50),
EXTERIOR VARCHAR2 (7),
INTERIOR VARCHAR2 (7),
ESTADO_ID SMALLINT,
CONSTRAINT PK_DIRECCION_ID PRIMARY KEY (DIRECCION_ID),
CONSTRAINT FK_ESTADO_ID FOREIGN KEY (ESTADO_ID)
REFERENCES ESTADO (ESTADO_ID));

CREATE TABLE SUCURSAL (
SUCURSAL_ID SMALLINT,
NOMBRE VARCHAR2 (45),
LADA VARCHAR2 (4),
TELEFONO NUMBER(10),
EXTENCION NUMBER (4),
PAGINA_WEB VARCHAR2 (50),
HORA_APERTURA DATE,
HORA_CIERRE DATE,
CORREO VARCHAR2 (50) CONSTRAINT U_CORREO UNIQUE,
DIRECCION_ID VARCHAR (7),
CONSTRAINT PK_SUCURSAL_ID PRIMARY KEY (SUCURSAL_ID),
CONSTRAINT FK_DIRECCION_ID FOREIGN KEY (DIRECCION_ID)
REFERENCES DIRECCION (DIRECCION_ID));

CREATE TABLE CLIENTE (
CLIENTE_ID SMALLINT,
NOMBRE VARCHAR2 (80),
APELLIDO_PAT VARCHAR2 (40),
APELLIDO_MAT VARCHAR2 (40),
CORREO VARCHAR2(50) CONSTRAINT U_CORREO_CLIENTE UNIQUE,
DIRECCION_ID VARCHAR2 (10),
ESCOLARIDAD_ID SMALLINT,
CREDENCIAL_ID SMALLINT,
CONSTRAINT PK_CLIENTE_ID PRIMARY KEY (CLIENTE_ID),
CONSTRAINT FK_CLIENTE_DIRECCION_ID FOREIGN KEY (DIRECCION_ID) REFERENCES DIRECCION (DIRECCION_ID),
CONSTRAINT FK_CLIENTE_ESCOLARIDAD_ID FOREIGN KEY (ESCOLARIDAD_ID) REFERENCES ESCOLARIDAD (ESCOLARIDAD_ID),
CONSTRAINT FK_CLIENTE_CREDENCIAL_ID FOREIGN KEY (CREDENCIAL_ID) REFERENCES CREDENCIAL (CREDENCIAL_ID));

CREATE TABLE EMPLEADO (
EMPLEADO_ID VARCHAR2 (5),
NOMBRE VARCHAR2 (90),
APELLIDO_PAT VARCHAR2 (40),
APELLIDO_MAT VARCHAR2 (40),
HORA_ENTRADA DATE,
HORA_SALIDA DATE,
GENERO VARCHAR2 (1),
RFC VARCHAR2 (15),
FECHA_NACIMIENTO DATE,
CORREO VARCHAR2(50) CONSTRAINT U_CORREO_EMPLEADO UNIQUE,
USUARIO VARCHAR2(20) CONSTRAINT U_USUARIO_EMPLEADO UNIQUE,
CONSTRASENA VARCHAR2(15),
SUCURSAL_ID SMALLINT,
DIRECCION_ID VARCHAR2 (10),
CONSTRAINT PK_EMPLEADO_ID PRIMARY KEY (EMPLEADO_ID),
CONSTRAINT FK_EMPLEADO_SUCURSAL_ID FOREIGN KEY (SUCURSAL_ID) REFERENCES SUCURSAL (SUCURSAL_ID),
CONSTRAINT FK_EMPLEADO_DIRECCION_ID FOREIGN KEY (DIRECCION_ID) REFERENCES DIRECCION (DIRECCION_ID));

CREATE TABLE PRESTAMO(
PRESTAMO_ID INTEGER,
FECCHA_PRESTAMO DATE,
FEHCA_ENTREGA DATE,
CLIENTE_ID SMALLINT,
EMPLEADO_ID VARCHAR2(7),
CONSTRAINT PK_PRESTAMO_ID PRIMARY KEY (PRESTAMO_ID),
CONSTRAINT FK_PRESTAMO_CLIENTE_ID FOREIGN KEY (CLIENTE_ID) REFERENCES CLIENTE (CLIENTE_ID),
CONSTRAINT FK_PRESTAMO_EMPLEADO_ID FOREIGN KEY (EMPLEADO_ID) REFERENCES EMPLEADO (EMPLEADO_ID));

CREATE TABLE LIBRO (
LIBRO_ID INTEGER,
TITULO VARCHAR2 (225),
EDICION NUMBER (2),
ANIO DATE,
NUM_PAGINAS NUMBER (4),
IDIOMA_ID SMALLINT,
GENERO_ID SMALLINT,
PAIS_ID SMALLINT,
EDITORIAL_ID VARCHAR2 (4),
CONSTRAINT PK_LIBRO_ID PRIMARY KEY (LIBRO_ID),
CONSTRAINT FK_LIBRO_IDIOMA_ID FOREIGN KEY (IDIOMA_ID) REFERENCES IDIOMA (IDIOMA_ID),
CONSTRAINT FK_LIBRO_GENERO_ID FOREIGN KEY (GENERO_ID) REFERENCES GENERO (GENERO_ID),
CONSTRAINT FK_LIBRO_PAIS_ID FOREIGN KEY (PAIS_ID) REFERENCES PAIS (PAIS_ID),
CONSTRAINT FK_LIBRO_EDITORIAL_ID FOREIGN KEY (EDITORIAL_ID) REFERENCES EDITORIAL (EDITORIAL_ID));

CREATE TABLE AUTOR(
AUTOR_ID VARCHAR2 (7),
NOMBRE VARCHAR2 (85),
APELLIDO_PAT VARCHAR2 (50),
LAST_UPDATE DATE,
PAIS_ID SMALLINT,
CONSTRAINT PK_AUTOR_ID PRIMARY KEY (AUTOR_ID),
CONSTRAINT FK_AUTOR_PAIS_ID FOREIGN KEY (PAIS_ID) REFERENCES PAIS (PAIS_ID));

CREATE TABLE AUTORIA(
AUTOR_ID VARCHAR2(5),
LIBRO_ID INTEGER,
CONSTRAINT PK_AUTORIA_ID PRIMARY KEY (AUTOR_ID, LIBRO_ID),
CONSTRAINT FK_AUTORIA_AUTOR_ID FOREIGN KEY (AUTOR_ID) REFERENCES AUTOR (AUTOR_ID),
CONSTRAINT FK_AUTORIA_LIBRO_ID FOREIGN KEY (LIBRO_ID) REFERENCES LIBRO (LIBRO_ID));


CREATE TABLE DETALLES_PRESTAMO (
LIBRO_ID INTEGER,
PRESTAMO_ID INTEGER,
CONSTRAINT PK_DETALLES_PRESTAMO_ID PRIMARY KEY (LIBRO_ID, PRESTAMO_ID),
CONSTRAINT FK_DETALLES_PRESTAMO_LIBRO_ID FOREIGN KEY (LIBRO_ID) REFERENCES LIBRO (LIBRO_ID),
CONSTRAINT FK_DETALLES_PRESTAMO_PRESTAMO_ID FOREIGN KEY (PRESTAMO_ID) REFERENCES PRESTAMO (PRESTAMO_ID));


--DATOS PAIS
Insert into PAIS values (96,'Tanzania',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (1,'Afganist?n',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (2,'Alemania',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (3,'Angola',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (4,'Arabia Saudita',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (5,'Argelia',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (6,'Argentina',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (7,'Australia',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (8,'Austria',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (9,'Bahamas',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (10,'Banglad?s',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (11,'B?lgica',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (12,'Belice',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (13,'Ben?n',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (14,'Bielorrusia',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (15,'Bolivia',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (16,'Brasil',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (17,'Bulgaria',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (18,'Cabo Verde',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (19,'Camboya',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (20,'Canad?',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (21,'Catar',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (22,'Chile',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (23,'China',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (24,'Colombia',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (25,'Corea del Norte',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (26,'Corea del Sur',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (27,'Costa Rica',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (28,'Croacia',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (29,'Cuba',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (30,'Dinamarca',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (31,'Ecuador',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (32,'Egipto',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (33,'El Salvador',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (34,'Emiratos ?rabes Unidos',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (35,'Eslovaquia',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (36,'Espa?a',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (37,'Estados Unidos',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (38,'Filipinas',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (39,'Finlandia',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (40,'Fiyi',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (41,'Francia',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (42,'Georgia',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (43,'Grecia',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (44,'Guatemala',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (45,'Guinea',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (46,'Honduras',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (47,'Hungr?a',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (48,'India',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (49,'Indonesia',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (50,'Irak',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (51,'Ir?n',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (52,'Irlanda',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (53,'Islandia',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (54,'Israel',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (55,'Italia',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (56,'Jamaica',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (57,'Jap?n',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (58,'Jordania',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (59,'Laos',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (60,'L?bano',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (61,'Liberia',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (62,'Libia',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (63,'Luxemburgo',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (64,'Madagascar',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (65,'Malasia',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (66,'Maldivas',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (67,'Marruecos',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (68,'M?xico',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (69,'M?naco',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (70,'Mongolia',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (71,'Nepal',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (72,'Nicaragua',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (73,'Nigeria',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (74,'Noruega',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (75,'Nueva Zelanda',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (76,'Pa?ses Bajos',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (77,'Pakist?n',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (78,'Panam?',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (79,'Paraguay',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (80,'Per?',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (81,'Polonia',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (82,'Portugal',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (83,'Reino Unido',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (84,'Rep?blica Checa',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (85,'Rep?blica Dominicana',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (86,'Rep?blica Sudafricana',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (87,'Ruman?a',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (88,'Rusia',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (89,'Santa Luc?a',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (90,'Senegal',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (91,'Singapur',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (92,'Siria',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (93,'Somalia',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (94,'Suiza',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (95,'Tailandia',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (97,'Trinidad y Tobago',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (98,'Turqu?a',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (99,'Ucrania',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (100,'Uganda',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (101,'Uruguay',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (102,'Uzbekist?n',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (103,'Vaticano',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (104,'Venezuela',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (105,'Vietnam',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (106,'Zambia',to_date('21/10/23','DD/MM/RR'));
Insert into PAIS values (107,'Zimbabue',to_date('21/10/23','DD/MM/RR'));
INSERT INTO PAIS VALUES (108, 'Inglaterra', SYSDATE);

--DATOS ESTADO
Insert into ESTADO  values (1101,'CIUDAD DE M?XICO',68);
Insert into ESTADO  values (1102,'ZACATECAS',68);
Insert into ESTADO  values (1103,'YUCAT?N',68);
Insert into ESTADO  values (1104,'VERACRUZ',68);
Insert into ESTADO  values (1105,'TLAXCALA',68);
Insert into ESTADO  values (1106,'TAMAULIPAS',68);
Insert into ESTADO  values (1107,'TABASCO',68);
Insert into ESTADO  values (1108,'SONORA',68);
Insert into ESTADO  values (1109,'SINALOA',68);
Insert into ESTADO  values (1110,'SAN LUIS POTOS?',68);
Insert into ESTADO  values (1111,'QUINTANA ROO',68);
Insert into ESTADO  values (1112,'QUER?TARO',68);
Insert into ESTADO  values (1113,'PUEBLA',68);
Insert into ESTADO  values (1114,'OAXACA',68);
Insert into ESTADO  values (1115,'NUEVO LE?N',68);
Insert into ESTADO  values (1116,'NAYARIT',68);
Insert into ESTADO  values (1117,'MORELOS',68);
Insert into ESTADO  values (1118,'MICHOAC?N',68);
Insert into ESTADO  values (1119,'ESTADO DE M?XICO',68);
Insert into ESTADO  values (1120,'JALISCO',68);
Insert into ESTADO  values (1121,'HIDALGO',68);
Insert into ESTADO  values (1122,'GUERRERO',68);
Insert into ESTADO  values (1123,'GUANAJUATO',68);
Insert into ESTADO  values (1124,'DURANGO',68);
Insert into ESTADO  values (1125,'COLIMA',68);
Insert into ESTADO  values (1126,'COAHUILA',68);
Insert into ESTADO  values (1127,'CHIHUAHUA',68);
Insert into ESTADO  values (1128,'CHIAPAS',68);
Insert into ESTADO  values (1129,'CAMPECHE',68);
Insert into ESTADO  values (1130,'BAJA CALIFORNIA SUR',68);
Insert into ESTADO  values (1131,'BAJA CALIFORNIA',68);
Insert into ESTADO  values (1132,'AGUASCALIENTES',68);

--DATOS IDIOMA
Insert into IDIOMA values (1,'ESPA?OL',to_date('21/10/23','DD/MM/RR'));
Insert into IDIOMA values (2,'INGLES',to_date('21/10/23','DD/MM/RR'));
Insert into IDIOMA values (3,'ALEMAN',to_date('21/10/23','DD/MM/RR'));
Insert into IDIOMA values (4,'CHINO MANDARIN',to_date('21/10/23','DD/MM/RR'));
Insert into IDIOMA values (5,'JAPONES',to_date('21/10/23','DD/MM/RR'));
Insert into IDIOMA values (6,'FRANCES',to_date('21/10/23','DD/MM/RR'));
Insert into IDIOMA values (7,'RUSO',to_date('21/10/23','DD/MM/RR'));
Insert into IDIOMA values (8,'PORTUGUES',to_date('21/10/23','DD/MM/RR'));
Insert into IDIOMA values (9,'ARABE',to_date('21/10/23','DD/MM/RR'));
Insert into IDIOMA values (10,'HINDI',to_date('21/10/23','DD/MM/RR'));
Insert into IDIOMA values (11,'BENGALI',to_date('21/10/23','DD/MM/RR'));
Insert into IDIOMA values (12,'URDU',to_date('21/10/23','DD/MM/RR'));
Insert into IDIOMA values (13,'TURCO',to_date('21/10/23','DD/MM/RR'));
Insert into IDIOMA values (14,'ITALIANO',to_date('21/10/23','DD/MM/RR'));
Insert into IDIOMA values (15,'COREANO',to_date('21/10/23','DD/MM/RR'));
Insert into IDIOMA values (16,'TAMIL',to_date('21/10/23','DD/MM/RR'));
Insert into IDIOMA values (17,'VIETNAMITA',to_date('21/10/23','DD/MM/RR'));
Insert into IDIOMA values (18,'POLACO',to_date('21/10/23','DD/MM/RR'));
Insert into IDIOMA values (19,'PERSA',to_date('21/10/23','DD/MM/RR'));

--DATOS ESCOLARIDAD
Insert into ESCOLARIDAD  values (1,'Preescolar');
Insert into ESCOLARIDAD  values (2,'Primaria');
Insert into ESCOLARIDAD  values (3,'Secundaria');
Insert into ESCOLARIDAD  values (4,'Medio-Superior');
Insert into ESCOLARIDAD  values (5,'Superior');

--DATOS GENERO
Insert into GENERO  values (1,'Novela',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (2,'Cuento',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (3,'Relato corto',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (4,'F?bula',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (5,'Leyenda',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (6,'Ensayo',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (7,'Biograf?a',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (8,'Autobiograf?a',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (9,'Memorias',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (10,'Cr?nica',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (11,'Periodismo literario',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (12,'Poes?a l?rica',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (13,'Haiku',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (14,'Soneto',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (15,'?gloga',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (16,'Poes?a ?pica',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (17,'Oda',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (18,'Tragedia',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (19,'Comedia',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (20,'Drama',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (21,'Mon?logo',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (22,'Teatro experimental',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (23,'Novela de misterio',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (24,'Novela de suspense',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (25,'Novela de detectives',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (26,'Thriller psicol?gico',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (27,'Ciencia ficci?n',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (28,'Fantas?a ?pica',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (29,'Fantas?a urbana',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (30,'Distop?a',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (31,'Cyberpunk',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (32,'Romance hist?rico',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (33,'Romance contempor?neo',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (34,'Romance paranormal',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (35,'Romance er?tico',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (36,'Novela de terror',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (37,'G?tico',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (38,'Horror c?smico',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (39,'Zombis',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (40,'Novela de aventuras',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (41,'Aventuras marinas',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (42,'Aventuras en la selva',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (43,'Novela hist?rica',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (45,'Libros para ni?os',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (46,'Literatura juvenil',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (47,'Cuentos de hadas',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (48,'Libros de texto',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (49,'Enciclopedias',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (50,'Diccionarios',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (51,'Manuales',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (52,'Autoayuda',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (53,'Desarrollo personal',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (54,'Motivaci?n',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (55,'Libros de cocina',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (57,'Libros de recetas',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (58,'Libros de viajes',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (59,'Aventuras de viajeros',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (60,'Divulgacion cient.',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (62,'Astronom?a',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (63,'Biolog?a',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (64,'Libros sagrados',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (65,'Textos religiosos',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (66,'Espiritualidad',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (67,'Libros de negocios',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (68,'Econom?a',to_date('21/10/23','DD/MM/RR'));
Insert into GENERO  values (69,'Finanzas personales',to_date('21/10/23','DD/MM/RR'));
INSERT INTO GENERO VALUES (75, 'Novela Policial', SYSDATE);
INSERT INTO GENERO VALUES (71, 'Satira', SYSDATE);
INSERT INTO GENERO VALUES (72, 'Epopeya', SYSDATE);
INSERT INTO GENERO VALUES (73, 'Teatro', SYSDATE);
INSERT INTO GENERO VALUES (70, 'Novela existencial', SYSDATE);
INSERT INTO GENERO VALUES (74, 'Realismo M\E1gico', SYSDATE);

--DATOS EDITORIAL
Insert into EDITORIAL  values ('S019','Plaza Jan?s');
Insert into EDITORIAL  values ('A001','Editorial Porrua');
Insert into EDITORIAL  values ('B002','Fondo de Cultura Econ?mica');
Insert into EDITORIAL  values ('C003','Grupo Editorial Planeta M?xico');
Insert into EDITORIAL  values ('D004','Ediciones Era');
Insert into EDITORIAL  values ('E005','Siglo XXI Editores');
Insert into EDITORIAL  values ('F006','Alfaguara M?xico');
Insert into EDITORIAL  values ('G007','Grijalbo');
Insert into EDITORIAL  values ('H008','CONACULTA');
Insert into EDITORIAL  values ('I009','Oc?ano');
Insert into EDITORIAL  values ('J010','Ediciones SM');
Insert into EDITORIAL  values ('K011','Editorial Trillas');
Insert into EDITORIAL  values ('L012','Editorial Alfonsina');
Insert into EDITORIAL  values ('M013','Bonilla Artigas Editores');
Insert into EDITORIAL  values ('N014','Artes de M?xico');
Insert into EDITORIAL  values ('O015','Nostra Ediciones');
Insert into EDITORIAL  values ('P016','Tusquets Editores M?xico');
Insert into EDITORIAL  values ('Q017','Ediciones Castillo');
Insert into EDITORIAL  values ('R018','Editores Mexicanos Unidos');
INSERT INTO EDITORIAL VALUES ('P010', 'Penguin Random House');  
INSERT INTO EDITORIAL VALUES ('E010', 'Sudamericana');  
INSERT INTO EDITORIAL VALUES ('P003', 'Punto de Lectura');
INSERT INTO EDITORIAL VALUES ('P001', 'Planeta');  
INSERT INTO EDITORIAL VALUES ('B001', 'Booket');  
INSERT INTO EDITORIAL VALUES ('I000', 'Independiente');
INSERT INTO EDITORIAL VALUES ('S002', 'Signet Classic');
INSERT INTO EDITORIAL VALUES ('L002', 'Letra Minuscula');
INSERT INTO EDITORIAL VALUES ('P011', 'Pehu\E9n');
INSERT INTO EDITORIAL VALUES ('P002', 'Penguin Books');
INSERT INTO EDITORIAL VALUES ('C001', 'COLOFON');
INSERT INTO EDITORIAL VALUES ('C011', 'C\E1tedra');
INSERT INTO EDITORIAL VALUES ('D001', 'Debolsillo');
INSERT INTO EDITORIAL VALUES ('P010', 'Penguin Random House');  
INSERT INTO EDITORIAL VALUES ('E010', 'Sudamericana');  


--DATOS LIBRO
Insert into LIBRO values (230001,'El Principito',30,to_date('06/04/43','DD/MM/RR'),96,1,45,68,'A001');
Insert into LIBRO values (230002,'Five Survive',1,to_date('29/11/22','DD/MM/RR'),416,1,26,68,'A001');
Insert into LIBRO values (230003,'Cr?menes exquisitos',1,to_date('13/07/22','DD/MM/RR'),848,1,26,68,'A001');
Insert into LIBRO values (230005,'Holly',1,to_date('05/08/23','DD/MM/RR'),624,1,23,68,'S019');
INSERT INTO LIBRO VALUES (230022, 'Guerra y paz', 2, to_date('1869','YYYY'), 1000, 2, 43, 88, 'P010');
INSERT INTO LIBRO VALUES (230006, 'Don Quijote de la Mancha', 1, to_date('2016','YYYY'), 1342, 1, 1, 36, 'P003');
INSERT INTO LIBRO VALUES (230007, 'El Se\F1or de los Anillos: La Comunidad del Anillo', 1, to_date('1977','YYYY'), 366, 1, 28, 36, 'P001');
INSERT INTO LIBRO VALUES (230008, 'El Se\F1or de los Anillos: Las Dos Torres', 1, to_date('2014','YYYY'), 476, 1, 28, 68, 'B001');    
INSERT INTO LIBRO VALUES (230009, 'El Se\F1or de los Anillos: El Retorno del Rey', 1, to_date('2022','YYYY'), 608, 1, 28, 68, 'B001');
INSERT INTO LIBRO VALUES (230010, 'Hamlet', 4, to_date('2022','YYYY'), 208, 1, 20, 36, 'L002');
INSERT INTO LIBRO VALUES (230011, 'El Alquimista', 1, to_date('2014','YYYY'),  192, 1, 1, 36, 'P001');
INSERT INTO LIBRO VALUES (230012, 'La Metamorfosis', 3, to_date('2001', 'YYYY'), 38, 1, 70, 22, 'P011');
INSERT INTO LIBRO VALUES (230013, 'Animal Farn', 1, to_date('2008', 'YYYY'), 112, 2, 71, 108, 'P002');
INSERT INTO LIBRO VALUES (230014, '1984', 1, to_date('1961', 'YYYY'), 328, 2, 30, 37, 'S002');
INSERT INTO LIBRO VALUES (230015, 'La Divina Comedia', 1, to_date('2017', 'YYYY'), 232, 14, 72, 55, 'I000');
INSERT INTO LIBRO VALUES (230016, 'Ulises', 2, to_date('2015', 'YYYY'), 806, 1, 1, 68, 'C001');
INSERT INTO LIBRO VALUES (230017, 'A Tale of Two Cities', 7, to_date('2003', 'YYYY'), 489, 2, 43, 108, 'P002');
INSERT INTO LIBRO VALUES (230018, 'Bodas de Sangre', 18, to_date('2000', 'YYYY'), 167, 1, 73, 36, 'C011');
INSERT INTO LIBRO VALUES (230019, 'La Casa de Bernarda Alba', 8, to_date('2017', 'YYYY'), 152, 1, 20, 68, 'D001');
INSERT INTO LIBRO VALUES (230020, 'Cien A\F1os de Soledad', 9, to_date('2017', 'YYYY'), 440, 1, 74, 68, 'P001');
INSERT INTO LIBRO VALUES (230021, 'Cr\F3nica de una muerte anunciada', 5, to_date('2016', 'YYYY'), 96, 1, 75, 68, 'P001');
INSERT INTO LIBRO VALUES (230022, 'Guerra y paz', 2, to_date('1869','YYYY'), 1000, 2, 43, 88, 'P010');
INSERT INTO LIBRO VALUES (230023, 'Ana Karenina', 2, to_date('1877','YYYY'), 800, 2, 43, 88, 'P010');
INSERT INTO LIBRO VALUES (230024, 'La Muerte de Ivan Ilich', 2, to_date('1886','YYYY'), 100, 2, 43, 88, 'P010');
INSERT INTO LIBRO VALUES (230025, 'Orgullo y Prejuicio', 2, to_date('1813','YYYY'), 400, 2, 33, 83, 'P010');
INSERT INTO LIBRO VALUES (230026, 'Sentido y sensibilidad', 2, to_date('1869','YYYY'), 1000, 2, 33, 83, 'P010');
INSERT INTO LIBRO VALUES (230027, 'Cien a?os de soledad', 1, to_date('1967','YYYY'), 500, 1, 1, 24, 'E010');
INSERT INTO LIBRO VALUES (230028, 'Cronicas de una muerta anunciada', 1, to_date('1981','YYYY'), 150, 1, 1, 24, 'E010');
INSERT INTO LIBRO VALUES (230029,'El oto?o del patriarca', 1, to_date('1975','YYYY'), 500, 1, 1, 24, 'E010');
INSERT INTO LIBRO VALUES (230030,'El amor en los tiempos del colera', 1, to_date('1985','YYYY'), 500, 1, 1, 24, 'E010');
INSERT INTO LIBRO VALUES (230031,'La hojarasca', 1, to_date('1955','YYYY'), 500, 1, 1, 24, 'E010');
INSERT INTO libro VALUES (230032, 'The Essential Haiku: Versions of Basho, Buson y Issa', 1, TO_DATE('01/08/1994', 'dd/mm/yyyy'), 320, 1, 45, 68, 'S002');
INSERT INTO libro VALUES (230033, 'Romeo y Julieta', 19, TO_DATE('01/01/2019', 'dd/mm/yyyy'), 123, 1, 20, 68, 'R018');
INSERT INTO libro VALUES (230100, 'Una vez minutos', 1, TO_DATE('22/06/2003', 'dd/mm/yyyy'), 240, 8, 24, 88, 'A001');
INSERT INTO libro VALUES (230101, 'Crimen y Castigo', 1, TO_DATE('04/01/1866', 'dd/mm/yyyy'), 500, 7, 35, 16, 'A001');
INSERT INTO libro VALUES (230102, 'Veronica decide morir', 1, TO_DATE('08/11/1998', 'dd/mm/yyyy'), 500, 8, 54, 16, 'A001');

--DATOS CREDENCIAL
Insert into CREDENCIAL  values (1001,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (2001,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (3001,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (4001,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (5001,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (6001,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (7001,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (8001,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (9001,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (1002,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (2002,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (3002,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (4002,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (5002,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (6002,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (7002,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (8002,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (9002,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (1003,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (2003,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (3003,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (4003,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (5003,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (6003,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (7003,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (8003,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (9003,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (1004,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (2004,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (3004,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (4004,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (5004,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (6004,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (7004,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (8004,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (9004,to_date('23/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (2005,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (3005,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (4005,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (5005,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (6005,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (7005,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (8005,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (9005,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (1006,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (2006,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (3006,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (4006,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (5006,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (6006,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (7006,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (8006,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (9006,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (1007,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (2007,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (3007,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (4007,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (5007,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (6007,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (7007,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (8007,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (9007,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (1008,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (2008,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (3008,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (4008,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (5008,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (6008,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (7008,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (8008,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (9008,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (1009,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (2009,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (3009,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (4009,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (5009,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (6009,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (7009,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (8009,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (9009,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (1010,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (2010,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (3010,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (4010,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (5010,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (6010,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (7010,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (8010,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (9010,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (2011,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (3011,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (4011,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (5011,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (6011,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (7011,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (8011,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (9011,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (2012,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (3012,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (4012,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (5012,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (6012,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (7012,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (8012,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (9012,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (1013,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (2013,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (3013,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (4013,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (5013,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (6013,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (7013,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (8013,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (9013,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (1014,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (2014,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (3014,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (4014,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (5014,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (6014,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (7014,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (8014,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (9014,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (1015,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (2015,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (3015,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (4015,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (5015,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (6015,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (7015,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (8015,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (9015,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (2016,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (3016,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (4016,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (5016,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (6016,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (7016,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (8016,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (9016,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (1017,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (2017,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (3017,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (4017,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (5017,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (6017,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (7017,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (8017,to_date('25/10/24','DD/MM/RR'));
Insert into CREDENCIAL  values (9017,to_date('25/10/24','DD/MM/RR'));
INSERT INTO CREDENCIAL VALUES (10024, to_date('22/06/2018', 'dd/mm/yyyy'));
INSERT INTO CREDENCIAL VALUES (10025, to_date('22/06/2018', 'dd/mm/yyyy'));

--DATOS DIRECCION 
INSERT INTO DIRECCION VALUES ('2322001', 'Iztapalapa', '09700', 'Manuel Ca?as', '45','2', 1101);
INSERT INTO DIRECCION VALUES ('2323001', 'Gustavo A. Madero', '07300', 'San Pedro Regional', '123', '24', 1101);
INSERT INTO DIRECCION VALUES ('2324001', 'Coyoacan', '10340', 'Cristobal Colon','18', '38', 1101);
INSERT INTO DIRECCION VALUES ('2325001', 'Angostura', '66699', 'Zona del muerto', '32', '120', 1109);
INSERT INTO DIRECCION VALUES ('2326001', 'Iztapalapa', '08100', 'Villa de la Barca','56', '15', 1101);
INSERT INTO DIRECCION VALUES ('2327001', 'Xochimilco', '10700', 'Calle Trajinera', '89','22', 1101);
INSERT INTO DIRECCION VALUES ('2328001', 'Tlahuac', '03700', 'Av. Tlahuac', '4','156', 1101);
INSERT INTO DIRECCION VALUES ('2329001', 'Tlalpan', '15033', 'Se?or covarubias', '67','46', 1101);
INSERT INTO DIRECCION VALUES ('2330001', 'Iztapalapa', '09300', 'Ermita', '91','13', 1101);
INSERT INTO DIRECCION VALUES ('2301001','Iztapalapa','09830','Calzada Ermita','1','2',1101);
INSERT INTO DIRECCION VALUES ('2302001','Coyoacan','04200','Canal de Miramontes','3','1',1101);
INSERT INTO DIRECCION VALUES ('2303001','Gustavo A. Madero','07020','Calzada de Guadalupe','6','4',1101);
INSERT INTO DIRECCION VALUES ('2304001','Centro','44100','Avenida Juarez','6','4',1120);
INSERT INTO DIRECCION VALUES ('2305001','San Nicol?s de los Garza','66490','Adolfo Ruiz Cortinez','2','35',1115);
INSERT INTO DIRECCION VALUES ('2306001', 'Tlanepantla', '54150', 'VILLAHERMOSA', '16A', '4', 1119);
INSERT INTO DIRECCION VALUES ('2307001', 'Veracruz', '91700', 'GUERRERO', '1650','65', 1104);
INSERT INTO DIRECCION VALUES ('2308001', 'Cuernavaca', '62020', 'ACTORES', '104', 'B', 1117);                      
INSERT INTO DIRECCION VALUES ('2309001', 'Benito Ju\E1rez', '03730', 'CERRADA NATIER', '10','90', 1101);           
INSERT INTO DIRECCION VALUES ('2310001', 'Xalapa', '91030', 'AMERICAS', '157', 'S/N', 1104);
INSERT INTO DIRECCION VALUES ('2311001', 'Queretaro', '76180', 'PRL ZARAGOZA', '230', '456', 1120);            
INSERT INTO DIRECCION VALUES ('2312001', 'Ciudad Ju\E1rez', '32780', 'AV LOPEZ MATEOS', '1762', 'S/N', 1127);            
INSERT INTO DIRECCION VALUES ('2313001', 'Guadalajara', '44100', 'SANTA MONICA', '230', '100',1120);
INSERT INTO DIRECCION VALUES ('2314001', 'Mazatl\E1n', '82110', 'AV. PLAYA GAVIOTAS', '123', '501', 1109);
INSERT INTO DIRECCION VALUES ('2315001', 'VERACRUZ', '82110', 'ALTAMIRANO', '456','1241', 1104);
INSERT INTO DIRECCION VALUES ('2316001', 'Oaxaca', '68000', 'HUMBOLDT', '300', '789', 1114);
INSERT INTO DIRECCION VALUES ('2317001', 'Chihuahua', '31160', 'AGUSTIN MELGAR', '2303', '102', 1127);
INSERT INTO DIRECCION VALUES ('2318001', 'Azcapotzalco', '02970', 'SABINO', '538', '764', 1101);
INSERT INTO DIRECCION VALUES ('2319001', 'Caborca', '83600', 'OBREGON', '265','908', 1108);
INSERT INTO DIRECCION VALUES ('2320001', 'Miguel Hidalgo', '11400', 'MAR BLANCO', '89', '8', 1101); 
INSERT INTO DIRECCION VALUES ('2321001', 'Queretaro', '11400', 'ANDADOR 5 DE MAYO', '14','35', 1120);
INSERT INTO DIRECCION VALUES ('2306010', 'Puebla de zaragoza', '72000', 'Avenidad reforma', '13A', '09', 1113);
INSERT INTO DIRECCION VALUES ('2306011', 'Tehuacan', '72100', 'Calle 5 de mayo', '13', '56', 1113);
INSERT INTO DIRECCION VALUES ('2306012', 'San Andres cholula', '72550', 'Calle 16 de septiembre', '14', '314', 1113);
INSERT INTO DIRECCION VALUES ('2306013', 'San Pedro Cholula', '72230', 'Calleno 11 Norte', '1Z', '425B',1113);
INSERT INTO DIRECCION VALUES ('2306014', 'Alixco', '72410', 'Bolevar Atlixco', '1G', '56',1113);
INSERT INTO DIRECCION VALUES ('2306015', 'Reforma', '72510', 'Calle 16 de septiembre', '10G','68', 1113); 
INSERT INTO DIRECCION VALUES ('2322001', 'Iztapalapa', '09700', 'Manuel Ca?as', '45', '2',1101);
INSERT INTO DIRECCION VALUES ('2323001', 'Gustavo A. Madero', '07300', 'San Pedro Regional', '123', '24',1101);
INSERT INTO DIRECCION VALUES ('2324001', 'Coyoacan', '10340', 'Cristobal Colon', '18', '38',1101);
INSERT INTO DIRECCION VALUES ('2325001', 'Angostura', '66699', 'Zona del muerto', '32', '120',1109);
INSERT INTO DIRECCION VALUES ('2337001', 'Benito Ju?rez', '06070', 'Benito Camelon', '22', '34',1101);
INSERT INTO DIRECCION VALUES ('2311002', 'Tepoztlan', '62520', 'Del Nino Artillero', '20', '321',1117);
INSERT INTO DIRECCION VALUES ('2311003', 'Coatzacoalcos', '96518', 'Bernardo Simonin', '1607', '098',1104); 
INSERT INTO DIRECCION VALUES ('2311004', 'Benito Juarez', '03310', 'Av Universidad', '1000','765', 1101); 
INSERT INTO DIRECCION VALUES ('2311005', 'Veracruz', '91750', 'Miguel Angel de Quevedo', '5750', '543',1104); 
INSERT INTO DIRECCION VALUES ('2311006', 'Monterrey', '64820', 'Av Chapultepec', 'S/N', '45G', 1115); 
INSERT INTO DIRECCION VALUES ('2311008', 'Tehuacan', '75850', 'Av Jose Garci-crespo', '2805','45E', 1113); 
INSERT INTO DIRECCION VALUES ('2311009', 'Puebla', '72400', 'Privada Topacio', '3505','23E', 1113); 
INSERT INTO DIRECCION VALUES ('2312000', 'Veracruz', '93240', 'Av 20 de Noviembre', '700','756', 1104); 
INSERT INTO DIRECCION VALUES ('2318010', 'Acaponeta', '00001', 'Calle 11', '1','56', 1116);
INSERT INTO DIRECCION VALUES ('2318011', 'Tuxpan', '00002', '5', '9','34', 1116);
INSERT INTO DIRECCION VALUES ('2318012', 'Tepic', '00003', '13', '3', '31',1116);
INSERT INTO DIRECCION VALUES ('2338001', 'Centro', '87532', 'Villa Camaron', '23','687', 1104);
INSERT INTO DIRECCION VALUES ('2339001', 'Iztapalapa', '09100', 'Villa Sin Fuente', '2','34Q', 1101);
INSERT INTO DIRECCION VALUES ('2340001', 'Iztapalapa', '09200', 'San Letran', '6', '43',1101);
INSERT INTO DIRECCION VALUES ('2341001', 'Gustavo A. Madero', '05621', 'Villa Canica', 'S/N', '13',1101);
INSERT INTO DIRECCION VALUES ('2342001', 'Iztapalapa', '08300', 'San Juan', '22','1344', 1101);
INSERT INTO DIRECCION VALUES ('2343001', 'Chalco', '30300', 'San Jose Se\F1or', 'S/N', '6546',1101);
INSERT INTO DIRECCION VALUES ('2344001', 'Centro', '13234', 'San Cristo', '34','7524', 1127);
INSERT INTO DIRECCION VALUES ('2345001', 'Morelos', '32782', 'San Nicolas', 'S/N', '546',1117);
INSERT INTO DIRECCION VALUES ('2346001', 'Centro', '02345', 'Cd. jardin', 'S/N','543', 1120);
INSERT INTO DIRECCION VALUES ('2347001', 'Toluca de lerdo', '23456', 'Martin de las casas', '21', '245',1119);
INSERT INTO DIRECCION VALUES ('2348001', 'Iztapalapa', '09243', 'Villa Angelica', '12','5242', 1101);
INSERT INTO DIRECCION VALUES ('2349001', 'Iztapalapa', '09230', 'Eje 3', '57', '7524', 1101);
INSERT INTO DIRECCION VALUES ('2351001', 'Coyoacan', '09200', 'Villa Condor', 'S/N','5613', 1101);
INSERT INTO DIRECCION VALUES ('2315000', 'Cuernavaca', '62000', 'Morelos', '182','4313', 1117);
INSERT INTO DIRECCION VALUES ('2315002', 'Cuernavaca', '62170', 'San Jernonimo', '207', '9824',1117);

--DATOS SUCURSAL
INSERT INTO SUCURSAL VALUES (2301, 'Iztapalapa',	'55', 66778899,	5299, 'libreriabda.mx', to_date('10:00', 'hh24:mi'), to_date('18:00', 'hh24:mi'), 'libreriabdaizt@gmail.com', '2301001');
INSERT INTO SUCURSAL VALUES (2302, 'Coyoacan', '55', 44772299, 5453, 'libreriabda.mx', to_date('10:00', 'hh24:mi'), to_date('18:00', 'hh24:mi'), 'libreriabdacoyo@gmail.com', '2302001');
INSERT INTO SUCURSAL VALUES (2303, 'Gustavo A. Madero', '55', 22113133, 5149, 'libreriabda.mx', to_date('10:00', 'hh24:mi'), to_date('18:00', 'hh24:mi'), 'libreriabdagam@gmail.com', '2303001');        
INSERT INTO SUCURSAL VALUES (2304, 'Guadalajara', '33', 77443322, 5221, 'libreriabda.mx', to_date('10:00', 'hh24:mi'), to_date('17:00', 'hh24:mi'), 'libreriabdaguad@gmail.com', '2304001');                
INSERT INTO SUCURSAL VALUES (2305, 'Monterrey', '81', 99112233, 5345, 'libreriabda.mx', to_date('10:00', 'hh24:mi'), to_date('17:00', 'hh24:mi'), 'libreriabdamont@gmail.com', '2305001');                        
INSERT INTO SUCURSAL VALUES (2306, 'Tlanepantla', '722', 57093743, 24, 'libreriabda.mx', to_date('10:00', 'hh24:mi'), to_date('16:00', 'hh24:mi'), 'ibreriabdatlane@gmail.com', '2306001');
INSERT INTO SUCURSAL VALUES (2001, 'Veracruz', '229 ', 2258846, 05, 'libreriabda.mx', to_date('09:30', 'hh24:mi'), to_date('14:45', 'hh24:mi'), 'ibreriabdaverag@gmail.com', '2307001');
INSERT INTO SUCURSAL VALUES (1601, 'Cuernavaca', '777', 3173200, 93, 'libreriabda.mx', to_date('12:15', 'hh24:mi'), to_date('16:30', 'hh24:mi'), 'ibreriabdacuerna@gmail.com', '2308001');             
INSERT INTO SUCURSAL VALUES(2201, 'Benito Juarez', '55', 2106061, 46, 'libreriabda.mx', to_date('08:00', 'hh24:mi'), to_date('15:15', 'hh24:mi'), 'ibreriabdabj@gmail.com', '2309001');
INSERT INTO SUCURSAL VALUES (2310, 'Toluca',	'55', 12345670,	5399, 'libreriabda.mx', to_date('10:00', 'hh24:mi'), to_date('18:00', 'hh24:mi'), 'libreriabdatoluca@gmail.com', '2306010');
INSERT INTO SUCURSAL VALUES (2311, 'Chalco', '55', 97865430, 5553, 'libreriabda.mx', to_date('10:00', 'hh24:mi'), to_date('18:00', 'hh24:mi'), 'libreriabdachalco@gmail.com', '2306011');
INSERT INTO SUCURSAL VALUES (2312, 'Juarez', '55', 45678900, 5549, 'libreriabda.mx', to_date('10:00', 'hh24:mi'), to_date('18:00', 'hh24:mi'), 'libreriabdajuarez@gmail.com', '2306012');        
INSERT INTO SUCURSAL VALUES (2313, 'Morelos', '55', 55512340, 5521, 'libreriabda.mx', to_date('10:00', 'hh24:mi'), to_date('17:00', 'hh24:mi'), 'libreriabdamorelosd@gmail.com', '2306013');                
INSERT INTO SUCURSAL VALUES (2314, 'Ecatepec', '55', 22233330, 5545, 'libreriabda.mx', to_date('10:00', 'hh24:mi'), to_date('17:00', 'hh24:mi'), 'libreriabdaecatepect@gmail.com', '2306014');                        
INSERT INTO SUCURSAL VALUES (2315, 'Naucalpan', '55', 88877770, 5275, 'libreriabda.mx', to_date('10:00', 'hh24:mi'), to_date('16:00', 'hh24:mi'), 'ibreriabdanaucalpan@gmail.com', '2306015');

--DATOS CLIENTE
INSERT INTO cliente VALUES (10001, 'Omar','Fern?ndez', 'D?az', 'omaferdiaz1@gmail.com', '2322001', 4, 1001);
INSERT INTO cliente VALUES (10002, 'Nancy','C?rdova', 'Vel?zquez ', 'nancorvela2@gmail.com', '2323001', 4, 1002);
INSERT INTO cliente VALUES (10003, 'Rene','Estrada', 'Flores', 'reestraflo@gmail.com', '2324001', 5, 1003);
INSERT INTO cliente VALUES (10004, 'Francisco','R?os', 'Hern?ndez', 'franrioher24@gmail.com', '2325001', 4, 1004);
INSERT INTO cliente VALUES (10005, 'Alejandro','Marcial', 'Lemus', 'alemusmarcial@gmail.com', '2326001', 5, 2001);
INSERT INTO cliente VALUES (10006, 'Andrea','Z??iga', 'Herrera', 'andyherrerazu@hotmail.com', '2327001', 2, 1006);
INSERT INTO cliente VALUES (10007, 'Oralia','Marcial', 'Romero', 'romimarcial2@gmail.com', '2328001', 1, 1007);
INSERT INTO cliente VALUES (10008, 'Emilio','Huerta', 'Vel?zquez', 'emihu123@gmail.com', '2329001', 3, 1008);
INSERT INTO cliente VALUES (10009, 'Graciela','Huerta', 'Vel?zquez', 'gracisexy26@gmail.com', '2330001', 3, 1009);
INSERT INTO cliente VALUES (10016, 'Gustavo','Buen Rostro', 'Diaz', 'gustavoelse?or66@gmail.com', '2337001', 4, 1017);
INSERT INTO CLIENTE VALUES (10017, 'Armando', 'Garcia', 'Muertorta', 'armandeitor@outlook.com', '2311005', 5, 2017);
INSERT INTO CLIENTE VALUES (10018, 'Cornelio', 'Verdugo', 'Calder\F3n', 'corneliovc@hotmail.com', '2311008', 4, 3001);
INSERT INTO CLIENTE VALUES (10019, 'Zacar\EDas', 'Vel\E1zquez', 'Cazares', 'zacavelaca@yahoo.com', '2311009', 2, 3002);            
INSERT INTO CLIENTE VALUES (10020, 'Jaqueline', 'Prieto', 'Pascal', 'jdoblep@gmail.com', '2312000', 5, 3003);
INSERT INTO cliente VALUES (10021, 'Oscar','Salinas', 'Martinez', 'mart12nas@gmail.com', '2318010', 3, 2001);
INSERT INTO cliente VALUES (10022, 'Karla','Suarez', 'Guerrero', 'Guerrero33@gmail.com', '2318011', 5, 3001);
INSERT INTO cliente VALUES (10023, 'Paola','Juarez', 'Martinez', 'Paomart01gmail.com', '2318012', 4, 4001);
INSERT INTO cliente VALUES (10024, 'Ignacio','Andrade', 'Garcia', 'ignandrcia@gmail.com', '2315000', 4, 10024);
INSERT INTO cliente VALUES (10025, 'Paola','Menta', 'Moreno', 'pamamo@gmail.com', '2315002', 3, 10025);
INSERT INTO cliente VALUES (10010, 'Wendy','Alarc?n', 'Rueda', 'thewendygirl@gmail.com', '2312001', 3, 1010);
INSERT INTO cliente VALUES (10011, 'Juan Carlos','Gonz?lez', 'Toledo', 'juanqui261@gmail.com', '2318001', 4, 2002);
INSERT INTO cliente VALUES (10012, 'Ana Gabriela','S?nchez', 'Trejo', 'anisanchez37@gmail.com', '2328001', 5, 2003);
INSERT INTO cliente VALUES (10013, 'Guadalupe','Gamboa', 'Rosas', 'lupisgamboa234@gmail.com', '2304001', 5, 1013);
INSERT INTO cliente VALUES (10014, 'Carolina','Gonz?lez', 'Rivas', 'carolinalanina@gmail.com', '2306011', 5, 1014);
INSERT INTO cliente VALUES (10015, 'Zayra','Octaviano', 'Rueda', 'sayritarueda@gmail.com', '2330001', 1, 1015);

--DATOS EMPLEADOS
INSERT INTO EMPLEADO VALUES ('23010', 'Juan', 'P\E9rez', 'Mart\EDnez', to_date('09:30', 'hh24:mi'), to_date('16:30', 'hh24:mi'), 'M', 'PEMJ031001FJK', to_date('01/10/2003', 'dd/mm/yyyy'), 'jperezm03@biblio.com.mx', 'jperezm03', '30mzerepj', 2306, '2318001');  
INSERT INTO EMPLEADO VALUES ('20010', 'Jason', 'Mormoan', 'Trujillo', to_date('09:15', 'hh24:mi'), to_date('15:00', 'hh24:mi'), 'M', 'MOTJ070214FJK', to_date('14/02/2007', 'dd/mm/yyyy'), 'jmormoant07@biblio.com.mx', 'jmormoant07', '70tnaomromj', 2001, '2310001');                        
INSERT INTO EMPLEADO VALUES ('20012', 'Daniel', 'Hernandez', 'Salda?a', to_date('09:15', 'hh24:mi'), to_date('15:00', 'hh24:mi'), 'M', 'HESJ060102MDF', to_date('06/01/2002', 'dd/mm/yyyy'), 'danisal07@biblio.com.mx', 'daniel06', 'Dahersa06', 2315, '2306015');
INSERT INTO EMPLEADO VALUES ('16010', 'Rodrigo', 'Cabeza', 'de Vaca', to_date('12:00', 'hh24:mi'), to_date('17:00', 'hh24:mi'), 'M', 'CADR050501ASC', to_date('01/05/2005', 'dd/mm/yyyy'), 'rcabezd05@biblio.com.mx', 'rcabezd05', '50zebacr', 1601, '2311002');                        
INSERT INTO EMPLEADO VALUES ('20011', 'Jazmin', 'Cuervo', 'Garcia', to_date('09:00', 'hh24:mi'), to_date('15:00', 'hh24:mi'), 'F', 'CUGJ020415TRE', to_date('15/04/2002', 'dd/mm/yyyy'), 'jcuervog02@biblio.com.mx', 'jcuervog02', '20govreucj', 2001, '2311003');    
INSERT INTO EMPLEADO VALUES ('22010', 'Jose', 'Juarez', 'Jarburg', to_date('07:45', 'hh24:mi'), to_date('15:30', 'hh24:mi'), 'M', 'JUJJ600822CAR', to_date('22/08/1960', 'dd/mm/yyyy'), 'jjuarezj60@biblio.com.mx', 'jjuarezj60', '06jzeraujj', 2201, '2311004');                
INSERT INTO EMPLEADO VALUES ('23050', 'Milton', 'Lopez', 'Rastro', to_date('09:30', 'hh24:mi'), to_date('17:15', 'hh24:mi'), 'M', 'LORM010217MAE', to_date('17/02/2001', 'dd/mm/yyyy'), 'mlopezr01@biblio.com.mx', 'mlopezr01', '10rzepolm', 2305, '2311006');    
INSERT INTO empleado VALUES ('23014', 'Arnulfo', 'Garc\EDa', 'Hern\E1ndez', to_date('08:30', 'hh24:mi'), to_date('17:00', 'hh24:mi'), 'M', 'AGHJ243113DMS', to_date('27/07/1999', 'dd/mm/yyyy'), 'hgarcia01@biblio.com.mx', 'hgarcia2', 'garci2612', 2001, '2338001');    
INSERT INTO empleado VALUES ('23015', 'Raquel', 'Valdez', 'Hern\E1ndez', to_date('7:30', 'hh24:mi'), to_date('16:00', 'hh24:mi'), 'F', 'HERV023114NDF', to_date('02/01/1997', 'dd/mm/yyyy'), 'hvraquel@biblio.com.mx', 'hraquel', 'contra01', 2301, '2339001');  
INSERT INTO empleado VALUES ('23016', 'Juana', 'Marques', 'Perez', to_date('7:30', 'hh24:mi'), to_date('16:00', 'hh24:mi'), 'F', 'PMJC136814DFN', to_date('30/12/2000', 'dd/mm/yyyy'), 'perezjuana22@biblio.com.mx', 'jperez', 'chikistrukis', 2301, '2339001');  
INSERT INTO empleado VALUES ('23017', 'Jordi', 'Narvarte', 'Avila', to_date('9:00', 'hh24:mi'), to_date('18:00', 'hh24:mi'), 'M', 'NAJK234814DFQ', to_date('23/04/2001', 'dd/mm/yyyy'), 'elborrego23@biblio.com.mx', 'javila', 'elpatron', 2303, '2341001');  
INSERT INTO empleado VALUES ('23018', 'Juan', 'Terrazas', 'Mondragon', to_date('9:00', 'hh24:mi'), to_date('18:00', 'hh24:mi'), 'M', 'MTJS234514DFW', to_date('14/03/2000', 'dd/mm/yyyy'), 'juanterra2@biblio.com.mx', 'mterraza', 'thepablito', 2301, '2342001');  
INSERT INTO empleado VALUES ('23019', 'Pedro', 'Sergio', 'Navarrete', to_date('7:30', 'hh24:mi'), to_date('16:00', 'hh24:mi'), 'M', 'SPNE345614DFP', to_date('04/12/1989', 'dd/mm/yyyy'), 'sergienav@biblio.com.mx', 'snavarrete', 'sergio123', 2311, '2343001');  
INSERT INTO empleado VALUES ('23020', 'Armando', 'Marques', 'Toledano', to_date('9:30', 'hh24:mi'), to_date('18:00', 'hh24:mi'), 'M', 'TMAQ1328SCHN', to_date('20/06/2001', 'dd/mm/yyyy'), 'toledanoa2@biblio.com.mx', 'atoledano', 'armando123', 2312, '2344001');  
INSERT INTO empleado VALUES ('23021', 'Paricia', 'Monterreal', 'Perez', to_date('7:00', 'hh24:mi'), to_date('16:00', 'hh24:mi'), 'F', 'PMPQ134824MRC', to_date('30/11/1993', 'dd/mm/yyyy'), 'perezpatri@biblio.com.mx', 'pperez', 'patripes', 2313, '2345001');  
INSERT INTO empleado VALUES ('23023', 'Kevin', 'Alejo', ',Moctezuma', to_date('7:30', 'hh24:mi'), to_date('16:00', 'hh24:mi'), 'M', 'MAKW321845DFS', to_date('03/05/2000', 'dd/mm/yyyy'), 'elkevin024@biblio.com.mx', 'kmoctezuma', 'kevin243r', 2310, '2347001');  
INSERT INTO empleado VALUES ('23024', 'Jaqueline', 'Marques', 'Quintanar', to_date('7:00', 'hh24:mi'), to_date('16:00', 'hh24:mi'), 'F', 'JMQP362814DFN', to_date('26/06/2000', 'dd/mm/yyyy'), 'jackymarques@biblio.com.mx', 'jquintanar', 'contra2587', 2302, '2348001');  
INSERT INTO empleado VALUES ('23022', 'Leonardo', 'Trejo', 'Arellano', to_date('9:30', 'hh24:mi'), to_date('18:00', 'hh24:mi'), 'M', 'LTAD136814DFN', to_date('07/10/2001', 'dd/mm/yyyy'), 'leotrejo@biblio.com.mx', 'ltrejo', 'leonidas2', 2304, '2346001');  
INSERT INTO empleado VALUES ('23025', 'Maggy', 'Ocampo', 'Torres', to_date('8:30', 'hh24:mi'), to_date('15:00', 'hh24:mi'), 'F', 'TOMQ792821DFM', to_date('11/05/1999', 'dd/mm/yyyy'), 'maggyocampo@biblio.com.mx', 'mocampo', 'omaggy23', 2301, '2349001');  
INSERT INTO empleado VALUES ('23026', 'Martin', 'Hernandez', 'Sanchez', to_date('7:30', 'hh24:mi'), to_date('16:00', 'hh24:mi'), 'M', 'SHME234894DFN', to_date('01/01/2001', 'dd/mm/yyyy'), 'martin26xx@biblio.com.mx', 'mhernandez', 'martinino', 2301, '2351001');  

--DATOS PRESTAMO 
INSERT INTO PRESTAMO VALUES (220428,  to_date('28/04/2022', 'dd/mm/yyyy'), to_date('01/05/2022', 'dd/mm/yyyy'), 10001, '23010');
INSERT INTO PRESTAMO VALUES (211024, to_date('24/10/2021', 'dd/mm/yyyy'), to_date('24/11/2021', 'dd/mm/yyyy'), 10017, '20010');
INSERT INTO PRESTAMO VALUES (230609, to_date('09/06/2023', 'dd/mm/yyyy'), to_date('09/06/2024', 'dd/mm/yyyy'), 10004, '23050');   
INSERT INTO PRESTAMO VALUES (230910, to_date('10/09/2023', 'dd/mm/yyyy'), to_date('11/09/2023', 'dd/mm/yyyy'), 10012, '23010');   
INSERT INTO PRESTAMO VALUES (230101, to_date('01/01/2023', 'dd/mm/yyyy'), to_date('01/05/2023', 'dd/mm/yyyy'), 10005, '23010');      
INSERT INTO PRESTAMO VALUES (230805, to_date('05/08/2023', 'dd/mm/yyyy'), to_date('05/11/2023', 'dd/mm/yyyy'), 10018, '20012'); 
INSERT INTO PRESTAMO VALUES (230809, to_date('09/08/2023', 'dd/mm/yyyy'), to_date('29/08/2023', 'dd/mm/yyyy'), 10019, '20012');       
INSERT INTO PRESTAMO VALUES (210704, to_date('04/07/2021', 'dd/mm/yyyy'), to_date('04/07/2021', 'dd/mm/yyyy'), 10020, '20011');   
INSERT INTO PRESTAMO VALUES (230202, to_date('02/02/2023', 'dd/mm/yyyy'), to_date('18/12/2023', 'dd/mm/yyyy'), 10015, '22010');
INSERT INTO PRESTAMO VALUES (230629, to_date('29/03/2023', 'dd/mm/yyyy'), to_date('12/11/2023', 'dd/mm/yyyy'), 10003, '22010');
INSERT INTO PRESTAMO VALUES (220502,  to_date('01/02/2023', 'dd/mm/yyyy'), to_date('01/03/2023', 'dd/mm/yyyy'), 10023, '20012');  
INSERT INTO PRESTAMO VALUES (220503,  to_date('19/12/2023', 'dd/mm/yyyy'), to_date('19/12/2024', 'dd/mm/yyyy'), 10011, '20012');
INSERT INTO PRESTAMO VALUES (180722,  to_date('22/07/2018', 'dd/mm/yyyy'), to_date('22/08/2018', 'dd/mm/yyyy'), 10024, '16010');
INSERT INTO PRESTAMO VALUES (190202,  to_date('02/02/2019', 'dd/mm/yyyy'), to_date('12/02/2019', 'dd/mm/yyyy'), 10025, '16010');
INSERT INTO PRESTAMO VALUES (231023,  to_date('23/10/2023', 'dd/mm/yyyy'), to_date('30/11/2023', 'dd/mm/yyyy'), 10017, '23014');
INSERT INTO PRESTAMO VALUES (171209,  to_date('09/12/2017', 'dd/mm/yyyy'), to_date('10/01/2018', 'dd/mm/yyyy'), 10025, '16010');
INSERT INTO PRESTAMO VALUES (230706,  to_date('06/07/2023', 'dd/mm/yyyy'), to_date('15/08/2023', 'dd/mm/yyyy'), 10025, '23021');
INSERT INTO PRESTAMO VALUES (230103, to_date('03/01/2023', 'dd/mm/yyyy'), to_date('03/02/2023', 'dd/mm/yyyy'), 10002, '23023');
INSERT INTO PRESTAMO VALUES (231112, to_date('12/11/2023', 'dd/mm/yyyy'), to_date('15/11/2023', 'dd/mm/yyyy'), 10002, '23019');
INSERT INTO PRESTAMO VALUES (230222, to_date('22/02/2022', 'dd/mm/yyyy'), to_date('23/03/2023', 'dd/mm/yyyy'), 10022, '23022');
INSERT INTO PRESTAMO VALUES (230517, to_date('17/05/2023', 'dd/mm/yyyy'), to_date('17/07/2023', 'dd/mm/yyyy'), 10017, '23050');
INSERT INTO PRESTAMO VALUES (231008, to_date('08/10/2022', 'dd/mm/yyyy'), to_date('12/12/2022', 'dd/mm/yyyy'), 10007, '22010');
INSERT INTO PRESTAMO VALUES (230204, to_date('04/03/2023', 'dd/mm/yyyy'), to_date('04/03/2023', 'dd/mm/yyyy'), 10024, '23023');

--DATOS DETALLES_PRESTAMO
INSERT INTO DETALLES_PRESTAMO VALUES (230001, 220428);
INSERT INTO DETALLES_PRESTAMO VALUES (230014, 220428);    
INSERT INTO DETALLES_PRESTAMO VALUES (230017, 211024);
INSERT INTO DETALLES_PRESTAMO VALUES (230016, 211024);                   
INSERT INTO DETALLES_PRESTAMO VALUES (230015, 211024);   
INSERT INTO DETALLES_PRESTAMO VALUES (230022, 211024);               
INSERT INTO DETALLES_PRESTAMO VALUES (230007, 230609);
INSERT INTO DETALLES_PRESTAMO VALUES (230008, 230609);
INSERT INTO DETALLES_PRESTAMO VALUES (230009, 230609);  
INSERT INTO DETALLES_PRESTAMO VALUES (230012, 230101);
INSERT INTO DETALLES_PRESTAMO VALUES (230023, 230101);
INSERT INTO DETALLES_PRESTAMO VALUES (230030, 230101);  
INSERT INTO DETALLES_PRESTAMO VALUES (230006, 230805);  
INSERT INTO DETALLES_PRESTAMO VALUES (230027, 230805);  
INSERT INTO DETALLES_PRESTAMO VALUES (230011, 230910);
INSERT INTO DETALLES_PRESTAMO VALUES (230001, 230805);              
INSERT INTO DETALLES_PRESTAMO VALUES (230024, 210704);  
INSERT INTO DETALLES_PRESTAMO VALUES (230014, 210704);  
INSERT INTO DETALLES_PRESTAMO VALUES (230022, 210704);            
INSERT INTO DETALLES_PRESTAMO VALUES (230002, 230202);     
INSERT INTO DETALLES_PRESTAMO VALUES (230029, 230202);    
INSERT INTO DETALLES_PRESTAMO VALUES (230021, 230629);                
INSERT INTO DETALLES_PRESTAMO VALUES (230017, 230629);    
INSERT INTO DETALLES_PRESTAMO VALUES (230033, 230629);                
INSERT INTO DETALLES_PRESTAMO VALUES (230028, 230629);   
INSERT INTO DETALLES_PRESTAMO VALUES (230012, 230629);   
INSERT INTO DETALLES_PRESTAMO VALUES (230100, 220502);
INSERT INTO DETALLES_PRESTAMO VALUES (230027, 220503);
INSERT INTO DETALLES_PRESTAMO VALUES (230031, 180722);
INSERT INTO DETALLES_PRESTAMO VALUES (230030, 190202);            
INSERT INTO DETALLES_PRESTAMO VALUES (230102, 190202);                        
INSERT INTO DETALLES_PRESTAMO VALUES (230025, 190202);    
INSERT INTO DETALLES_PRESTAMO VALUES (230005, 231023);                        
INSERT INTO DETALLES_PRESTAMO VALUES (230022, 231023);    
INSERT INTO DETALLES_PRESTAMO VALUES (230032, 230101);  
INSERT INTO DETALLES_PRESTAMO VALUES (230013, 171209);            
INSERT INTO DETALLES_PRESTAMO VALUES (230021, 171209);  
INSERT INTO DETALLES_PRESTAMO VALUES (230005, 230706);            
INSERT INTO DETALLES_PRESTAMO VALUES (230102, 230103);   
INSERT INTO DETALLES_PRESTAMO VALUES (230017, 230103);   
INSERT INTO DETALLES_PRESTAMO VALUES (230003, 231112);  
INSERT INTO DETALLES_PRESTAMO VALUES (230100, 231112);              
INSERT INTO DETALLES_PRESTAMO VALUES (230101, 230222);  
INSERT INTO DETALLES_PRESTAMO VALUES (230030, 230222);     
INSERT INTO DETALLES_PRESTAMO VALUES (230007, 230517);   
INSERT INTO DETALLES_PRESTAMO VALUES (230028, 230517);  
INSERT INTO DETALLES_PRESTAMO VALUES (230022, 230517);  
INSERT INTO DETALLES_PRESTAMO VALUES (230020, 231008);               
INSERT INTO DETALLES_PRESTAMO VALUES (230023, 231008);    
INSERT INTO DETALLES_PRESTAMO VALUES (230102, 231008);                
INSERT INTO DETALLES_PRESTAMO VALUES (230019, 230204); 

--DATOS AUTOR
INSERT INTO AUTOR VALUES ('E900', 'Miguel', 'de Cervantes', SYSDATE, 36);
INSERT INTO AUTOR VALUES ('I900', 'John Ronald Reuel', 'Tolkien', SYSDATE, 108);
INSERT INTO AUTOR VALUES ('B700', 'Paulo', 'Coelho', SYSDATE, 16);
INSERT INTO AUTOR VALUES ('I901', 'William', 'Shakespeare', SYSDATE, 108);
INSERT INTO AUTOR VALUES ('A800', 'Franz', 'Kafka', SYSDATE, 8);
INSERT INTO AUTOR VALUES ('A900', 'Charles', 'Dickens', SYSDATE, 108);
INSERT INTO AUTOR VALUES ('C600', 'Gabriel', 'Garcia', SYSDATE, 24);
INSERT INTO AUTOR VALUES ('I700', 'Oscar', 'Wilde', SYSDATE, 52);
INSERT INTO AUTOR VALUES ('I902', 'Jane', 'Austen', SYSDATE, 108);
INSERT INTO AUTOR VALUES ('I701', 'James', 'Joyce', SYSDATE, 52);
INSERT INTO AUTOR VALUES ('I000', 'Dante', 'Alighieri', SYSDATE, 55);
INSERT INTO AUTOR VALUES ('E901', 'Federico', 'Garc\EDa', SYSDATE, 36);
INSERT INTO AUTOR VALUES ('E902', 'Lope', 'de Vega', SYSDATE, 36);
INSERT INTO AUTOR VALUES ('J900', 'Haruki', 'Murakami', SYSDATE, 57);
INSERT INTO AUTOR VALUES ('I200', 'George', 'Orwell', SYSDATE, 48);
INSERT INTO AUTOR VALUES ('E910', 'Leo', 'Tolstoi', SYSDATE, 88);
INSERT INTO AUTOR VALUES ('I910', 'Jane', 'Austen', SYSDATE, 83);
INSERT INTO AUTOR VALUES ('B710', 'Fiodor', 'Dostoievski', SYSDATE, 88);
INSERT INTO AUTOR VALUES ('A810', 'JK', 'Rowling', SYSDATE, 83);
INSERT INTO AUTOR VALUES ('A910', 'Mark', 'Twain', SYSDATE, 37);
INSERT INTO AUTOR VALUES ('I710', 'Miguel', 'de Cervantes', SYSDATE, 36);
INSERT INTO AUTOR VALUES ('I711', 'Toni', 'Morrison', SYSDATE, 37);
INSERT INTO AUTOR VALUES ('J901', 'Matsuo', 'Basho', SYSDATE, 57);

--DATOS AUTORIA
INSERT INTO AUTORIA VALUES ('I900', 230007);
INSERT INTO AUTORIA VALUES ('I900', 230008);
INSERT INTO AUTORIA VALUES ('I900', 230009);
INSERT INTO AUTORIA VALUES ('B700', 230011);
INSERT INTO AUTORIA VALUES ('I901', 230010);
INSERT INTO AUTORIA VALUES ('A800', 230012);
INSERT INTO AUTORIA VALUES ('I900', 230014);
INSERT INTO AUTORIA VALUES ('I200', 230013);
INSERT INTO AUTORIA VALUES ('I000', 230015);
INSERT INTO AUTORIA VALUES ('I701', 230016);
INSERT INTO AUTORIA VALUES ('A900', 230017);
INSERT INTO AUTORIA VALUES ('E901', 230018);
INSERT INTO AUTORIA VALUES ('E901', 230019);
INSERT INTO AUTORIA VALUES ('C600', 230021);
INSERT INTO AUTORIA VALUES ('C600', 230020);
INSERT INTO AUTORIA (AUTOR_ID, LIBRO_ID) VALUES ('E900', 230006);      
INSERT INTO AUTORIA (AUTOR_ID, LIBRO_ID) VALUES ('E910', 230022); 
INSERT INTO AUTORIA (AUTOR_ID, LIBRO_ID) VALUES ('E910', 230023);
INSERT INTO AUTORIA (AUTOR_ID, LIBRO_ID) VALUES ('E910', 230024);
INSERT INTO AUTORIA (AUTOR_ID, LIBRO_ID) VALUES ('I910', 230025);
INSERT INTO AUTORIA (AUTOR_ID, LIBRO_ID) VALUES ('I910', 230026);
INSERT INTO AUTORIA (AUTOR_ID, LIBRO_ID) VALUES ('C600', 230027);
INSERT INTO AUTORIA (AUTOR_ID, LIBRO_ID) VALUES ('C600', 230028);
INSERT INTO AUTORIA (AUTOR_ID, LIBRO_ID) VALUES ('C600', 230029);
INSERT INTO AUTORIA (AUTOR_ID, LIBRO_ID) VALUES ('C600', 230030);
INSERT INTO AUTORIA (AUTOR_ID, LIBRO_ID) VALUES ('C600', 230031);
INSERT INTO AUTORIA VALUES ('J901', 230032);
INSERT INTO AUTORIA VALUES ('I901', 230033);


























































































































