CREATE SCHEMA Centro_Odontologico;

USE Centro_Odontologico;
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

