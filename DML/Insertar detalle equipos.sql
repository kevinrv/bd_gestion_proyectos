Use bd_gestion_proyectos;

-- Insertar empleados en equipos asegurando que cada uno esté en máximo 2 equipos y sumando 8 horas

DECLARE @empleados_disponibles TABLE (empleado_id INT, veces_asignado INT DEFAULT 0);
INSERT INTO @empleados_disponibles (empleado_id) 
SELECT id FROM empleados;

DECLARE @equipo_id INT, @empleado_id INT, @num_integrantes INT, @horas_asignadas DECIMAL(9,2);
DECLARE equipo_cursor CURSOR FOR 
SELECT id FROM equipos;

OPEN equipo_cursor;
FETCH NEXT FROM equipo_cursor INTO @equipo_id;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Elegimos aleatoriamente entre 3 y 5 integrantes por equipo
    SET @num_integrantes = 3 + (ABS(CHECKSUM(NEWID())) % 3); 
    
    -- Asignamos empleados asegurando que no excedan 2 equipos y que sumen 8 horas
    WHILE @num_integrantes > 0
    BEGIN
        -- Seleccionar un empleado disponible (que esté en menos de 2 equipos)
        SELECT TOP 1 @empleado_id = empleado_id 
        FROM @empleados_disponibles 
        WHERE veces_asignado < 2
        ORDER BY NEWID();

        -- Si el empleado ya tiene una asignación previa, ajustar horas
        IF EXISTS (SELECT 1 FROM detalles_equipos WHERE empleado_id = @empleado_id)
        BEGIN
            SET @horas_asignadas = 8 - (SELECT SUM(horas_asignadas) FROM detalles_equipos WHERE empleado_id = @empleado_id);
        END
        ELSE
        BEGIN
            -- Si es su primera asignación, darle 4 horas
            SET @horas_asignadas = 4;
        END

        -- Insertar la asignación del empleado al equipo
        INSERT INTO detalles_equipos (equipo_id, empleado_id, horas_asignadas, rol, fecha_asignacion)
        VALUES (@equipo_id, @empleado_id, @horas_asignadas, 'Miembro del equipo', GETDATE());

        -- Actualizar el conteo de asignaciones del empleado
        UPDATE @empleados_disponibles 
        SET veces_asignado = veces_asignado + 1 
        WHERE empleado_id = @empleado_id;

        -- Reducir el número de integrantes pendientes
        SET @num_integrantes = @num_integrantes - 1;
    END

    FETCH NEXT FROM equipo_cursor INTO @equipo_id;
END

CLOSE equipo_cursor;
DEALLOCATE equipo_cursor;
