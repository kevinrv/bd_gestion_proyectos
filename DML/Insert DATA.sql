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
