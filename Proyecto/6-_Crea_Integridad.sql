----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ INTEGRIDADES DE TABLAS ----------------------------------------------------
------------------------------------------------ INTEGRIDADES DE TABLAS ----------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

--LLAVES PRIMARIAS###########
--Diego
ALTER TABLE cestado_ve ADD CONSTRAINT pk_cestado_ve_id_cestado_ve PRIMARY KEY(id_cestado_ve);
ALTER TABLE cpuertas ADD CONSTRAINT pk_cpuertas_id_cpuertas PRIMARY KEY(id_cpuertas);
ALTER TABLE ctransmision ADD CONSTRAINT pk_ctransmision_id_ctransmision PRIMARY KEY(id_ctransmision);
ALTER TABLE ctipo ADD CONSTRAINT pk_ctipo_id_ctipo PRIMARY KEY(id_ctipo);
ALTER TABLE canio ADD CONSTRAINT pk_canio_id_canio PRIMARY KEY(id_canio);
ALTER TABLE ccolor ADD CONSTRAINT pk_ccolor_id_ccolor PRIMARY KEY(id_color);
ALTER TABLE cstatus ADD CONSTRAINT pk_cstatus_id_cstatus PRIMARY KEY (id_cstatus);
ALTER TABLE cmotor ADD CONSTRAINT pk_cmotor_id_cmotor PRIMARY KEY(id_cmotor);
ALTER TABLE cmarca ADD CONSTRAINT pk_cmarca_id_cmarca PRIMARY KEY(id_cmarca);
ALTER TABLE cmodelo ADD CONSTRAINT pk_cmodelo_id_cmodelo PRIMARY KEY(id_cmodelo);
ALTER TABLE vehiculo ADD CONSTRAINT pk_vehiculo_id_vehiculo PRIMARY KEY(id_vehiculo); --#######
ALTER TABLE ajustes ADD CONSTRAINT pk_ajustes_id_ajuste PRIMARY KEY(id_ajuste);
ALTER TABLE vehiculo_ajustes ADD CONSTRAINT pk_vehiculo_ajustes_id_vehiculo_ajustes PRIMARY KEY(id_vehiculo_ajustes);

--Arturo
ALTER TABLE ctemporalidad ADD CONSTRAINT pk_ctemporalidad_id_temporalidad PRIMARY KEY (id_temporalidad);
ALTER TABLE cforma_compra ADD CONSTRAINT pk_cforma_compra_id_cforma_compra PRIMARY KEY (id_cforma_compra);
ALTER TABLE cstatus_deuda ADD CONSTRAINT pk_cstatus_deuda_id_cst_deuda PRIMARY KEY (id_cst_deuda);
ALTER TABLE deuda ADD CONSTRAINT pk_deuda_id_deuda PRIMARY KEY (id_deuda);
ALTER TABLE contrato_venta ADD CONSTRAINT pk_contrato_venta_id_cont_venta PRIMARY KEY (id_cont_venta);
ALTER TABLE factura ADD CONSTRAINT pk_factura_id_factura PRIMARY KEY (id_factura);

--Alexa
ALTER TABLE domicilio ADD CONSTRAINT pk_domicilio_id_domicilio PRIMARY KEY (id_domicilio);
ALTER TABLE cmunicipio ADD CONSTRAINT pk_cmunicipio_id_cmunicipio PRIMARY KEY (id_cmunicipio);
ALTER TABLE cestado ADD CONSTRAINT pk_cestado_cestado PRIMARY KEY (id_cestado);
ALTER TABLE cita ADD CONSTRAINT pk_id_cita PRIMARY KEY (id_cita);
ALTER TABLE casistencia ADD CONSTRAINT pk_id_casis PRIMARY KEY (id_casis);

--Allan
ALTER TABLE tipo_cliente ADD CONSTRAINT pk_tipo_cliente_id_tp_cliente PRIMARY KEY (id_tp_cliente);
ALTER TABLE cgenero ADD CONSTRAINT pk_cgenero_id_cgenero PRIMARY KEY (id_cgenero);
ALTER TABLE persona ADD CONSTRAINT pk_persona_id_persona PRIMARY KEY (id_persona);
ALTER TABLE ccliente ADD CONSTRAINT pk_ccliente_id_ccliente PRIMARY KEY (id_ccliente);
ALTER TABLE cliente ADD CONSTRAINT pk_cliente_id_cliente PRIMARY KEY (id_cliente);

