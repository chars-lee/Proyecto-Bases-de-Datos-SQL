-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------CONSULTAS---------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

--diego
--Tabla vehiculo
--Vehiculos vendidos hasta el 21 de abril del 2022
SELECT no_serie,placas,precio_com,precio_ven,fe_compra_vehi,fe_venta_vehi,status
FROM vehiculo
WHERE status = 2;

-- vehiculos que hemos comprado de color rojo,morado,cafe y azul
SELECT No_serie,placas,precio_com,color
FROM vehiculo
WHERE color = 1 OR color = 6 OR color = 7 OR color = 14;

--Tabla vehiculo_ajustes
SELECT *
FROM vehiculo_ajustes;
-- ajustes que se le han realizado a vehiculos con precio mayor a 500 pesos
SELECT no_serie,id_ajuste,costo
FROM vehiculo_ajustes
WHERE costo > 500;

-- ajustes que se le han realizado a vehiculos con precio menos a 200 pesos
SELECT no_serie,id_ajuste,costo
FROM vehiculo_ajustes
WHERE costo < 500;

--Arturo
--Tabla deuda
SELECT id_deuda,f_ini_pago,f_fin_pago,valor_deuda,tasa_interes,id_temporalidad,id_cst_deuda,id_cforma_compra
FROM deuda
WHERE f_ini_pago = '2022-03-10';

SELECT id_deuda,f_ini_pago,f_fin_pago,valor_deuda,tasa_interes,id_temporalidad,id_cst_deuda,id_cforma_compra
FROM deuda
WHERE id_temporalidad < 5;

--Tabla contrato_venta
SELECT id_cont_venta,fecha_emi_com,id_deuda,no_serie,id_empleado,id_cliente
FROM contrato_venta
WHERE id_cont_venta = 5;

SELECT id_cont_venta,fecha_emi_com,id_deuda,no_serie,id_empleado,id_cliente
FROM contrato_venta
WHERE no_serie = '1quhb63rpbf841293';

--Tabla factura
SELECT id_factura,id_cont_venta
FROM factura
WHERE id_cont_venta = 12;

SELECT id_factura,id_cont_venta
FROM factura
WHERE id_factura = 3;

--Allan
--Tabla persona
SELECT nombres, a_materno FROM persona WHERE id_persona = '16';

SELECT nombres, a_materno FROM persona WHERE id_persona = '17';

--Tabla tipo_cliente
SELECT id_cliente FROM tipo_cliente WHERE id_ccliente = '1';

SELECT id_cliente FROM tipo_cliente WHERE id_ccliente = '2';

--CONSULTAS Tabla cliente
SELECT * FROM cliente WHERE id_persona = '16';

SELECT id_cliente FROM cliente WHERE id_persona = '30';

--carlos
--Tabla contrato_compra
SELECT id_cont_com,fecha_pago,fecha_emi_com,id_cf_pago,id_cst_pago,id_cliente,no_serie,id_empleado
FROM contrato_compra
WHERE id_cont_com = 10;

SELECT id_cont_com,fecha_pago,fecha_emi_com,id_cf_pago,id_cst_pago,id_cliente,no_serie,id_empleado
FROM contrato_compra
WHERE id_cont_com = 8;

--alexa
--Tabla cita
SELECT *
FROM cita
WHERE id_casis = 2;

SELECT hora
FROM cita
WHERE fecha = '2022/02/02';

--Tabla domicilio
SELECT calle
FROM domicilio
WHERE colonia = 'olivar de los padres';

SELECT colonia
FROM domicilio
WHERE cp = '09860';

--Ari
--Tabla empleados
SELECT fecha_i, id_persona FROM empleados WHERE id_carea = '1';

SELECT fecha_f, id_persona FROM empleados WHERE id_crol = '3';


-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------