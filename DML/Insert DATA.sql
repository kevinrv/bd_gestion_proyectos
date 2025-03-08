USE bd_gestion_proyectos;
GO

-- Inserciones:
--- Profesiones

SELECT*FROM profesiones;
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
('PE20250001','BBVA','FINANCIERO','Perú','bbva@bbva.com','01 123546','20635632145','San Isidro','bbva.com','Empresa Grande');

-- Insertar 10 proyectos en la tabla proyectos
INSERT INTO proyectos (cliente_id, codigo, nombre, descripcion, fecha_inicio, fecha_fin, estado, presupuesto_asignado)
VALUES 
(1, 'PROJ001', 'Sistema de Gestión Financiera', 'Desarrollo de un sistema para control financiero.', '2024-01-10', '2024-06-30', 'En curso', 50000),
(2, 'PROJ002', 'Implementación de ERP', 'Instalación y configuración de un ERP para la empresa.', '2024-02-01', '2024-08-15', 'Planificado', 75000),
(3, 'PROJ003', 'Desarrollo de App Móvil', 'Creación de una aplicación móvil para clientes.', '2024-03-05', '2024-09-30', 'En curso', 60000),
(4, 'PROJ004', 'Automatización de Procesos', 'Optimización de flujos de trabajo internos.', '2024-04-01', '2024-12-20', 'Planificado', 45000),
(5, 'PROJ005', 'Migración a la Nube', 'Migración de servidores a una infraestructura cloud.', '2024-05-15', '2024-11-15', 'En curso', 90000),
(6, 'PROJ006', 'Análisis de Datos Avanzado', 'Implementación de herramientas de BI y Big Data.', '2024-06-10', '2024-12-31', 'Pendiente', 85000),
(7, 'PROJ007', 'Ciberseguridad Empresarial', 'Fortalecimiento de seguridad informática.', '2024-07-20', '2025-01-20', 'Planificado', 72000),
(8, 'PROJ008', 'Optimización de Logística', 'Mejora de procesos de distribución y almacenamiento.', '2024-08-05', '2025-02-28', 'En curso', 55000),
(9, 'PROJ009', 'Desarrollo de CRM', 'Implementación de un sistema CRM personalizado.', '2024-09-10', '2025-03-15', 'Pendiente', 68000),
(10, 'PROJ010', 'Expansión Internacional', 'Análisis y estrategia para expandir operaciones.', '2024-10-01', '2025-06-30', 'Planificado', 120000);