--Ari
ALTER TABLE empleados ADD CONSTRAINT pk_empleados_id_empleado PRIMARY KEY (id_empleado);
ALTER TABLE cno_exten ADD CONSTRAINT pk_cno_exten_id_cno_ex PRIMARY KEY (id_cno_ex);
ALTER TABLE carea ADD CONSTRAINT pk_carea_id_carea PRIMARY KEY (id_carea);
ALTER TABLE crol ADD CONSTRAINT pk_crol_id_crol PRIMARY KEY (id_crol);
ALTER TABLE chorario ADD CONSTRAINT pk_chorario_id_chorario PRIMARY KEY (id_chorario);

--Carlos
ALTER TABLE contrato_compra ADD CONSTRAINT pk_id_cont_com PRIMARY KEY (id_cont_com);
ALTER TABLE cstatus_pago ADD CONSTRAINT pk_id_cst_pago PRIMARY KEY (id_cst_pago);
ALTER TABLE cforma_pago ADD CONSTRAINT pk_id_cf_pago PRIMARY KEY (id_cf_pago);

--LLAVES FORANEAS############
--Diego
ALTER TABLE vehiculo ADD CONSTRAINT fk_vehiculo_estado_ve_cestado_ve_id_cestado_ve FOREIGN KEY (estado_ve) REFERENCES cestado_ve(id_cestado_ve);
ALTER TABLE vehiculo ADD CONSTRAINT fk_vehiculo_puertas_cpuertas_id_cestado FOREIGN KEY (puertas) REFERENCES cpuertas(id_cpuertas);
ALTER TABLE vehiculo ADD CONSTRAINT fk_vehiculo_transmision_ctransmision_id_ctransmision FOREIGN KEY (transmision) REFERENCES ctransmision(id_ctransmision);
ALTER TABLE vehiculo ADD CONSTRAINT fk_vehiculo_anio_canio_id_canio FOREIGN KEY (anio) REFERENCES canio(id_canio);
ALTER TABLE vehiculo ADD CONSTRAINT fk_vehiculo_color_ccolor_id_ccolor FOREIGN KEY (color) REFERENCES ccolor(id_color);
ALTER TABLE vehiculo ADD CONSTRAINT fk_vehiculo_status_cstatus_id_cstatus FOREIGN KEY (status) REFERENCES cstatus(id_cstatus);
ALTER TABLE vehiculo ADD CONSTRAINT fk_vehiculo_motor_cmotor_id_cmotor FOREIGN KEY (motor) REFERENCES cmotor(id_cmotor);
ALTER TABLE vehiculo ADD CONSTRAINT fk_vehiculo_modelo_cmodelo_id_cmodelo FOREIGN KEY (modelo) REFERENCES cmodelo(id_cmodelo);
ALTER TABLE cmodelo ADD CONSTRAINT fk_cmodelo_id_ctipo_ctipo_id_ctipo FOREIGN KEY (id_ctipo) REFERENCES ctipo(id_ctipo);
ALTER TABLE cmodelo ADD CONSTRAINT fk_cmodelo_id_cmarca_cmarca_id_cmarca FOREIGN KEY (id_cmarca) REFERENCES cmarca(id_cmarca);
ALTER TABLE vehiculo_ajustes ADD CONSTRAINT fk_vehiculo_ajustes_id_vehiculo_vehiculo_id_vehiculo FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id_vehiculo); --#########
ALTER TABLE vehiculo_ajustes ADD CONSTRAINT fk_vehiculo_ajustes_id_ajuste_ajustes_id_ajuste FOREIGN KEY (id_ajuste) REFERENCES ajustes(id_ajuste); --#########

--Arturo
ALTER TABLE deuda ADD CONSTRAINT fk_id_cst_deuda_cstatus_deuda_id_cst_deuda FOREIGN KEY (id_cst_deuda) REFERENCES cstatus_deuda(id_cst_deuda);
ALTER TABLE deuda ADD CONSTRAINT fk_id_cforma_compra_cforma_compra_id_cforma_compra  FOREIGN KEY (id_cforma_compra) REFERENCES cforma_compra(id_cforma_compra);
ALTER TABLE contrato_venta ADD CONSTRAINT fk_id_deuda_deuda_id_deuda FOREIGN KEY (id_deuda) REFERENCES deuda(id_deuda);
ALTER TABLE contrato_venta ADD CONSTRAINT fk_id_vehiculo_vehiculo_id_vehiculo FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id_vehiculo);
ALTER TABLE contrato_venta ADD CONSTRAINT fk_id_empleado_empleados_id_empleado FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado);
ALTER TABLE contrato_venta ADD CONSTRAINT fk_id_cliente_cliente_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);
ALTER TABLE factura ADD CONSTRAINT fk_id_cont_venta_contrato_venta_id_cont_venta FOREIGN KEY (id_cont_venta) REFERENCES contrato_venta(id_cont_venta);

