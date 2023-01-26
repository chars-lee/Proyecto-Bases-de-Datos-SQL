----------------------------------------------------- INTEGRIDADES -----------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- TABLA vehiculo

--PK
ALTER TABLE vehiculo ADD CONSTRAINT pk_vehiculo_no_serie PRIMARY KEY(no_serie); 

--FK
ALTER TABLE vehiculo ADD CONSTRAINT fk_vehiculo_estado_ve_cestado_ve_id_cestado_ve FOREIGN KEY (estado_ve) REFERENCES cestado_ve(id_cestado_ve);ALTER TABLE vehiculo ADD CONSTRAINT fk_vehiculo_puertas_cpuertas_id_cestado FOREIGN KEY (puertas) REFERENCES cpuertas(id_cpuertas);
ALTER TABLE vehiculo ADD CONSTRAINT fk_vehiculo_transmision_ctransmision_id_ctransmision FOREIGN KEY (transmision) REFERENCES ctransmision(id_ctransmision);
ALTER TABLE vehiculo ADD CONSTRAINT fk_vehiculo_tipo_ctipo_id_ctipo FOREIGN KEY (tipo) REFERENCES ctipo(id_ctipo);
ALTER TABLE vehiculo ADD CONSTRAINT fk_vehiculo_anio_canio_id_canio FOREIGN KEY (anio) REFERENCES canio(id_canio);
ALTER TABLE vehiculo ADD CONSTRAINT fk_vehiculo_color_ccolor_id_ccolor FOREIGN KEY (color) REFERENCES ccolor(id_ccolor);
ALTER TABLE vehiculo ADD CONSTRAINT fk_vehiculo_status_cstatus_id_cstatus FOREIGN KEY (status) REFERENCES cstatus(id_cstatus);
ALTER TABLE vehiculo ADD CONSTRAINT fk_vehiculo_motor_cmotor_id_cmotor FOREIGN KEY (motor) REFERENCES cmotor(id_cmotor);
ALTER TABLE vehiculo ADD CONSTRAINT fk_vehiculo_modelo_cmodelo_id_cmodelo FOREIGN KEY (modelo) REFERENCES cmodelo(id_cmodelo);
ALTER TABLE vehiculo ADD CONSTRAINT fk_vehiculo_marca_cmarca_id_cmarca FOREIGN KEY (marca) REFERENCES cmarca(id_cmarca);

--No nulo
ALTER TABLE vehiculo ALTER COLUMN placas SET NOT NULL;
ALTER TABLE vehiculo ALTER COLUMN precio_com SET NOT NULL;
ALTER TABLE vehiculo ALTER COLUMN km SET NOT NULL;
ALTER TABLE vehiculo ALTER COLUMN fe_compra_vehi SET NOT NULL;

--Valores unicos
ALTER TABLE vehiculo ADD CONSTRAINT unq_vehiculo_placas UNIQUE (placas);

--Dominio
ALTER TABLE vehiculo ADD CONSTRAINT chk_vehiculo_precio_com CHECK (precio_com>0);
ALTER TABLE vehiculo ADD CONSTRAINT chk_vehiculo_precio_ven CHECK (precio_ven>0);
ALTER TABLE vehiculo ADD CONSTRAINT chk_vehiculo_km CHECK (km>0);



-- TABLA cestado_ve 

--PK
ALTER TABLE cestado_ve ADD CONSTRAINT pk_cestado_ve_id_cestado_ve PRIMARY KEY(id_cestado_ve);

-- No nulo
ALTER TABLE cestado_ve ALTER COLUMN estado_ve SET NOT NULL;

-- Valores unicos
ALTER TABLE cestado_ve ADD CONSTRAINT unq_cestado_ve_estado_ve UNIQUE (estado_ve);


-- Tabla  cpuertas 

--PK
ALTER TABLE cpuertas ADD CONSTRAINT pk_cpuertas_id_cpuertas PRIMARY KEY(id_cpuertas);

-- No nulo
ALTER TABLE cpuertas ALTER COLUMN cant_puertas SET NOT NULL;

