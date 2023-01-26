--###############################################################################################################################
---------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------- CONSULTAS ----------------------------------------------------------- 
---------------------------------------------------------------------------------------------------------------------------------
--###############################################################################################################################






------- #####  CONSULTA BAISCA ###########################################################################################################################
-- todos los datos de las personas con genero masculino y que posean un correo con dominio @hotmail 
-- y que hayan nacido despues del año 1995, ordenados de manera ascedente por el nombre, apellido 
-- materno y paterno
SELECT * 
FROM persona
WHERE (id_cgenero = 1) AND (correo LIKE '%@hotmail.%') AND (DATE_PART('YEAR', CAST(f_nacimiento AS DATE)) >1995)
ORDER BY nombres, a_paterno, a_materno ASC;


------- #####  CONSULTA CON SUBCONSULTAS##################################################################################################################

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


------- #####  CONSULTA COMPUESTA ##### ##################################################################################################################
-- Identificar los 2 tipos de vehiculos comprados por la empresa MÁS COMUNES en el primer CUATRIMESTRE del 2022, para despues 
-- mostrarme todos los vehiculos COMPRADOS de estos dos tipos de vehiculo en ese mismo cuatrimestre(no_serie,placas,precio de 
-- compra, fecha de compra, marca, modelo, tipo y estado del vehiculo) donde a su vez el estado al que pertenecen los 
-- vehiculos debe ser igual al estado MÁS COMÚN en el que viven las personas que nos han vendido vehiculos.
SELECT vehiculo.no_serie,vehiculo.placas,vehiculo.precio_com,vehiculo.fe_compra_vehi,
       cmarca.marca,cmodelo.modelo,ctipo.tipo,cestado_ve.estado_ve
FROM (vehiculo LEFT JOIN cmodelo ON vehiculo.modelo = cmodelo.id_cmodelo
		 	             JOIN ctipo ON cmodelo.id_ctipo = ctipo.id_ctipo
						 JOIN cmarca ON cmarca.id_cmarca = cmodelo.id_cmarca
						 JOIN cestado_ve ON cestado_ve.id_cestado_ve = vehiculo.estado_ve)
WHERE ctipo.tipo IN ( -- Tipos de vehiculos comprados por la empresa más comúnes en el primer cuatrimestre del 2022
                         SELECT tipo 
                         FROM ( SELECT T1.tipo, COUNT(T1.no_serie) total
                                FROM ( SELECT *
	                                   FROM (vehiculo LEFT JOIN cmodelo ON vehiculo.modelo = cmodelo.id_cmodelo)
		 	                                               JOIN ctipo ON cmodelo.id_ctipo = ctipo.id_ctipo
	                                   WHERE (DATE_PART('MONTH', CAST(vehiculo.fe_compra_vehi AS DATE)) BETWEEN 1 AND 4)
	                                          AND DATE_PART('YEAR', CAST(vehiculo.fe_compra_vehi AS DATE)) = 2022 ) AS T1
                                       GROUP BY T1.tipo
                                       ORDER BY total DESC
                                       LIMIT 2 ) AS T2 )     AND
	vehiculo.estado_ve = ( -- Estado en cual viven los clientes que nos han vendido más 
                              SELECT id_cestado 
                              FROM ( SELECT T3.id_cestado, COUNT(T3.id_cont_com) total_
                                     FROM ( SELECT *
                                            FROM (persona LEFT JOIN cliente ON persona.id_persona = cliente.id_persona)
		 	                                                   JOIN contrato_compra ON cliente.id_cliente = contrato_compra.id_cliente 
						                                       JOIN domicilio ON domicilio.id_domicilio = persona.id_domicilio
	                                                           JOIN cmunicipio ON cmunicipio.id_cmunicipio = domicilio.id_cmunicipio ) AS T3
                                     GROUP BY T3.id_cestado 
	                                 ORDER BY total_ DESC
                                     LIMIT 1 ) T4 )          AND
	-- Delimitamos las compras a el primer cuatrimestre del 2022								 
	( (DATE_PART('MONTH', CAST(vehiculo.fe_compra_vehi AS DATE)) BETWEEN 1 AND 4 )
	 AND DATE_PART('YEAR', CAST(vehiculo.fe_compra_vehi AS DATE)) = 2022 );
	 


------- #####  CONSULTA PAGINACION #####
-- Nombre,apellido paterno y telefono de los clientes, los cuales compraron algún vehiculo en en el
-- mes de enero del 2022, añadiendo la suma total de todas las deudas totales  y cantidad de veces
-- se le a asigando una misma tasa de interes a los cliente en el mes indicado
--Tras ordenar de menor a mayor la por el monto de la deuda, se descartan las primeras 3 filas con menor deuda
-- y nos devuelve de las 6 siguientes, el valor de la deuda, así como su fecha de inicio y de fin
SELECT contrato_venta.fecha_emi_com,persona.nombres, persona.a_paterno,persona.telefono, deuda.tasa_interes,
       COUNT(deuda.id_deuda) OVER( PARTITION BY deuda.tasa_interes) total_tasas_in, deuda.valor_deuda,
       SUM(deuda.valor_deuda) OVER() suma_total_deudas
