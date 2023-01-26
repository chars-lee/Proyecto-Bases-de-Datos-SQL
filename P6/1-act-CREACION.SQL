-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--------------------------------------------------CREACION-------------------------------------------------------
--------------------------------------------------CREACION-------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

------------------------------Catálogos (ROJO)
--diego
--Tabla cestado_ve
CREATE TABLE cestado_ve (
id_cestado_ve SERIAL,
estado_ve VARCHAR(30)
);
-- Tabla cpuertas
CREATE TABLE cpuertas (
id_cpuertas SERIAL,
cant_puertas INTEGER
);
-- Tabla ctransmision
CREATE TABLE ctransmision (
id_ctransmision SERIAL,
transmision VARCHAR(20)
);
-- Tabla ctipo
CREATE TABLE ctipo (
id_ctipo SERIAL,
tipo VARCHAR(20)
);
-- Tabla canio
CREATE TABLE canio (
id_canio SERIAL,
anio INTEGER
);
-- Tabla ccolor
CREATE TABLE ccolor (
id_color SERIAL,
color VARCHAR(20)
);
-- Tabla cstatus
CREATE TABLE cstatus (
id_cstatus SERIAL,
status VARCHAR(11)
);
-- Tabla cmotor
CREATE TABLE cmotor (
id_cmotor SERIAL,
motor VARCHAR(20)
);

-- Tabla cmarca
CREATE TABLE cmarca (
id_cmarca SERIAL,
marca VARCHAR(20)
);
---
-- Tabla ctemporalidad
CREATE TABLE ctemporalidad(
id_temporalidad SERIAL,
tiempo VARCHAR(20)
);
-- Tabla cstatus_deuda
CREATE TABLE cstatus_deuda(
id_cst_deuda SERIAL,
st_deuda VARCHAR(15)
);
-- Tabla cforma_compra
CREATE TABLE cforma_compra(
id_cforma_compra SERIAL,
forma_compra VARCHAR(20)
);
-- Tabla factura
CREATE TABLE factura(
id_factura SERIAL,
id_cont_venta INTEGER
);
-- Tabla casistencia
CREATE TABLE casistencia(
id_casis SERIAL,
asistencia VARCHAR(15)
);
-- Tabla cestado
CREATE TABLE cestado(
id_cestado SERIAL,
estado VARCHAR(24)
);
--Tabla cgenero
CREATE TABLE cgenero(
    id_cgenero SERIAL,
    genero VARCHAR(1)
);
--Tabla ccliente
CREATE TABLE ccliente(
    id_ccliente SERIAL,
    tipo_cliente VARCHAR(10)
    );
--TABLA cstatus_pago
CREATE TABLE cstatus_pago(
    id_cst_pago SERIAL,
    status_pago VARCHAR(10)
);
--TABLA cforma_pago
CREATE TABLE cforma_pago(
    id_cf_pago SERIAL,
    forma_pago VARCHAR(15)
);
--TABLA cno_exten
CREATE TABLE cno_exten(
id_cno_ex SERIAL,
no_ext NUMERIC(5)
);
--TABLA crol
CREATE TABLE crol(
id_crol SERIAL,
rol VARCHAR(30),
sueldo NUMERIC(5)
);
--TABLA chorario
CREATE TABLE chorario(
id_chorario SERIAL,
horario VARCHAR(12)
);

-------------------------------------Cátalogos (AZUL)
-- Tabla cmodelo
CREATE TABLE cmodelo (
id_cmodelo SERIAL,
modelo VARCHAR(20),
id_cmarca INTEGER,
id_ctipo INTEGER
);
--TABLA cmunicipio
CREATE TABLE cmunicipio(
id_cmunicipio SERIAL,
municipio VARCHAR(40),
id_cestado INTEGER
);
--TABLA carea
CREATE TABLE carea(
id_carea SERIAL,
area VARCHAR(30),
id_cno_ex INTEGER
);
--TABLA ajustes
CREATE TABLE ajustes (
id_ajuste SERIAL,
ajuste VARCHAR(60)
);

------------------------------------Tablas Primarias (ROSA)
--TABLA persona
CREATE TABLE persona(
    id_persona SERIAL,
    nombres VARCHAR(16),
    a_paterno VARCHAR(30),
    a_materno VARCHAR(30),
    telefono NUMERIC(10,0),
    correo VARCHAR(50),
    rfc VARCHAR(13),
    f_nacimiento DATE,
    id_cgenero INTEGER,
    id_domicilio INTEGER
);
--TABLA cliente
CREATE TABLE cliente(
    id_cliente SERIAL,
    id_persona INTEGER
);
--TABLA vehiculo
CREATE TABLE vehiculo (
no_serie VARCHAR(17),
placas VARCHAR(15) ,
precio_com INTEGER,
precio_ven INTEGER,
km INTEGER,
fe_compra_vehi DATE,
fe_venta_vehi DATE,
estado_ve INTEGER,
puertas INTEGER,
transmision INTEGER,
anio INTEGER,
color INTEGER,
status INTEGER,
motor INTEGER,
modelo INTEGER
);

----------------------------Casos Especiales (VERDE)
--TABLA tipo_cliente
CREATE TABLE tipo_cliente(
id_tp_cliente SERIAL,
id_ccliente INTEGER,
id_cliente INTEGER
);
--TABLA vehiculo_ajustes
CREATE TABLE vehiculo_ajustes (
id_vehiculo_ajustes SERIAL,
no_serie VARCHAR(17),
id_ajuste INTEGER,
costo NUMERIC(6,2)
);

-------------------------------------------Tablas (NEGRO)
--TABLA domicilio
CREATE TABLE domicilio(
id_domicilio SERIAL,
calle VARCHAR(50),
colonia VARCHAR(50),
num_int VARCHAR(20),
num_ext VARCHAR(20),
cp VARCHAR(5),
id_cmunicipio INTEGER
);

--TABLA cita
CREATE TABLE cita(
id_cita SERIAL,
fecha DATE,
hora TIME,
id_casis INTEGER,
id_tp_cliente INTEGER
);

--TABLA empleados
CREATE TABLE empleados(
id_empleado SERIAL,
fecha_i DATE,
fecha_f DATE,
nss NUMERIC(13,0),
id_crol INTEGER,
id_carea INTEGER,
id_chorario INTEGER,
id_persona INTEGER
);

---------------------------------Tablas (MORADO)
--TABLA contrato_venta
CREATE TABLE contrato_venta(
id_cont_venta SERIAL,
fecha_emi_com DATE,
id_deuda INTEGER,
no_serie VARCHAR(17),
id_empleado INTEGER,
id_cliente INTEGER
);
--TABLA contrato_compra
CREATE TABLE contrato_compra(
    id_cont_com SERIAL,
    fecha_pago DATE,
    fecha_emi_com DATE,
    id_cf_pago INTEGER,
    id_cst_pago INTEGER,
    id_cliente INTEGER,
    no_serie VARCHAR(17),
    id_empleado INTEGER
);

-----------------------------------Tabla (AMARILLO)
--TABLA deuda
CREATE TABLE deuda(
id_deuda SERIAL,
f_ini_pago DATE,
f_fin_pago DATE,
valor_deuda NUMERIC(10,4),
tasa_interes NUMERIC(2,1),
id_temporalidad INTEGER,
id_cst_deuda INTEGER,
id_cforma_compra INTEGER
);

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------