--Allan
ALTER TABLE persona ADD CONSTRAINT fk_persona_id_cgenero_cgenero_id_cgenero FOREIGN KEY (id_cgenero) REFERENCES cgenero(id_cgenero);
ALTER TABLE persona ADD CONSTRAINT fk_persona_id_domicilio_domicilio_id_domicilio FOREIGN KEY (id_domicilio) REFERENCES domicilio(id_domicilio);
ALTER TABLE tipo_cliente ADD CONSTRAINT fk_tipo_cliente_id_ccliente_ccliente_id_ccliente FOREIGN KEY (id_ccliente) REFERENCES ccliente(id_ccliente);
ALTER TABLE tipo_cliente ADD CONSTRAINT fk_tipo_cliente_id_cliente_cliente_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);
ALTER TABLE cliente ADD CONSTRAINT fk_cliente_id_persona_persona_id_persona FOREIGN KEY (id_persona) REFERENCES persona(id_persona);

--Alexa
ALTER TABLE cita ADD CONSTRAINT fk_id_tp_cliente FOREIGN KEY (id_tp_cliente) REFERENCES tipo_cliente(id_tp_cliente);
ALTER TABLE cita ADD CONSTRAINT fk_id_casis FOREIGN KEY (id_casis) REFERENCES casistencia(id_casis);
ALTER TABLE domicilio ADD CONSTRAINT fk_id_cmunicipio FOREIGN KEY (id_cmunicipio) REFERENCES cmunicipio(id_cmunicipio);
ALTER TABLE cmunicipio ADD CONSTRAINT fk_id_cestado FOREIGN KEY (id_cestado) REFERENCES cestado(id_cestado);

--Ari
ALTER TABLE empleados ADD CONSTRAINT fk_empleados_id_chorario_chorario_id_chorario FOREIGN KEY(id_chorario) REFERENCES chorario(id_chorario);
ALTER TABLE empleados ADD CONSTRAINT fk_empleados_id_persona_persona_id_persona FOREIGN KEY(id_persona) REFERENCES persona(id_persona);
ALTER TABLE empleados ADD CONSTRAINT fk_empleados_id_crol_crol_id_crol FOREIGN KEY(id_crol) REFERENCES crol(id_crol);
ALTER TABLE empleados ADD CONSTRAINT fk_empleados_id_carea_c_area_id_carea FOREIGN KEY(id_carea) REFERENCES carea(id_carea);
ALTER TABLE carea ADD CONSTRAINT fk_carea_id_cno_ex_cno_exten_id_cno_ex FOREIGN KEY(id_cno_ex) REFERENCES cno_exten(id_cno_ex);

--Carlos
ALTER TABLE contrato_compra ADD CONSTRAINT fk_contrato_compra_id_cf_pago_cestatus_deuda_id_cf_pago FOREIGN KEY (id_cf_pago) REFERENCES cforma_pago(id_cf_pago);
ALTER TABLE contrato_compra ADD CONSTRAINT fk_contrato_compra_id_cst_pago_cestatus_pago_id_cst_pago FOREIGN KEY (id_cst_pago) REFERENCES cstatus_pago(id_cst_pago);
ALTER TABLE contrato_compra ADD CONSTRAINT fk_contrato_compra_id_cliente_cliente_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);
ALTER TABLE contrato_compra ADD CONSTRAINT fk_contrato_compra_id_vehiculo_vehiculo_id_vehiculo FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id_vehiculo);
ALTER TABLE contrato_compra ADD CONSTRAINT fk_contrato_compra_id_empleado_empleados_id_empleado FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado);

--CHECK###########
--Arturo
ALTER TABLE cforma_compra ADD CONSTRAINT chk_cforma_compra_forma_compra CHECK (forma_compra IN ('Efectivo','Tarjeta_Credito','Transferencia'));
ALTER TABLE deuda ADD CONSTRAINT chk_deuda_valor_deuda CHECK (valor_deuda>0);

--Allan
ALTER TABLE cgenero ADD CONSTRAINT chk_cgenero_genero CHECK (genero IN ('M','F'));