FROM ( ( (cliente LEFT JOIN persona ON persona.id_persona = cliente.id_persona)
                      JOIN contrato_venta ON cliente.id_cliente = contrato_venta.id_cliente )
					  JOIN deuda ON contrato_venta.id_deuda = deuda.id_deuda )
WHERE (DATE_PART('month',CAST (fecha_emi_com AS DATE)) = '01' AND
      DATE_PART('year',CAST (fecha_emi_com AS DATE)) = '2022' )
ORDER BY valor_deuda
OFFSET 3 FETCH NEXT 6 ROWS ONLY;


------- #####  CONSULTA CROSSTAB ###########################################################################################################################

---- Regresar la tabla que muestre el área de trabajo del empleado donde las filas sean el id del empleado
-- y las columnas esten dadas por el nombre del area de trabajo y el rol. De los empleados que tengan horario matutino, con un sueldo mayor a 8000
CREATE EXTENSION tablefunc;
SELECT *
FROM CROSSTAB(
'SELECT id_empleado, area, rol
    FROM empleados JOIN persona ON empleados.id_persona = persona.id_persona
       LEFT JOIN carea ON empleados.id_carea = carea.id_carea
        LEFT JOIN crol ON empleados.id_crol = crol.id_crol
        LEFT JOIN chorario c on empleados.id_chorario = c.id_chorario where c.id_chorario = 1 and sueldo>8000
 ORDER BY 2, 3',
    'SELECT DISTINCT area FROM carea ORDER BY 1')
    AS resultado(id TEXT, "compras" VARCHAR(30), "finanzas y contabilidad" VARCHAR(30), "marketing" VARCHAR(30),
        "mecanica" VARCHAR(30), "recursos humanos" VARCHAR(30), "ventas" VARCHAR(30));


------- #####  CONSULTA FUNCIÓN DE VENTANA #################################################################################################################

-- Nombre,apellido paterno y telefono de los clientes, los cuales compraron algún vehiculo en en el 
-- mes de enero del 2022, añadiendo la suma total de todas las deudas totales  y cantidad de veces 
-- se le a asigando una misma tasa de interes a los cliente en el mes indicado

SELECT contrato_venta.fecha_emi_com,persona.nombres, persona.a_paterno,persona.telefono, deuda.tasa_interes,
       COUNT(deuda.id_deuda) OVER( PARTITION BY deuda.tasa_interes) total_tasas_in, deuda.valor_deuda,
       SUM(deuda.valor_deuda) OVER() suma_total_deudas
FROM ( ( (cliente LEFT JOIN persona ON persona.id_persona = cliente.id_persona) 
                      JOIN contrato_venta ON cliente.id_cliente = contrato_venta.id_cliente )
					  JOIN deuda ON contrato_venta.id_deuda = deuda.id_deuda )
WHERE (DATE_PART('month',CAST (fecha_emi_com AS DATE)) = '01' AND
      DATE_PART('year',CAST (fecha_emi_com AS DATE)) = '2022' );


------- #####  CONSULTA AGRUPACION #####
-- Nombre,apellido paterno y telefono de los clientes, los cuales compraron algún vehiculo en en el 
-- mes de enero del 2022, añadiendo la suma total de todas las deudas totales  y cantidad de veces 
-- se le a asigando una misma tasa de interes a los cliente en el mes indicado
SELECT contrato_venta.fecha_emi_com, nombres, a_paterno, a_materno, telefono,deuda.tasa_interes,total_tasas_in,
       (SELECT SUM(valor_deuda)
        FROM deuda JOIN contrato_venta cv on deuda.id_deuda = cv.id_deuda
        WHERE DATE_PART('month',CAST (fecha_emi_com AS DATE)) = '01' AND
               DATE_PART('year',CAST (fecha_emi_com AS DATE)) = '2022')
FROM cliente LEFT JOIN persona ON persona.id_persona = cliente.id_persona
                  JOIN contrato_venta ON cliente.id_cliente = contrato_venta.id_cliente
                  JOIN deuda ON contrato_venta.id_deuda = deuda.id_deuda
                  JOIN (SELECT tasa_interes, COUNT(id_cont_venta) total_tasas_in
                        FROM (SELECT *
                              FROM deuda JOIN contrato_venta ON deuda.id_deuda = contrato_venta.id_deuda
                              WHERE (DATE_PART('month',CAST (fecha_emi_com AS DATE)) = '01' AND
                                     DATE_PART('year',CAST (fecha_emi_com AS DATE)) = '2022' ) ) AS T6
                               GROUP BY tasa_interes ) T1 ON  deuda.tasa_interes = T1.tasa_interes
WHERE (DATE_PART('month',CAST (fecha_emi_com AS DATE)) = '01' AND
      DATE_PART('year',CAST (fecha_emi_com AS DATE)) = '2022' )
ORDER BY deuda.tasa_interes;

