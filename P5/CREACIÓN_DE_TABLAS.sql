CREATE DATABASE AGENCIA

----------------------------------------------- CREACIÓN DE TABLAS -------------------------------------------------

CREATE TABLE cgenero(
    id_cgenero SERIAL,
    genero VARCHAR(1)
);

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

CREATE TABLE ccliente(
    id_ccliente SERIAL,
    tipo_cliente VARCHAR(10)
    );

CREATE TABLE cliente(
    id_cliente SERIAL,
    id_persona INTEGER
);

CREATE TABLE tipo_cliente(
    cclienteid_ccliente2 SERIAL,
    id_ccliente INTEGER,
    id_cliente INTEGER
);
---------------------------------------------------------------------------------------------------------------------------
-- Tabla vehiculo 
CREATE TABLE vehiculo (
no_serie SERIAL,
placas VARCHAR(15) ,
precio_com INTEGER,
precio_ven INTEGER,
km INTEGER,
fe_compra_vehi DATE, 
fe_venta_vehi DATE,
estado_ve INTEGER,
puertas INTEGER,
transmision INTEGER,
tipo INTEGER,
anio INTEGER,
color INTEGER,
status INTEGER,
motor INTEGER,
modelo INTEGER,
marca INTEGER
);

-- Tabla cestado_ve 
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
id_ccolor SERIAL,
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

-- Tabla cmodelo
CREATE TABLE cmodelo (
id_cmodelo SERIAL,
modelo VARCHAR(20) 
);

-- Tabla cmarca 
CREATE TABLE cmarca (
id_cmarca SERIAL,
marca VARCHAR(20) );

---------------------
-- TABLA vehiculo_ajustes
CREATE TABLE vehiculo_ajustes (
no_serie INTEGER,
id_ajuste INTEGER,
costo INTEGER 
);

-- Tabla ajustes
CREATE TABLE ajustes (
id_ajuste SERIAL,
ajuste VARCHAR(60) 
);
----------------------
---------------------------------------------------------------------------------------------------------------------------

CREATE TABLE empleados(
id_empleado SERIAL,
id_persona INTEGER,
fecha_i DATE,
fecha_f DATE,
nss NUMERIC(13,0),
horario NUMERIC(2,1),
id_crol INTEGER,
id_carea INTEGER,
id_chorario INTEGER,
sueldo NUMERIC(6,2),
n_extension NUMERIC(2,1)
);

CREATE TABLE carea(
id_carea SERIAL,
area VARCHAR(30)
);

CREATE TABLE chorario(
id_chorario SERIAL,
horario TIME(12)
);

CREATE TABLE crol(
id_crol SERIAL,
rol VARCHAR(30)
);
---------------------------------------------------------------------------------------------------------------------------
--Creacion tabla contrato_compra
CREATE TABLE contrato_compra (
    id_cont_com INTEGER,
    fecha_pago DATE NOT NULL,
    fecha_emi_com DATE NOT NULL,
    id_cf_pago INTEGER NOT NULL,
    id_cst_pago INTEGER NOT NULL,
    id_csituacion INTEGER NOT NULL,
    id_cliente INTEGER NOT NULL,
    no_serie NUMERIC(17,0) NOT NULL,
    id_empleado INTEGER NOT NULL
);

--Creacion tabla csituacion
CREATE TABLE csituacion(
    id_csituacion INTEGER,
    situacion VARCHAR(30)
);


--Creacion tabla cstatus_pago
CREATE TABLE cstatus_pago(
    id_cst_pago INTEGER,
    status_pago VARCHAR(10)
);

--Creacion tabla cforma_pago
CREATE TABLE cforma_pago(
    id_cf_pago INTEGER,
    forma_pago VARCHAR(15)
);

---------------------------------------------------------------------------------------------------------------------------

CREATE TABLE deuda(
id_deuda_per_tem SERIAL,
f_ini_pago DATE,
f_fin_pago DATE,
tasa_interes NUMERIC(2,1),
monto NUMERIC(10,4)
);	
 
CREATE TABLE cperiodicidad(
id_cperiodicidad SERIAL,
periodos VARCHAR(20)
);

CREATE TABLE ctemporalidad(
id_temporalidad SERIAL,
tiempo VARCHAR(20)
);



CREATE TABLE contrato_venta(
id_cont_único SERIAL,
tiempo VARCHAR(20),
fecha_emi_con DATE,
id_deuda INTEGER,
id_cliente INTEGER,
id_empleado INTEGER
);

CREATE TABLE factura(
id_fac_venta SERIAL,
id_cliente INTEGER
);

CREATE TABLE cforma_compra(
id_cf_compra SERIAL,
forma_compra VARCHAR(20)
);

CREATE TABLE cstatus_deuda(
id_cf_pago SERIAL,
st_deuda VARCHAR(15)
);


---------------------------------------------------------------------------------------------------------------------------

CREATE TABLE cita(
id_cita SERIAL, 
id_cliente INTEGER, 
casistenciaid_casis INTEGER
);


CREATE TABLE fecha_hora_cita(
fecha_hora_cita SERIAL, 
id_cliente TIMESTAMP
);


CREATE TABLE casistencia(
id_casis SERIAL, 
asistencia VARCHAR(15),
clienteid_cliente INTEGER
);

CREATE TABLE domicilio(
id_domicilio SERIAL,
calle VARCHAR(50),
colonia VARCHAR(50),
num_int INTEGER,
num_ext INTEGER,
cp NUMERIC(5,0),
id_cmunicipio INTEGER
);

CREATE TABLE cmunicipio(
id_cmunicipio SERIAL,
municipio VARCHAR(40),
id_cestado INTEGER
);

CREATE TABLE cestado(
id_cestado SERIAL,
estado VARCHAR(24)
);

---------------------------------------------------------------------------------------------------------------------------