-- Valores unicos
ALTER TABLE cpuertas ADD CONSTRAINT unq_cpuertas_cant_puertas UNIQUE (cant_puertas);

-- Dominio
ALTER TABLE cpuertas ADD CONSTRAINT chk_cpuertas_cant_puertas CHECK (cant_puertas>0);


-- Tabla   ctransmision 

--PK
ALTER TABLE ctransmision ADD CONSTRAINT pk_ctransmision_id_ctransmision PRIMARY KEY(id_ctransmision);

-- No nulo
ALTER TABLE ctransmision ALTER COLUMN transmision SET NOT NULL;

-- Valores unicos
ALTER TABLE ctransmision ADD CONSTRAINT unq_ctransmision_transmision UNIQUE (transmision);


-- Tabla  ctipo 

--PK
ALTER TABLE ctipo ADD CONSTRAINT pk_ctipo_id_ctipo PRIMARY KEY(id_ctipo);

-- No nulo
ALTER TABLE ctipo ALTER COLUMN tipo SET NOT NULL;

-- Valores unicos
ALTER TABLE ctipo ADD CONSTRAINT unq_ctipo_tipo UNIQUE (tipo);



-- Tabla  canio

--PK
ALTER TABLE canio ADD CONSTRAINT pk_canio_id_canio PRIMARY KEY(id_canio);

-- No nulo
ALTER TABLE canio ALTER COLUMN anio SET NOT NULL;

-- Dominio
ALTER TABLE canio ADD CONSTRAINT chk_canio_anio CHECK (anio>20000);

-- Valores unicos
ALTER TABLE canio ADD CONSTRAINT unq_canio_anio UNIQUE (anio);


-- Tabla  ccolor

--PK
ALTER TABLE ccolor ADD CONSTRAINT pk_ccolor_id_ccolor PRIMARY KEY(id_ccolor);

-- No nulo
ALTER TABLE ccolor ALTER COLUMN color SET NOT NULL;

-- Valores unicos
ALTER TABLE ccolor ADD CONSTRAINT unq_ccolor_color UNIQUE (color);



-- TABLA  cstatus

--PK
ALTER TABLE cstatus ADD CONSTRAINT pk_cstatus_id_cstatus PRIMARY KEY (id_cstatus);

-- No nulo
ALTER TABLE cstatus ALTER COLUMN status SET NOT NULL;

-- Valores unicos
ALTER TABLE cstatus ADD CONSTRAINT unq_cstatus_status UNIQUE (status);


-- TABLA  cmotor 

--PK
ALTER TABLE cmotor ADD CONSTRAINT pk_cmotor_id_cmotor PRIMARY KEY(id_cmotor);

-- No nulo
ALTER TABLE cmotor ALTER COLUMN motor SET NOT NULL;

-- Valores unicos
ALTER TABLE cmotor ADD CONSTRAINT unq_cmotor_motor UNIQUE (motor);


-- TABLA  cmarca 

--PK
ALTER TABLE cmarca ADD CONSTRAINT pk_cmarca_id_cmarca PRIMARY KEY(id_cmarca);

-- No nulo
ALTER TABLE cmarca ALTER COLUMN marca SET NOT NULL;

-- Valores unicos
ALTER TABLE cmarca ADD CONSTRAINT unq_cmarca_marca UNIQUE (marca);


-- TABLA  cmodelo 

--PK
ALTER TABLE cmodelo ADD CONSTRAINT pk_cmodelo_id_cmodelo PRIMARY KEY(id_cmodelo);

-- No nulo
ALTER TABLE cmodelo ALTER COLUMN modelo SET NOT NULL;

-- Valores unicos
ALTER TABLE cmodelo ADD CONSTRAINT unq_cmodelo_modelo UNIQUE (modelo);


--#------------------------
-- TABLA  ajustes 

--PK
ALTER TABLE ajustes ADD CONSTRAINT pk_ajustes_id_ajuste PRIMARY KEY(id_ajuste);


-- TABLA  vehiculo_ajustes 

