-- Tabla Pacientes

CREATE TABLE Pacientes (
id_paciente 	INT NOT NULL auto_increment PRIMARY KEY,
Nombre_Px 		VARCHAR (50),
Apellido_Px 	VARCHAR (50),
Sexo_Px 		CHAR,
Fecha_Nac_Px	DATE,
Domicilio_Px	VARCHAR (70),
Tel_Contacto	INT,
Email_Px		VARCHAR (50),
Fecha_de_Ig		DATE,
Fecha_de_Eg		DATE,
Pagos_Px		DECIMAL (6,2)
);

-- Tabla Servicios

CREATE TABLE Servicios (
Cod_Servicio		INT NOT NULL PRIMARY KEY,
Nombre_Servicio		VARCHAR (20),
Costo_Variable		DECIMAL (6,2),
Costo_Fijo			DECIMAL (6,2),
Honorarios			DECIMAL (6,2)
);

-- Tabla Insumos

CREATE TABLE Insumos (
id_insumos			INT NOT NULL PRIMARY KEY,
Nombre_Insumo		VARCHAR (50),
Costo				DECIMAL (6,2)
);

-- Tabla Proveedores

CREATE TABLE Proveedores (
id_proveed			INT NOT NULL PRIMARY KEY,
Razon_Social		VARCHAR (50),
Fecha_Alta			DATE,
Fecha_Baja			DATE
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
Tel_Contacto	INT,
Email_PF		VARCHAR (50)
);

-- Tabla Especialidades

CREATE TABLE Especialidades (
id_especialidad		INT NOT NULL PRIMARY KEY,
Especialidad		VARCHAR (20)
);

-- Tabla Sucursales

CREATE TABLE Sucursales (
id_sucursal		INT NOT NULL PRIMARY KEY,
Sucursal		VARCHAR (20)
);

-- Tabla Facturas

CREATE TABLE Facturas (
id_facturas 	INT NOT NULL PRIMARY KEY
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
OS_Eliminada				VARCHAR (50)
);

ALTER TABLE facturas
ADD Paciente INT;

ALTER TABLE facturas
ADD CONSTRAINT fk_paciente FOREIGN KEY (Paciente) REFERENCES pacientes(id_paciente);

ALTER TABLE facturas
ADD Obra_Soc INT;

ALTER TABLE facturas
ADD CONSTRAINT OOSS_px FOREIGN KEY (Obra_Soc) REFERENCES ooss(id_OOSS);

ALTER TABLE facturas
ADD Legajo_PF INT;

ALTER TABLE facturas
ADD CONSTRAINT fk_legajo_pf FOREIGN KEY (Legajo_PF) REFERENCES profesionales(Legajo);

ALTER TABLE facturas
ADD Sucursal INT;

ALTER TABLE facturas
ADD CONSTRAINT fk_sucursal_factura FOREIGN KEY (Sucursal) REFERENCES sucursales(id_sucursal);

ALTER TABLE facturas
ADD Servicio_factura INT;

ALTER TABLE facturas
ADD CONSTRAINT fk_servicio_factura FOREIGN KEY (Servicio_factura) REFERENCES servicios(Cod_Servicio);

SELECT * FROM facturas;