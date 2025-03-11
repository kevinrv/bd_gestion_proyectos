/*
 Consulta Básica: Listado de Proyectos
Obtén un listado con el ID, nombre y fecha de inicio de todos los proyectos registrados en la base de datos.
*/
SELECT id,nombre, fecha_inicio
FROM proyectos;
/*
2️⃣ Filtro de Datos: Proyectos Activos
Muestra los proyectos en estado "En Progreso", ordenados por fecha de inicio de forma descendente.

3️⃣ Uso de JOIN: Clientes y sus Proyectos
Lista el nombre del cliente y el nombre del proyecto asociado.

4️⃣ Cálculo de Pagos: Total Pagado por Proyecto
Obtén el total de pagos realizados para cada proyecto, mostrando el ID del proyecto, nombre y monto total pagado.

5️⃣ Inserción de Datos: Nuevo Cliente
Inserta un nuevo cliente en la tabla clientes, con los siguientes datos:

Nombre: "InnovaTech S.A."
Dirección: "Av. Principal 123, Lima"
Teléfono: "+51 987654321"
6️⃣ Actualización de Datos: Cambio de Estado del Proyecto
Cambia el estado de un proyecto con ID 5 a "Finalizado".

7️⃣ Eliminación de Datos: Borrar un Pago
Elimina un pago de la tabla pagos con ID 10.

8️⃣ Uso de Funciones Agregadas: Cantidad de Proyectos por Cliente
Muestra el nombre del cliente y la cantidad de proyectos que tiene.
*/



 /*Consulta Avanzada: Clientes con Más Proyectos
Obtén una lista de los 5 clientes con más proyectos en la base de datos. La consulta debe incluir el nombre del cliente, la cantidad de proyectos y el presupuesto total asignado.

2️⃣ Procedimiento Almacenado: Registro de Pago
Crea un procedimiento almacenado que registre un nuevo pago en la tabla pagos. El procedimiento debe:

Validar que la cuota exista y no esté pagada completamente.
Insertar el pago y actualizar el monto pendiente en la tabla cuotas.
3️⃣ Función Escalar: Cálculo de Mora
Crea una función escalar que, dado el ID de una cuota, devuelva el monto total de penalidad en caso de retraso. Se debe calcular la mora como el 5% del monto de la cuota por cada mes de retraso.

4️⃣ Trigger: Cambio de Estado de Proyecto
Implementa un trigger que cambie automáticamente el estado del proyecto en la tabla proyectos a "Finalizado" cuando todas sus cuotas hayan sido pagadas.

5️⃣ Vista: Resumen de Pagos por Proyecto
Crea una vista que muestre un resumen de los pagos realizados por proyecto. Debe incluir:

ID y nombre del proyecto
Cliente asociado
Monto total pagado
Saldo pendiente
6️⃣ Optimización de Consulta
Tienes la siguiente consulta que obtiene la lista de pagos junto con la información del cliente y proyecto:

sql
Copy
Edit
SELECT p.id, p.numero_operacion, p.fecha_pago, p.monto_pagado, 
       c.nombre AS Cliente, pr.nombre AS Proyecto
FROM pagos p
JOIN cuotas cu ON p.cuota_id = cu.id
JOIN proyectos pr ON cu.proyecto_id = pr.id
JOIN clientes c ON pr.cliente_id = c.id
WHERE p.fecha_pago BETWEEN '2024-01-01' AND '2024-12-31'
Optimiza la consulta asegurando un buen uso de índices y verificando posibles mejoras en la estructura de las tablas.*/