-- FK
ALTER TABLE vehiculo_ajustes ADD CONSTRAINT fk_vehiculo_ajustes_no_serie_vehiculo_no_serie  FOREIGN KEY (no_serie) REFERENCES vehiculo(no_serie);

--FK
ALTER TABLE vehiculo_ajustes ADD CONSTRAINT fk_vehiculo_ajustes_id_ajuste_ajustes_id_ajusto FOREIGN KEY (id_ajuste) REFERENCES ajustes(id_ajuste);

-- Dominio
ALTER TABLE vehiculo_ajustes ADD CONSTRAINT chk_vehiculo_ajustes_costo CHECK (costo>0);


--ALLAN------------------------------------------------------------------------------------------------------------------------

--Integridades tabla cgenero*
ALTER TABLE cgenero ALTER COLUMN id_cgenero SET NOT NULL;
ALTER TABLE cgenero ALTER COLUMN genero SET NOT NULL;
ALTER TABLE cgenero ADD CONSTRAINT pk_cgenero_id_cgenero PRIMARY KEY (id_cgenero);
ALTER TABLE cgenero ADD CONSTRAINT chk_cgenero_genero CHECK (genero IN ('M','F'));
ALTER TABLE cgenero ADD CONSTRAINT unq_cegenero_id_cgenero UNIQUE (id_cgenero);

--Integridades tabla persona*
ALTER TABLE persona ALTER COLUMN nombres SET NOT NULL;
ALTER TABLE persona ALTER COLUMN a_paterno SET NOT NULL;
ALTER TABLE persona ALTER COLUMN telefono SET NOT NULL;
ALTER TABLE persona ALTER COLUMN correo SET NOT NULL;
ALTER TABLE persona ALTER COLUMN rfc SET NOT NULL;
ALTER TABLE persona ALTER COLUMN f_nacimiento SET NOT NULL;
ALTER TABLE persona ALTER COLUMN id_cgenero SET NOT NULL;
ALTER TABLE persona ALTER COLUMN id_domicilio SET NOT NULL;
ALTER TABLE persona ADD CONSTRAINT pk_persona_id_persona PRIMARY KEY (id_persona);
ALTER TABLE persona ADD CONSTRAINT unq_persona_id_persona UNIQUE (id_persona);
ALTER TABLE persona ADD CONSTRAINT unq_persona_rfc UNIQUE (rfc);
ALTER TABLE persona ADD CONSTRAINT fk_persona_id_cgenero_cgenero_id_cgenero FOREIGN KEY (id_cgenero) REFERENCES cgenero(id_cgenero);
ALTER TABLE persona ADD CONSTRAINT fk_persona_id_domicilio_domicilio_id_domicilio FOREIGN KEY (id_domicilio) REFERENCES domicilio(id_domicilio);


--Integridades tabla ccliente*
ALTER TABLE ccliente ALTER COLUMN id_ccliente SET NOT NULL;
ALTER TABLE ccliente ALTER COLUMN tipo_cliente SET NOT NULL;
ALTER TABLE ccliente ADD CONSTRAINT pk_ccliente_id_ccliente PRIMARY KEY (id_ccliente);
ALTER TABLE ccliente ADD CONSTRAINT unq_ccliente_id_ccliente UNIQUE (id_ccliente);

--Integridades tabla cliente*
ALTER TABLE cliente ALTER COLUMN id_cliente SET NOT NULL;
ALTER TABLE cliente ALTER COLUMN id_persona SET NOT NULL;
ALTER TABLE cliente ADD CONSTRAINT pk_cliente_id_cliente PRIMARY KEY (id_cliente);
ALTER TABLE cliente ADD CONSTRAINT fk_cliente_id_persona_persona_id_persona FOREIGN KEY (id_persona) REFERENCES persona(id_persona);
ALTER TABLE cliente ADD CONSTRAINT unq_cliente_id_cliente UNIQUE (id_cliente);
ALTER TABLE cliente ADD CONSTRAINT unq_cliente_id_persona UNIQUE (id_persona);