--Diego
ALTER TABLE vehiculo ADD CONSTRAINT chk_vehiculo_precio_com CHECK (precio_com>0);
ALTER TABLE vehiculo ADD CONSTRAINT chk_vehiculo_precio_ven CHECK (precio_ven>0);
ALTER TABLE vehiculo ADD CONSTRAINT chk_vehiculo_km CHECK (km>0);
ALTER TABLE vehiculo_ajustes ADD CONSTRAINT chk_vehiculo_ajustes_costo CHECK (costo>0);
ALTER TABLE canio ADD CONSTRAINT chk_canio_anio CHECK (anio>2009 AND anio<2060);

--NO NULO#############
--Diego
ALTER TABLE vehiculo ALTER COLUMN no_serie SET NOT NULL;
ALTER TABLE vehiculo ALTER COLUMN placas SET NOT NULL;
ALTER TABLE vehiculo ALTER COLUMN precio_com SET NOT NULL;
ALTER TABLE vehiculo ALTER COLUMN km SET NOT NULL;
ALTER TABLE vehiculo ALTER COLUMN fe_compra_vehi SET NOT NULL;

--Arturo
ALTER TABLE ctemporalidad ALTER COLUMN id_temporalidad SET NOT NULL;
ALTER TABLE ctemporalidad ALTER COLUMN tiempo SET NOT NULL;
ALTER TABLE cforma_compra ALTER COLUMN id_cforma_compra SET NOT NULL;
ALTER TABLE cforma_compra ALTER COLUMN forma_compra SET NOT NULL;
ALTER TABLE cstatus_deuda ALTER COLUMN id_cst_deuda SET NOT NULL;
ALTER TABLE cstatus_deuda ALTER COLUMN st_deuda SET NOT NULL;
ALTER TABLE deuda ALTER COLUMN id_deuda SET NOT NULL;
ALTER TABLE deuda ALTER COLUMN f_ini_pago SET NOT NULL;
ALTER TABLE deuda ALTER COLUMN f_fin_pago SET NOT NULL;
ALTER TABLE deuda ALTER COLUMN tasa_interes SET NOT NULL;
ALTER TABLE deuda ALTER COLUMN id_cst_deuda SET NOT NULL;
ALTER TABLE deuda ALTER COLUMN id_cforma_compra SET NOT NULL;
ALTER TABLE contrato_venta ALTER COLUMN id_cont_venta SET NOT NULL;
ALTER TABLE contrato_venta ALTER COLUMN fecha_emi_com SET NOT NULL;
ALTER TABLE contrato_venta ALTER COLUMN id_deuda SET NOT NULL;

ALTER TABLE contrato_venta ALTER COLUMN id_empleado SET NOT NULL;
ALTER TABLE contrato_venta ALTER COLUMN id_cliente SET NOT NULL;
ALTER TABLE factura ALTER COLUMN id_factura SET NOT NULL;
ALTER TABLE factura ALTER COLUMN id_cont_venta SET NOT NULL;

--Alexa
ALTER TABLE domicilio ALTER COLUMN id_domicilio SET NOT NULL;
ALTER TABLE domicilio ALTER COLUMN calle SET NOT NULL;
ALTER TABLE domicilio ALTER COLUMN colonia SET NOT NULL;
ALTER TABLE domicilio ALTER COLUMN num_int SET NOT NULL;
ALTER TABLE domicilio ALTER COLUMN num_ext SET NOT NULL;
ALTER TABLE cmunicipio ALTER COLUMN id_cmunicipio SET NOT NULL;
ALTER TABLE cmunicipio ALTER COLUMN municipio SET NOT NULL;
ALTER TABLE cestado ALTER COLUMN id_cestado SET NOT NULL;
ALTER TABLE cestado ALTER COLUMN estado SET NOT NULL;
ALTER TABLE cita ALTER COLUMN id_cita SET NOT NULL;
ALTER TABLE cita ALTER COLUMN id_casis SET NOT NULL;
ALTER TABLE cita ALTER COLUMN fecha SET NOT NULL;
ALTER TABLE cita ALTER COLUMN fecha SET NOT NULL;
ALTER TABLE casistencia ALTER COLUMN asistencia SET NOT NULL;
ALTER TABLE casistencia ALTER COLUMN id_casis SET NOT NULL;

