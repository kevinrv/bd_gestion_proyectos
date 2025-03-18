USE bd_gestion_proyectos;
GO

-- Dim Proyecto

SELECT
	DISTINCT
	p.id AS 'proyecto_id',
	p.nombre AS 'proyecto',
	c.nombre AS 'cliente',
	p.estado
FROM proyectos p
	INNER JOIN clientes c ON c.id=p.cliente_id;

-- Dim Empleado

SELECT
	DISTINCT
	e.id AS 'empleado_id',
	CONCAT(e.nombres,' ',e.apellido_paterno,' ',e.apellido_materno) AS 'empleado',
	p.nombre AS 'profesion'
FROM empleados e
	INNER JOIN profesiones p ON p.id=e.profesion_id;

--Dim equipo

SELECT
	DISTINCT
	id AS 'equipo_id',
	nombre AS 'equipo',
	presupuesto_asignado
FROM equipos;

-- Dim Tiempo

SELECT
	DISTINCT
	fecha_asignacion,
	MONTH(fecha_asignacion) AS 'mes',
	YEAR(fecha_asignacion) AS 'anio'
FROM detalles_equipos;


--- Preparando la data de fecha de asignacion para la dim_tiempo
DECLARE @counter INT;
SET @counter=1;

WHILE @counter < 175
    BEGIN
	UPDATE detalles_equipos SET fecha_asignacion=DATEADD(MONTH,-(ROUND(RAND()*36,0)),fecha_asignacion)
	WHERE id=@counter
	SET @counter = @counter +1
END

