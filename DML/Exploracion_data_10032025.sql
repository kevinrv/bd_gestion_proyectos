USE bd_gestion_proyectos;
GO

SELECT*FROM profesiones;
SELECT*FROM empleados;
SELECT*FROM clientes;
SELECT*FROM proyectos;
SELECT*FROM equipos;
SELECT*FROM detalles_equipos;

SELECT*FROM cuotas;
SELECT*FROM pagos;
--Analisis de asiganciones por equipo

SELECT
	e.id,
	e.nombre,
	COUNT(DISTINCT de.empleado_id) AS 'coun_num_integrantes'
INTO #T01
FROM equipos e 
INNER JOIN detalles_equipos de ON de.equipo_id=e.id
WHERE de.horas_asignadas>0
GROUP BY 
	e.id,
	e.nombre,
	e.num_integrantes;

SELECT*FROM #T01;

UPDATE e SET e.num_integrantes=t.coun_num_integrantes
FROM equipos e
INNER JOIN #T01 t ON t.id=e.id;

SELECT
	e.id,
	e.nombre,
	e.num_integrantes,
	COUNT(DISTINCT de.empleado_id) AS 'coun_num_integrantes'
FROM equipos e 
INNER JOIN detalles_equipos de ON de.equipo_id=e.id
WHERE de.horas_asignadas>0
GROUP BY 
	e.id,
	e.nombre,
	e.num_integrantes;
-- Insertando datos en Cuotas y pagos

SELECT*FROM proyectos;

--- Visulizar las horas a facturar por cada proyecto

SELECT
	p.id,
	p.nombre,
	DATEDIFF(MONTH, p.fecha_inicio, p.fecha_fin) AS 'meses_proyecto',
	SUM(de.horas_asignadas) AS 'total_horas_dia',
	SUM(de.horas_asignadas)*20 AS 'total_horas_mes',
	(SUM(de.horas_asignadas)*20)*50 AS 'factura_total_mes',
	((SUM(de.horas_asignadas)*20)*50)*DATEDIFF(MONTH, p.fecha_inicio, p.fecha_fin) AS 'costo_total_proyecto'
FROM proyectos p
INNER JOIN equipos e ON e.proyecto_id=p.id
INNER JOIN detalles_equipos de ON de.equipo_id=e.id
WHERE p.fecha_fin < GETDATE()
GROUP BY
	p.id, 
	p.nombre,
	p.fecha_inicio, 
	p.fecha_fin;

SELECT*FROM cuotas;

INSERT INTO cuotas
VALUES ('3','1','64000','2024-02-10','2024-02-10','pagado','0','1280'),
('3','2','64000','2024-03-10','2024-03-10','pagado','0','1280'),
('3','3','64000','2024-04-10','2024-04-10','pagado','0','1280'),
('3','4','64000','2024-05-10','2024-05-10','pagado','0','1280'),
('3','5','64000','2024-06-10','2024-06-10','pagado','0','1280');

-- Procedimeinto almacenado para generar cuotas

ALTER PROCEDURE sp_kv_generar_cuotas  
	@id_proyecto INT
AS 
BEGIN
 DECLARE @monto_cuota MONEY;
 DECLARE @fecha_pago DATETIME;
 DECLARE @fecha_vencimiento DATETIME;
 DECLARE @horas_facturadas INT;
 DECLARE @num_cuotas INT;
 DECLARE @Counter INT;

 SELECT
	@num_cuotas = DATEDIFF(MONTH, p.fecha_inicio, p.fecha_fin),
	@horas_facturadas = SUM(de.horas_asignadas)*20,
	@monto_cuota= (SUM(de.horas_asignadas)*20)*50
FROM proyectos p
INNER JOIN equipos e ON e.proyecto_id=p.id
INNER JOIN detalles_equipos de ON de.equipo_id=e.id
WHERE p.id=@id_proyecto
GROUP BY p.fecha_inicio, p.fecha_fin;

SELECT @fecha_pago = fecha_inicio, @fecha_vencimiento=fecha_fin  FROM proyectos WHERE id=@id_proyecto;

SET @Counter = 1

WHILE @Counter <= @num_cuotas

BEGIN

INSERT INTO cuotas 
VALUES (@id_proyecto,@Counter,@monto_cuota,DATEADD(MONTH, @Counter,@fecha_pago), DATEADD(MONTH, @Counter,@fecha_vencimiento),'creado','0.00',@horas_facturadas)

SET @Counter = @Counter + 1
END

END
GO


EXECUTE dbo.sp_kv_generar_cuotas 10

select*from cuotas;

DELETE FROM cuotas WHERE proyecto_id=4;