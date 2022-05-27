drop database if exists backup_5;
create schema BACKUP_5;

USE backup_5;

CREATE TABLE Pacientes (
id_paciente 	INT NOT NULL auto_increment PRIMARY KEY,
Nombre_Px 		VARCHAR (50),
Apellido_Px 	VARCHAR (50),
Sexo_Px 		CHAR,
Fecha_Nac_Px	DATE,
Domicilio_Px	VARCHAR (70),
Tel_Contacto	VARCHAR(50),
Email_Px		VARCHAR (50),
Fecha_de_Ig		DATE,
Fecha_de_Eg		DATE,
Pagos_Px		DECIMAL (8,2),
Localidad		INT,
ObraSocial		INT
);


-- Tabla Servicios

CREATE TABLE Servicios (
Cod_Servicio		INT NOT NULL PRIMARY KEY,
Nombre_Servicio		VARCHAR (250),
Costo_Variable		DECIMAL (6,2),
Costo_Fijo			DECIMAL (6,2),
Honorarios			DECIMAL (6,2)
);

-- Tabla Insumos

CREATE TABLE Insumos (
id_insumos			INT NOT NULL PRIMARY KEY,
Nombre_Insumo		VARCHAR (50),
Costo				DECIMAL (8,2),
Proveedor			INT,
Cod_servicio		INT
);



-- Tabla Proveedores

CREATE TABLE Proveedores (
id_proveed			INT NOT NULL PRIMARY KEY,
Razon_Social		VARCHAR (50),
Fecha_Alta			DATE,
Fecha_Baja			DATE,
Producto			INT
);

-- Tabla Localidades

CREATE TABLE Localidades (
id_localidad		INT NOT NULL PRIMARY KEY,
Localidad			VARCHAR (50)
);

-- Tabla Obra Social

CREATE TABLE OOSS (
id_OOSS				INT NOT NULL PRIMARY KEY,
Obra_Social			VARCHAR (50)
);

-- Tabla Profesionales

CREATE TABLE Profesionales (
Legajo			INT NOT NULL PRIMARY KEY,
Nombre_PF		VARCHAR (50),
Apellido_PF		VARCHAR (50),
Fecha_Nac		DATE,
Domicilio_PF	VARCHAR (70),
Tel_Contacto	VARCHAR (50),
Email_PF		VARCHAR (50),
Localidad_PF	INT,
Especialidad	INT
);

-- Tabla Especialidades

CREATE TABLE Especialidades (
id_especialidad		INT NOT NULL PRIMARY KEY,
Especialidad		VARCHAR (50)
);

-- Tabla Sucursales

CREATE TABLE Sucursales (
id_sucursal		INT NOT NULL PRIMARY KEY,
Sucursal		VARCHAR (20)
);

-- Tabla Facturas

CREATE TABLE Facturas (
id_facturas 	INT NOT NULL PRIMARY KEY,
paciente 		int,
Obra_soc		int,
Legajo_pf		int,
Sucursal		int,
servicio_factura	int
);

CREATE TABLE Tabla_Log_Pacientes_por_profesional (
ID_paciente		INT NOT NULL PRIMARY KEY,
Fecha_de_ig 	DATE,
Email_px		VARCHAR(50)
);

CREATE TABLE Tabla_log_profesionales (
Legajo				INT NOT NULL PRIMARY KEY,
Tel_contacto 		VARCHAR(50),
email_pf			VARCHAR(50)
);

CREATE TABLE tabla_log_ooss (
Id_obra_social_eliminada 	INT NOT NULL PRIMARY KEY,
OS_Eliminada				VARCHAR (50),
usuario						VARCHAR (50),
fecha						DATETIME
);

-- Creacion de claves foraneas

ALTER TABLE insumos
ADD CONSTRAINT proveedor_por_producto FOREIGN KEY (proveedor) REFERENCES proveedores(id_proveed);

ALTER TABLE facturas
ADD CONSTRAINT fk_servicio_factura FOREIGN KEY (Servicio_factura) REFERENCES servicios(Cod_Servicio);

ALTER TABLE facturas
ADD CONSTRAINT fk_sucursal_factura FOREIGN KEY (Sucursal) REFERENCES sucursales(id_sucursal);

ALTER TABLE facturas
ADD CONSTRAINT fk_legajo_pf FOREIGN KEY (Legajo_PF) REFERENCES profesionales(Legajo);

ALTER TABLE facturas
ADD CONSTRAINT OOSS_px FOREIGN KEY (Obra_Soc) REFERENCES ooss(id_OOSS);

ALTER TABLE facturas
ADD CONSTRAINT fk_paciente FOREIGN KEY (Paciente) REFERENCES pacientes(id_paciente);

ALTER TABLE profesionales
ADD CONSTRAINT fk_especialidad FOREIGN KEY (Especialidad) REFERENCES especialidades(id_especialidad);

ALTER TABLE profesionales
ADD CONSTRAINT fk_localidad_pf FOREIGN KEY (Localidad_PF) REFERENCES localidades(id_localidad);

ALTER TABLE pacientes
ADD CONSTRAINT fk_OOSS FOREIGN KEY (ObraSocial) REFERENCES OOSS(id_OOSS);

ALTER TABLE pacientes
ADD CONSTRAINT fk_localidad FOREIGN KEY (Localidad) REFERENCES Localidades(id_localidad);

ALTER TABLE proveedores
ADD CONSTRAINT fk_producto FOREIGN KEY (Producto) REFERENCES insumos(id_insumos);

ALTER TABLE insumos
ADD CONSTRAINT fk_servicios FOREIGN KEY (Cod_Servicio) REFERENCES Servicios (Cod_Servicio);

ALTER TABLE insumos
ADD CONSTRAINT fk_Proveedores FOREIGN KEY (Proveedor) REFERENCES proveedores(id_proveed);