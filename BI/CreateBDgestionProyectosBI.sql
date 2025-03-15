--DROP DATABASE bd_gestion_proyectos_bi;

CREATE DATABASE bd_gestion_proyectos_bi;
GO
USE bd_gestion_proyectos_bi;
-- Dimensión Equipos
CREATE TABLE dim_equipo(
id INT IDENTITY(1,1) PRIMARY KEY,
equipo_id INT NOT NULL,
equipo VARCHAR(100) NULL,
presupuesto_asignado MONEY NULL
);

-- Dimensión Proyectos

CREATE TABLE dim_proyecto(
id INT IDENTITY(1,1) PRIMARY KEY,
proyecto_id INT NOT NULL,
proyecto VARCHAR(255) NULL,
cliente VARCHAR(100) NULL,
estado VARCHAR(55)
);

-- Dimensión empleados

CREATE TABLE dim_empleado(
id INT IDENTITY(1,1) PRIMARY KEY,
empleado_id INT NOT NULL,
empleado VARCHAR(465) NULL,
profesion VARCHAR(155) NULL
);

--- Dimensión tiempo

CREATE TABLE dim_tiempo(
id INT IDENTITY(1,1) PRIMARY KEY,
fecha_asignacion DATETIME NOT NULL,
mes VARCHAR(20) NULL,
anio VARCHAR(10) NULL
);

--- Tabla hechos o Fac table

CREATE TABLE fac_table_desempenios(
id INT IDENTITY(1,1) PRIMARY KEY,
dim_tiempo_id INT,
dim_equipo_id INT,
dim_empleado_id INT,
dim_proyecto_id INT,
horas_asignadas INT,
horas_facturadas INT,
monto_facturado INT,
tiempo_asignado_meses INT
);

ALTER TABLE fac_table_desempenios
ADD FOREIGN KEY (dim_tiempo_id) REFERENCES dim_tiempo(id);

ALTER TABLE fac_table_desempenios
ADD FOREIGN KEY (dim_equipo_id) REFERENCES dim_equipo(id);

ALTER TABLE fac_table_desempenios
ADD FOREIGN KEY (dim_empleado_id) REFERENCES dim_empleado(id);

ALTER TABLE fac_table_desempenios
ADD FOREIGN KEY (dim_proyecto_id) REFERENCES dim_proyecto(id);