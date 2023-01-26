---------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------ELIMINACIONES---------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

-- Arturo
--Tabla factura
DELETE FROM factura
WHERE id_factura=3;

DELETE FROM factura
WHERE id_cont_venta=4;

--Tabla contrato_venta
DELETE FROM contrato_venta
WHERE no_serie ='4eglx51tidx410873';

DELETE FROM contrato_venta
WHERE no_serie = '8bpzx29mmhg472488';

--Tabla deuda
DELETE FROM deuda
WHERE id_deuda=3;
DELETE FROM deuda
WHERE id_deuda=4;

--Diego
--Tabla vehiculo_ajustes
DELETE FROM vehiculo_ajustes WHERE no_serie = '8bpzx29mmhg472488';

DELETE FROM vehiculo_ajustes WHERE no_serie = '4eglx51tidx410873';

--carlos
--Tablacontrato_compra
DELETE FROM contrato_compra WHERE no_serie ='4eglx51tidx410873'; --Si corrio

DELETE FROM contrato_compra WHERE no_serie ='8bpzx29mmhg472488'; -- Si corrio

--diego
--Tabla vehiculo
DELETE FROM vehiculo
WHERE no_serie = '4eglx51tidx410873';

DELETE FROM vehiculo
WHERE no_serie = '8bpzx29mmhg472488';

--alexa
--tabla cita
DELETE FROM cita
WHERE id_cita=4;

DELETE FROM cita
WHERE id_cita=1;

-- Allan
--Tabla tipo_cliente
DElETE FROM tipo_cliente WHERE id_tp_cliente =3;

DElETE FROM tipo_cliente WHERE id_tp_cliente =4;

--Tabla cliente
DELETE FROM cliente WHERE id_cliente = 4;

DELETE FROM cliente WHERE id_cliente = 3;

--Ari
--Tabla empleados
DELETE FROM empleados WHERE id_empleado = 4;

DELETE FROM empleados WHERE id_persona = 3;

-- Allan
-- Tabla persona
-- De las cuales eliminaremos a los 2 clientes y 2 empleados eliminados anteriormente
DELETE FROM persona WHERE  id_persona= 3;

DELETE FROM persona WHERE  id_persona= 4;

DELETE FROM persona WHERE  id_persona= 18;

DELETE FROM persona WHERE  id_persona= 19;

--Tabla domicilio
--De las cuales eliminaremoslas 4 derecciones de las personas eliminadas anteriormente
DELETE FROM domicilio
WHERE id_domicilio = 3;

DELETE FROM domicilio
WHERE id_domicilio = 4;

DELETE FROM domicilio
WHERE id_domicilio = 18;

DELETE FROM domicilio
WHERE id_domicilio = 19;

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------