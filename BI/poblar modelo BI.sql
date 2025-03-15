USE bd_gestion_proyectos;
GO

-- Dim Proyecto

SELECT
p.id AS 'proyecto_id',
p.nombre AS 'proyecto',
c.nombre AS 'cliente',
p.estado
FROM proyectos p
INNER JOIN clientes c ON c.id=p.cliente_id;