--Integridades tabla tipo_cliente*
ALTER TABLE tipo_cliente ALTER COLUMN cclienteid_ccliente2 SET NOT NULL;
ALTER TABLE tipo_cliente ALTER COLUMN id_ccliente SET NOT NULL;
ALTER TABLE tipo_cliente ALTER COLUMN id_cliente SET NOT NULL;
ALTER TABLE tipo_cliente ADD CONSTRAINT pk_tipo_cliente_cclienteid_ccliente2 PRIMARY KEY (cclienteid_ccliente2);
ALTER TABLE tipo_cliente ADD CONSTRAINT fk_tipo_cliente_id_ccliente_ccliente_id_ccliente FOREIGN KEY (id_ccliente) REFERENCES ccliente(id_ccliente);
ALTER TABLE tipo_cliente ADD CONSTRAINT fk_tipo_cliente_id_cliente_cliente_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);


--Ariana---------------------------------------------------------------------------------------------------------------------------
--Integridades tabla empleado*
ALTER TABLE empleados ALTER COLUMN horario SET NOT NULL;
ALTER TABLE empleados ALTER COLUMN fecha_i SET NOT NULL;
ALTER TABLE empleados ALTER COLUMN nss SET NOT NULL;
ALTER TABLE empleados ADD CONSTRAINT pk_empleados_id_empleado PRIMARY KEY (id_empleado);
--ALTER TABLE empleados*
ALTER TABLE empleados ALTER COLUMN id_crol SET NOT NULL;
ALTER TABLE empleados ALTER COLUMN id_carea SET NOT NULL;
ALTER TABLE empleados ALTER COLUMN sueldo SET NOT NULL;
ALTER TABLE empleados ALTER COLUMN n_extension SET NOT NULL;
ALTER TABLE empleados ALTER COLUMN id_chorario SET NOT NULL;
ALTER TABLE empleados ADD CONSTRAINT fk_empleados_id_chorario_chorario_id_chorario FOREIGN KEY(id_chorario) REFERENCES chorario(id_chorario);
ALTER TABLE empleados ADD CONSTRAINT fk_empleados_id_persona_persona_id_persona FOREIGN KEY(id_persona) REFERENCES persona(id_persona);
ALTER TABLE empleados ADD CONSTRAINT fk_empleados_id_crol_crol_id_crol FOREIGN KEY(id_crol) REFERENCES crol(id_crol);
ALTER TABLE empleados ADD CONSTRAINT fk_empleados_id_carea_c_area_id_carea FOREIGN KEY(id_carea) REFERENCES carea(id_carea);

--Integridades tabla carea*
ALTER TABLE carea ALTER COLUMN id_carea SET NOT NULL;
ALTER TABLE carea ALTER COLUMN area SET NOT NULL;
ALTER TABLE carea ADD CONSTRAINT pk_carea_id_carea PRIMARY KEY (id_carea);
ALTER TABLE carea ADD CONSTRAINT unq_carea_id_area UNIQUE (id_carea);

--Integridades tabla chorario*
ALTER TABLE chorario ALTER COLUMN id_chorario SET NOT NULL;
ALTER TABLE chorario ALTER COLUMN horario SET NOT NULL;
ALTER TABLE chorario ADD CONSTRAINT pk_chorario_id_chorario PRIMARY KEY (id_chorario);
ALTER TABLE chorario ADD CONSTRAINT unq_chorario_id_chorario UNIQUE (id_chorario);

--Integridades tabla crol*
ALTER TABLE crol ALTER COLUMN id_crol SET NOT NULL;
ALTER TABLE crol ALTER COLUMN rol SET NOT NULL;
ALTER TABLE crol ADD CONSTRAINT pk_crol_id_crol PRIMARY KEY (id_crol);
ALTER TABLE crol ADD CONSTRAINT unq_crol_id_rol UNIQUE (id_crol);

