---------------------------------------------------------------------------------------------------------------------------
------------------------------------------------- CONSULTAS PRACTICA 07 ---------------------------------------------------
--------------------------------------------- DML PAGINACION Y COMPOSICION ------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------


--------------------------------------------- CONSULTAS TIPO 1 ---------------------------------------------


--- 1) 5 consultas con JOIN y funciones de paginación.
-- Diego
-- Compras que hemos relaizado en los en los ultimos 6 meses de las marcas TOYOTA, SEAT, VW Y RENAULT
SELECT cmodelo.modelo, vehiculo.fe_compra_vehi
FROM cmodelo LEFT JOIN vehiculo ON cmodelo.id_cmodelo = vehiculo.modelo
WHERE fe_compra_vehi > '2021/10/1'  AND cmodelo.id_cmarca IN (19,18,22,23)
ORDER BY fe_compra_vehi;

-- Alexa
-- consultar el nombre completo, calle, colonia y el ID de municipio de los clientes que residen en el municipio cuyo ID es el “1”
SELECT fecha, hora, id_tp_cliente FROM cita
NATURAL JOIN tipo_cliente
ORDER BY id_tp_cliente
OFFSET 5 LIMIT 10;

-- Ari
-- tabla con los registros id_empleado, fecha_i, id_chorario, id_carea, de la tabla empleados
-- ordenadas a partir de id_empleado con una cantidad de 10 registros, descartando las primeras 3 filas
SELECT id_empleado, fecha_i, id_chorario, id_carea
FROM empleados
ORDER BY id_empleado
OFFSET 3 LIMIT 6;

--Allan
--Saber los datos básicos de la persona (nombre, a_paterno, teléfono, correo
SELECT nombres,a_paterno,telefono,correo
FROM persona
NATURAL JOIN cgenero
ORDER BY nombres
OFFSET 2 LIMIT 4;

--Arturo
--Tras ordenar de menor a mayor la por el monto de la deuda, se descartan las primeras 3 filas con menor deuda, y nos devuelve de las 6 siguientes, el valor de la deuda, así como su fecha de inicio y de fin
SELECT valor_deuda,f_ini_pago,f_fin_pago
FROM deuda
ORDER BY valor_deuda
OFFSET 3 FETCH NEXT 6 ROWS ONLY;

--------------------------------------------- CONSULTAS TIPO 2 ---------------------------------------------
--- 2) 5 consultas con JOIN y funciones de composición.

--Diego
-- Número de telefono y nombre de las peronas que tengan en su contrato una tasa mayor a 1% con
-- status "en curso" , con el proposito de hacer una reformulación de tasa
select telefono, nombres, a_paterno, a_materno
FROM persona INNER JOIN cliente ON persona.id_persona = cliente.id_persona
WHERE id_cliente IN ( SELECT id_cont_venta
					  FROM contrato_venta
					  WHERE contrato_venta.id_deuda IN (SELECT id_deuda
				                                        FROM deuda
                                                        WHERE tasa_interes > 1 AND id_cst_deuda = 2 ));


-- Alexa
-- consultar toda la información de la tabla1 cuando el ID de municipio del cliente es menor o igual a “7”
SELECT nombres, a_paterno, a_materno, calle, colonia, id_cmunicipio FROM persona
INNER JOIN domicilio
ON id_cmunicipio = 1;

--Ari
--Datos del id_empleado y id_rol, donde el id_chorario de la tabla empleados y chorario coincidan
SELECT id_empleado, id_crol
FROM empleados
LEFT JOIN chorario c on empleados.id_chorario = c.id_chorario;

--Allan
--Saber el nombre de las personas así como su género para poder checar la cantidad de hombres y de mujeres involucrad@s
SELECT nombres, genero
FROM persona
NATURAL JOIN cgenero;

--Arturo
--Nos devuelve el valor de la deuda, y sus fechas de inicio y de fin, de las tuplas en deuda donde el id de temporalidad se encuentre también registrado en el catálogo de temporalidades

SELECT valor_deuda,f_ini_pago,f_fin_pago
FROM deuda
RIGHT JOIN ctemporalidad ON deuda.id_temporalidad=ctemporalidad.id_temporalidad;

--------------------------------------------- CONSULTAS TIPO 3 ---------------------------------------------

--Vehiculos más comprados en toda nuestra historia como empresa
SELECT cmodelo.modelo, M_VEN1.total
FROM
   (SELECT modelo, COUNT(no_serie) AS total
    FROM vehiculo
    GROUP BY modelo) AS M_VEN1 LEFT JOIN cmodelo ON M_VEN1.modelo = cmodelo.id_cmodelo
WHERE M_VEN1.total = (SELECT MAX(total)
                      FROM (
                            SELECT modelo, COUNT(no_serie) AS total
                            FROM vehiculo
                            GROUP BY modelo) AS M_VEN2);
-- Alexa

SELECT * FROM
(
    -- Nombre completo, id del municipio, fecha y hora de cita y id de asistencia del cliente
    -- separado por atributos
    SELECT nombres, a_paterno, a_materno, id_cmunicipio, fecha, hora, id_casis FROM persona
    NATURAL JOIN domicilio, cita) AS tabla1
WHERE tabla1.id_cmunicipio <= 7;

--Ari
SELECT * FROM
(
    -- id_empleado, fecha_i, nss, id_rol
    -- separado por atributos
    SELECT id_empleado, fecha_i, nss, id_carea  FROM empleados
    NATURAL JOIN carea ) AS tabla_E;

--Allan
--Tener los datos básicos así como el género en una nueva tabla para una rápida identificación
SELECT * FROM(
SELECT nombres,a_paterno,a_materno,genero FROM persona
NATURAL JOIN cgenero) AS nombregenero;

--Arturo
----Nos devuelve el número de serie y la fecha en que se emitió de la compra del vehículo de una tabla que le llamamos fecha_serie, la cual contiene el id del contrato de venta, el número de serie y la fecha de compra de aquellas tuplas cuyo id de deuda se encontrara también en la tabla de deuda
SELECT no_serie,fecha_emi_com FROM(
	SELECT id_cont_venta,no_serie,fecha_emi_com
	FROM contrato_venta
	LEFT JOIN deuda ON contrato_venta.id_deuda=deuda.id_deuda) AS fecha_serie;




