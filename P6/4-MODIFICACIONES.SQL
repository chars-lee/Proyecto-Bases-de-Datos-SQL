-------------------------------------------------------------------------------------------------------------------
---------------------------------------------------MODIFICACIONES--------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

--diego
-- Tabla vehiculo
-- Gracias a que hemos determinado el precio al que saldra a la venta cierto vehiculo, lo actualizaremos
UPDATE vehiculo
SET precio_ven = 500000
WHERE no_serie = '1quhb63rpbf841293';

--Hemos vendido el coche anterior asique le cambiamos el status
UPDATE vehiculo
SET status = 2
WHERE no_serie = '1quhb63rpbf841293';

--carlos
-- Tabla contrato_compra
UPDATE contrato_compra set fecha_pago = '2022-04-18' WHERE id_cont_com = 1;

UPDATE contrato_compra set id_empleado = 2 where id_cont_com = 8;

--diego
--Tabla vehiculo_ajustes
-- Se le cambia el precio de costo de ajuste
UPDATE vehiculo_ajustes
SET costo = 100
WHERE id_vehiculo_ajustes = 2;

-- Se le cambia el precio de costo de ajuste
UPDATE vehiculo_ajustes
SET costo = 2000
WHERE id_vehiculo_ajustes = 9;

-- Arturo
-- Tabla deuda
UPDATE deuda
SET tasa_interes=1
WHERE id_cst_deuda=3;

UPDATE deuda
SET f_ini_pago='2022-01-23'
WHERE id_deuda=12;

-- Tabla contrato_venta
UPDATE contrato_venta
SET id_cliente=1
WHERE id_empleado=3;

UPDATE contrato_venta
SET fecha_emi_com='2022-01-23'
WHERE id_cliente=12;

-- Tabla factura
UPDATE factura
SET id_factura= 30
WHERE id_cont_venta=9;

UPDATE factura
SET id_cont_venta=7
WHERE id_factura=6;

--allan
--Tabla persona
UPDATE persona set nombres = 'leslie' WHERE nombres = 'karil';

UPDATE persona set nombres = 'allan' WHERE nombres = 'esdras';

--Tabla tipo_cliente
UPDATE tipo_cliente set id_ccliente = '1' WHERE id_cliente = '8';

UPDATE tipo_cliente set id_ccliente = '2' WHERE id_cliente = '11';

--Tabla cliente
UPDATE cliente set id_persona = '2' WHERE id_persona = '16';

UPDATE cliente set id_persona = '16' WHERE id_cliente = '2';

--Alexa
--cita
UPDATE cita
SET fecha = '2022/02/01'
WHERE fecha = '2022/02/02';

UPDATE cita
SET hora = '10:25:00'
WHERE hora = '10:30:00';

-- Tabla domicilio
UPDATE domicilio
SET num_int = '30'
WHERE num_int = '36';

UPDATE domicilio
SET calle = 'avenida toluca'
WHERE calle = 'av. toluca';

--Ari
--Tabla empleados
UPDATE empleados set id_crol = '155' WHERE id_crol = '111';

UPDATE empleados set id_crol = '177' WHERE id_crol = '144';

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------