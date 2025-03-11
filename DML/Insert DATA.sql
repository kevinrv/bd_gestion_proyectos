USE bd_gestion_proyectos;
GO

-- Inserciones:
--- Profesiones

SELECT*FROM empleados;
SELECT*FROM profesiones ORDER BY id ;
EXEC SP_HELP profesiones;

INSERT INTO profesiones (nombre) VALUES ('Ingeniero de Sistemas'),
('Ingeniero de Software');

DELETE FROM profesiones WHERE id=20;

--- Empleados
SELECT*FROM empleados;
EXEC SP_HELP empleados;

INSERT INTO empleados 
(profesion_id,nombres,apellido_paterno,apellido_materno,numero_documento,email_personal,email_institucional,celular,fecha_ingreso,fecha_fin_contrato)
VALUES
('3', 'Carlos','Tong',NULL,'12345078','carlostong@gmail.com','ctong@dsrp.com','911234528','2025-03-03','2026-03-03'),
('4', 'Kevin','Rivera','Vergaray','12345678','kevinriveravergaray@gmail.com','kriverav@dsrp.com','918839228','2025-03-03','2026-03-03');

UPDATE empleados SET numero_documento='12345670'
WHERE id=1;
--- Clientes

SELECT*FROM clientes;
EXEC SP_HELP clientes;

INSERT INTO clientes (codigo, nombre, sector, pais, email, telefono, identificador_cliente, direccion, web_url, tipo)
VALUES 
('PE20250001','BBVA','FINANCIERO','Per�','bbva@bbva.com','01 123546','20635632145','San Isidro','bbva.com','Empresa Grande');

-- Insertar 10 proyectos en la tabla proyectos
INSERT INTO proyectos (cliente_id, codigo, nombre, descripcion, fecha_inicio, fecha_fin, estado, presupuesto_asignado)
VALUES 
(1, 'PROJ001', 'Sistema de Gesti�n Financiera', 'Desarrollo de un sistema para control financiero.', '2024-01-10', '2024-06-30', 'En curso', 50000),
(122, 'PROJ002', 'Implementaci�n de ERP', 'Instalaci�n y configuraci�n de un ERP para la empresa.', '2024-02-01', '2024-08-15', 'Planificado', 75000),
(130, 'PROJ003', 'Desarrollo de App M�vil', 'Creaci�n de una aplicaci�n m�vil para clientes.', '2024-03-05', '2024-09-30', 'En curso', 60000),
(134, 'PROJ004', 'Automatizaci�n de Procesos', 'Optimizaci�n de flujos de trabajo internos.', '2024-04-01', '2024-12-20', 'Planificado', 45000),
(125, 'PROJ005', 'Migraci�n a la Nube', 'Migraci�n de servidores a una infraestructura cloud.', '2024-05-15', '2024-11-15', 'En curso', 90000),
(136, 'PROJ006', 'An�lisis de Datos Avanzado', 'Implementaci�n de herramientas de BI y Big Data.', '2024-06-10', '2024-12-31', 'Pendiente', 85000),
(127, 'PROJ007', 'Ciberseguridad Empresarial', 'Fortalecimiento de seguridad inform�tica.', '2024-07-20', '2025-01-20', 'Planificado', 72000),
(138, 'PROJ008', 'Optimizaci�n de Log�stica', 'Mejora de procesos de distribuci�n y almacenamiento.', '2024-08-05', '2025-02-28', 'En curso', 55000),
(129, 'PROJ009', 'Desarrollo de CRM', 'Implementaci�n de un sistema CRM personalizado.', '2024-09-10', '2025-03-15', 'Pendiente', 68000),
(140, 'PROJ010', 'Expansi�n Internacional', 'An�lisis y estrategia para expandir operaciones.', '2024-10-01', '2025-06-30', 'Planificado', 120000);

Select*from empleados;

