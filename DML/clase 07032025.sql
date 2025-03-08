USE dsrp_prestamos_financieros_6;


SELECT*FROM empleados;
SELECT*FROM personas_naturales;

--Empleados
SELECT 
	nt.nombres, 
	nt.apellido_paterno, 
	nt.apellido_materno,
	nt.numero_documento,
	nt.email AS 'email_personal',
	CONCAT(SUBSTRING(nt.nombres,1,1),nt.apellido_paterno, SUBSTRING(nt.apellido_materno,1,1), '@dsrp.com') AS 'email_institucional',
	celular, 
	CAST(GETDATE() AS DATE) AS 'fecha_ingreso',
	CAST(DATEADD(YEAR, CAST(ROUND(RAND()*10,0) AS INT),GETDATE()) AS DATE) AS 'fecha_fin_contrato'
FROM empleados e
INNER JOIN personas_naturales nt ON nt.id=e.persona_id

SELECT*FROM personas_juridicas;
SELECT
UPPER(CONCAT('000',id, SUBSTRING(razon_social, 1,2))) AS 'codigo',
razon_social AS 'nombre',
'TECH' AS 'sector',
'PERÚ' AS 'pais',
email,
telefono,
numero_documento AS 'identificador_cliente',
direccion,
CONCAT('www.',LOWER(
	TRIM(
	REPLACE(
		REPLACE(
		REPLACE(
			REPLACE(razon_social,'.',''),' ',''),'ó','o'),'í','i'))),'.com') AS 'web_url'
FROM personas_juridicas;