--Carlos---------------------------------------------------------------------------------------------------------------------------
--Integridades tabla contrato_compra*
ALTER TABLE contrato_compra ADD CONSTRAINT pk_id_cont_com PRIMARY KEY (id_cont_com);
ALTER TABLE contrato_compra ADD CONSTRAINT unq_contrato_compra_id_cont_com UNIQUE (id_cont_com);
ALTER TABLE contrato_compra ADD CONSTRAINT fk_contrato_compra_id_cf_pago_cestatus_deuda_id_cf_pago FOREIGN KEY (id_cf_pago) REFERENCES cestatus_deuda(id_cf_pago);
ALTER TABLE contrato_compra ADD CONSTRAINT fk_contrato_compra_id_cst_pago_cestatus_pago_id_cst_pago FOREIGN KEY (id_cst_pago) REFERENCES cestatus_pago(id_cst_pago);
ALTER TABLE contrato_compra ADD CONSTRAINT fk_contrato_compra_id_csituacion_csituacion_id_csituacion FOREIGN KEY (id_csituacion) REFERENCES csituacion(id_csituacion);
ALTER TABLE contrato_compra ADD CONSTRAINT fk_contrato_compra_id_cliente_cliente_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);
ALTER TABLE contrato_compra ADD CONSTRAINT fk_contrato_compra_no_serie_vehiculo_no_serie FOREIGN KEY (no_serie) REFERENCES vehiculo(no_serie);
ALTER TABLE contrato_compra ADD CONSTRAINT fk_contrato_compra_id_empleado_empleados_id_empleado FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado);

--Integridades tabla csituacion
ALTER TABLE csituacion ADD CONSTRAINT pk_id_csituacion PRIMARY KEY (id_csituacion);
ALTER TABLE csituacion ADD CONSTRAINT unq_csituacion_id_csituacion UNIQUE (id_csituacion);


--Integridades tabla cstatus_pago
ALTER TABLE cstatus_pago ADD CONSTRAINT pk_id_cst_pago PRIMARY KEY (id_cst_pago);
ALTER TABLE cstatus_pago ADD CONSTRAINT unq_cstatus_pago_id_cst_pago UNIQUE (id_cst_pago);


--Integridades tabla cforma_pago
ALTER TABLE cforma_pago ADD CONSTRAINT pk_id_cf_pago PRIMARY KEY (id_cf_pago);
ALTER TABLE cforma_pago ADD CONSTRAINT unq_cforma_pago_id_cf_pago UNIQUE (id_cf_pago);

-- Arturo---------------------------------------------------------------------------------------------------------------------------

--Integridades tabla deuda
ALTER TABLE deuda ALTER COLUMN id_deuda_per_tem SET NOT NULL;
ALTER TABLE deuda ALTER COLUMN f_ini_pago SET NOT NULL;
ALTER TABLE deuda ALTER COLUMN f_fin_pago SET NOT NULL;
ALTER TABLE deuda ALTER COLUMN tasa_interes SET NOT NULL;
ALTER TABLE deuda ALTER COLUMN monto SET NOT NULL;
ALTER TABLE deuda ADD CONSTRAINT pk_deuda_id_deuda_per_tem PRIMARY KEY (id_deuda_per_tem);
ALTER TABLE deuda ADD CONSTRAINT chk_deuda_monto CHECK (monto>0);
ALTER TABLE deuda ADD CONSTRAINT unq_deuda_id_deuda_per_tem UNIQUE (id_deuda_per_tem);
ALTER TABLE deuda ADD CONSTRAINT fk_id_cperiodicidad FOREIGN KEY (deuda) REFERENCES id_cperiodicidad(cperiodicidad);
ALTER TABLE deuda ADD CONSTRAINT fk_id_ctemporalidad FOREIGN KEY (deuda) REFERENCES id_ctemporalidad(ctemporalidad);
 
--Integridades tabla cperiodicidad*
ALTER TABLE cperiodicidad ALTER COLUMN id_cperiodicidad SET NOT NULL;
ALTER TABLE cperiodicidad ALTER COLUMN periodos SET NOT NULL;
ALTER TABLE cperiodicidad ADD CONSTRAINT pk_cperiodicidad_id_cperiodicidad PRIMARY KEY (id_cperiodicidad);
ALTER TABLE cperiodicidad ADD CONSTRAINT unq_cperiodicidad_id_cperiodicidad UNIQUE (id_cperiodicidad);

