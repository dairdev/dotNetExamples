CREATE DATABASE Test;

USE Test;

IF OBJECT_ID ('dbo.Usuario') IS NOT NULL
	DROP TABLE dbo.Usuario
GO

CREATE TABLE dbo.Usuario
	(
	id             INT IDENTITY NOT NULL,
	nombre VARCHAR(15),
	paterno VARCHAR(15),
	materno VARCHAR(15),
	ingreso INT,
	genero CHAR(1),
	PRIMARY KEY (id)
	)
GO

INSERT INTO Usuario (nombre, paterno, materno, ingreso, genero) VALUES 
('Dennis','Infantas','Reaño',2014,'M'),
('Otro','Usuario','Mas',2014,'M'),
('Fulana','Sutana','Mengana',2014,'F'),
('Ella','EsLa','Usuaria',2014,'F');