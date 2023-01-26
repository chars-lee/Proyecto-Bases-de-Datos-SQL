------------------------------------------------------ Práctica #9 --------------------------------------------------------
------------------------------------------------------- Equipo 10 ---------------------------------------------------------
------------------------------------------------- Vistas, índices y CTE's -------------------------------------------------
 
 -- ##CORRER, YA QUE ES NECESARIO PARA UNA DE NUESTRAS CONSULTAS ##
UPDATE cmunicipio set id_cestado = 1 WHERE id_cmunicipio = 1;
UPDATE cmunicipio set id_cestado = 1 WHERE id_cmunicipio = 2;
UPDATE cmunicipio set id_cestado = 1 WHERE id_cmunicipio = 3;
UPDATE cmunicipio set id_cestado = 1 WHERE id_cmunicipio = 4;
UPDATE cmunicipio set id_cestado = 1 WHERE id_cmunicipio = 5;
UPDATE cmunicipio set id_cestado = 1 WHERE id_cmunicipio = 6;
UPDATE cmunicipio set id_cestado = 1 WHERE id_cmunicipio = 7;
UPDATE cmunicipio set id_cestado = 1 WHERE id_cmunicipio = 8;
UPDATE cmunicipio set id_cestado = 1 WHERE id_cmunicipio = 9;
UPDATE cmunicipio set id_cestado = 1 WHERE id_cmunicipio = 10;
UPDATE cmunicipio set id_cestado = 1 WHERE id_cmunicipio = 11;
UPDATE cmunicipio set id_cestado = 1 WHERE id_cmunicipio = 12;
UPDATE cmunicipio set id_cestado = 1 WHERE id_cmunicipio = 13;
UPDATE cmunicipio set id_cestado = 1 WHERE id_cmunicipio = 14;
UPDATE cmunicipio set id_cestado = 1 WHERE id_cmunicipio = 15;
UPDATE cmunicipio set id_cestado = 1 WHERE id_cmunicipio = 16;
-- ###############################################################


---------------------------------------------------------- VISTAS -----------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
-- Carlos
-- Datos de los clientes que tengan un contrato de compra en la CDMX menor a 1000000.
CREATE VIEW vw_clientesCDMX_venta AS (
    SELECT nombres, a_paterno, a_materno, telefono, precio_com, fe_compra_vehi, vehiculo.no_serie, estado_ve
    FROM persona JOIN cliente ON persona.id_persona = cliente.id_persona
    JOIN contrato_compra ON cliente.id_cliente = contrato_compra.id_cliente
    JOIN vehiculo ON contrato_compra.no_serie = vehiculo.no_serie
    WHERE precio_com < 1000000 AND estado_ve = 1
    GROUP BY persona.id_persona, cliente.id_cliente, vehiculo.no_serie,contrato_compra.id_cont_com
    ORDER BY precio_com ); 

SELECT * FROM vw_clientesCDMX_venta;

--Alexa
-- Número de telefono y apellido paterno de las peronas que revasen el promedio de edad de todos los clientes 
-- y que a su vez, su contato de compra se encuentre en mora, con el proposito de una reestructuración
CREATE VIEW vw_contratos_mora AS (
select telefono, nombres, a_paterno, DATE_PART('year',CAST(f_nacimiento AS DATE )) as anio_nacimiento, persona.id_persona
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
                                                            FROM persona LEFT JOIN cliente ON persona.id_persona = cliente.id_persona)) )  );	


SELECT * FROM vw_contratos_mora;

-- Diego
-- Identificar los 2 tipos de vehiculos comprados por la empresa MÁS COMUNES en el primer CUATRIMESTRE del 2022, para despues 
-- mostrarme todos los vehiculos COMPRADOS de estos dos tipos de vehiculo en ese mismo cuatrimestre(no_serie,placas,precio de 
-- compra, fecha de compra, marca, modelo, tipo y estado del vehiculo) donde a su vez el estado al que pertenecen los 
-- vehiculos debe ser igual al estado MÁS COMÚN en el que viven las personas que nos han vendido vehiculos.
CREATE VIEW vw_ve_comprados_erCuatri AS (
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
	 AND DATE_PART('YEAR', CAST(vehiculo.fe_compra_vehi AS DATE)) = 2022 ) );
	 
SELECT * FROM vw_ve_comprados_erCuatri;
--------------------------------------------------------- ÍNDICES ----------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------

-- ######### Catálogos #########
-- ROJO
-- Catálogo cestado_ve
CREATE INDEX indx_cestado_ve_id_cestado_ve_estado_ve ON cestado_ve(id_cestado_ve,estado_ve);
-- Catálogo cpuertas
CREATE INDEX indx_cpuertas_id_cpuertas_puertas ON cpuertas(id_cpuertas,cant_puertas);
-- Catálogo ctransmision
CREATE INDEX indx_ctransmision_id_ctransmision_transmision ON ctransmision(id_ctransmision,transmision);
-- Catálogo canio
CREATE INDEX indx_canio_id_canio_anio ON canio(id_canio,anio);
-- Catálogo ccolor
CREATE INDEX indx_ccolor_id_color_color ON ccolor(id_color,color);
-- Catálogo cstatus
CREATE INDEX indx_cstatus_id_cstatus_status ON cstatus(id_cstatus,status);
-- Catálogo cmotor
CREATE INDEX indx_cmotor_id_cmotor_motor ON cmotor(id_cmotor,motor);
-- Catálogo cmodelo
CREATE INDEX indx_cmodelo_id_cmodelo_modelo ON cmodelo(id_cmodelo,modelo);
-- Catálogo cmarca
CREATE INDEX indx_cmarca_id_cmarca_marca ON cmarca(id_cmarca,marca);
-- Catálogo ctipo
CREATE INDEX indx_ctipo_id_ctipo_tipo ON ctipo(id_ctipo,tipo);
-- Catálogo ajustes
CREATE INDEX indx_ajustes_id_ajuste_ajuste ON ajustes(id_ajuste,ajuste);

