-----------------------------------------------------------------------------------------------------------------------------
------------------------------------------------- CONSULTAS PRÁCTICA 9 -----------------------------------------------------
--------------------------------------------- CROSSTAB Y FUNCIONES DE VENTANA -----------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------

CREATE EXTENSION tablefunc;

----------------------------------------------------- Consulta tipo #1 ------------------------------------------------------
-- Carlos ###
--Total de citas con asistencia en 2022 ordenadas por mes
SELECT *
FROM CROSSTAB(
    'SELECT ''asistencia'', extract(MONTH from fecha) MES,COUNT(cita.id_casis) TOTAL
FROM cita JOIN casistencia ON cita.id_casis = casistencia.id_casis
WHERE DATE_PART(''YEAR'',fecha) = 2022 and cita.id_casis=2
GROUP BY extract(MONTH from fecha)') resultado(oasistencia TEXT, oMarzo BIGINT, oMayo BIGINT, oJunio BIGINT);

-- Ariana ###
-- Total de vehiculos por año de compra y color del vehiculo
SELECT *
FROM CROSSTAB(
'SELECT ''AZUL FUERTE'' color ,EXTRACT(YEAR FROM fe_compra_vehi) anio, COUNT(no_serie)
FROM vehiculo  where (color=''8'')
GROUP BY EXTRACT(YEAR FROM fe_compra_vehi)
UNION ALL
SELECT ''ROSA'',EXTRACT(YEAR FROM fe_compra_vehi), COUNT(no_serie)
FROM vehiculo  where (color=''2'')
GROUP BY EXTRACT(YEAR FROM fe_compra_vehi)
UNION ALL
SELECT ''PLATEADO'',EXTRACT(YEAR FROM fe_compra_vehi), COUNT(no_serie)
FROM vehiculo  where (color=''11'')
GROUP BY EXTRACT(YEAR FROM fe_compra_vehi)
UNION ALL
SELECT ''ROJO'',EXTRACT(YEAR FROM fe_compra_vehi), COUNT(no_serie)
FROM vehiculo  where (color=''1'')
GROUP BY EXTRACT(YEAR FROM fe_compra_vehi)
UNION ALL
SELECT ''DORAADO'',EXTRACT(YEAR FROM fe_compra_vehi), COUNT(no_serie)
FROM vehiculo  where (color=''13'')
GROUP BY EXTRACT(YEAR FROM fe_compra_vehi)
UNION ALL
SELECT ''MORADO'',EXTRACT(YEAR FROM fe_compra_vehi), COUNT(no_serie)
FROM vehiculo  where (color=''6'')
GROUP BY EXTRACT(YEAR FROM fe_compra_vehi)
ORDER BY anio,color') resultado(ocolor text,o2021 BIGINT,o2022 BIGINT);

----------------------------------------------------- Consulta tipo #2 ------------------------------------------------------
-- Alexa ###
-- Regresar la tabla que muestre el área de trabajo del empleado donde las filas sean el id del empleado
-- y las columnas esten dadas por el nombre del area de trabajo y el rol
SELECT *
FROM CROSSTAB(
    'SELECT id_empleado, area, rol
    FROM empleados JOIN persona ON empleados.id_persona = persona.id_persona
       LEFT JOIN carea ON empleados.id_carea = carea.id_carea
        LEFT JOIN crol ON empleados.id_crol = crol.id_crol
        ORDER BY 2, 3',
    'SELECT DISTINCT area FROM carea ORDER BY 1')
    AS resultado(id TEXT, "compras" VARCHAR(30), "finanzas y contabilidad" VARCHAR(30), "marketing" VARCHAR(30),
        "mecanica" VARCHAR(30), "recursos humanos" VARCHAR(30), "ventas" VARCHAR(30));
		
-- Arturo ###
--Regresar tabla que indique los costos de ajustes menores a 7500 de los vehiculos comprados cuyas filas sean
--el tipo de reparación y las columnas sean los distintos números de serie de los autos que se reparan.
SELECT *
FROM CROSSTAB(
    'SELECT ajustes.ajuste, no_serie, costo
    FROM vehiculo_ajustes JOIN ajustes ON vehiculo_ajustes.id_ajuste=ajustes.id_ajuste
    WHERE vehiculo_ajustes.costo < 7500
    ORDER BY 1,2',
    'SELECT DISTINCT no_serie FROM vehiculo_ajustes ORDER BY 1'
    )AS Tabla_resultado(id TEXT, "1DWOC10FUQU752855" NUMERIC(6,2), "1quhb63rpbf841293" NUMERIC(6,2), 
						"2ldja54kiju106918" NUMERIC(6,2), "3krdt28vgft163635" NUMERIC(6,2), "7luot78urhj636781" NUMERIC(6,2));

----------------------------------------------------- Consulta tipo #3 ------------------------------------------------------
-- Alexa ###
--total de montos que iniciaron mes de marzo de las deudas que esten en curso con su respectivo id de cliente
SELECT id_cliente,f_ini_pago, valor_deuda, sum(valor_deuda) OVER() Total_valor_deuda_mes
FROM deuda join contrato_venta on deuda.id_deuda = contrato_venta.id_deuda
WHERE deuda.id_cst_deuda=2 and DATE_PART('MONTH', f_ini_pago) = 03;

-- Diego ###
-- Número de serie,placas,modelo, marca, total de vehiculos comprados por marca y total global de vehiculos comprados
SELECT vehiculo.no_serie, vehiculo.placas, cmodelo.modelo, cmarca.marca, COUNT(vehiculo.no_serie) 
       OVER( PARTITION BY cmarca.id_cmarca) total_por_marca, COUNT(vehiculo.no_serie) OVER() total_comprados
FROM ( vehiculo LEFT JOIN cmodelo ON vehiculo.modelo = cmodelo.id_cmodelo
	                JOIN cmarca ON cmodelo.id_cmarca = cmarca.id_cmarca );
 ------Consulta para verificar total vehiculos comprados por marca 
       SELECT cmarca.marca, total
	   FROM  (SELECT T1.id_cmarca, COUNT(T1.no_serie) total
              FROM (SELECT vehiculo.no_serie, cmodelo.modelo, cmodelo.id_cmarca 
                    FROM vehiculo LEFT JOIN cmodelo ON vehiculo.modelo = cmodelo.id_cmodelo) AS T1 
              GROUP BY T1.id_cmarca) as t2 JOIN cmarca ON t2.id_cmarca = cmarca.id_cmarca
	   ORDER BY total;
	 
----------------------------------------------------- Consulta tipo #4 ------------------------------------------------------
-- Carlos ###
--Deudas SALDADAS ordenadas por mes con su respectivo valor con la suma total de las deudas pagadas en el mes
SELECT extract(MONTH from f_fin_pago) MES, valor_deuda, sum(valor_deuda) over(partition by extract(MONTH from f_fin_pago)) SUMA_DEL_MES
FROM deuda join cstatus_deuda on deuda.id_cst_deuda = cstatus_deuda.id_cst_deuda
where DATE_PART('YEAR', f_fin_pago) = 2022 and cstatus_deuda.id_cst_deuda = 1
group by extract(MONTH from f_fin_pago), valor_deuda,id_deuda;

-- Arturo ###
--Mostrar en una tabla, el precio total y el promedio de lo que se ha gastado para reparar cada vehículo individualmente
--que se ha comprado (identificándolo por su número de serie), así como los ajustes que se les han hecho
--y el costo de estos.
SELECT ajustes.ajuste, no_serie, costo,
       SUM(costo)OVER (PARTITION BY no_serie),
       AVG(costo)OVER (PARTITION BY no_serie)
FROM vehiculo_ajustes JOIN ajustes ON vehiculo_ajustes.id_ajuste=ajustes.id_ajuste
ORDER BY no_serie;

----------------------------------------------------- Consulta tipo #5 ------------------------------------------------------
-- Ariana ### 
-- id_vehiculo_ajustes, no_serie, costo del ajuste, total pagado por ajuste de cada vehiculo, y total pagado por todos los ajustes
SELECT id_vehiculo_ajustes,no_serie,costo, SUM(costo) OVER(PARTITION BY id_vehiculo_ajustes) totalajuste, SUM(costo) OVER() totalglobal
FROM vehiculo_ajustes JOIN ajustes a on vehiculo_ajustes.id_ajuste = a.id_ajuste
ORDER BY id_vehiculo_ajustes, costo ASC ;

-- Diego ###
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





