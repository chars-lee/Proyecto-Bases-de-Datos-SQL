---------------------------------------------------------------------------------------------------------------------------
------------------------------------------------- CONSULTAS PRACTICA 08 ---------------------------------------------------
----------------------------------------------------- DML AVANZADO ------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------

-- ENTREGABLES

-- 4 consultas con JOIN y operadores de comparación.
-- 4 consultas con JOIN, funciones de agregación y agrupación.
-- 2 consultas con JOIN, funciones de comparación, agregación y agrupación

--------------- INCISO 1)

---- Diego

-- Compras que hemos realizado en los en los ultimos 7 meses de las marcas que manejan veiculos con 2 puertas
-- de tipo hatchback o sedan y transmisión estandar

SELECT cmodelo.modelo, vehiculo.fe_compra_vehi, vehiculo.no_serie
FROM cmodelo LEFT JOIN vehiculo ON cmodelo.id_cmodelo = vehiculo.modelo
WHERE (fe_compra_vehi > '2021/09/1'  AND
	   vehiculo.no_serie IN (SELECT vehiculo.no_serie
				             FROM cmodelo RIGHT JOIN vehiculo ON vehiculo.modelo = cmodelo.id_cmodelo
					         WHERE cmodelo.id_ctipo   BETWEEN   (SELECT id_ctipo
															     FROM ctipo
															     WHERE tipo LIKE 'hatchback' ) AND (SELECT id_ctipo
																							        FROM ctipo
																							        WHERE tipo LIKE 'sedan' ))
				                     AND vehiculo.puertas = 1 )
ORDER BY fe_compra_vehi, cmodelo.modelo;

-- Alexa

-- Mostrar las placas de los vehiculos modelo Q5, Groove, Sienna y Accent cuyo
-- precio de compra ronde entre los 500,000 y 1,150,000 pesos y cuente con motor hibrido

SELECT cmodelo.modelo, cestado.estado, vehiculo.placas, vehiculo.precio_com, vehiculo.motor
FROM vehiculo INNER JOIN cmodelo ON vehiculo.modelo = cmodelo.id_cmodelo
RIGHT JOIN cestado ON vehiculo.estado_ve = cestado.id_cestado
WHERE (
        vehiculo.motor = 2 AND
        cmodelo.modelo IN (SELECT modelo FROM cmodelo
                            WHERE cmodelo.modelo IN (SELECT modelo FROM cmodelo
                                                    WHERE cmodelo.modelo IN ('q5', 'groove', 'sienna', 'accent')))
    AND vehiculo.precio_com BETWEEN 500000 AND 1150000)
ORDER BY vehiculo.placas;

---- Arturo

--Dar número de serie y placas de todos los autos modelo captur vendidos después de enero del 2022 
--cuyo kilometraje se encuentre entre 100000 y 300000

SELECT contrato_venta.no_serie, vehiculo.placas
FROM contrato_venta JOIN vehiculo ON contrato_venta.no_serie = vehiculo.no_serie
WHERE (vehiculo.fe_venta_vehi IN (
	SELECT vehiculo.fe_venta_vehi
	FROM vehiculo
	WHERE fe_venta_vehi >= '2022-02-01'
	)
	   AND vehiculo.km BETWEEN 100000 and 300000
	   AND vehiculo.modelo IN(
		   SELECT id_cmodelo
		   FROM cmodelo NATURAL JOIN cmarca
		   WHERE cmodelo.modelo='captur'))
ORDER BY contrato_venta.no_serie;

--Ari
--Deuda mayor a 10000 cuya tasa de interes este entre 1.00 y 2.00 después del 31/01/22
SELECT deuda.id_deuda, deuda.f_fin_pago, deuda.valor_deuda, deuda.tasa_interes
FROM deuda JOIN cstatus_deuda cd on cd.id_cst_deuda = deuda.id_cst_deuda
WHERE ( valor_deuda >= '1.0000' AND f_fin_pago > '2022-01-31'
	)
AND tasa_interes BETWEEN 1.00 and 2.00
ORDER BY tasa_interes;

--------------- INCISO 2)

--- Diego

-- Número de telefono y nombre completo de las peronas que revasen el promedio de edad de todos los clientes
-- y que a su vez, su contato de compra se encuentre en mora

SELECT telefono, nombres, a_paterno, a_materno, DATE_PART('year',CAST(f_nacimiento AS DATE )) as anio_nacimiento, persona.id_persona
FROM persona INNER JOIN cliente ON persona.id_persona = cliente.id_persona
WHERE( id_cliente IN ( SELECT id_cont_venta
					   FROM contrato_venta
					   WHERE contrato_venta.id_deuda IN (SELECT id_deuda
				                                         FROM deuda
                                                         WHERE deuda.id_cst_deuda = (SELECT T1.id_cst_deuda
                                                                                     FROM (SELECT id_cst_deuda
                                                                                           FROM cstatus_deuda
                                                                                           GROUP BY id_cst_deuda) AS T1 NATURAL JOIN cstatus_deuda
                                                                                           WHERE st_deuda LIKE 'mo%' ))
	   AND DATE_PART('year',CAST(f_nacimiento AS DATE )) > (SELECT AVG( DATE_PART('year',CAST(f_nacimiento AS DATE )) )
                                                            FROM persona LEFT JOIN cliente ON persona.id_persona = cliente.id_persona)) );