-- VERDE
-- Cátalogo cmunicipio
CREATE INDEX indx_cmunicipio ON cmunicipio(id_cmunicipio,municipio);
-- Cátalogo cno_exten
CREATE INDEX indx_cno_exten ON cno_exten(id_cno_ex,no_ext);
-- Cátalogo cestado
CREATE INDEX indx_cestado ON cestado(id_cestado,estado);
-- Cátalogo ccliente
CREATE INDEX indx_cgenero ON cgenero(id_cgenero, genero);
-- Cátalogo ccliente
CREATE INDEX indx_ccliente ON ccliente(id_ccliente, tipo_cliente);

-- AZUL
--Catálogo cforma_pago
CREATE INDEX idx_forma_pago ON cforma_pago(id_cf_pago,forma_pago);
--Catálogo cforma_compra
CREATE INDEX idx_forma_compra ON cforma_compra(id_cforma_compra,forma_compra);
--Catálogo cstatus_pago
CREATE INDEX idx_status_pago ON cstatus_pago(id_cst_pago,status_pago);
--Catálogo cstatus_deuda
CREATE INDEX idx_st_deuda ON cstatus_deuda(id_cst_deuda,st_deuda);
--Catálogo ctemporalidad
CREATE INDEX idx_temporalidad ON ctemporalidad(id_temporalidad,tiempo);
--Catálogo chorario
CREATE INDEX idx_horario ON chorario(id_chorario,horario);
--Catálogo crol
CREATE INDEX idx_rol ON crol(id_crol,rol, sueldo);
--Catálogo carea
CREATE INDEX idx_area ON carea(id_carea,area);

-- ######### Atributos recurrentes #########
-- ROJO
-- Tabla vehiculo_ajustes 
CREATE INDEX indx_vehiculo_ajustes_id_vehiculo_ajustes_no_serie ON vehiculo_ajustes(id_vehiculo_ajustes,no_serie);
-- Tabla vehiculo
CREATE INDEX indx_vehiculo_no_serie_placas ON vehiculo(no_serie,placas);

-- VERDE
-- Cátalogo domicilio
CREATE INDEX indx_domicilio_calle_colonia_cp ON domicilio(calle,colonia,cp);
-- Cátalogo persona
CREATE INDEX indx_persona_nombres_apaterno_amaterno ON persona(nombres,a_materno,a_materno);


---------------------------------------------------- CTE's tipo SELECT -----------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
--Ariana
--CTE de tipo select
-- Precio de venta, año y modelo, del vehiculo vendido cuyo monto de deuda es mayor
WITH cte_DEUDAMAYOR AS (SELECT MAX(valor_deuda) MAYOR_DEUDA FROM contrato_venta
    JOIN deuda d on contrato_venta.id_deuda = d.id_deuda
    ORDER BY MAYOR_DEUDA)

SELECT precio_ven, DATE_PART('year',CAST(fe_venta_vehi AS DATE )) Año,
       c.modelo FROM vehiculo join cmodelo c on vehiculo.modelo = c.id_cmodelo
WHERE placas IN(
SELECT placas FROM vehiculo join contrato_venta cv on vehiculo.no_serie = cv.no_serie
WHERE id_cont_venta IN( SELECT MAYOR_DEUDA FROM cte_DEUDAMAYOR));

-- Carlos
-- Nombre, apellidos y numero telefonico del empleado que cuenta con mas contratos de compra
WITH cte_contratosVentaEmpleados AS (select contrato_compra.id_empleado, count(contrato_compra.id_cont_com) total
                                     FROM empleados
                                              JOIN contrato_compra ON empleados.id_empleado = contrato_compra.id_empleado
                                              JOIN vehiculo ON contrato_compra.no_serie = vehiculo.no_serie
                                     group by contrato_compra.id_empleado
)
SELECT id_empleado, nombres,a_paterno,a_materno,telefono
FROM cte_contratosVentaEmpleados JOIN persona ON cte_contratosVentaEmpleados.id_empleado = persona.id_persona
WHERE total = (SELECT MAX(total) FROM cte_contratosVentaEmpleados);

---------------------------------------------------- CTE's tipo DELETE -----------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
-- Arturo
--Almacenar en una tabla nueva, todos aquellos municipios registrados en los que no vive ninguna de las personas
--cuyos datos se encuentran en nuestra base de datos.
CREATE TABLE nuevos_municipios(
id_cmunicipio SERIAL,
municipio VARCHAR(40),
id_cestado INTEGER
);

WITH eliminaciones AS(
    DELETE FROM cmunicipio
    WHERE cmunicipio.id_cmunicipio NOT IN (
                  SELECT domicilio.id_cmunicipio
                  FROM domicilio
              )
    RETURNING *
)
INSERT INTO nuevos_municipios
SELECT * FROM eliminaciones;

-- Alexa
CREATE TABLE ve_ajustes_nuevo (
id_vehiculo_ajustes SERIAL,
no_serie VARCHAR(17),
id_ajuste INTEGER,
costo NUMERIC(6,2)
);

WITH preciosaltos AS (
    DELETE FROM vehiculo_ajustes
           WHERE vehiculo_ajustes.costo > 7000
RETURNING *)
INSERT INTO ve_ajustes_nuevo
SELECT * FROM preciosaltos;
