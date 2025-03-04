## Modelo de Gestión Financiera de Proyectos (Base de Datos Transaccional)
Una empresa consultora desea gestionar sus proyectos y realizar un seguimiento financiero. Para ello, se requiere un modelo de datos que registre:


Proyectos: Código, nombre, descripción, fecha de inicio, fecha de fin, estado y presupuesto asignado.

Clientes: Código, nombre, sector y país.

Equipos de trabajo: Empleados asignados a cada proyecto, con su rol y horas trabajadas.

Costos: Desglose de costos asociados (personal, materiales, tecnología, etc.)

Pagos: Registro de facturas emitidas y cobranzas recibidas.

Indicadores financieros: Rentabilidad, costo total y margen de ganancia.


## Requerimiento:

Diseña el modelo entidad-relación (ER).
![Diagrama E-R drawio](https://github.com/user-attachments/assets/c00aad4b-793c-4d7c-a947-1486a23b4310)


Indica las claves primarias y foráneas.

Normaliza hasta la 3NF.

![gestión-de-proyectos_1](https://github.com/user-attachments/assets/b65546d1-7507-4d58-aa1b-2637892ef0fd)

Modelo Físico:
![image](https://github.com/user-attachments/assets/721ffce4-2cd6-4ec5-91ca-c619ff0e5a03)



Proporciona al menos dos métricas financieras que puedan calcularse.


## Caso Propuesto: Inteligencia de Negocios para la Gestión Financiera de Proyectos (Base de datos Multidimencional)

Una empresa de consultoría multinacional ha desarrollado múltiples proyectos para clientes de diferentes sectores. La alta dirección busca implementar un sistema de Inteligencia de Negocios (BI) que permita analizar el desempeño financiero de los proyectos, optimizar la asignación de recursos y mejorar la rentabilidad.

## Requerimientos de BI
Fuentes de Datos

Información de proyectos (presupuesto, costos reales, margen de ganancia).
Datos de clientes (sector, país, historial de pagos).
Información de empleados asignados a proyectos.
Registros de pagos y facturación.
KPIs e Indicadores Clave

Rentabilidad por proyecto y por cliente.
Tasa de ejecución presupuestaria (% de presupuesto utilizado).
Desviación de costos (diferencia entre presupuesto y costos reales).
Tiempo promedio de cobranza de facturas.
Productividad del equipo (horas facturables vs. horas trabajadas).
Requerimientos de Reportería y Dashboards

Comparativo de rentabilidad por sector y país.
Análisis de flujo de caja proyectado vs. real.
Tendencias de ingresos y costos en el tiempo.
Identificación de proyectos con sobrecostos y riesgo financiero.
Ejercicio Propuesto
### Diseña un modelo de datos multidimensional adecuado para este sistema de BI (esquema estrella o copo de nieve).
### Define los hechos y dimensiones necesarias.
### Propuesta de visualizaciones clave para los dashboards.
### (Opcional) Generar un conjunto de consultas SQL para extraer insights clave.