--- Alexa

-- Mostrar el nombre y domicilio completo del empleado de mayor edad de la empresa, que trabaje en el area de marketing


SELECT persona.f_nacimiento, empleados.id_empleado, empleados.fecha_i, empleados.id_carea, persona.nombres, persona.a_paterno, persona.a_materno,
       domicilio.calle, domicilio.colonia, domicilio.num_int, domicilio.num_ext, domicilio.cp, cmunicipio.municipio
FROM persona JOIN domicilio ON persona.id_domicilio = domicilio.id_domicilio
JOIN cmunicipio ON domicilio.id_cmunicipio = cmunicipio.id_cmunicipio
LEFT JOIN empleados ON persona.id_persona = empleados.id_persona
WHERE (empleados.id_carea IN (SELECT id_carea FROM empleados
                                WHERE empleados.id_carea = 1) AND
                f_nacimiento IN (SELECT min(f_nacimiento) FROM persona
                                                        JOIN empleados ON persona.id_persona = empleados.id_persona
                                    WHERE persona.id_persona = empleados.id_persona));

---- Arturo

--Dar promedio de valor de deuda que tienen aquellas personas que fueron atendidas por los
--empleados que aún conservan su trabajo

SELECT AVG(valor_deuda)
FROM deuda LEFT JOIN contrato_venta ON deuda.id_deuda=contrato_venta.id_deuda
WHERE (contrato_venta.id_empleado IN (
	SELECT id_empleado
	from empleados
	WHERE(id_empleado IN(
		SELECT id_empleado
		FROM empleados JOIN persona ON empleados.id_persona=persona.id_persona
		WHERE fecha_i IS NOT NULL
))GROUP BY id_empleado)
);

--Ari
-- Sumar el total de ventas de vehiculos despues del 03/01/22
-- La suma es correspondiente al estado, modelo y marca del vehiculo
SELECT fe_venta_vehi, SUM(precio_ven),no_serie
FROM vehiculo INNER JOIN cestado_ve cv on vehiculo.estado_ve = cv.id_cestado_ve left join
    cmodelo c on vehiculo.modelo = c.id_cmodelo right join cmarca c2 on c.id_cmarca = c2.id_cmarca
WHERE fe_venta_vehi IS NOT NULL AND fe_venta_vehi > '2022-01-03'
GROUP BY fe_venta_vehi, no_serie;

------------ INCISO 3

---- Diego

-- Identificar el tipo de vehiculo mas común en nuestro catalogo cmodelo, para despues determinar la marca o marcas con
-- mayor predominio en ese tipo de vehiculo, y obtener el modelo, tipo y marca que poseen

SELECT cmodelo.modelo,ctipo.tipo,cmarca.marca
FROM ((cmodelo JOIN ctipo ON cmodelo.id_ctipo = ctipo.id_ctipo) JOIN cmarca ON cmarca.id_cmarca = cmodelo.id_cmarca )
WHERE cmodelo.id_cmarca IN (SELECT id_cmarca
                            FROM (SELECT id_cmarca, COUNT(id_cmodelo) total
                                  FROM cmodelo
                                  WHERE id_ctipo = ((SELECT id_ctipo
                                                     FROM (SELECT cmodelo.id_ctipo, COUNT(cmodelo.id_cmodelo) AS total_BD
                                                     FROM ctipo RIGHT JOIN cmodelo ON ctipo.id_ctipo = cmodelo.id_ctipo
                                                     GROUP BY cmodelo.id_ctipo
	                                                 ORDER BY total_BD DESC
	                                                 LIMIT 1) AS T1 ))
                                  GROUP BY id_cmarca
                                  ORDER BY total DESC
                                  LIMIT 2) as T2)  AND  cmodelo.id_ctipo =(SELECT id_ctipo
                                                                           FROM (SELECT cmodelo.id_ctipo, COUNT(cmodelo.id_cmodelo) AS total_BD
                                                                                 FROM ctipo RIGHT JOIN cmodelo ON ctipo.id_ctipo = cmodelo.id_ctipo
                                                                                 GROUP BY cmodelo.id_ctipo
	                                                                             ORDER BY total_BD DESC
	                                                                             LIMIT 1) AS T1 );


---- Arturo

--Dar la cuenta de todos los contratos emitidos para autos modelo yaris vendidos 
--a princios de marzo de 2021 cuyas placas comiencen con la letra Y

SELECT COUNT(contrato_venta.id_cont_venta)
FROM contrato_venta RIGHT JOIN vehiculo ON contrato_venta.no_serie = vehiculo.no_serie
WHERE (vehiculo.fe_venta_vehi IN (
	SELECT vehiculo.fe_venta_vehi
	FROM vehiculo
	WHERE fe_venta_vehi > '2021-03-01'
	)
	   AND vehiculo.placas LIKE 'Y%'
	   AND vehiculo.modelo IN(
		   SELECT id_cmodelo
		   FROM cmodelo NATURAL JOIN cmarca
		   WHERE cmodelo.modelo='yaris'
	   GROUP BY cmodelo.id_cmodelo));