--Integridades tabla ctemporalidad*
ALTER TABLE ctemporalidad ALTER COLUMN id_temporalidad SET NOT NULL;
ALTER TABLE ctemporalidad ALTER COLUMN tiempo SET NOT NULL;
ALTER TABLE ctemporalidad ADD CONSTRAINT pk_ctemporalidad_id_temporalidad PRIMARY KEY (id_temporalidad);
ALTER TABLE ctemporalidad ADD CONSTRAINT unq_ctemporalidad_id_temporalidad UNIQUE (id_temporalidad);


--Integridades tabla contrato_venta
ALTER TABLE contrato_venta ALTER COLUMN id_cont_único SET NOT NULL;
ALTER TABLE contrato_venta ALTER COLUMN tiempo SET NOT NULL;
ALTER TABLE contrato_venta ALTER COLUMN fecha_emi_con SET NOT NULL;
ALTER TABLE contrato_venta ALTER COLUMN id_deuda SET NOT NULL;
ALTER TABLE contrato_venta ALTER COLUMN id_cliente SET NOT NULL;
ALTER TABLE contrato_venta ALTER COLUMN id_empleado SET NOT NULL;
ALTER TABLE contrato_venta ADD CONSTRAINT pk_contrato_venta_id_cont_único PRIMARY KEY (id_cont_único);
ALTER TABLE contrato_venta ADD CONSTRAINT unq_contrato_venta_id_cont_único UNIQUE (id_cont_único);
ALTER TABLE deuda ADD CONSTRAINT fk_id_deuda FOREIGN KEY (contrato_venta) REFERENCES id_deuda(deuda);
ALTER TABLE deuda ADD CONSTRAINT fk_id_cf_compra FOREIGN KEY (contrato_venta) REFERENCES id_cf_compra(cforma_compra);
ALTER TABLE deuda ADD CONSTRAINT fk_id_cf_pago FOREIGN KEY (contrato_venta) REFERENCES id_cf_pago(cstatus_deuda);
ALTER TABLE deuda ADD CONSTRAINT fk_id_cliente FOREIGN KEY (contrato_venta) REFERENCES id_cliente(cliente);
ALTER TABLE deuda ADD CONSTRAINT fk_no_serie FOREIGN KEY (contrato_venta) REFERENCES no_serie(vehiculo);
ALTER TABLE deuda ADD CONSTRAINT fk_id_empleado FOREIGN KEY (contrato_venta) REFERENCES id_empleado(empleados);

--Integridades tabla factura
ALTER TABLE factura ALTER COLUMN id_fac_venta SET NOT NULL;
ALTER TABLE factura ALTER COLUMN id_cliente SET NOT NULL;
ALTER TABLE factura ADD CONSTRAINT pk_factura_id_fac_venta PRIMARY KEY (id_fac_venta);
ALTER TABLE factura ADD CONSTRAINT unq_factura_id_fac_venta UNIQUE (id_fac_venta);
ALTER TABLE deuda ADD CONSTRAINT fk_id_cont_venta FOREIGN KEY (factura) REFERENCES id_cont_venta(contrato_venta);
ALTER TABLE deuda ADD CONSTRAINT fk_id_cliente FOREIGN KEY (factura) REFERENCES id_cliente(cliente);

--Integridades tabla cforma_compra*
ALTER TABLE cforma_compra ALTER COLUMN forma_compra SET NOT NULL;
ALTER TABLE cforma_compra ADD CONSTRAINT pk_cforma_compra_id_cf_compra PRIMARY KEY (id_cf_compra);
ALTER TABLE cforma_compra ADD CONSTRAINT chk_cforma_compra_forma_compra CHECK (forma_compra IN ('Efectivo','Tarjeta_Credito','Transferencia'));
ALTER TABLE cforma_compra ADD CONSTRAINT unq_cforma_compra_id_cf_compra UNIQUE (id_cf_compra);