--Allan
ALTER TABLE cgenero ALTER COLUMN id_cgenero SET NOT NULL;
ALTER TABLE cgenero ALTER COLUMN genero SET NOT NULL;
ALTER TABLE persona ALTER COLUMN id_persona SET NOT NULL;
ALTER TABLE persona ALTER COLUMN nombres SET NOT NULL;
ALTER TABLE persona ALTER COLUMN a_paterno SET NOT NULL;
ALTER TABLE persona ALTER COLUMN telefono SET NOT NULL;
ALTER TABLE persona ALTER COLUMN correo SET NOT NULL;
ALTER TABLE persona ALTER COLUMN rfc SET NOT NULL;
ALTER TABLE persona ALTER COLUMN f_nacimiento SET NOT NULL;
ALTER TABLE cliente ALTER COLUMN id_cliente SET NOT NULL;
ALTER TABLE cliente ALTER COLUMN id_persona SET NOT NULL;
ALTER TABLE persona ALTER COLUMN id_cgenero SET NOT NULL;
ALTER TABLE persona ALTER COLUMN id_domicilio SET NOT NULL;
ALTER TABLE ccliente ALTER COLUMN id_ccliente SET NOT NULL;
ALTER TABLE ccliente ALTER COLUMN tipo_cliente SET NOT NULL;
ALTER TABLE tipo_cliente ALTER COLUMN id_ccliente SET NOT NULL;
ALTER TABLE tipo_cliente ALTER COLUMN id_cliente SET NOT NULL;

--Ari
ALTER TABLE empleados ALTER COLUMN fecha_i SET NOT NULL;
ALTER TABLE empleados ALTER COLUMN nss SET NOT NULL;
ALTER TABLE empleados ALTER COLUMN id_empleado SET NOT NULL;
ALTER TABLE empleados ALTER COLUMN id_carea SET NOT NULL;
ALTER TABLE empleados ALTER COLUMN id_chorario SET NOT NULL;
ALTER TABLE empleados ALTER COLUMN id_crol SET NOT NULL;
ALTER TABLE empleados ALTER COLUMN id_persona SET NOT NULL;
ALTER TABLE cno_exten ALTER COLUMN id_cno_ex SET NOT NULL;
ALTER TABLE cno_exten ALTER COLUMN no_ext SET NOT NULL;
ALTER TABLE carea ALTER COLUMN id_carea SET NOT NULL;
ALTER TABLE carea ALTER COLUMN area SET NOT NULL;
ALTER TABLE carea ALTER COLUMN id_cno_ex SET NOT NULL;
ALTER TABLE crol ALTER COLUMN id_crol SET NOT NULL;
ALTER TABLE crol ALTER COLUMN rol SET NOT NULL;
ALTER TABLE crol ALTER COLUMN sueldo SET NOT NULL;
ALTER TABLE chorario ALTER COLUMN id_chorario SET NOT NULL;
ALTER TABLE chorario ALTER COLUMN horario SET NOT NULL;

--Carlos
ALTER TABLE contrato_compra ALTER COLUMN fecha_pago SET NOT NULL;
ALTER TABLE contrato_compra ALTER COLUMN fecha_emi_com SET NOT NULL;
ALTER TABLE contrato_compra ALTER COLUMN id_cf_pago SET NOT NULL;
ALTER TABLE contrato_compra ALTER COLUMN id_cst_pago SET NOT NULL;
ALTER TABLE contrato_compra ALTER COLUMN id_cliente SET NOT NULL;

ALTER TABLE contrato_compra ALTER COLUMN id_empleado SET NOT NULL;
ALTER TABLE cstatus_pago ALTER COLUMN status_pago SET NOT NULL;
ALTER TABLE cforma_pago ALTER COLUMN forma_pago SET NOT NULL;

--UNICO ##########
--Allan
ALTER TABLE persona ADD CONSTRAINT unq_persona_rfc UNIQUE (rfc);
ALTER TABLE cliente ADD CONSTRAINT unq_cliente_id_persona UNIQUE (id_persona);

--Diego
ALTER TABLE vehiculo ADD CONSTRAINT unq_vehiculo_placas UNIQUE (placas);
ALTER TABLE vehiculo ADD CONSTRAINT unq_vehiculo_no_serie UNIQUE (no_serie);

--CARLOS
ALTER TABLE contrato_compra ADD CONSTRAINT unq_contrato_compra_id_cont_com UNIQUE (id_cont_com);
ALTER TABLE cstatus_pago ADD CONSTRAINT unq_cstatus_pago_id_cst_pago UNIQUE (id_cst_pago);
ALTER TABLE cforma_pago ADD CONSTRAINT unq_cforma_pago_id_cf_pago UNIQUE (id_cf_pago);