-- Insertar equipos por proyecto (2 o 3 equipos por cada uno)
INSERT INTO equipos (proyecto_id, nombre, fecha_creacion, fecha_fin, num_integrantes, presupuesto_asignado, funciones)  
VALUES  
-- Proyecto 1
(12, 'Equipo Desarrollo Backend', '2024-01-15', '2024-06-30', 5, 20000, 'Desarrollo y mantenimiento del backend.'),  
(12, 'Equipo Desarrollo Frontend', '2024-01-20', '2024-06-30', 4, 15000, 'Dise�o y desarrollo del frontend.'),  
(12, 'Equipo QA y Testing', '2024-02-01', '2024-06-30', 3, 10000, 'Pruebas de calidad y aseguramiento.'),  

-- Proyecto 2  
(11, 'Equipo Implementaci�n ERP', '2024-02-05', '2024-08-15', 6, 30000, 'Configuraci�n y personalizaci�n del ERP.'),  
(11, 'Equipo Capacitaci�n', '2024-02-15', '2024-08-15', 3, 12000, 'Capacitaci�n a usuarios finales.'),  

-- Proyecto 3  
(3, 'Equipo Desarrollo App', '2024-03-10', '2024-09-30', 5, 25000, 'Desarrollo de la app m�vil.'),  
(3, 'Equipo UI/UX', '2024-03-15', '2024-09-30', 3, 12000, 'Dise�o de experiencia de usuario.'),  

-- Proyecto 4  
(4, 'Equipo Automatizaci�n', '2024-04-10', '2024-12-20', 4, 20000, 'Desarrollo de scripts de automatizaci�n.'),  
(4, 'Equipo Integraciones', '2024-04-20', '2024-12-20', 4, 18000, 'Integraci�n de sistemas existentes.'),  

-- Proyecto 5  
(5, 'Equipo Migraci�n Cloud', '2024-05-20', '2024-11-15', 5, 40000, 'Migraci�n de infraestructura a la nube.'),  
(5, 'Equipo Seguridad Cloud', '2024-06-01', '2024-11-15', 3, 25000, 'Implementaci�n de seguridad en la nube.'),  

-- Proyecto 6  
(6, 'Equipo BI y Big Data', '2024-06-15', '2024-12-31', 5, 50000, 'Implementaci�n de soluciones de BI.'),  
(6, 'Equipo An�lisis Predictivo', '2024-07-01', '2024-12-31', 4, 30000, 'Desarrollo de modelos de predicci�n.'),  

-- Proyecto 7  
(7, 'Equipo Seguridad TI', '2024-07-25', '2025-01-20', 6, 40000, 'Auditor�a y fortalecimiento de seguridad.'),  
(7, 'Equipo Gesti�n de Riesgos', '2024-08-10', '2025-01-20', 3, 25000, 'An�lisis y mitigaci�n de riesgos.'),  

-- Proyecto 8  
(8, 'Equipo Log�stica y Transporte', '2024-08-15', '2025-02-28', 5, 35000, 'Optimizaci�n de la cadena de suministros.'),  
(8, 'Equipo Almacenes', '2024-08-25', '2025-02-28', 4, 20000, 'Mejoras en la gesti�n de almacenes.'),  

-- Proyecto 9  
(9, 'Equipo Desarrollo CRM', '2024-09-15', '2025-03-15', 5, 40000, 'Desarrollo del sistema CRM.'),  
(9, 'Equipo Integraciones CRM', '2024-09-25', '2025-03-15', 4, 25000, 'Conexi�n con sistemas externos.'),  

-- Proyecto 10  
(10, 'Equipo Estrategia de Expansi�n', '2024-10-10', '2025-06-30', 5, 50000, 'An�lisis de mercado y expansi�n.'),  
(10, 'Equipo Legal y Normativa', '2024-10-20', '2025-06-30', 3, 30000, 'Cumplimiento legal en nuevos mercados.');


SELECT*FROM equipos;
SELECT*FROM detalles_equipos;


SELECT*FROM proyectos

ALTER TABLE cuotas
ADD horas_facturadas INT NULL;