--Integridades tabla cstatus_deuda*
ALTER TABLE cstatus_deuda ALTER COLUMN id_cf_pago SET NOT NULL;
ALTER TABLE cstatus_deuda ALTER COLUMN st_deuda SET NOT NULL;
ALTER TABLE cstatus_deuda ADD CONSTRAINT pk_cstatus_deuda_id_cf_pago PRIMARY KEY (id_cf_pago);
ALTER TABLE cstatus_deuda ADD CONSTRAINT unq_cstatus_deuda_id_cf_pago UNIQUE (id_cf_pago);

-- Alexa---------------------------------------------------------------------------------------------------------------------------

-- integridades tabla cita --

ALTER TABLE cita ALTER COLUMN casistenciaid_casis SET NOT NULL;
ALTER TABLE cita ADD CONSTRAINT pk_id_cita PRIMARY KEY (id_cita);
ALTER TABLE cita ADD CONSTRAINT unq_cita_id_cita UNIQUE (id_cita);
ALTER TABLE cita ADD CONSTRAINT fk_id_cliente FOREIGN KEY (cita) REFERENCES cliente(cliente);


-- integridades tabla fecha_hora_cita
ALTER TABLE fecha_hora_cita ALTER COLUMN fecha_hora_cita SET NOT NULL;
ALTER TABLE fecha_hora_cita ALTER COLUMN id_cliente SET NOT NULL;
ALTER TABLE fecha_hora_cita ADD CONSTRAINT pk_fecha_hora_cita PRIMARY KEY (id_cliente);
ALTER TABLE fecha_hora_cita ADD CONSTRAINT unq_id_cliente UNIQUE (id_cliente);
ALTER TABLE fecha_hora_cita ADD CONSTRAINT fk_id_cliente FOREIGN KEY (fecha_hora_cita) REFERENCES id_cliente(cliente);


-- integridades tabla casistencia* 
ALTER TABLE casistencia ALTER COLUMN id_casis SET NOT NULL;
ALTER TABLE casistencia ALTER COLUMN asistencia SET NOT NULL;
ALTER TABLE casistencia ALTER COLUMN clienteid_cliente SET NOT NULL;
ALTER TABLE casistencia ADD CONSTRAINT pk_id_casis PRIMARY KEY (asistencia);
ALTER TABLE casistencia ADD CONSTRAINT unq_id_casis UNIQUE (asistencia);
ALTER TABLE casistencia ADD CONSTRAINT unq_clienteid_cliente UNIQUE (asistencia);

-- Integridades tabla domicilio
ALTER TABLE domicilio ALTER COLUMN calle SET NOT NULL;
ALTER TABLE domicilio ALTER COLUMN colonia SET NOT NULL;
ALTER TABLE domicilio ALTER COLUMN num_int SET NOT NULL;
ALTER TABLE domicilio ALTER COLUMN num_ext SET NOT NULL;
ALTER TABLE domicilio ADD CONSTRAINT pk_domicilio_id_domicilio PRIMARY KEY (id_domicilio);
ALTER TABLE domicilio ADD CONSTRAINT unq_domicilio_id_domicilio UNIQUE (id_domicilio);
ALTER TABLE domicilio ADD CONSTRAINT fk_id_cmunicipio FOREIGN KEY (domicilio) REFERENCES id_cmunicipio(cmunicipio);

--Integridades tabla cmunicipio

ALTER TABLE cmunicipio ALTER COLUMN municipio SET NOT NULL;
ALTER TABLE cmunicipio ADD CONSTRAINT pk_cmunicipio_id_cmunicipio PRIMARY KEY (id_cmunicipio);
ALTER TABLE cmunicipio ADD CONSTRAINT fk_id_cestado FOREIGN KEY (cmunicipio) REFERENCES id_cestado(cestado);

--Integridades tabla cestado*
ALTER TABLE cestado ALTER COLUMN estado SET NOT NULL;
ALTER TABLE cestado ADD CONSTRAINT pk_cestado_cestado PRIMARY KEY (id_cestado);
ALTER TABLE cestado ADD CONSTRAINT unq_cestado_cestado UNIQUE (id_cestado);

---------------------------------------------------------------------------------------------------------------------------















