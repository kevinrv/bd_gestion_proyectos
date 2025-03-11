USE bd_gestion_proyectos;

-- Insertar empleados con profesiones asignadas de forma correlativa entre ID 3 y 22
DECLARE @contador INT = 0, @total_empleados INT = 50, @profesion_id INT = 3;
DECLARE @nombre VARCHAR(50), @apellido_p VARCHAR(50), @apellido_m VARCHAR(50), 
        @email VARCHAR(100), @fecha_ingreso DATE, @tiempo_contrato DATE, @numero_doc VARCHAR(20);

WHILE @contador < @total_empleados
BEGIN
    -- Generar nombres y apellidos de una lista predefinida
    SET @nombre = 
        CASE (@contador % 10) 
            WHEN 0 THEN 'Carlos' WHEN 1 THEN 'Mar�a' WHEN 2 THEN 'Javier' WHEN 3 THEN 'Andrea' WHEN 4 THEN 'Fernando'
            WHEN 5 THEN 'Sof�a' WHEN 6 THEN 'Alejandro' WHEN 7 THEN 'Valeria' WHEN 8 THEN 'Ricardo' WHEN 9 THEN 'Luc�a'
        END;

    SET @apellido_p = 
        CASE (@contador % 10) 
            WHEN 0 THEN 'Garc�a' WHEN 1 THEN 'L�pez' WHEN 2 THEN 'Mart�nez' WHEN 3 THEN 'P�rez' WHEN 4 THEN 'S�nchez'
            WHEN 5 THEN 'Ram�rez' WHEN 6 THEN 'Torres' WHEN 7 THEN 'Flores' WHEN 8 THEN 'G�mez' WHEN 9 THEN 'D�az'
        END;

    SET @apellido_m = 
        CASE (@contador % 10) 
            WHEN 0 THEN 'Rojas' WHEN 1 THEN 'Vargas' WHEN 2 THEN 'Hern�ndez' WHEN 3 THEN 'Morales' WHEN 4 THEN 'Castillo'
            WHEN 5 THEN 'Mendoza' WHEN 6 THEN 'Ortega' WHEN 7 THEN 'Cruz' WHEN 8 THEN 'Jim�nez' WHEN 9 THEN 'Reyes'
        END;

    -- Generar email basado en el nombre y apellido
    SET @email = LOWER(@nombre) + '.' + LOWER(@apellido_p) + '@correo.com';

    -- Generar n�mero de documento aleatorio
    SET @numero_doc = CAST(10000000 + FLOOR(RAND() * 89999999) AS VARCHAR(20));

    -- Generar fecha de ingreso aleatoria dentro de los �ltimos 5 a�os
    SET @fecha_ingreso = DATEADD(DAY, -FLOOR(RAND() * 1825), GETDATE());

    -- Generar tiempo de contrato entre 6 y 36 meses
    SET @tiempo_contrato = DATEADD(DAY, -FLOOR(RAND() * 1095), GETDATE());

    -- Insertar en la tabla empleados
    INSERT INTO empleados (profesion_id, nombres, apellido_paterno, apellido_materno, numero_documento, 
                           email_personal, email_institucional, celular, fecha_ingreso, fecha_fin_contrato)
    VALUES (@profesion_id, @nombre, @apellido_p, @apellido_m, @numero_doc, 
            @email, NULL, NULL, @fecha_ingreso, @tiempo_contrato);

    -- Incrementar contador y asignar profesi�n de forma rotativa
    SET @contador = @contador + 1;
    SET @profesion_id = CASE WHEN @profesion_id < 22 THEN @profesion_id + 1 ELSE 3 END;
END;
